import Flutter
import UIKit

@available(iOS 12.1, *)
class PencilInteractionDelegate: NSObject, UIPencilInteractionDelegate {
    private var pencilChannel: FlutterMethodChannel?

    public func setPencilChannel(channel: FlutterMethodChannel? = nil) {
        self.pencilChannel = channel
    }

    @available(iOS 17.5, *)
    public func pencilInteraction(
        _ interaction: UIPencilInteraction, didReceiveTap tap: UIPencilInteraction.Tap
    ) {

        let actionType =
            switch UIPencilInteraction.preferredTapAction {
            case .ignore: "ignore"
            case .switchEraser: "switchEraser"
            case .switchPrevious: "switchPrevious"
            case .showColorPalette: "showColorPalette"
            case .showInkAttributes: "showInkAttributes"
            case .showContextualPalette: "showContextualPalette"
            case .runSystemShortcut: "runSystemShortcut"
            default: "unknown"
            }
        let data: [String: Any?] = [
            "preferredAction": actionType,
            "locationX": tap.hoverPose?.location.x,
            "locationY": tap.hoverPose?.location.y,
            "zOffset": tap.hoverPose?.zOffset,
        ]
        if pencilChannel != nil {
            pencilChannel!.invokeMethod("onPencilDoubleTapV2", arguments: data)
        }
    }

    @available(iOS 17.5, *)
    public func pencilInteraction(
        _ interaction: UIPencilInteraction, didReceiveSqueeze squeeze: UIPencilInteraction.Squeeze
    ) {
        let actionType =
            switch UIPencilInteraction.preferredSqueezeAction {
            case .ignore: "ignore"
            case .switchEraser: "switchEraser"
            case .switchPrevious: "switchPrevious"
            case .showColorPalette: "showColorPalette"
            case .showInkAttributes: "showInkAttributes"
            case .showContextualPalette: "showContextualPalette"
            case .runSystemShortcut: "runSystemShortcut"
            default: "unknown"
            }
        let phase =
            switch squeeze.phase {
            case .began: "began"
            case .changed: "changed"
            case .ended: "ended"
            case .cancelled: "cancelled"
            default: "unknown"
            }
        let data: [String: Any?] = [
            "preferredAction": actionType,
            "squeezePhase": phase,
            "locationX": squeeze.hoverPose?.location.x,
            "locationY": squeeze.hoverPose?.location.y,
            "zOffset": squeeze.hoverPose?.zOffset,
        ]
        if pencilChannel != nil {
            pencilChannel!.invokeMethod("onPencilSqueeze", arguments: data)
        }
    }

    public func pencilInteractionDidTap(_ interaction: UIPencilInteraction) {
        if pencilChannel != nil {
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
        let channel = FlutterMethodChannel(
            name: channelName, binaryMessenger: registrar.messenger())
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let viewController = findRootViewController() {
                pencilDelegate.setPencilChannel(channel: channel)

                let pencilInteraction = UIPencilInteraction()
                pencilInteraction.delegate = pencilDelegate
                viewController.view.addInteraction(pencilInteraction)
            } else {
                print("Root view controller is nil.")
            }
        }
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    static func findRootViewController() -> UIViewController? {
        if #available(iOS 13.0, *) {
            let scenes = UIApplication.shared.connectedScenes
            for scene in scenes {
                if let windowScene = scene as? UIWindowScene {
                    for window in windowScene.windows {
                        if window.isKeyWindow {
                            return window.rootViewController
                        }
                    }
                }
            }
            return nil
        } else {
            return UIApplication.shared.keyWindow?.rootViewController
        }
    }
}
