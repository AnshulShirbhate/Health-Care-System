from flask import Flask, render_template, request, session, Response
from flask_sqlalchemy import SQLAlchemy
import json
from datetime import date
from werkzeug.utils import redirect
from flaskext.mysql import MySQL
import pymysql
from fpdf import FPDF


todaydate = date.today()

local_server = True

with open("config.json", "r") as c:
    params = json.load(c)["params"]

app = Flask(__name__)
app.secret_key = "super-secret-key"
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["local_uri"]
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["prod_uri"]
db = SQLAlchemy(app)

mysql = MySQL()

app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'fitpros'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)


class Users(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.Text, nullable=False)
    email = db.Column(db.String(40), nullable=False)
    phone_no = db.Column(db.String(12), nullable=False)
    gender = db.Column(db.Text, nullable=False)
    address = db.Column(db.Text, nullable=False)
    password = db.Column(db.String(50), nullable=False)
    date = db.Column(db.Date, nullable=False)


class Userdisease(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.Text, nullable=False)
    weight = db.Column(db.Integer, nullable=False)
    height = db.Column(db.Integer, nullable=False)
    age = db.Column(db.Integer, nullable=False)
    bloodgroup = db.Column(db.String(3), nullable=False)
    disease = db.Column(db.Text, nullable=False)
    comment = db.Column(db.Text, nullable=True)


class Diseases(db.Model):
    pass
    did = db.Column(db.Integer, primary_key=True)
    dname = db.Column(db.Text, nullable=False)
    dimage = db.Column(db.Text, nullable=False)
    ddescription = db.Column(db.Text, nullable=False)
    dsymptoms = db.Column(db.Text, nullable=False)
    dprevention = db.Column(db.Text, nullable=False)
    dexercise = db.Column(db.Text, nullable=False)
    ddiet = db.Column(db.Text, nullable=False)


@app.route("/", methods=["GET", "POST"])
def signin():
    if "user" in session:
        loggeduser = Users.query.filter_by(email=session["user"]).first()
        return render_template("homepage.html", loggeduser=loggeduser)

    if request.method == "POST":
        email = request.form.get("email")
        password = request.form.get("password")

        userlogin = Users.query.filter_by(email=email).first()
        try:
            if email == userlogin.email and password == userlogin.password:
                session["user"] = email
                return render_template("homepage.html", loggeduser=userlogin)
            else:
                return render_template("failure.html")
        except:
            return render_template("failure.html")
    else:
        return render_template("signin.html", page="", email="Email", password="Password")


@app.route("/dashboard", methods=["GET", "POST"])
def dashboard():
    if "user" in session and session["user"] == params["admin_id"]:
        users = Users.query.all()
        return render_template("dashboard.html", users=users)

    if request.method == "POST":
        email = request.form.get("email")
        password = request.form.get("password")

        if email == params["admin_id"] and password == params["admin_pass"]:
            session["user"] = email
            users = Users.query.all()
            return render_template("dashboard.html", users=users)
        else:
            return redirect("/dashboard")
    else:
        return render_template("signin.html", page="dashboard", email="Admin ID", password="Admin Password")


@app.route("/delete/<string:email>")
def deleteuser(email):
    if "user" in session and session["user"] == params["admin_id"]:
        userdelete = Users.query.filter_by(email=email).first()
        db.session.delete(userdelete)
        try:
            userdatadelete = Userdisease.query.filter_by(email=email).first()
            db.session.delete(userdatadelete)
        except:
            pass
        db.session.commit()
        return redirect("/dashboard")


@app.route("/signup", methods=["GET", "POST"])
def signup():
    if request.method == "POST":
        name = request.form.get("username").title()
        email = request.form.get("email")
        phone_no = request.form.get("phnumber")
        gender = request.form.get("gender").capitalize()
        address = request.form.get("address").title()
        password = request.form.get("password")

        entry = Users(name=name, email=email, phone_no=phone_no, gender=gender, address=address,
                      password=password, date=todaydate)
        db.session.add(entry)
        db.session.commit()
        return redirect("/")
    else:
        return render_template("signup.html")


@app.route("/about")
def about():
    return render_template("about.html")


@app.route("/team")
def team():
    return render_template("team.html")


@app.route('/logout')
def logout():
    session.pop("user")
    return redirect("/")


@app.route("/dregistration", methods=["GET", "POST"])
def dregistration():
    if request.method == "POST":
        email = request.form.get("email")
        try:
            present = Userdisease.query.filter_by(email=email).first()
            if email == present.email:
                message = "Looks like you are already registered! Click on try again button and then click on My " \
                          "Report. "
                return render_template("drfailure.html", message=message)
        except:
            pass
        weight = request.form.get("weight")
        height = request.form.get("height")
        age = request.form.get("age")
        bloodgroup = request.form.get("bloodgroup")
        disease = request.form.get("disease").title()
        comment = request.form.get("comment").capitalize()

        entry = Userdisease(email=email, weight=weight, height=height, age=age, bloodgroup=bloodgroup, disease=disease,
                            comment=comment)
        db.session.add(entry)
        db.session.commit()
        return redirect("/")
    else:
        diseases = Diseases.query.all()
        print(diseases)
        return render_template("form.html", diseases=diseases)


@app.route("/userdata/<string:email>")
def userdata(email):
    usersdata = Userdisease.query.filter_by(email=email).first()
    usersdata2 = Users.query.filter_by(email=email).first()

    try:
        diseaseinfo = Diseases.query.filter_by(dname=usersdata.disease).first()
        bmi = int((usersdata.weight / usersdata.height / usersdata.height) * 10000)
        if bmi > 0 and bmi < 18.5:
            bmiresult = "Underweight by BMI"
        elif bmi > 18.5 and bmi <= 25:
            bmiresult = "Normal by BMI"
        elif bmi > 25 and bmi < 30:
            bmiresult = "Overweight by BMI"
        else:
            bmiresult = "Obese by BMI"


        symptoms = diseaseinfo.dsymptoms.split("/")
        symptoms = list(map(lambda symptom: symptom.capitalize(), symptoms))
        preventions = diseaseinfo.dprevention.split("/")
        preventions = list(map(lambda prevention: prevention.capitalize(), preventions))
        exercises = diseaseinfo.dexercise.split("/")
        exercises = list(map(lambda exercise: exercise.capitalize(), exercises))
        diet = diseaseinfo.ddiet.split("/")
        diet = list(map(lambda food: food.capitalize(), diet))

        return render_template("report.html", usersdata=usersdata, usersdata2=usersdata2, bmi=bmi, bmiresult=bmiresult,
                               diseaseinfo=diseaseinfo, symptoms=symptoms, preventions=preventions, exercises=exercises,
                               diet=diet)

    except:
        message = "Looks like you have not registered your data! Please register by clicking on Let's Start button and " \
                  "submitting the form."
        return render_template("drfailure.html", message=message)


@app.route("/diseasemaster", methods=["GET", "POST"])
def diseasemaster():
    if "user" in session and session["user"] == params["admin_id"]:
        if request.method == "POST":
            dname = request.form.get("dname").title()
            dimage = request.form.get("dimage")
            description = request.form.get("description")
            symptoms = request.form.get("symptoms")
            prevention = request.form.get("prevention")
            exercise = request.form.get("exercise")
            diet = request.form.get("diet")
            entry = Diseases(dname=dname, dimage=dimage, ddescription=description, dsymptoms=symptoms, dprevention=prevention,
                             dexercise=exercise, ddiet=diet)
            db.session.add(entry)
            db.session.commit()
            return redirect("/diseasemaster")
        return render_template("diseasemaster.html")
    else:
        return render_template("signin.html")


@app.route("/download/report/diseaselist")
def diseaselist():
    conn = None
    cursor = None
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)

        cursor.execute("SELECT did, dname, dsymptoms FROM diseases")
        result = cursor.fetchall()

        pdf = FPDF()
        pdf.add_page()

        page_width = pdf.w - 2 * pdf.l_margin

        pdf.set_font('Times', 'B', 14.0)
        pdf.cell(page_width, 0.0, 'Disease List', align='C')
        pdf.ln(10)

        pdf.set_font('Times', 'B', 12)

        pdf.ln(1)

        th = pdf.font_size + 5
        pdf.cell(page_width / 14, th, txt="Sr. No", border=1)
        pdf.cell(page_width / 14, th, txt="Id", border=1)
        pdf.cell(page_width / 3, th, txt="Name", border=1)
        pdf.cell(page_width / 2, th, txt="Symptoms", border=1)
        pdf.ln(th)

        pdf.set_font('Times', '', 12)
        srno = 1
        for row in result:
            pdf.cell(page_width/14, th, str(srno), border=1)
            pdf.cell(page_width/14, th, str(row['did']), border=1)
            pdf.cell(page_width/3, th, row['dname'], border=1)
            symptoms = str(row['dsymptoms']).split("/")
            symptoms = symptoms[0:1]
            symptoms = ", ".join(symptoms)
            pdf.cell(page_width/2, th, str(symptoms), border=1)
            pdf.ln(th)
            srno += 1

        pdf.ln(10)
        for row in result:
            symptoms = str(row['dsymptoms']).split("/")
            symptoms = symptoms[1:3]
            symptoms = ", ".join(symptoms)
            pdf.cell(0, th, str(symptoms), border=1)
            pdf.ln(th)

        pdf.ln(10)

        pdf.set_font('Times', '', 10.0)
        pdf.cell(page_width, 0.0, '- end of report -', align='C')
        return Response(pdf.output(dest='S').encode('latin-1'), mimetype='application/pdf',
                        headers={'Content-Disposition': 'attachment;filename=diseaselist.pdf'})
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()


@app.route("/download/report/usersdatalist")
def usersdatalist():
    conn = None
    cursor = None
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)

        # cursor.execute("SELECT id, name, address, phone_no, email, gender FROM users")
        cursor.execute("SELECT userdisease.id, users.name, users.address, users.phone_no, userdisease.email, "
                       "users.gender FROM users JOIN userdisease ON users.email=userdisease.email")

        result = cursor.fetchall()

        pdf = FPDF()
        pdf.add_page()

        page_width = pdf.w - 2 * pdf.l_margin

        pdf.set_font('Times', 'B', 14.0)
        pdf.cell(page_width, 0.0, 'Users Status Report', align='C')
        pdf.ln(10)

        pdf.set_font('Times', 'B', 12)

        pdf.ln(1)

        th = pdf.font_size + 5
        pdf.cell(page_width / 14, th, txt="Sr. No", border=1)
        pdf.cell(page_width / 14, th, txt="Id", border=1)
        pdf.cell(page_width / 6, th, txt="Name", border=1)
        pdf.cell(page_width / 5, th, txt="Address", border=1)
        pdf.cell(page_width / 8, th, txt="Phone No", border=1)
        pdf.cell(page_width / 3, th, txt="Email", border=1)
        pdf.cell(page_width / 7, th, txt="Gender", border=1)
        pdf.ln(th)

        pdf.set_font('Times', '', 12)
        srno = 1
        for row in result:
            pdf.cell(page_width/14, th, str(srno), border=1)
            pdf.cell(page_width/14, th, str(row['id']), border=1)
            pdf.cell(page_width/6, th, row['name'], border=1)
            pdf.cell(page_width/5, th, row['address'], border=1)
            pdf.cell(page_width/8, th, str(row['phone_no']), border=1)
            pdf.cell(page_width/3, th, str(row['email']), border=1)
            pdf.cell(page_width/7, th, str(row['gender']), border=1)
            pdf.ln(th)
            srno += 1

        cursor.execute("SELECT userdisease.email AS user_email, userdisease.disease AS user_disease, "
                       "diseases.dexercise AS user_remedy FROM userdisease JOIN diseases ON "
                       "userdisease.disease=diseases.dname")

        result = cursor.fetchall()
        pdf.ln(10)
        pdf.set_font('Times', 'B', 12)

        th = pdf.font_size + 5
        pdf.cell(page_width / 4, th, txt="Disease", border=1)
        pdf.cell(page_width, th, txt="Remedy", border=1)
        pdf.ln(th)

        pdf.set_font('Times', '', 12)
        for row in result:
            pdf.cell(page_width / 4, th, str(row['user_disease']), border=1)
            pdf.cell(page_width, th, str(row['user_remedy']), border=1)
            pdf.ln(th)

        pdf.ln(10)
        pdf.set_font('Times', '', 10.0)
        pdf.cell(page_width, 0.0, '- end of report -', align='C')
        return Response(pdf.output(dest='S').encode('latin-1'), mimetype='application/pdf',
                        headers={'Content-Disposition': 'attachment;filename=diseaselist.pdf'})
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()

app.run(debug=True)
