import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:unihr/feature/unicalture/presentation/pages/bottomnav/BottomNavigate.dart';
import '../../component/widget/loading.dart';
import '../../storage/secure_storage.dart';
import '../login/presentation/page/login.dart';


class LoadingPage extends StatefulWidget {
  final bool isLogIn;
  const LoadingPage({super.key, required this.isLogIn});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  startLoading() async {

    return Timer(const Duration(seconds: 2), () async{
      if(widget.isLogIn){
        String idRole =  await LoginStorage.readIdRoles();
        if(idRole == "1"){
          log("Role : User");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigateBar()),);
        }
        // else if(idRole == "3"){
        //   log("Role : Manager");
        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigatorBarManager()),);
        // }
      }
      else{
        await LoginStorage.deleteAll();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()),);
      }
    });

  }

  @override
  void initState(){
    super.initState();
    startLoading();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
                child: Loading()
            ),
          ),
        ],
      ),
    );
  }
}