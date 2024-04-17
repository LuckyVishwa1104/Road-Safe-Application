from flask import Flask , request , jsonify
import random

app = Flask(__name__)

@app.route("/",methods=["GET","POST"])
def ro(id):
    if request.method == "POST":
        print("e")
        print(request.files)
        # request.files['file'].save(f"upload/{random.randint(1000)}.jpg")
        request.files['file'].save(f"upload/title.jpg")
        return jsonify({})
    return id

app.run("192.168.196.212",port=5000,debug=True)