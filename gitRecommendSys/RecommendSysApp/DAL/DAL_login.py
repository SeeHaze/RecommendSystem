# coding:utf-8

import RecommendSysApp.DAL.DBHelper.DBHelperMySQL
class DAL_login:
    def CheckLoginInfo(self,user,password,type):
        if type=="admin":
            strSql="SELECT COUNT(*) from sys_para where 1=1\
                    and fparatype='管理员账号|'+'"+user+"' \
                    and fparaname='"+password+"'"
        else:
            strSql="SELECT COUNT(*) FROM `user` where 1=1\
                    and fname='"+user+"'\
                    and fpassword='"+password+"'"
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data = dbhelper.Executex_All(strSql)
        return data[0]