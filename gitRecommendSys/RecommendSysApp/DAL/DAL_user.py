import RecommendSysApp.DAL.DBHelper.DBHelperMySQL
class DAL_user:
    def GetResultList(self,user):
        strSql = "select fid,fitemname,fmusician from recommendationflow  "
        strSql += "where 1=1 "
        if user:
            strSql += "and fuser='" + str(user) + "' and to_days(fcreatetime) = to_days(NOW()) "
        strSql += "order by fid "
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data = dbhelper.Executex_All(strSql)
        return data

    def UserFeedback(self,fid,factivity):
        strSql = "select fuser,fitemname,fmusician from recommendationflow "
        strSql += "where 1=1 "
        if fid:
            strSql += "and fid='" + str(fid) + "' "
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data = dbhelper.Executex_All(strSql)
        if len(data) > 0:
            user = data[0][0]
            itemname = data[0][1]
            musician = data[0][2]
        else:
            return "-1"
        strSql = "INSERT INTO user_activity (fuser,fitemname,factivity,factivitytime)values"
        strSql += "('" + str(user) + "','" + str(itemname) + "|" + str(musician) + "','" + str(factivity) + "',NOW())"
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        r_count = dbhelper.Executex_Rowcount(strSql)
        strSql = "UPDATE recommendationflow set factivity='" + factivity + "' "
        strSql += "where 1=1 "
        strSql += "and fid='" + str(fid) + "' "
        dbhelper.Executex_Rowcount(strSql)
        return r_count
