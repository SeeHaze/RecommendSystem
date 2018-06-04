# coding:utf-8

import RecommendSysApp.DAL.DBHelper.DBHelperMySQL

class DAL_Admin:

    def GetPrecision(self):
        strSql = "SELECT ("
        strSql += "select count(*) from recommendationflow "
        strSql += "where 1=1 "
        strSql += "and to_days(NOW())-to_days(fcreatetime) = 0 "
        strSql += "and factivity!='' and factivity!='不喜欢' and factivity!='跳过'"
        strSql += ") as zhengcount,("
        strSql += "select count(*) from recommendationflow "
        strSql += "where 1=1 "
        strSql += "and to_days(NOW())-to_days(fcreatetime) = 0 "
        strSql += ") as zongcount "
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data = dbhelper.Executex_All(strSql)
        if int(data[0][1]) == 0:
            return 0
        else:
            return data[0][0]/data[0][1]

    def GetRecall(self):
        strSql = "SELECT ("
        strSql += "select count(*) from recommendationflow "
        strSql += "where 1=1 "
        strSql += "and to_days(NOW())-to_days(fcreatetime) = 0 "
        strSql += "and factivity!='' and factivity!='不喜欢' and factivity!='跳过'"
        strSql += ") as zhengcount,("
        strSql += "select count(*) from user_activity "
        strSql += "where 1=1 "
        strSql += "and to_days(NOW()) - to_days(factivitytime) = 0 "
        strSql += "and factivity != '' and factivity != '不喜欢' and factivity != '跳过' "
        strSql += ") as zongcount "
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data = dbhelper.Executex_All(strSql)
        if int(data[0][1]) == 0:
            return 0
        else:
            return data[0][0] / data[0][1]

    def GetCoverage(self):
        strSql = "select ( "
        strSql += "  select count(scount) from ( "
        strSql += "    select count(*) as scount from recommendationflow "
        strSql += "    where 1=1 group by fitemname,fmusician "
        strSql += "  )A "
        strSql += ")as cover,( "
        strSql += "  select count(*) from raw_item where 1=1 "
        strSql += ") as fcount"
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data = dbhelper.Executex_All(strSql)
        if int(data[0][1]) == 0:
            return 0
        else:
            if data[0][0] / data[0][1] > 1:
                return 1
            else:
                return data[0][0] / data[0][1]

    def GetProgress(self):
        strSql = "select ("
        strSql += "  select count(*) from `user` "
        strSql += "  where 1=1 "
        strSql += "  and fstatus=1 "
        strSql += "  and DATEDIFF(now(),fdate)<1 "
        strSql += ")as a,( "
        strSql += "  select count(*) from `user` "
        strSql += "  where 1=1 "
        strSql += ")as b "
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data = dbhelper.Executex_All(strSql)
        if int(data[0][1]) == 0:
            return 0
        else:
            if data[0][0] / data[0][1] > 1:
                return 1
            else:
                return data[0][0] / data[0][1]

    def GetHeartbeat(self):
        strSql = "select "
        strSql += "TIMESTAMPDIFF(SECOND, fparaname, now()) "
        strSql += "AS `Second`, fparaname "
        strSql += "from recommendsysapp_sys_para "
        strSql += "where 1 = 1 and fparatype = '心跳时间' "
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data = dbhelper.Executex_All(strSql)
        return data