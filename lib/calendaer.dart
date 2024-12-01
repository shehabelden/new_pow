import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pow/presentation/favoret/cubit/cubit.dart';
import 'package:pow/presentation/favoret/cubit/state.dart';

import 'presentation/main_screen/cubit/cubit.dart';
import 'presentation/main_screen/cubit/state.dart';

List<String> Times = [
  "9:30 Am",
  "10:30 Am",
  "11:30 Am",
  "12:30 Pm",
  "9:30pm",
  "9:30pm"
];

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    Key? key,
    this.doctorMap,
    required this.onLocaleChanged,
  }) : super(key: key);

  final Map<String,dynamic>  ?doctorMap;
  final ValueChanged<Locale> onLocaleChanged;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  int checkin = 0;
  DateTime date=DateTime.now();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    FavoriteCubit cubit=FavoriteCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Color(0xffFFFFFF),
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(0xff81ECFF).withOpacity(.25),
        actions: [
          Row(
            children: [
              Text(
                widget.doctorMap!["name"],
                style: GoogleFonts.manrope(
                  color: Color(0xffFFFFFF),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: width*.4166666666666667,
              )
            ],
          ),
        ],
      ),
      body: BlocBuilder<FavoriteCubit, MainFavoriteCubitState>(
          builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                  child: Container(
                    height: height/2,
                    width: width*.9444444444444444,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                      onDateChanged: (selectedDate) {
                        setState(() {
                          date=selectedDate;

                        });
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "  Pick a Time",
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 60,
                  ),
                  itemCount: Times.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          checkin =
                              index; // Use the assignment operator '=' instead of '!='
                        });
                        print(checkin);
                      },
                      child: Container(
                        width:
                            width*.2777777777777778, // Adjust this value to make the container smaller or larger
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: checkin != index
                              ? Color(0xffffffff)
                              : Color(0xff70d6d1),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0, 4),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: checkin != index
                              ? Text('${Times[index]}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                    color: Color(0xff000000),
                                  ))
                              : Text(
                                  '${Times[index]}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: .9444444444444444*width,
                      height: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff70d6d1)),
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => CustomCalendar(
                          //           onLocaleChanged: (Locale value) {},
                          //         ))); // Changed to MatewrialPageRoute
                          print(FirebaseAuth.instance.currentUser!.uid);
                          cubit.addData(FirebaseAuth.instance.currentUser!.uid,{
                           "doctor_info":widget.doctorMap,
                            "booking_time":date,
                          });
                          final snackBar = SnackBar(
                            content: Text('booking is done!'),
                            action: SnackBarAction(
                              label: '',
                              onPressed: () {
                                // Perform some action here
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Book an Appointment",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Image.asset("images/deadline (1) 1.png"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
              ],
            ),
          );
        }
      ),
    );
  }
}

