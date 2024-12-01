import 'package:flutter/material.dart';
import '../info_screen.dart';
import 'text_column.dart';
class HomeInfo extends StatelessWidget {
  const HomeInfo({Key? key,required this.doctorsInfo}) : super(key: key);
  final List doctorsInfo;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: doctorsInfo.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return InfoScreen(doctorInfo:doctorsInfo[index]);
              }),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, right: 10),
            child: Container(
              width: width*.9333333333333333,
              height: height*.156,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: height*.15375,
                    width: width*.2444444444444444,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(doctorsInfo[index]["image"]),
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  TextColumn(doctorMap:doctorsInfo[index] ,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
