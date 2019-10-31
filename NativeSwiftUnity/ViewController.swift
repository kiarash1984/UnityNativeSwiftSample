//
//  ViewController.swift
//  NativeSwiftUnity
//
//  Created by Kiarash on 10/31/19.
//  Copyright © 2019 Kiarash. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UnityFrameworkDeallocator {
    
    var unityView: UIView?

    @IBAction func show(_ sender: Any) {
        UnityFrameworkWrapper.shared.delegate = self
        
        // BUG: first time unity logo is animated the view will not be added
        self.unityView = UnityFrameworkWrapper.shared.framework.appController()!.rootView
        self.view.addSubview(self.unityView!)
    }
    
    // MARK: - UnityFrameworkDeallocator
    
    func exitUnity() {
        unityView?.removeFromSuperview()
    }
    
}

