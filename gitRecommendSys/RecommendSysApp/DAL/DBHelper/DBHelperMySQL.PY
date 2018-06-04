# coding:utf-8
import MySQLdb

class DBHelperMySQL:
    connectname="localhost"
    username="root"
    password="123456"
    dbname="recommendsys"

    '''
    执行sql语句，返回一条结果
    '''
    def Executex_One (self,strSql):
        # 打开数据库连接
        db = MySQLdb.connect(self.connectname, self.username, self.password, self.dbname)

        # 使用cursor()方法获取操作游标
        cursor = db.cursor()

        # 使用execute方法执行SQL语句
        cursor.execute(strSql)

        # 使用 fetchone() 方法获取一条数据
        data = cursor.fetchone()

        # 关闭数据库连接
        db.close()

        return data

    '''
    执行sql语句，返回多条结果
    '''
    def Executex_All (self,strSql):
        # 打开数据库连接
        db = MySQLdb.connect(self.connectname, self.username, self.password, self.dbname,charset='utf8')

        # 使用cursor()方法获取操作游标
        cursor = db.cursor()

        # 使用execute方法执行SQL语句
        cursor.execute(strSql)

        # 使用 fetchall() 方法获取所有数据
        data = cursor.fetchall()

        # 关闭数据库连接
        db.close()

        return data

    '''
    执行sql语句，返回影响的条数
    '''
    def Executex_Rowcount(self, strSql):
        # 打开数据库连接
        db = MySQLdb.connect(self.connectname, self.username, self.password, self.dbname, charset='utf8')

        # 使用cursor()方法获取操作游标
        cursor = db.cursor()
        try:
            cursor.execute(strSql)
            db.commit()
        except:
            db.rollback()
            raise
            return -1
        else:
            return cursor.rowcount
        finally:
            cursor.close()


