#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pymysql.cursors


class MySqlDB:
    def __init__(self):
        try:
            self.connect()
            print "MySql connection is successful."
        except:
            print "MySql connection failed!"
            exit()

    def connect(self):
        self.conn = pymysql.connect(
            host='localhost',
            user='root',
            passwd='test', # Config file will be implemented
            db='swamp',
            charset='utf8',
            cursorclass=pymysql.cursors.DictCursor,
            autocommit=True
        )

    # BEG ADD NEW ITEM -----------------------------------
    def add_user(self, username="", password=""):
        sql = "INSERT INTO User (username, password) VALUES ('{}', '{}');".format(username, password)

        self.run_query(sql)

    def add_user_account(self, username="", name="", surname="", email=""):
        sql = "INSERT INTO User_Account (username, name, surname, email, totalRecycled, monthlyRecycled) VALUES ('{}', '{}', '{}', '{}', 0, 0);".format(
            username, name, surname, email)

        self.run_query(sql)

    def add_bin(self, id="", locX="", locY=""):
        sql = "INSERT INTO Bin (id, locX, locY) VALUES ('{}', {}, {});".format(id, locX, locY)

        self.run_query(sql)

    def add_recycled(self, binId="", username="", amount=""):
        sql = "INSERT INTO Recycled (binId, username, amount) VALUES ('{}', '{}', {});".format(binId, username, amount)
        self.run_query(sql)

        self.update_total_recycled(username, amount)

        if self.is_user_bin_exist(username, binId):
            self.update_user_bin(username, binId, amount)
        else:
            self.add_user_bin(username, binId, amount)

        return 1

    def add_user_bin(self, username="", binId="", amount=0):
        sql = "INSERT INTO User_Bin (username, binId, amount) VALUES ('{}', '{}', {});".format(username, binId, amount)

        self.run_query(sql)

    # ----------------------------------- END ADD NEW ITEM

    # BEG UPDATE ITEM -----------------------------------
    # current recycled = cr + amount
    def update_total_recycled(self, username="", amount=0):
        sql = "UPDATE User_Account SET totalRecycled = totalRecycled+{} WHERE username='{}'".format(amount, username)

        self.run_query(sql)

    def update_user_bin(self, username="", binId="", amount=0):
        sql = "UPDATE User_Bin SET amount = amount+{} WHERE username='{}' AND binId='{}'".format(amount, username,
                                                                                                 binId)
        self.run_query(sql)

    # ----------------------------------- END UPDATE ITEM

    # BEG CHECK ITEM -----------------------------------
    # return 1 if exists, 0 if not
    def is_username_exist(self, username=""):
        sql = "SELECT * FROM User WHERE username='{}'".format(username)

        return len(self.run_query(sql))

    # return 1 if match, 0 if not
    def is_username_password_match(self, username, password):
        sql = "SELECT * FROM User WHERE username='{}' AND password='{}';".format(username, password)

        return len(self.run_query(sql))

    def is_user_bin_exist(self, username, binId):
        sql = "SELECT * FROM User_Bin WHERE username='{}' AND binID='{}';".format(username, binId)

        if len(self.run_query(sql)) == 0:
            return 0

        return 1

    # ----------------------------------- END CHECK ITEM

    # BEG GET ITEM -----------------------------------
    def get_account(self, username):
        sql = "SELECT * FROM User_Account WHERE username='{}'".format(username)

        return self.run_query(sql)[0]

    def get_total_top(self, username="", top=5):
        sql = "SELECT username FROM User_Account ORDER BY totalRecycled DESC LIMIT {};".format(top)

        result = []

        counter = 1

        for rec in self.run_query(sql):
            result.append({"username": rec["username"], "point": self.get_user_total(rec["username"]), "rank": counter})
            counter += 1

        result.append(
            {"username": username, "point": self.get_user_total(username), "rank": self.get_user_rank(username)})
        return result

    def get_user_rank(self, username="tanss"):
        sql = "SELECT username FROM User_Account ORDER BY totalRecycled DESC;"

        result = []
        for rec in self.run_query(sql):
            result.append(rec["username"])

        return result.index(username) + 1

    def get_user_total(self, username):
        sql = "SELECT totalRecycled FROM User_Account WHERE username='{}'".format(username)

        return self.run_query(sql)[0]["totalRecycled"]

    def get_bin_list(self):
        sql = "SELECT * FROM Bin;"

        result = list()
        for rec in self.run_query(sql):
            result.append(rec)

        return result

    # YOU MUST HAVE PEOPLE THAT USED THE BIN TO CHECK THIS
    def get_bin_owner(self, binId=""):
        sql = "SELECT username, amount FROM User_Bin WHERE binId='{}' ORDER BY amount DESC;".format(binId)

        result = self.run_query(sql)[0]

        return result

    # offset is to decide if bin is close to user or not
    # smaller offset is just closer bin
    def get_close_bin(self, x, y, offset=5.0):
        result = list()

        for rec in self.get_bin_list():
            if (rec["locX"] - offset <= x <= rec["locX"] + offset) and (
                                rec["locY"] - offset <= x <= rec["locY"] + offset):
                owner = self.get_bin_owner(rec["id"])
                rec["username"] = owner["username"]
                rec["owner_amount"] = owner["amount"]
                user_details = self.get_account(rec["username"])
                rec["owner_name"] = user_details["name"]
                rec["owner_surname"] = user_details["surname"]
                result.append(rec)

        return result

    # ----------------------------------- END CHECK ITEM

    def run_query(self, sql):
        cursor = ""
        try:
            cursor = self.conn.cursor()
            cursor.execute(sql)
        except:
            self.connect()
            cursor = self.conn.cursor()
            cursor.execute(sql)

        result = list()
        for row in cursor:
            result.append(row)

        cursor.close()
        return result

    def fill_test_input(self):
        a.add_user("didin", "12345")
        a.add_user_account("didin", "Muhammed", "Didin", "cilginDidin80@gmail.com")


if __name__ == "__main__":
    a = MySqlDB()
    # a.add_user_bin("suleymanu", "c2:27:eb:13:eb:d2@iotigniteagent", 1.9)
    # print a.get_bin_owner("c0:27:eb:13:eb:d2@iotigniteagent")
    # a.get_close_bin(33.1, 33.5)
    # a.add_bin("c3:27:eb:13:eb:d2@iotigniteagent", 35.248500, 33.022233)
    # a.add_recycled("b8:27:eb:13:eb:d2@iotigniteagent", "alis", 100)
