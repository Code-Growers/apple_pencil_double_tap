import Flutter
import UIKit

@available(iOS 12.1, *)
class PencilInteractionDelegate: NSObject, UIPencilInteractionDelegate {
    private var pencilChannel: FlutterMethodChannel?
    
    public func setPencilChannel(channel: FlutterMethodChannel? = nil) {
        self.pencilChannel = channel
    }
    
    public func pencilInteractionDidTap(_ interaction: UIPencilInteraction) {
        if (pencilChannel != nil) {
            if UIPencilInteraction.preferredTapAction == .switchPrevious {
                pencilChannel!.invokeMethod("onPencilDoubleTap", arguments: "switchPrevious")
                return
            }
            if UIPencilInteraction.preferredTapAction == .showColorPalette {
                pencilChannel!.invokeMethod("onPencilDoubleTap", arguments: "showColorPalette")
                return
            }
            if #available(iOS 16.0, *) {
                if UIPencilInteraction.preferredTapAction == .showInkAttributes {
                    pencilChannel!.invokeMethod("onPencilDoubleTap", arguments: "showInkAttributes")
                    return
                }
            }
            if UIPencilInteraction.preferredTapAction == .ignore {
                pencilChannel!.invokeMethod("onPencilDoubleTap", arguments: "ignore")
                return
            }
            if UIPencilInteraction.preferredTapAction == .switchEraser {
                pencilChannel!.invokeMethod("onPencilDoubleTap", arguments: "switchEraser")
                return
            }
            pencilChannel!.invokeMethod("onPencilDoubleTap", arguments: nil)
        }
    }
}

@available(iOS 12.1, *)
public class ApplePencilDoubleTapPlugin: NSObject, FlutterPlugin {
    static let channelName = "tech.codegrowers.applepencildoubletap/apple_pencil_double_tap_plugin"
    
    static let pencilDelegate = PencilInteractionDelegate()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: channelName, binaryMessenger: registrar.messenger())
        
        guard let viewController = UIApplication.shared.delegate?.window??.rootViewController else {
            fatalError("rootViewController could not be located")
        }
        
        pencilDelegate.setPencilChannel(channel: channel)
        
        let pencilInteraction = UIPencilInteraction()
        pencilInteraction.delegate = pencilDelegate
        viewController.view.addInteraction(pencilInteraction)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
