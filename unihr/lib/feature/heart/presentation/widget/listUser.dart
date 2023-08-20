import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unihr/feature/heart/presentation/bloc/heart_bloc.dart';

class ListUser extends StatefulWidget {
  final HeartBloc heartBloc;
  final String date;
  final int value;
  final String firstname;
  final String lastname;
  const ListUser({Key? key,
    required this.heartBloc,
    required this.date,
    required this.value,
    required this.firstname,
    required this.lastname,
  }) : super(key: key);

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  late DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    dateTime = DateTime.parse(widget.date);
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
          title: Text(
              widget.firstname.toString()
                  + " " +
                  widget.lastname.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            DateFormat("d MMM y").format(dateTime),
          ),
          trailing: Stack(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: MediaQuery.of(context).size.width*0.09,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).devicePixelRatio*2.5,
                  left: MediaQuery.of(context).devicePixelRatio*4,
                ),
                child: Text(
                  widget.value.toString(),
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
