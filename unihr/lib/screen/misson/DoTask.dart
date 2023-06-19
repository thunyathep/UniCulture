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
                    height: MediaQuery.of(context).size.height*0.3,
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
            ],
          ),
        ),
      ),
    );
  }
}
