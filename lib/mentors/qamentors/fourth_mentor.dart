import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class FourthMentor extends StatefulWidget {
  //const FourthMentor({Key? key}) : super(key: key);

  @override
  _FourthMentorState createState() => _FourthMentorState();
}

class _FourthMentorState extends State<FourthMentor> {
  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+91-9359644407',
      text: "Hey! I'm inquiring about the Testing Course.",
    );
    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Mentors')),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            height: 1800, // THis is the fixed length of the screen
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.black,
              Colors.black,
              Colors.black,
            ])),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          )),
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(children: [
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //       color: Color.fromRGBO(225, 97, 27, .3),
                                  //       blurRadius: 20,
                                  //       offset: Offset(0,10)
                                  //   )
                                  // ]
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: CircleAvatar(
                                        radius: 80,
                                        backgroundImage: AssetImage(
                                            'assets/mentors/smita mam.jpg'),
                                        //child: Image.asset('assets/prajakt.jpg'),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    ListTile(
                                      tileColor: Colors.grey[300],
                                      title: Text(
                                        'Smita Patil Mam.(Manual Tester)',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    //SizedBox(height: 5,),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ListTile(
                                      tileColor: Colors.grey[300],
                                      title: Text(
                                        '                     Worked At:-                                             '
                                        'Fidel Softech Pvt. Ltd. Pune, Capgemini India Pvt. Ltd. and Finastra India Pvt. Ltd,'
                                        'HCL Software and Telecommunication.',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ListTile(
                                      tileColor: Colors.grey[300],
                                      title: Text(
                                        'Technologies:- Testing ,Database',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),
                                    ListTile(
                                      tileColor: Colors.grey[300],
                                      title: Text(
                                        'Tools:- JIRA, HP ALM QC, Jenkins tool, SOAP UI, FileZilla',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),
                                    ListTile(
                                      tileColor: Colors.grey[300],
                                      title: Text(
                                        'Experience:- 5+ Years of Experience.                ',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ),

                                    SizedBox(height: 30),
                                    Container(
                                      child: Card(

                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,  //I assumed you want to occupy the entire space of the card
                                              image: AssetImage(
                                                'assets/bgabc.jpg',
                                              ),
                                            ),
                                          ),
                                          child: ListTile(
                                            onTap: () {
                                              launchWhatsApp();
                                            },
                                            // tileColor: Colors.grey[300],
                                            minVerticalPadding: 20,
                                            contentPadding: EdgeInsets.zero,
                                            leading: IconButton(
                                              icon: Icon(Icons.messenger, color: Colors.deepPurple ,size: 40,),
                                              onPressed: () {
                                                launchWhatsApp();
                                              },
                                            ),
                                            title: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Center(child: Text('Chat With Us',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w900,fontSize: 20),)),

                                              ],
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Center(child: Text('Enquire more about our courses.', style: TextStyle(color: Colors.black,fontSize: 16),)),
                                               // SizedBox(width: 20,),
                                                Icon(Icons.arrow_forward_ios,color: Colors.deepPurple,size: 30,),
                                              ],
                                            ),

                                          ),
                                        ),
                                      ),


                                    )
                                  ],
                                ))
                          ]))),
                )
              ],
            )),
      ),
    );
  }
}
