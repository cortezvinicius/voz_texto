import Flutter
import UIKit

public class SwiftVoztextoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "voztexto", binaryMessenger: registrar.messenger())
    let instance = SwiftVoztextoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "vozTexto.iniciar"
    {
        let alert = UIAlertController(title: nil, message: "deu certo", preferredStyle: .alert)
        let acao = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        
        alert.addAction(acao)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        
    }
  }
}
