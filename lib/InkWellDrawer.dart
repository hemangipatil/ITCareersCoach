import 'package:flutter/material.dart';
import 'package:itcareerscoach/ContactUs.dart';
import 'package:itcareerscoach/ProfileForm.dart';
import 'package:itcareerscoach/login.dart';
import 'package:share/share.dart';

class InkWellDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext ctxt) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.black,
                    Colors.black
                  ])
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(padding: EdgeInsets.all(8.0),
                        child: Image.asset("assets/pimg.png",fit: BoxFit.contain,height: 95, width: 95),
                      ),
                    ),
                    Text('Hello', style: TextStyle(color: Colors.white, fontSize: 20.0),)
                  ],
                ),
              )),
          SizedBox(height: 10,),
          CustomListTile(Icons.person, 'Profile', ()=>{
            Navigator.pop(ctxt),
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new FormScreen())
            )
          }),

          SizedBox(height: 10,),
          CustomListTile(Icons.share, 'Share APP', ()=>{
            {
              Share.share("please download this link of this app:- https://play.google.com/store/apps/details?id=com.itcareerscoach.itcareerscoach")
            },
          }),
          SizedBox(height: 10,),
          CustomListTile(Icons.call_rounded, 'Contact us', ()=>{
            Navigator.pop(ctxt),
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new ContactUs())
            )
          }),
          CustomListTile(Icons.logout, 'LogOut', ()=>{
            Navigator.pop(ctxt),
            Navigator.push(ctxt,
                new MaterialPageRoute(builder: (ctxt) => new LoginScreen())
            )
          }),
          // SizedBox(height: 10,),
          // CustomListTile(Icons.settings, 'Settings', ()=>{}),
          // SizedBox(height: 10,),
          // CustomListTile(Icons.lock, 'Log Out', ()=>{
          // }),
          // SizedBox(height: 10,),
        ],

      ),
    );
  }
}

class CustomListTile extends StatelessWidget{

  final IconData icon;
  final  String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context){
    //ToDO
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child:Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
            splashColor: Colors.orangeAccent,
            onTap: onTap,
            child: Container(
                height: 40,
                child: Row(
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                      ),
                      Text(text, style: TextStyle(
                          fontSize: 16
                      ),),
                    ],),
                    Icon(Icons.arrow_right)
                  ],)
            )
        ),
      ),
    );
  }
}
