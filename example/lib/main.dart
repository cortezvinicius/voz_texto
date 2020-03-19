import 'package:flutter/material.dart';
import 'package:voztexto/voztexto.dart';

void main()=>runApp(AplicativoExemplo());

class AplicativoExemplo extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }

}
class Home extends StatefulWidget
{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
{

  bool _botao_status = false;
  var _texto_fala = "texto fala";


  _clickBotao()
  {
    setState(()
    {
      if(_botao_status == false)
      {
        _botao_status = true;
      }else
      {
        _botao_status = false;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Voztexto.iniciar();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            IconButton(
                icon: _botao_status ? Icon(Icons.mic, color: Colors.blue, size: 30,) : Icon(Icons.mic, color: Colors.black, size: 30,),
                onPressed: _clickBotao
            ),
            Text("${_texto_fala}")
          ],
        ),
      ),
    );
  }
}
