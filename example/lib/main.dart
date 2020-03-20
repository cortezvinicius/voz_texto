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
  Voztexto _voztexto;
  bool _isAvailable = false;
  bool _isListening = false;

  _clickBotao()
  {
    setState(()
    {
      if(_botao_status == false)
      {
        _botao_status = true;

        if (_isAvailable && !_isListening) {
          _voztexto
              .listen(locale: "pt_br")
              .then((result) => print('$result'));
        }
      }else
      {
        _botao_status = false;
        if (_isListening) {
          _voztexto.stop().then(
                (result) => setState(() => _isListening = result),
          );
        }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Voztexto.iniciar();
    iniciar();
  }

  void iniciar()
  {
    _voztexto = new Voztexto();

    _voztexto.setAvailabilityHandler(
          (bool result) => setState(() => _isAvailable = result),
    );

    _voztexto.setRecognitionStartedHandler(
          () => setState(() => _isListening = true),
    );

    _voztexto.setRecognitionResultHandler(
          (String speech) => setState(() => _texto_fala = speech),
    );

    _voztexto.setRecognitionCompleteHandler(
          () => setState(() => _isListening = false),
    );

    _voztexto.activate().then(
          (result) => setState(() => _isAvailable = result),
    );


  }

  void onRecognitionComplete() => setState(() => _isListening = false);
  
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
