//
//  CallManager.swift
//  MyCallKit
//
//  Created by Saadet Şimşek on 26/05/2025.
//

import Foundation
import CallKit

final class CallManager: NSObject {
    let provider = CXProvider(configuration: CXProviderConfiguration())
    let cellController = CXCallController()
}
