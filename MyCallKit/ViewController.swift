//
//  ViewController.swift
//  MyCallKit
//
//  Created by Saadet Şimşek on 25/05/2025.
//

import UIKit


final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        startDemo()
    }


    func startDemo(){
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            let callManager = CallManager()
            let id = UUID()
            callManager.reportIncomingCall(id: id, handle: "Tim Cook")
        })
    }
}

