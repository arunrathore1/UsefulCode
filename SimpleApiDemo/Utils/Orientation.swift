//
//  Orientation.swift
//  SimpleApiDemo
//
//  Created by Arun Rathore on 29/09/22.
//

import SwiftUI

final class OrientationInfo: ObservableObject {
    enum Orientation {
        case portrait
        case landscape
    }

    @Published var orientation: Orientation

    private var _observer: NSObjectProtocol?

    init() {
        // fairly arbitrary starting value for 'flat' orientations
        if UIDevice.current.orientation.isLandscape {
            self.orientation = .landscape
        }
        else {
            self.orientation = .portrait
        }

        // unowned self because we unregister before self becomes invalid
        _observer = NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: nil) { [unowned self] note in
            guard let device = note.object as? UIDevice else {
                return
            }
            if device.orientation.isPortrait {
                self.orientation = .portrait
            }
            else if device.orientation.isLandscape {
                self.orientation = .landscape
            }
        }
    }

    deinit {
        if let observer = _observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}


struct AppUtility {

    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {

        if (UIApplication.shared.delegate as? AppDelegate) != nil {
            AppDelegate.orientationLock = orientation
        }
    }

    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {

        self.lockOrientation(orientation)

        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }

}

//static var orientationLock =
//UIInterfaceOrientationMask.all
//
//func application(_ application: UIApplication,
//supportedInterfaceOrientationsFor window:
//UIWindow?) -> UIInterfaceOrientationMask {
//return AppDelegate.orientationLock
}
