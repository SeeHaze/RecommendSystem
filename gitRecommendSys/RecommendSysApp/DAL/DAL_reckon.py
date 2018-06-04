# coding:utf-8

import RecommendSysApp.DAL.DBHelper.DBHelperMySQL

class DAL_reckon:
    '''
    获取用户列表
    '''
    def GetUserList(self):
        strSql="select fid,fname,fpassword,fuserid from `user` "
        strSql+="where 1=1 "
        strSql+="and fstatus=0 "
        strSql+="or DATEDIFF(now(),fdate)>1 "
        dbhelper=RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data=dbhelper.Executex_All(strSql)
        return data

    '''
    获取歌曲列表
    '''
    def GetItemList(self):
        strSql="select fid,fitemname,fmusician from raw_item "
        strSql+="where 1=1 "
        dbhelper=RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data=dbhelper.Executex_All(strSql)
        return data

    '''
    获取用户行为 
    '''
    def GetUserActivityInfo(self,user,item):
        strSql = "select fid,fuser,fitemname,factivity,factivitytime from user_activity "
        strSql += "where 1=1 "
        if user:
            strSql += "and fuser='"+str(user)+"' "
        if item:
            strSql += "and fitemname='"+str(item)+"' "
        strSql += "order by factivitytime desc "
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data = dbhelper.Executex_All(strSql)
        return data

    '''
    讲推荐结果写入数据库并更改用户状态
    '''
    def AddRecommendationFlow(self,user,itemList):
        r_count=0
        if len(itemList)>0:
            strSql = "INSERT INTO recommendationflow (fuser,fitemname,fmusician,fcreatetime)values"
            flag=True
            for item in itemList:
                if flag:
                    strSql+="('"+str(user)+"','"+str(item).split("|")[0]+"','"+str(item).split("|")[1]+"',NOW())"
                    flag=False
                else:
                    strSql += ",('" + str(user) + "','" + str(item).split("|")[0] + "','" + str(item).split("|")[1] + "',NOW())"

            dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
            r_count = dbhelper.Executex_Rowcount(strSql)
            strSql="UPDATE `user` set fstatus='1',fdate=NOW() "
            strSql+="where 1=1 "
            strSql+="and fname='"+str(user)+"' "
            dbhelper.Executex_Rowcount(strSql)
        return r_count

    '''
    获取用户列表
    '''
    def GetUserCount(self):
        strSql = "select count(fid) from `user` "
        strSql += "where 1=1 "
        strSql += "and fstatus=0 "
        strSql += "or DATEDIFF(now(),fdate)>0 "
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data = dbhelper.Executex_All(strSql)
        return data
    '''
    心跳连接
    '''
    def Heartbeat(self):
        strSql = "update recommendsysapp_sys_para set fparaname=now() where fparatype='心跳时间' "
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        r_count=dbhelper.Executex_Rowcount(strSql)
        return r_count

if __name__ == "__main__":
        print(1)

