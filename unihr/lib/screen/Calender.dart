import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  void _onDaySelected (DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*1,
                height: MediaQuery.of(context).size.height*1,
                child: Image.asset(
                  "assets/bg_calendar.png",
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*20
                    ),
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                        size: MediaQuery.of(context).size.height*0.04,
                      ),
                    ),
                  ),
                  TableCalendar(
                    headerVisible: true,
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        fontSize: 32, // Customize the font size
                        fontWeight: FontWeight.bold, // Customize the font weight
                        color: Colors.white,
                      ),
                      leftChevronIcon: Container(
                        width: MediaQuery.of(context).size.width*0.05, // Set the desired width
                        height: MediaQuery.of(context).size.width*0.1, // Set the desired height
                        child: Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      rightChevronIcon: Container(
                        width: MediaQuery.of(context).size.width*0.05, // Set the desired width
                        height: MediaQuery.of(context).size.width*0.1, // Set the desired height
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day)=>isSameDay(day, today),
                    rowHeight: MediaQuery.of(context).size.height*0.06,
                    locale: 'en_US',
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Color(0xffEC6C8B),
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Color(0xffEC6C8B).withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      weekendTextStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      defaultTextStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    focusedDay: today,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    onDaySelected: _onDaySelected,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffAEAEAE),
                      ),
                      weekendStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xffAEAEAE),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
