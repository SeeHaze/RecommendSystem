# coding:utf-8

import pandas as pd
import numpy as np
import math
import operator
import time
import random
import threading
import datetime
import time
from multiprocessing import Process, Queue
import multiprocessing

import DAL.DAL_reckon
import DAL.DAL_para


'''
获取用户列表
'''
def getUserList():
    dal_reckon=DAL.DAL_reckon.DAL_reckon()
    data_userlist=dal_reckon.GetUserList()
    data_user=[]
    for user in data_userlist:
        data_user.append(user[1])
    print(data_user)   #测试输出
    return data_user;

'''
获取歌曲列表（格式：歌曲名+“|”+歌手名）
'''
def getItemList():
    dal_reckon=DAL.DAL_reckon.DAL_reckon()
    data_itemlist=dal_reckon.GetItemList()
    data_item=[]
    for item in data_itemlist:
        data_item.append(item[1]+"|"+item[2])
    print(data_item)   #测试输出
    return data_item;

'''
初始化权值字典
'''
def initWeightDict():
    weightDict=dict()
    dal_para=DAL.DAL_para.DAL_para()
    paralist=dal_para.getAllParaInfo("行为权值")
    for para in paralist:
        paratype=para[2]
        weight=dal_para.getOneParaInfo(paratype)
        if len(weight)>0:
            weight=weight[2]
        else:
            weight="0"
        weightDict[paratype]=weight
    print(weightDict)  #测试输出
    return weightDict

'''
获取用户行为评分
'''
def getUser_Item_Mark(user,item,weightDict):
    mark=0
    dal_reckon=DAL.DAL_reckon.DAL_reckon()
    activity=dal_reckon.GetUserActivityInfo(user,item)
    print("activity:",activity)
    if len(activity)>10:
        mark=int(weightDict["单曲循环"])
    else:
        if len(activity)>0:
            mark=int(weightDict[activity[0][3]])
        else:
            mark=0
    return mark

'''
生成用户-歌曲 行为评分矩阵  
'''
def setUsers_Items(users,items,weightDict):
    users_items=dict()
    for user in users:
        users_items[user]=dict()
        for item in items:
            users_items[user][item]=getUser_Item_Mark(user,item,weightDict)
    print (users_items)
    return users_items

'''
初始化两个特征矩阵
'''
def initpara(users, items, F):
    p = dict()
    q = dict()

    for userid in users:
        p[userid] = [(-1 + 2 * random.random()) for f in range(0, F)]  # / math.sqrt(F)

    for itemid in items:
        q[itemid] = [(-1 + 2 * random.random()) for f in range(0, F)]  # / math.sqrt(F)

    return p, q

'''
初始化样本
'''
def initsamples(user_items):
    user_samples = []
    items_pool = []
    for userid, items in user_items.items():
        for item in items:
            items_pool.append(item)

    for userid, items in user_items.items():
        samples = dict()
        for itemid, score in items.items():
            if score != 0:
                samples[itemid] = score
        user_samples.append((userid, samples))

    return user_samples

'''
初始化模型
'''
def initmodel(user_items, users, items, F):
    p, q = initpara(users, items, F)
    user_samples = initsamples(user_items)

    return p, q, user_samples


'''
利用隐喻义模型计算
:param user_items: user_items
:param users: users
:param items: items
:param F: 隐类因子个数
:param N: 迭代次数
:param alpha: 步长
:param lamda: 正则化参数
:return: p,q
'''
def lfm(user_items, users, items, F, N, alpha, lamda):
    '''
    LFM计算参数 p,q
    '''
    p, q, user_samples = initmodel(user_items, users, items, F)

    debugid1 = 0
    debugid2 = 0
    for step in range(0, N):
        random.shuffle(user_samples)  # 乱序

        error = 0
        count = 0
        for userid, samples in user_samples:
            for itemid, rui in samples.items():
                pui = predict(userid, itemid, p, q)
                eui = rui - pui
                count += 1
                # error += math.pow(eui, 2)
                '''debug'''
                if userid == 1:
                    if debugid1 == 0 and rui == 1:
                        debugid1 = itemid
                    if debugid2 == 0 and rui == -1:
                        debugid2 = itemid

                if userid == 1 and itemid == debugid1:
                    print(debugid1, rui, pui, eui, alpha)  #测试输出
                if userid == 1 and itemid == debugid2:
                    print(debugid2, rui, pui, eui, alpha)  #测试输出

                '''debug end'''

                for f in range(0, F):
                    p_u = p[userid][f]
                    q_i = q[itemid][f]

                    p[userid][f] += alpha * (eui * q_i - lamda * p_u)
                    q[itemid][f] += alpha * (eui * p_u - lamda * q_i)
        # if count==0:
        #     rmse=0
        # else:
        #     rmse = math.sqrt(error / count)
        # print( "rmse:", rmse)  #测试输出
        alpha *= 0.9
    return p, q

'''
得到用户对歌曲的偏好矩阵
'''
def predictlist(userid, items, p, q):
    predict_score = dict()
    for itemid in items:
        p_score = predict(userid, itemid, p, q)
        predict_score[itemid] = p_score

    return predict_score

'''
计算用户对歌曲的预测偏好值
'''
def predict(userid, itemid, p, q):
    a = sum(p[userid][f] * q[itemid][f] for f in range(0, len(p[userid])))
    return a

'''
设置TOPN参数
'''
def setTOP_N():
    TOPN=0
    dal_para=DAL.DAL_para.DAL_para()
    para_TOPN=dal_para.getOneParaInfo("推荐歌单曲目数")
    if len(para_TOPN)>0:
        TOPN=int(para_TOPN[2])
    return TOPN

'''
得到用户对歌曲偏好值评分TOPN的歌曲名称
'''
def getTOPN_Score(predict_score,TOPN,itemdic):
    predict_score_list = sorted(predict_score.items(), key=lambda d: d[1], reverse=True)
    # print(predict_score_list)
    TOPN_ScoreItem=[]
    cnt = 0
    for pre in predict_score_list:
        if itemdic[pre[0]]==0:
            cnt += 1
            if cnt > TOPN:
                break
            TOPN_ScoreItem.append(pre[0])
    return TOPN_ScoreItem

'''
将推荐曲目写入数据库
'''
def WriteFlow(user,TOPN_ScoreItem):
    dal_reckon = DAL.DAL_reckon.DAL_reckon()
    if dal_reckon.AddRecommendationFlow(user,TOPN_ScoreItem)>-1:
        return True
    else:
        return False

def recommend():
    '''
        LFM计算参数 p,q
        :param user_items: user_items
        :param users: users
        :param items: items
        :param F: 隐类因子个数
        :param N: 迭代次数
        :param alpha: 步长
        :param lamda: 正则化参数
    '''
    print('start')

    # user_items = {1: {'a|': 1, 'b|': -1, 'c|': -1, 'd|': -1, 'e|': 1, 'f|': 1, 'g|': -1},
    #               2: {'a|': -1, 'b|': 1, 'c|': -1, 'd|': 1, 'e|': 1, 'f|': 1, 'g|': 1},
    #               3: {'a|': 1, 'b|': 3, 'c|': 0, 'd|': -1, 'e|': -1, 'f|': -1, 'g|': 1},
    #               4: {'a|': 1, 'b|': -1, 'c|': -1, 'd|': 0, 'e|': 1, 'f|': 1, 'g|': 1},
    #               5: {'a|': -1, 'b|': 1, 'c|': 1, 'd|': 1, 'e|': -1, 'f|': -1, 'g|': 0},
    #               6: {'a|': 1, 'b|': 0, 'c|': -1, 'd|': -1, 'e|': 1, 'f|': -1, 'g|': -1}} # 用户 - 歌曲 行为评分矩阵（以字典形式） -- Test
    # users = [1, 2, 3, 4, 5, 6]  # 用户列表 -- Test
    # items = ['a|', 'b|', 'c|', 'd|', 'e|', 'f|', 'g|']  # 歌曲列表 -- Test

    users=getUserList()  # 用户列表
    items=getItemList()  # 歌曲列表
    weightDict=initWeightDict()  #权重字典
    user_items=setUsers_Items(users, items, weightDict) # 用户 - 歌曲 行为评分矩阵（以字典形式）

    TOPN=setTOP_N()  # 推荐歌单曲目数
    F = 5  # 潜在因子个数 -- Test
    N = 30  # 迭代次数 -- Test
    alpha = 0.3  # 步长 -- Test
    lamda = 0.03  # 正则化参数 -- Test
    p, q = lfm(user_items, users, items, F, N, alpha, lamda)
    print("user-factor  ",p)  #测试输出(用户-潜在因子矩阵)
    print("factor-item  ",q)  #测试输出(潜在因子-音乐矩阵)

    for user, itemdic in user_items.items():
        # print(user)  #测试输出(用户)
        print("target", itemdic)  #测试输出(原评分稀疏矩阵)
        predict_score = predictlist(user, itemdic, p, q)
        print( "predicted", predict_score)  #测试输出(偏好矩阵即预测偏好值)
        TOPN_ScoreItem=getTOPN_Score(predict_score,TOPN,itemdic)
        print(TOPN_ScoreItem)  # 测试输出(偏好矩阵即预测偏好值TOPN)
        if WriteFlow(user,TOPN_ScoreItem):
            print("写入用户"+str(user)+"数据成功") # 测试输出(写入结果是否成功)
        else:
            print("写入用户" + str(user) + "数据失败！！")  # 测试输出(写入结果是否成功)

    print('end')
    return 0

def main(h,m):
    while True:
        now = datetime.datetime.now()
        print(("0" + str(now.hour)) if now.hour < 10 else now.hour, ":", ("0" + str(now.minute)) if  now.minute < 10 else  now.minute)
        if now.hour == h and now.minute == m:
            item=recommend()
            print(item)
        # 每隔15秒检测一次
        time.sleep(15)

#与服务器进行心跳连接
def Heartbeat():
    while True:
        now = datetime.datetime.now()
        print("Heartbeat: ",now)
        dal_reckon = DAL.DAL_reckon.DAL_reckon()
        item=dal_reckon.Heartbeat()
        # 每隔10秒检测一次
        time.sleep(10)
if __name__ == "__main__":
    h=18 #时
    m=57 #分
    pool = multiprocessing.Pool(2)  # 创建进程 -- 一个线程控制心跳连接，另一个计算
    pool.apply_async(main, (h, m))
    pool.apply_async(Heartbeat, ())
    pool.close()
    pool.join()
    # recommend()