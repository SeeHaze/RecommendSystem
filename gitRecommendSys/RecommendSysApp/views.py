from django.shortcuts import render
from django.http import Http404
from django.http import HttpResponse
from django import forms
from django.shortcuts import render_to_response
import json

import RecommendSysApp.DAL.DAL_user
import RecommendSysApp.DAL.DAL_login
import RecommendSysApp.DAL.DAL_Admin

class UserForm(forms.Form):
    name = forms.CharField()

def admin(request):
    return render(request, 'admin01.html')

def index(request):
    return render(request, 'index.html')
def left(request):
    return  render(request, 'left.html')
def count(request):
    return render(request, 'recommend_count.html')
#用户登录
def login(request):
    return render(request, 'login.html')

def monitor(request):
    return render(request, 'monitor.html')

def ajax_login(request):
    name = str(request.POST.get('name'))
    password = str(request.POST.get('password'))
    login_type = str(request.POST.get('type'))
    if login_type != "":
        if login_type == "0":
            flag = "admin"
        elif login_type == "1":
            flag = "user"
        else:
            return HttpResponse("传入参数有误！")
        dal_login = RecommendSysApp.DAL.DAL_login.DAL_login()
        if int(dal_login.CheckLoginInfo(name, password, flag)[0]) > 0:
            return HttpResponse(login_type)
        else:
            return HttpResponse("-1")
    else:
        return HttpResponse("请选择登录类型！")

def resultList(request):
    name = str(request.POST.get('name'))
    if name == "":
        return HttpResponse("-1")
    else:
        dal_user = RecommendSysApp.DAL.DAL_user.DAL_user()
        data=dal_user.GetResultList(name)
        jsonData = []
        # 循环读取元组数据
        # 将元组数据转换为列表类型，每个条数据元素为字典类型:[{'字段1':'字段1的值','字段2':'字段2的值',...,'字段N:字段N的值'},{第二条数据},...,{第N条数据}]
        for row in data:
            result = {}
            result['id'] = str(row[0])
            result['itemname'] = str(row[1])
            result['musician'] = str(row[2])
            jsonData.append(result)
        json_str=json.dumps(jsonData)
        return HttpResponse(json_str)

def resultFeedback(request):
    fid=str(request.POST.get('flowid'))
    factivity=str(request.POST.get('act'))
    dal_user = RecommendSysApp.DAL.DAL_user.DAL_user()
    fcount = dal_user.UserFeedback(fid,factivity)
    if fcount == -1:
        return HttpResponse("传入参数有误！")
    if fcount > 0 :
        return HttpResponse("成功！")
    else:
        return HttpResponse("操作失败！")

def sysAssess(request):
    dal_admin = RecommendSysApp.DAL.DAL_Admin.DAL_Admin()
    precision = round(dal_admin.GetPrecision(), 2)
    recall = round(dal_admin.GetRecall(), 2)
    if precision+recall == 0:
        f_Measure = 0
    else:
        f_Measure = round((2 * precision * recall) / (precision + recall), 2)
    # print("['"+str(precision*100)+"%','"+str(recall*100)+"%','"+str(f_Measure*100)+"%']")
    return HttpResponse("['"+str(precision*100)+"%','"+str(recall*100)+"%','"+str(f_Measure*100)+"%']")

def getCoverage(request):
    dal_admin = RecommendSysApp.DAL.DAL_Admin.DAL_Admin()
    coverage = round(dal_admin.GetCoverage(), 2)*100
    # print(str(coverage)+"|"+str(100-coverage))
    return HttpResponse(str(coverage)+"|"+str(100-coverage))

def Progress(request):
    dal_admin = RecommendSysApp.DAL.DAL_Admin.DAL_Admin()
    progress = round(dal_admin.GetProgress(), 2) * 100
    return HttpResponse("['"+str(progress)+"%']")

def GetHeartbeat(request):
    dal_admin = RecommendSysApp.DAL.DAL_Admin.DAL_Admin()
    progress = dal_admin.GetHeartbeat()
    print("['" + str(progress[0][0]) + "','" + str(progress[0][1]) + "']")
    return HttpResponse("['" + str(progress[0][0]) + "','" + str(progress[0][1]) + "']")