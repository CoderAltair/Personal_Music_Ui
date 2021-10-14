import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hokimlar/hokim.dart';
import 'package:hokimlar/modellar.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MusicPlayer extends StatefulWidget {
  Musiqa obyekt1;
  MusicPlayer({this.obyekt1});

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;
  AudioCache cache;
  AudioPlayer _player;
  Duration position = new Duration();
  Duration musicLenght = new Duration();
  Widget slider() {
    return Container(
      width: 300,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Color(0xFFbd15FF),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
        ),
        child: Slider.adaptive(
          autofocus: true,
          activeColor: Color(0xFF8133ff),
          inactiveColor: Colors.white,
          value: position.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          },
          max: musicLenght.inSeconds.toDouble(),
        ),
      ),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    _player.durationHandler = (d) {
      setState(() {
        musicLenght = d;
      });
    };
    _player.positionHandler = (s) {
      setState(() {
        position = s;
      });
    };
    cache.load('${widget.obyekt1.musiqa}');
  }
bool _isFavoruite=false;
  bool _isnotFavoruite=false;
  void _toggleFavoriute(){
    setState(() {
      if(_isFavoruite){
        _isFavoruite = false;_isnotFavoruite=true;}
      else {
        _isFavoruite = true;_isnotFavoruite=false;}
    });}
  Future<bool>chiqish(){ return playing? {_player.pause(),Navigator.pop(context)}:
  showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text('Accept?'),
    content:Row(
      children: <Widget>[
        CircleAvatar(radius: 30.0,
        backgroundImage: AssetImage('assets/pngwing.com.png'),),
        Text('Do you accept ?')
      ],
    ),
    actions: [
      FlatButton(onPressed:()=>Navigator.push(
          context,
          MaterialPageRoute(builder:(context)=>Hokimlar())),
          child: Text('Yes',style: TextStyle(

          ),)),
      FlatButton(onPressed:()=>Navigator.pop(context),
          child: Text('No')),
    ],
    elevation: 24.0,
  ));}
    @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){return chiqish();},
      child: Scaffold(
        backgroundColor:Colors.black ,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios_sharp),
                          color: Color(0xFF8133ff),
                          onPressed: () { if (playing) {
                            _player.pause();
                            setState(() {
                              playBtn = Icons.arrow_back_ios_sharp;
                              playing = false;
                              Navigator.pop(context);
                            });
                          }
                          else{ Navigator.pop(context);}  }
                      ),
                      Container(
                        width: 150.0,
                        height: 50.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText(
                              '${widget.obyekt1.nomi}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  // fontWeight: FontWeight.bold,
                                  // fontFamily: 'abrils',
                                  color: Colors.white),
                            ),
                            AutoSizeText(
                              '${widget.obyekt1.avtor}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w100,
                                  // fontFamily: 'abrils',
                                  color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 100.0),
                        child: IconButton(
                          icon: Icon(Icons.queue_music),
                          iconSize: 35.0,
                          color: Color(0xFF8133ff),
                          onPressed: ()=>AwesomeDialog(
                              context: context,
                              dialogType: DialogType.INFO_REVERSED,
                              borderSide: BorderSide(color: Colors.white,width: 2),
                              width: 350,
                              buttonsBorderRadius: BorderRadius.all(Radius.circular(2.0)),
                              headerAnimationLoop: false,
                              animType: AnimType.BOTTOMSLIDE,
                              title:'Информация',
                              desc: 'Пожалуста Подождите....',
                              buttonsTextStyle: TextStyle(color: Colors.black),
                              showCloseIcon: true,
                              btnOkOnPress: (){},
                              btnOkColor: Colors.white,
                              dialogBackgroundColor: Colors.white54

                          )..show(),

                        ),
                      ),
                    ],
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFbd15FF),width: 3),
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(
                          color: Color(0xFFbd15FF),
                          blurRadius: 50.0
                      )]
                  ),
                  child: CircleAvatar(
                    radius: 150.0,
                    backgroundImage: AssetImage('${widget.obyekt1.rasm}'),
                    // onBackgroundImageError:
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                child: Column(
                  children: <Widget>[
                    AutoSizeText(
                      '${widget.obyekt1.nomi}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          // fontFamily: 'abrils',
                          color: Colors.white),
                    ),
                    AutoSizeText(
                      '${widget.obyekt1.avtor}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w100,
                          // fontFamily: 'abrils',
                          color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                width: 400,
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(_isFavoruite?Icons.thumb_up:Icons.thumb_up_alt_outlined),
                              color: Color(0xFF8133ff),
                              onPressed: ()=>_toggleFavoriute()),
                          IconButton(
                              icon: Icon(Icons.audiotrack),
                              color: Colors.deepOrange,
                              onPressed: (){showDialog(context: context, builder: (context)=>AlertDialog(
                                title: Text('Песни.'),
                                content:Text('${widget.obyekt1.nomi}'),
                                actions: [
                                  FlatButton(onPressed:()=>Navigator.pop(context),
                                      child: Text('Ok',style: TextStyle(

                                      ),)),
                                  Text('Нет'),
                                ],
                                elevation: 24.0,
                              ));}
                            //=>Navigator.push(
                            //  context,
                            //  MaterialPageRoute(builder: (_)=>Fils()))
                          ),
                          IconButton(
                              icon: Icon(_isnotFavoruite? Icons.thumb_down:Icons.thumb_down_outlined),
                              color: Color(0xFFbd15FF),
                              onPressed: ()=>_toggleFavoriute()),

                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            '${position.inMinutes}:${position.inSeconds.remainder(60)}'),
                        slider(),
                        Text(
                            '${musicLenght.inMinutes}:${musicLenght.inSeconds.remainder(60)}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          color: Color(0xFF8110ff),
                          iconSize: 45.0,
                          icon: Icon(Icons.skip_previous_outlined),
                          onPressed: () {
                            print('skip');
                          },
                        ),
                        IconButton(
                          color:Color(0xFF8110ff),
                          iconSize: 45.0,
                          icon: Icon(playBtn),
                          onPressed: () {
                            if (!playing) {
                              cache.play("${widget.obyekt1.musiqa}");
                              setState(() {
                                playBtn = Icons.pause;
                                playing = true;
                              });
                            } else {
                              _player.pause();
                              setState(() {
                                playBtn = Icons.play_arrow;
                                playing = false;
                              });
                            }
                          },
                        ),
                        IconButton(
                          color: Color(0xFFbd15FF),
                          iconSize: 45.0,
                          icon: Icon(Icons.skip_next_outlined),
                          onPressed: () {
                            print('skip');
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
