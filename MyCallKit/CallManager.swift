//
//  CallManager.swift
//  MyCallKit
//
//  Created by Saadet Şimşek on 26/05/2025.
//

import Foundation
import CallKit

final class CallManager: NSObject, CXProviderDelegate {
    
    let provider = CXProvider(configuration: CXProviderConfiguration())
    let cellController = CXCallController()
    
    override init() {
        super.init()
        provider.setDelegate(self, queue: nil)
    }
    
    public func reportIncomingCall(id: UUID, handle: String){
        print("reporting incoming call")
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: handle)
        provider.reportNewIncomingCall(with: id, update: update) { error in
            if let error = error {
                print(String(describing: error))
            }
            else {
                print("call reported")
            }
        }
    }
    
    public func starCall(id: UUID, handle: String){
        print("starting call")
        let handle = CXHandle(type: .generic, value: handle)
        let action = CXStartCallAction(call: id, handle: handle)
        let transaction = CXTransaction(action: action)
        cellController.request(transaction) { error in
            if let error = error {
                print(String(describing: error))
            }
            else {
                print("call started")
            }
        }
    }
    
    func providerDidReset(_ provider: CXProvider) {
        
    }
}
