# coding:utf-8

import RecommendSysApp.DAL.DBHelper.DBHelperMySQL
class DAL_para:

    '''
    获取多条数据
    '''
    def getAllParaInfo(self,fparatype):
        strSql = "select fid,fparatype,fparaname,fparaorder from recommendsysapp_sys_para "
        strSql+="where 1=1 "
        if fparatype:
            strSql+="and fparatype='"+fparatype+"' "
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data = dbhelper.Executex_All(strSql)
        return data

    '''
    获取一条数据
     '''
    def getOneParaInfo(self,fparatype):
        strSql = "select fid,fparatype,fparaname,fparaorder from recommendsysapp_sys_para "
        strSql+="where 1=1 "
        if fparatype:
            strSql+="and fparatype='"+fparatype+"' "
        strSql += "order by fid desc "
        strSql+="limit 1; "
        dbhelper = RecommendSysApp.DAL.DBHelper.DBHelperMySQL.DBHelperMySQL()
        data = dbhelper.Executex_All(strSql)
        if len(data)>0:
            return data[0]
        return data