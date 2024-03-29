import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unihr/feature/feedback/presentation/bloc/feedback_bloc.dart';

import '../../data/model/feedback_model.dart';


class ListFeedback extends StatefulWidget {
  final FeedbackBloc feedbackBloc ;
  final String feedbackType;
  final int currentpage;
  final String title;
  final String firstName;
  final String lastName;
  final String date;
  const ListFeedback({Key? key,
    required this.feedbackBloc,
    required this.feedbackType,
    required this.currentpage,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.date}) : super(key: key);


  @override
  State<ListFeedback> createState() => _ListFeedbackState();
}

class _ListFeedbackState extends State<ListFeedback> {
  late DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    dateTime = DateTime.parse(widget.date);
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
              leading: widget.feedbackType == "anonymous" && widget.currentpage == 0 ?
              CircleAvatar(
                backgroundImage:
                  AssetImage('assets/profilepic.png'),
                radius: 30,
              ) : CircleAvatar(
                backgroundImage:
                AssetImage('assets/pikachu.jpg'),
                radius: 30,
              ),
              title: Text(
                "\""+widget.title+"\"",
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: widget.feedbackType == "anonymous" && widget.currentpage == 0 ?
              Text("Anonymous" + ", " +
                  DateFormat("d MMM y , H:M").format(dateTime),
                style: TextStyle(
                  fontSize: 10,
                ),):
              Text(
                  widget.firstName.toString() +
                      ' '
                      + widget.lastName.toString() +
                  ", "+ DateFormat("d MMM y , H:M").format(dateTime),
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
