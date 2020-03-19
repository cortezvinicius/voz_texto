import 'dart:async';

import 'package:flutter/services.dart';

class Voztexto {
  static const MethodChannel _channel =
      const MethodChannel('voztexto');

  static iniciar()
  {
    _channel.invokeMethod("vozTexto.iniciar");
  }
}
