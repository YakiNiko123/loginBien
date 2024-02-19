import hashlib
import mysql.connector
from flask import Flask, request, redirect, session, render_template
from flask_jwt_extended import JWTManager, create_access_token
from email.message import EmailMessage
import ssl
import smtplib
import os

programa = Flask(__name__)
# Configura la clave secreta para JWT (debe ser segura en un entorno real)
programa.config['SECRET_KEY'] = os.urandom(24)

# Configura el JWT Manager
jwt = JWTManager(programa)

# MySQL Connector
conexion = mysql.connector.connect(user='root', password='', host='localhost', database='bcap')
cursor = conexion.cursor()

@programa.route('/')
def index():
    return render_template('login.html')

@programa.route('/recuperar')
def boton_recuperar():
    return render_template('recuperar.html')

@programa.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        correo = request.form['correo_enviado']
        contrasena = request.form['contrasena']
        hashed_contrasena = hashlib.sha512(contrasena.encode("utf-8")).hexdigest()
        consulta = f"SELECT contrasena FROM instructor WHERE correo_electronico='{correo}'"
        
        cursor.execute(consulta)
        resultado = cursor.fetchall()
        conexion.commit()
        
        print(hashed_contrasena)
        
        if resultado:
            if resultado[0][0] == hashed_contrasena:

                session['logueado'] = True
                return render_template('recuperar.html')
            else:
                return render_template('login.html', error2='Contraseña incorrecta')
        else:
            return render_template('login.html', error1='Email incorrecto')

@programa.route('/cambio_contrasena', methods=['POST'])
def register():
    if request.method == 'POST':
        correo = request.form['correo']

        cursor.execute(f"SELECT correo_electronico FROM instructor WHERE correo_electronico = '{correo}'" )
        resultado = cursor.fetchone()

        if resultado:
            # Crea un token de verificación usando JWT
            verification_token = create_access_token(identity=correo)

            cursor.execute(f"UPDATE instructor SET token = '{verification_token}' WHERE correo_electronico = '{correo}'")
            conexion.commit()

            # Aquí se envía un correo electrónico de verificación con el token
            asunto = 'Codigo de Recuperación'
            cuerpo = f'Por favor, haga clic en el siguiente enlace para verificar su correo: http://127.0.0.1:5000/nueva/{verification_token}/{correo}'

            email_emisor = 'niccastaeda1@misena.edu.co'  # Correo de prácticas
            email_contrasena = '1005712571Nico'

            em = EmailMessage()
            em['From'] = email_emisor
            em['To'] = correo
            em['Subject'] = asunto
            em.set_content(cuerpo)

            contexto = ssl.create_default_context()

            with smtplib.SMTP_SSL('smtp.gmail.com', 465, context=contexto) as smtp:
                smtp.login(email_emisor, email_contrasena)
                smtp.sendmail(email_emisor, correo, em.as_string())

            return render_template('login.html')
        else:
            return render_template('recuperar.html', mensaje='El correo no existe')

@programa.route('/nueva/<tk>/<correo>')
def nueva(tk, correo):
    cursor.execute(f"SELECT token FROM instructor WHERE  correo_electronico = '{correo}'")
    token_db = cursor.fetchall()
    print(token_db)
    print(tk)   
    print(correo)
    if token_db[0][0] == tk:
        cursor.execute(f"UPDATE instructor SET token = ' ' WHERE correo_electronico = '{correo}'")
        return redirect(f'/nuevacontrasena/{correo}')
    else:
        return redirect('/')
    
    
@programa.route('/nuevacontrasena/<correo>')
def nuevacontrasena(correo):
    print("holaaaaaaa")
    return render_template('nuevacontrasena.html', email=correo)
    

@programa.route('/guardanueva', methods=['POST'])
def guardanueva():
    email = request.form['email']
    contrasena1 = request.form['contraseña1']
    contrasena2 = request.form['contraseña2']
    if contrasena1 == contrasena2:
        contrasena_nueva = hashlib.sha512(contrasena1.encode("utf-8")).hexdigest()
        cursor.execute(f"UPDATE instructor SET contrasena = '{contrasena_nueva}' WHERE correo_electronico = '{email}'")
        conexion.commit()
        return redirect('/')
    else:
        return render_template('nuevacontrasena.html', email = email, mensaje = "Contraseñas no coinciden.")

if __name__ == "__main__":
    programa.run(debug=True)
