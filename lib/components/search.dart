import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guest_house_app/components/buttons/elevatedbutton.dart';
import 'package:guest_house_app/routes/arguments.dart';
import 'package:guest_house_app/styles/themes.dart';
import 'package:intl/intl.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  DateTime checkInDate = DateTime.now();
  DateTime checkOutDate = DateTime(
  DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);

  int noOfRooms = 10;
  int selectedRooms = 01;
  int selectedGuests = 01;
  int selectedGuestValue = 01;
  search(context) {
    if (!checkOutDate.difference(checkInDate).isNegative){
       Navigator.pushNamed(context, '/listingRooms',arguments: SearchArguments(checkInDate,checkOutDate,selectedGuests,selectedRooms));

    }else{
       Fluttertoast.showToast(  
        msg: 'CheckInDate should not be less than CheckOutDate',  
        toastLength: Toast.LENGTH_SHORT,  
        gravity: ToastGravity.BOTTOM,  
        timeInSecForIosWeb: 8,
          
        backgroundColor: Colors.red,  
        textColor: Colors.yellow  
    );  

    } 




  }

  Future<DateTime?> datePicker() async {
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

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: queryData.size.width * 0.08),
      height: queryData.size.height * (2.0 / 5) - queryData.size.height * 0.06,
      width: queryData.size.width,
      //color: Colors.amber,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Column(
          children: [
            //check in and check out
            Flexible(
              child: Container(
                //color: Colors.black12,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    //check in and check out
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //checkin
                        InkWell(
                          onTap: () {
                            datePicker().then((value) {
                              if (value != null) {
                                setState(() {
                                  checkInDate = value;
                                });
                              }
                            });
                          },
                          child: buildChecking("CHECK IN", checkInDate),
                        ),
                        Container(
                          width: 2,
                          decoration: const BoxDecoration(
                            color: Color(0xfff5f5f5),
                          ),
                        ),
                        //checkout
                        InkWell(
                            onTap: () {
                              datePicker().then((value) {
                                if (value != null) {
                                  setState(() {
                                    checkOutDate = value;
                                  });
                                }
                              });
                            },
                            child: buildChecking("CHECK OUT", checkOutDate)),
                      ],
                    ),
                    //In
                    Container(
                      height: queryData.size.height * 0.07,
                      width: queryData.size.width * 0.1,
                      decoration: BoxDecoration(
                        color: const Color(0xfff5f5f5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "1N",
                          style: Themes.inStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              flex: 4,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 2,
              decoration: const BoxDecoration(
                color: Color(0xfff5f5f5),
              ),
            ),
            //guest and rooms
            Flexible(
              child: Container(
                //color: Colors.black26,
                child: Center(
                  child: Row(
                    children: [
                      //checkin
                      buildGuests("GUESTS", selectedGuestValue),
                      Container(
                        width: 2,
                        decoration: const BoxDecoration(
                          color: Color(0xfff5f5f5),
                        ),
                      ),
                      //checkout
                      buildrooms("ROOMS", noOfRooms, selectedRooms),
                    ],
                  ),
                ),
              ),
              flex: 2,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 2,
              decoration: const BoxDecoration(
                color: Color(0xfff5f5f5),
              ),
            ),
            //submit
            Flexible(
              child: Container(
                child: Center(
                  child: ElevatedButtons()
                      .buildSearchButton(context, search, "Search", 40),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30),
              ),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }

  Container buildChecking(String check, DateTime date) {
    return Container(
      // color: Colors.black26,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              check,
              style: Themes.checkinStyle,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('d').format(date),
                    style: Themes.datestyle,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('MMM').format(date) +
                            " " +
                            date.year.toString(),
                        style: Themes.monthstyle,
                      ),
                      Text(
                        DateFormat('EEEE').format(date),
                        style: Themes.monthstyle,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Flexible buildrooms(
    String title,
    int num,
    int selectedvalue,
  ) {
    List<int> items = List.generate(num, (int index) => index + 1);

    return Flexible(
      child: Container(
        // color: Colors.black26,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Themes.checkinStyle,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                width: 20,
              ),
              DropdownButton<int>(
                  value: selectedvalue,
                  items: items.map((int n) {
                    return DropdownMenuItem(
                      value: n,
                      child: Text(
                        n.toString(),
                        style: Themes.noRooms,
                      ),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedRooms = newValue!;
                    });
                  })
            ],
          ),
        ),
      ),
      flex: 1,
    );
  }

  Flexible buildGuests(
    String title,
    int selectedValue,
  ) {
    List<int> items =
        List.generate(selectedRooms * 2, (int index) => index + 1);

    return Flexible(
      child: Container(
        // color: Colors.black26,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Themes.checkinStyle,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                width: 20,
              ),
              DropdownButton<int>(
                  value: selectedValue,
                  items: items.map((int n) {
                    return DropdownMenuItem(
                      value: n,
                      child: Text(
                        n.toString(),
                        style: Themes.noRooms,
                      ),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  })
            ],
          ),
        ),
      ),
      flex: 1,
    );
  }
}
