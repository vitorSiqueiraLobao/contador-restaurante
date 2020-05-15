import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Hello World",
    home: Home()));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int _pessoas = 0;
  String _texto = "Pode entrar";


  void _atualizaPessoas(int x){
    if(x == 1){
      if(_pessoas >= 10){
        setState(() {
          _texto = "Lotado";
        });
      }else{
         setState(() {
            _pessoas++;  
         });
      }
    }else if(x == -1){
      if(_pessoas > 0){
        if(_pessoas == 10){
          setState(() {
            _texto = "Pode Entrar";
            _pessoas--;  
          });       
        }else{
          setState(() {
            _pessoas--;
          });
        }
        
      } 
    }
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/restaurant.jpg", fit: BoxFit.cover, height: 1000,
        ),
        Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Pessoas : $_pessoas", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Padding(padding: EdgeInsets.all(10.0),
            child:FlatButton(
            onPressed: (){_atualizaPessoas(1);},
            child: Text("+1", style: TextStyle(fontSize: 40, color: Colors.white))
            )
          ),
           Padding(padding: EdgeInsets.all(10.0),
            child:FlatButton(
            onPressed: (){_atualizaPessoas(-1);},
            child: Text("-1", style: TextStyle(fontSize: 40, color: Colors.white))
            )
          ),
        ],
        ),
        Text("$_texto", style: TextStyle(color : Colors.white, fontStyle: FontStyle.italic, fontSize: 30),
        ),
      ],
    ),
      ]
    );

  }
} 