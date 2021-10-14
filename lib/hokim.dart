import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hokimlar/modellar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hokimlar/player.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
class Hokimlar extends StatefulWidget {
  @override
  _HokimlarState createState() => _HokimlarState();
}
class _HokimlarState extends State<Hokimlar> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  Widget top(int index) {
    return InkWell(
      onTap:()=> Navigator.push(
          context,
          MaterialPageRoute(builder: (_)=>MusicPlayer(
            obyekt1: obyekt[index],
          ))),
      child: Padding(
        padding: EdgeInsets.only(top: 9,left: 9),
        child: Container(
          height: 150.0,
          // width:MediaQuery.of(context).size.width*0.3,
          decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10.0), boxShadow: [
            BoxShadow( color: Colors.white70, blurRadius: 5.0)
          ]),
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0),),
                    image: DecorationImage(
                        image: AssetImage(obyekt[index].rasm), fit: BoxFit.cover)),
              ),
              Container(
                height: 50.0,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.only(bottomRight: Radius.circular(10.0),bottomLeft: Radius.circular(10.0),),
                  color:Colors.black87,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5.0, left: 5.0, right: 5.0, bottom: 3.0),
                      child: AutoSizeText(
                        obyekt[index].nomi,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
                      child: AutoSizeText(obyekt[index].avtor,
                          style: TextStyle(
                            color: Colors.white70
                          ),
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget konteynerlar(int index) {
    return InkWell(
      onTap: ()=>
          Navigator.push(
              context,
              MaterialPageRoute(builder: (_)=>MusicPlayer(obyekt1: obyekt[index],))),
      child: Padding(
        padding: EdgeInsets.only(top: 9.0,left: 9.0),
        child: Container(
          height: 135.0,
          width: 110.0,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                     color: Colors.white70, blurRadius: 4.0)
              ]),
          child: Column(
            children: <Widget>[
              Container(
                height: 88,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0),),
                    image: DecorationImage(
                        image: AssetImage(obyekt[index].rasm), fit: BoxFit.cover)),
              ),
              Container(
                height: 47.0,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.only(bottomRight: Radius.circular(10.0),bottomLeft: Radius.circular(10.0),),
                  color: Colors.black87,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5.0, left: 5.0, right: 5.0, bottom: 3.0),
                      child: AutoSizeText(
                        obyekt[index].nomi,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: AutoSizeText(obyekt[index].avtor,
                          style: TextStyle(fontSize: 12.0, color: Colors.white70),
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          //physics: BouncingScrollPhysics(),
           slivers: <Widget>[
         SliverAppBar(
           leading: IconButton(
             icon: Icon(Icons.account_circle_outlined),
             color: Colors.lightBlue,
             iconSize: 40.0,
             onPressed:()=>AwesomeDialog(
                 context: context,
                 dialogType: DialogType.SUCCES,
                 borderSide: BorderSide(color: Colors.white,width: 2),
                 width: 350,
                 buttonsBorderRadius: BorderRadius.all(Radius.circular(2.0)),
                 headerAnimationLoop: false,
                 animType: AnimType.BOTTOMSLIDE,
                 title:'Информация',
                 desc: 'Хокимлар',
                 buttonsTextStyle: TextStyle(color: Colors.black),
                 showCloseIcon: true,
                 btnOkOnPress: (){},
                 btnOkColor: Colors.white,
                 dialogBackgroundColor: Colors.white54

             )..show(),),
           title: Text('...',
             style:TextStyle(
               color: Colors.black,
               fontSize: 20.0,
               shadows: [Shadow(
                   blurRadius: 10.0,
                   color: Colors.grey,
                   offset: Offset(5.0, 5.0)
               )]
             ) ,),
          backgroundColor: Colors.white,
          pinned: this._pinned,
          snap: this._snap,
          floating: this._floating,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/1g.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
            child:Container(
              decoration: BoxDecoration(
                color: Colors.black
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 2), blurRadius: 7, color: Colors.black54)
                    ]),
                    height: 200.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: 110.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              image: DecorationImage(
                                  image: AssetImage('assets/4.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                          height: 200.0,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Нужна помощь',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                  '  Если вам нужна помощь, нажмите.\nкнопки ниже\n'
                                      'Приложение работает в тестовом\nрежиме. Заранее '
                                      'приносим свои \nизвинения за возможные\n недостатки',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12.0,
                                  )),
                              Row(
                                children: <Widget>[
                                  FlatButton(
                                      onPressed: () => AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.INFO_REVERSED,
                                          borderSide: BorderSide(color: Colors.white,width: 2),
                                          width: 350,
                                          buttonsBorderRadius: BorderRadius.all(Radius.circular(2.0)),
                                          headerAnimationLoop: false,
                                          animType: AnimType.BOTTOMSLIDE,
                                          title:'Информация',
                                          desc: 'Спасибо, что воспользовались нашим сервисом',
                                          buttonsTextStyle: TextStyle(color: Colors.black),
                                          showCloseIcon: true,
                                          btnOkOnPress: (){},
                                          btnOkColor: Colors.white,
                                          dialogBackgroundColor: Colors.white54

                                      )..show(),
                                      child: Text(
                                        'Не Сейчас',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF8133ff),
                                        ),
                                      )),
                                  FlatButton(
                                      onPressed: () => AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.INFO_REVERSED,
                                        borderSide: BorderSide(color: Colors.white,width: 2),
                                        width: 350,
                                        buttonsBorderRadius: BorderRadius.all(Radius.circular(2.0)),
                                        headerAnimationLoop: false,
                                        animType: AnimType.BOTTOMSLIDE,
                                        title:'Информация',
                                        desc: 'С помощью этой программы вы\n можете слушать свою любимую\n музыку.Если в программе\nесть недостатки,\n вы можете связаться с azizbekqodirov441@email.com\n и заранее извиниться.',
                                        buttonsTextStyle: TextStyle(color: Colors.black),
                                        showCloseIcon: true,
                                        btnOkOnPress: (){},
                                        btnOkColor: Colors.white,
                                        dialogBackgroundColor: Colors.white54

                                      )..show(),
                                      child: Text(
                                        'Справка',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFbd15FF)),
                                      ))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Популярный',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8133ff),
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Icon(
                            Icons.favorite_border,
                            color: Color(0xFFbd15FF),
                            size: 30.0,
                          )
                        ],
                      )),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          top(0),
                          top(1),
                          top(2)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          top(3),
                          top(4),
                          top(5),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 15.0,right: 15.0,bottom:5.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Вся музыка',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8133ff),
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Icon(
                            Icons.music_note_outlined,
                            color: Color(0xFFbd15FF),
                            size: 30.0,
                          )
                        ],
                      )),
                  Container(
                    height: 400,
                    child: ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                konteynerlar(0),
                                konteynerlar(1),
                                konteynerlar(2)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                konteynerlar(3),
                                konteynerlar(4),
                                konteynerlar(5),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                konteynerlar(6),
                                konteynerlar(7),
                                konteynerlar(8),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                konteynerlar(9),
                                konteynerlar(10),
                                konteynerlar(11),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                konteynerlar(12),
                                konteynerlar(13),
                                konteynerlar(14),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                konteynerlar(15),
                                konteynerlar(16),
                                konteynerlar(17),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                konteynerlar(18),
                                konteynerlar(19),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ) )
      ],
    ));
  }
}


