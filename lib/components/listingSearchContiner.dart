import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:guest_house_app/styles/themes.dart';
import 'package:intl/intl.dart';

class ListingSearchContainer extends StatefulWidget {
  DateTime checkInDate;
  DateTime checkOutDate;
  ListingSearchContainer(this.checkInDate,this.checkOutDate);

  @override
  State<ListingSearchContainer> createState() => _ListingSearchContainerState();
}

class _ListingSearchContainerState extends State<ListingSearchContainer> {


    Future<DateTime?> datePickerChekcIn(checkInDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context, initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now()
              .day), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(DateTime.now().year, DateTime.now().month + 1,
          DateTime.now().day + 1),
      currentDate: checkInDate,
    );
    return pickedDate;
  }
   Future<DateTime?> datePickerChekcOut(DateTime checkInDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context, initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          checkInDate.day), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(DateTime.now().year, DateTime.now().month + 1,
          DateTime.now().day + 1),
          currentDate: checkInDate
      
    );
    return pickedDate;
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 120,
      width: double.infinity,
      color: Colors.blue,
      padding:const  EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 10),
      child: SizedBox(
        height: 60,
        child: Card(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: InkWell(
                  onTap:  () {
                            datePickerChekcIn(widget.checkInDate).then((value) {
                              if (value != null) {
                                setState(() {
                                  widget.checkInDate = value;
                                });
                              }
                            });
                          },
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('d').format(widget.checkInDate),
                          style: Themes.datestyle,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                               DateFormat('MMM').format(widget.checkInDate) +
                            " " +
                            widget.checkInDate.year.toString(),
                              style: Themes.monthstyle,
                            ),
                            Text(
                               DateFormat('EEEE').format(widget.checkInDate),
                              style: Themes.monthstyle,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: InkWell(
                  onTap:  () {
                            datePickerChekcOut(widget.checkInDate).then((value) {
                              if (value != null) {
                                setState(() {
                                  widget.checkOutDate = value;
                                });
                              }
                            });
                          },
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                           DateFormat('d').format(widget.checkOutDate),
                          style: Themes.datestyle,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('MMM').format(widget.checkOutDate) +
                            " " +
                            widget.checkOutDate.year.toString(),
                              style: Themes.monthstyle,
                            ),
                            Text(
                             DateFormat('EEEE').format(widget.checkOutDate),
                              style: Themes.monthstyle,
                            )
                          ],
                        )
                      ],
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
