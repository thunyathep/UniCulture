import 'package:flutter/material.dart';

class DoTask extends StatefulWidget {
  const DoTask({Key? key}) : super(key: key);

  @override
  State<DoTask> createState() => _DoTaskState();
}

class _DoTaskState extends State<DoTask> {
  final TextEditingController _textEditingControllerDetail = TextEditingController();
  final TextEditingController _textEditingControllerLearned = TextEditingController();
  int _characterCountDetail = 0;
  int _characterCountLearned = 0;
  int _maxLength = 60;

  @override
  void initState() {
    super.initState();
    _textEditingControllerDetail.addListener(_updateCharacterCount);
  }

  @override
  void dispose() {
    _textEditingControllerDetail.dispose();
    super.dispose();
  }

  void _updateCharacterCount() {
    setState(() {
      _characterCountDetail = _textEditingControllerDetail.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*1,
                    child: Image.asset(
                      'assets/top_bar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.0), // Start color with opacity
                          Colors.white.withOpacity(1), // End color with opacity
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*20
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black,
                            size: MediaQuery.of(context).size.height*0.04,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).devicePixelRatio*10,
                            right: MediaQuery.of(context).devicePixelRatio*10,
                          ),
                          child: Text(
                            "ทำความรู้จักน้องๆฝึกงาน",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio*10,
                ),
                child: Text(
                  "กรอกรายละเอียด",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*5,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return TextField(
                          onChanged: (value){
                            setState(() {
                              _characterCountDetail = _maxLength-_characterCountDetail;
                            });
                          },
                          controller: _textEditingControllerDetail,
                          maxLength: _maxLength,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xff757575).withOpacity(0.15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "ข้อความ",
                            hintStyle: TextStyle(
                              color: Color(0xff757575),
                              fontSize: 12,
                            ),
                            counter: Text(
                              '($_characterCountDetail/$_maxLength)',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          maxLines: null, // Allow multiple lines
                          textAlignVertical: TextAlignVertical.center,
                        );
                      }
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio*10,
                ),
                child: Text(
                  "สิ่งที่ได้เรียนรู้",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*5,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          return TextField(
                            onChanged: (value){
                              setState(() {
                                _characterCountLearned = _maxLength-_characterCountLearned;
                              });
                            },
                            controller: _textEditingControllerLearned,
                            maxLength: _maxLength,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff757575).withOpacity(0.15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "ข้อความ",
                              hintStyle: TextStyle(
                                color: Color(0xff757575),
                                fontSize: 12,
                              ),
                              counter: Text(
                                '($_characterCountLearned/$_maxLength)',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            maxLines: null, // Allow multiple lines
                            textAlignVertical: TextAlignVertical.center,
                          );
                        }
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio*10,
                ),
                child: Text(
                  "หลักฐานการทำภารกิจ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*5,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.25,
                    decoration: BoxDecoration(
                      color: Color(0xff757575).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).devicePixelRatio*10,
                              ),
                              child: Image.asset(
                                "assets/upload.png"
                              ),
                            ),
                            Text(
                              "อัพโหลดไฟล์ที่นี่",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).devicePixelRatio*5,
                              ),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xff5581F1), //<-- SEE HERE
                                child: IconButton(
                                  icon: Icon(
                                    Icons.file_upload_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20.0)), //this right here
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.27,
                              width: MediaQuery.of(context).size.width*0.8,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).devicePixelRatio*5,
                                    ),
                                    child: Text(
                                      "ยืนยันการทำภารกิจ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).devicePixelRatio*5,
                                    ),
                                    child: Text(
                                      "คุณต้องการยืนยันการทำภารกิจ",
                                      style: TextStyle(
                                        color: Color(0xff757575),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).devicePixelRatio*2,
                                    ),
                                    child: Text(
                                      "ภารกิจฮ๊าฟฟู่ววว",
                                      style: TextStyle(
                                        color: Color(0xff757575),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),


                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(20.0)), //this right here
                                              child: Container(
                                                height: MediaQuery.of(context).size.height*0.2,
                                                width: MediaQuery.of(context).size.width*0.8,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        top: MediaQuery.of(context).devicePixelRatio*10,
                                                      ),
                                                      child: Text(
                                                        "ยืนยันการทำภารกิจแล้ว",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),


                                                    GestureDetector(
                                                      onTap: (){
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                          top: MediaQuery.of(context).devicePixelRatio*10,
                                                        ),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width*0.6,
                                                          height: MediaQuery.of(context).size.height*0.03,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.all(
                                                              Radius.circular(20),
                                                            ),
                                                            color: Color(0xffF05F5F),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "ปิด",
                                                              style: TextStyle(
                                                                color: Color(0xffffffff),
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).devicePixelRatio*5,
                                      ),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width*0.6,
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            color: Color(0xff5581F1),
                                            border: Border.all(
                                              color: Color(0xff5581F1),
                                              width: 2,
                                            )
                                        ),
                                        child: Center(
                                          child: Text(
                                            "ยืนยัน",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).devicePixelRatio*2,
                                      ),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width*0.6,
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Color(0xff5581F1),
                                              width: 2,
                                            )
                                        ),
                                        child: Center(
                                          child: Text(
                                            "ยกเลิก",
                                            style: TextStyle(
                                              color: Color(0xff5581F1),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*5,
                    ),
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xffFCB0C2),
                            Color(0xffF4BFCF),
                            Color(0xffF0C5F1),
                            Color(0xffE3DEF4),
                            Color(0xffC1E1E7),
                            Color(0xffC1E1E6),
                          ]
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "ยืนยัน",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
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
