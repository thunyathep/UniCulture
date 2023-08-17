import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextEditingController username = TextEditingController();
  // TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late bool obscure = true;
  bool userFieldError = false;
  bool passwordFieldError = false;
  bool isLoginFail = false;
  bool isLoading = false;
  Map loginData = {"username": "", "password": ""};



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Image.asset(
                  "assets/logoUni.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left : MediaQuery.of(context).devicePixelRatio*10,
                ),
                child: Text(
                  "เข้าสู่ระบบ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio*10,
                  right: MediaQuery.of(context).devicePixelRatio*10,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio*10,
                        ),
                        child: TextFormField(
                          style: GoogleFonts.kanit(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              setState(() => userFieldError = true);
                              return "กรุณาใส่ชื่อผู้ใช้";
                            }
                            setState(() => userFieldError = false);
                            return null;
                          },
                          onChanged: (String username) {
                            setState(() {
                              loginData["username"] = username;
                            });
                          },
                          decoration: InputDecoration(
                            floatingLabelStyle: GoogleFonts.kanit(),
                            labelText: "ชื่อผู้ใช้",
                            labelStyle: GoogleFonts.kanit(
                                fontSize: 18,
                                color: userFieldError ? Colors.red : Colors.grey),
                            prefixIcon: Icon(Icons.account_circle_rounded,
                                color: userFieldError ? Colors.red : Colors.grey),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            errorStyle: GoogleFonts.kanit(fontSize: 15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 5,
                        ),
                        child: TextFormField(
                          style: GoogleFonts.kanit(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              setState(() => passwordFieldError = true);
                              return "กรุณาใส่รหัสผ่าน";
                            } else if (value.length < 8) {
                              setState(() => passwordFieldError = true);
                              return "รหัสผ่านต้องมีอย่างน้อย 8 ตัวอักษร";
                            }
                            setState(() => passwordFieldError = false);
                            return null;
                          },
                          onChanged: (String password) {
                            setState(() {
                              loginData["password"] = password;
                            });
                          },
                          obscureText: obscure,
                          decoration: InputDecoration(
                            floatingLabelStyle: GoogleFonts.kanit(),
                            hintStyle: GoogleFonts.kanit(),
                            labelText: "รหัสผ่าน",
                            labelStyle: GoogleFonts.kanit(
                                fontSize: 18,
                                color:
                                passwordFieldError ? Colors.red : Colors.grey),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: passwordFieldError ? Colors.red : Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() => obscure = !obscure);
                              },
                              icon: Icon(
                                obscure ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            errorStyle: GoogleFonts.kanit(fontSize: 15),
                          ),
                        ),
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginStateLoading) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffc6c6c6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      if (formKey.currentState!.validate()) {
                                        log("success");
                                      } else {
                                        log("not success");
                                      }
                                    },
                                    child: Padding(
                                        padding: const  EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const  SizedBox(
                                                height: 25,
                                                width: 25,
                                                child: CircularProgressIndicator(
                                                  color: Colors.white,
                                                )),
                                            const SizedBox(width: 15,),
                                            Text("กำลังเข้าสู่ระบบ",style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                color: Colors.white),)
                                          ],
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            );
                          }
                          else if (state is LoginStateFailure) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 45,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff6FC9E4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        if (formKey.currentState!.validate()) {
                                          context.read<LoginBloc>().add(
                                              LoginEventDoLogin(
                                                  username: loginData["username"],
                                                  password: loginData["password"]));
                                          // logInProvider.login(loginData["username"], loginData["password"]);
                                          log("success");
                                        } else {
                                          log("not success");
                                        }
                                      },
                                      child: Text(
                                        "เข้าสู่ระบบ",
                                        style: GoogleFonts.kanit(
                                            fontSize: 16,
                                            color: Colors.white),
                                      )),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "ไม่สามารถเข้าสู่ระบบได้ กรุณาลองอีกครั้ง",
                                  style: GoogleFonts.kanit(
                                      fontSize: 15, color: Colors.red),
                                )
                              ],
                            );
                          }
                          else if(state is LoginStateSuccess){
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  const LoadingPage(isLogIn: true,), // Replace with your home page
                                ),
                                    (route) => false,
                              );
                            });
                            return SizedBox(
                              height: 45,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff6FC9E4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Text(
                                    "เข้าสุ่ระบบสำเร็จ",
                                    style: GoogleFonts.kanit(
                                        fontSize: 16,
                                        color: Colors.white),
                                  )),
                            );
                          }
                          else {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 45,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff6FC9E4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        if (formKey.currentState!.validate()) {
                                          context.read<LoginBloc>().add(
                                              LoginEventDoLogin(
                                                  username: loginData["username"],
                                                  password: loginData["password"]));
                                          // logInProvider.login(loginData["username"], loginData["password"]);
                                          log("success");
                                        } else {
                                          log("not success");
                                        }
                                      },
                                      child: Text(
                                        "เข้าสุ่ระบบ",
                                        style: GoogleFonts.kanit(
                                            fontSize: 16,
                                            color: Colors.white),
                                      )),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            );
                          }
                        },
                      ),
                      Text(
                        "version 1.0",
                        style: GoogleFonts.kanit(
                            fontSize: 17,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
