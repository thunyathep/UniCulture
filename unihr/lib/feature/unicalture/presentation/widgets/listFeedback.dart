import 'package:flutter/material.dart';


class ListFeedback extends StatefulWidget {
  const ListFeedback({Key? key}) : super(key: key);

  @override
  State<ListFeedback> createState() => _ListFeedbackState();
}

class _ListFeedbackState extends State<ListFeedback> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: EdgeInsets.all(
            MediaQuery.of(context).devicePixelRatio*5
        ),
        child: Container(
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/pikachu.jpg'),
                radius: 30,
              ),
              title: Text('อิ่มอร่อยได้ทุกที่กรอบดีถึงใจ'),
              subtitle: Text('สมปอง นอนดึก, 30 Feb 5080'),
            ),
          ),
        ),
      ),
    );
  }
}
