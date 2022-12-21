import 'package:flutter/material.dart';
import 'package:plugz/pages/expenses_recurring.dart';


class ExpOntime extends StatefulWidget {
  const ExpOntime({Key? key}) : super(key: key);

  @override
  State<ExpOntime> createState() => _ExpOntimeState();
}

class _ExpOntimeState extends State<ExpOntime> {

  Color airtimColor = Color(0xff9B51E0);
  Color dataColor = Colors.transparent;
  Color bookingColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.more_vert, color: Colors.grey,), onPressed: () {  },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle, color: Color(0xff9B51E0) ),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
        ], //<Wi
      ),
      body:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                const Text(
                  'Expenses',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), ),

                const SizedBox(height: 40,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('One Time', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal), ),
                       SizedBox(height: 5),
                        Container(
                        width: 80,
                          child: Container(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff9B51E0),

                          ),
                          height: 10,
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox(width: 20.0,)),
                    Column(
                      children: [
                        InkWell(
                          child:  Text('Recurring', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal), ),
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExpRecurring()));
                          },
                        )
                       ,
                        SizedBox(height: 5),
                        Container(
                          width: 80,
                          child: Container(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent
                          ),
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 40,),
                //the card container
                Container(
                  height: 70,
                  width:double.infinity,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      //======================Airtime==============================
                     InkWell(
                       child: buildCard('Airtime'),
                       onTap: (){
                         setState(() {
                           airtimColor = Color(0xff9B51E0);
                           dataColor = Colors.transparent;
                           bookingColor = Colors.transparent;
                         });
                       },
                     ),

          //======================Data==============================
                      InkWell(
                        child: buildCard('Data'),
                        onTap: (){
                          setState(() {
                            airtimColor = Colors.transparent;
                            dataColor = Color(0xff9B51E0);
                            bookingColor = Colors.transparent;
                          });
                        },
                      ),

//======================Bookings==============================
                      InkWell(
                        child: buildCard('Bookings'),
                        onTap: (){
                          setState(() {
                            airtimColor = Colors.transparent;
                            dataColor = Colors.transparent;
                            bookingColor = Color(0xff9B51E0);
                          });
                        },
                      )
                    ],
                    // itemCount: 15,
                  ),
                ),

            SizedBox(height: 40,),
                //the three dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildDot(airtimColor),
                    buildDot(dataColor),
                    buildDot(bookingColor),
                    ],
                ),
              ],
            ),
          )),

    );
  }

   //card container
   Card buildCard(String cardText) {
    return Card(
                      child: Container(
                        width: 150,
                        child: Center(child:
                        Text(cardText, style: TextStyle(color: Colors.white, fontSize: 18),)
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff9B51E0),
                        ),
                      ),
                    );
  }


  //dot container
  Container buildDot(Color dotColor) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      width: 10,
      height: 10,
      child: Container(),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff9B51E0)),
        borderRadius: BorderRadius.circular(100),
        color: dotColor,
      ),
    );
  }
}
