import 'package:flutter/material.dart';


class NotificationCard extends StatefulWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
body:
//===============Home page notification card=====================
SafeArea(
  child:   Container(
    height: 120,
    child: ListView(
  
      shrinkWrap: true,
  
      scrollDirection: Axis.horizontal,
  
      children: [
  
        //======================Airtime==============================
        InkWell(
          child: notificationCard
            ('welcome', 'images/errandbooking.png'),
          onTap: (){},
        ),
  
        InkWell(
          child: notificationCard
            ('welcome', 'images/errandbooking.png'),
          onTap: (){},
        ),
        InkWell(
          child: notificationCard
            ('welcome', 'images/errandbooking.png'),
          onTap: (){},
        ),
      ],
    ),
  
  ),
),
    );
  }

  Card notificationCard(String cardText, cardImage) {
    return Card(
      color: Color(0xff9B51E0),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 300,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(cardImage, width:100, height: 100),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cardText, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10),
                      Text(
                        'What task do you need help with?',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white), ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}
