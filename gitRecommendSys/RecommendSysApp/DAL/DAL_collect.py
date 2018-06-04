import json
import RecommendSysApp.DAL.DBHelper.DBHelperMySQL

class DAL_collect:
    def InsertUserData(self, user):
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        strSql = "SELECT COUNT(*) from `User` where 1=1\
                           and fname='" + user + "' "
        data = dbhelper.Executex_All(strSql)
        if data[0][0]==0:
            strSql1="INSERT INTO `User` (fname,fcreatetime) values('"+user+"',now())"
            strSql2="INSERT INTO User_info (fusername) values('"+user+"')"
            dbhelper.Executex_Rowcount(strSql1)
            dbhelper.Executex_Rowcount(strSql2)

    def InsertItemData(self, item, musician):
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        strSql = "SELECT COUNT(*) from raw_item where 1=1\
                           and fitemname='" + item + "' and fmusician='"+musician+"' "
        data = dbhelper.Executex_All(strSql)
        if data[0][0] == 0:
            strSql = "INSERT INTO raw_item (fitemname,fmusician) values('" + item + "','" + musician + "')"
            dbhelper.Executex_Rowcount(strSql)
    def insertData(self,jsonlist):
        for json in jsonlist:
            self.InsertItemData(json["item"], json["musician"])
            self.InsertUserData(json["user"])
            strSql = "INSERT INTO user_activity (fuser,fitemname,factivity,factivitytime)\
             values('" + json["user"] + "','" + json["item"] + "|"+ json["musician"] +"','"+json["activity"]+"',now())"
            dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
            dbhelper.Executex_Rowcount(strSql)



dal=DAL_collect()
jsonlist=[]
json={}
json["item"]="成都"
json["musician"]="赵雷"
json["user"]="菜豆豆"
json["activity"]="评论"
jsonlist.append(json)
dal.insertData(jsonlist)


