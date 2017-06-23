#!/usr/bin/env python
# -*- coding: utf-8 -*-

from flask import Flask, request, jsonify
import database

app = Flask("Swamp")
db = database.MySqlDB()


@app.route("/")
def index():
    return "Hello World, I am Swamp!"


# get "username", "password", "name", "surname", "email" as json
# return 1 if "username" is unique, 0 if not
@app.route('/add_user', methods=['GET', 'POST'])
def add_user():
    user_json = request.json

    username = user_json["username"]
    userpassword = user_json["password"]

    if db.is_username_exist(username):
        return jsonify({"result": False})

    name = user_json["name"]
    surname = user_json["surname"]
    email = user_json["email"]

    db.add_user(username, userpassword)
    db.add_user_account(username, name, surname, email)

    return jsonify({"result": True})


# get "username", "password", "name", "surname", "email" as json
# return 1 if "username" is unique, 0 if not
@app.route('/test', methods=['GET', 'POST'])
def test():
    username = request.args.get('username')
    password = ""

    username+="denyo ali"

    return username


# get "username", "password"
# return 1 if they match, 0 if not
@app.route('/login', methods=['GET', 'POST'])
def login():
    user_json = request.json

    username = user_json["username"]
    userpassword = user_json["password"]

    if db.is_username_password_match(username, userpassword):
        return jsonify({"result": True})

    return jsonify({"result": False})


# get "username"
# return user account if find username, 0 if username not exists
@app.route('/get_account', methods=['GET', 'POST'])
def get_account():
    user_json = request.json

    username = user_json["username"]

    if not db.is_username_exist(username):
        return jsonify({"result": False})

    result = db.get_account(username)
    result["monthlyRecycled"] = result["totalRecycled"]

    result["result"] = True

    return jsonify(result)


# return total top 5
@app.route('/get_top5', methods=['GET', 'POST'])
def get_top5():
    user_json = request.json

    top5list = db.get_total_top(user_json["username"], 5)

    result = dict()
    result["top5"] = top5list

    return jsonify(result)


# return 1 or 0
@app.route('/add_recycled', methods=['GET', 'POST'])
def add_recycled():
    user_json = request.json

    username = user_json["username"]
    binId = user_json["binId"]
    amount = user_json["amount"]

    db.add_recycled(binId, username, amount)

    result = {'result': True}
    return jsonify(result)


# return 1 or 0
@app.route('/closest_bin', methods=['GET', 'POST'])
def closest_bin():
    user_json = request.json

    result = list()

    loc_x = user_json["x"]
    loc_y = user_json["y"]

    result = db.get_close_bin(loc_x, loc_y)

    result = {'result': result}
    return jsonify(result)


# return 1 or 0
@app.route('/measure_from_pi', methods=['GET', 'POST'])
def measure_from_pi():
    global svUnameDict
    user_json = request.json

    svUnameDict[user_json["binId"]] = user_json["username"]
    # print user_json["username"]
    # print user_json["binId"]

    return jsonify({'result': True})


# return 1 or 0
@app.route('/server_amount', methods=['GET', 'POST'])
def server_amount():
    global svUnameDict
    
    binIdArg = request.args.get('binId')
    amountArg = request.args.get('amount')
    
    svUnameDict[ binIdArg ] = float( amountArg )
    
    return jsonify({'result': True})


# return 1 or 0
@app.route('/is_server_received_amount', methods=['GET', 'POST'])
def is_server_received_amount():
    global svUnameDict
    user_json = request.json

    if not user_json["binId"] in svUnameDict:
        return jsonify({'result': False})

    if type(svUnameDict[ user_json["binId"] ]) == unicode:
        return jsonify({'result': False})

    amount = svUnameDict[user_json["binId"]]
    svUnameDict.pop(user_json["binId"])

    #db.add_recycled(user_json["binId"], user_json["username"], amount)
    return jsonify({'result': True, 'amount': amount})
    # print {'result': True, 'amount':amount}
    #import random
    #amount = random.randint(1,5)
    #return jsonify({'result': True, 'amount': amount})


# open bin
@app.route('/open_bin', methods=['GET', 'POST'])
def open_bin():
    global svBinDict
    binIdArg = request.args.get('binId')

    svBinDict[ binIdArg ] = OPEN_STATE

    return "opening", binIdArg


# close bin
@app.route('/close_bin', methods=['GET', 'POST'])
def close_bin():
    global svBinDict
    binIdArg = request.args.get('binId')

    svBinDict[ binIdArg ] = CLOSE_STATE

    return "closing", binIdArg


# communicate with waste bin
@app.route('/is_bin_opened', methods=['GET', 'POST'])
def is_bin_opened():
    global svBinDict
    binIdArg = request.args.get('binId')

    if svBinDict[ binIdArg ]==OPEN_STATE:
        svBinDict[ binIdArg ]="standby"
        return  OPEN_STATE

    if svBinDict[ binIdArg ]==CLOSE_STATE:
        svBinDict[ binIdArg ]="standby"
        return CLOSE_STATE

    return "standby"


def run():
    app.run(host="0.0.0.0", port=9977, debug=True)


svUnameDict = dict()
svBinDict = dict() # cop acma komutu

svBinDict["112233445566"] = False

OPEN_STATE = '*'
CLOSE_STATE = '+'

if __name__ == "__main__":
    run()
