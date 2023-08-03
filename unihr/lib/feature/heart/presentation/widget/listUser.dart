import 'package:flutter/material.dart';

class ListUser extends StatefulWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: MediaQuery.of(context).size.width*0.8,
        height: MediaQuery.of(context).size.height*0.1,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.1),
              width: 1,

            ),
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/pikachu.jpg'),
            radius: 30,
          ),
          title: Text('สมปอง นอนดึก'),
          subtitle: Text('32 Jan 3080'),
          trailing: Stack(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: MediaQuery.of(context).size.width*0.09,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).devicePixelRatio*3,
                  left: MediaQuery.of(context).devicePixelRatio*4,
                ),
                child: Text(
                  "1",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
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
