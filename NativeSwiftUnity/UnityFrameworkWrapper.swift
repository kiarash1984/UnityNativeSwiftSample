//
//  UnityFrameworkWrapper.swift
//  NativeSwiftUnity
//
//  Created by Kiarash on 10/31/19.
//  Copyright © 2019 Kiarash. All rights reserved.
//

import Foundation
import UnityFramework

protocol UnityFrameworkDeallocator {
    func exitUnity()
}

class UnityFrameworkWrapper: NSObject, UnityFrameworkListener, NativeCallsProtocol {
    
    static let shared = UnityFrameworkWrapper()
    
    // MARK: - Properties
    
    let framework: UnityFramework
    var delegate: UnityFrameworkDeallocator?
    
    // MARK: - init
    
    override init() {
        let bundlePath = Bundle.main.bundlePath + "/Frameworks/UnityFramework.framework"
        
        guard let frameworkBundle = Bundle.init(path: bundlePath) else {
            fatalError("bundle could not be initialized")
        }
        if !frameworkBundle.isLoaded { frameworkBundle.load() }
        guard let _framework = frameworkBundle.principalClass?.getInstance() else {
            fatalError("framework could not be initialized")
        }

        if _framework.appController() == nil {
            _framework.setExecuteHeader(mhExecHeaderPtr)
        }
        
        self.framework = _framework
        super.init()
        
        framework.setDataBundleId("com.unity3d.framework")
        framework.register(self)
        NSClassFromString("FrameworkLibAPI")?.registerAPIforNativeCalls(self)
        framework.runEmbedded(withArgc:  CommandLine.argc, argv: CommandLine.unsafeArgv, appLaunchOpts: nil)
    }
    
    // MARK: - NativeCallsProtocol
    
    func showHostMainWindow(_ color: String!) {
        delegate?.exitUnity()
    }
    
    // MARK: - UnityFrameworkListener
    
    func unityDidUnload(_ notification: Notification!) {
        framework.unregisterFrameworkListener(self)
        delegate?.exitUnity()
    }
    
    // MARK: - Functions
    
    func showMainView() {
        framework.showUnityWindow()
    }
    
    func sendMsgToUnity() {
        // framework.sendMessageToGO(withName: "cube", functionName: "change", message: "yellow")
    }
    
}
