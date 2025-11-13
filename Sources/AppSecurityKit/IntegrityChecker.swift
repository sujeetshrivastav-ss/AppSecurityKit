//
//  IntegrityChecker.swift
//  AppSecurityKit
//
//  Created by Sujeet Shrivastav on 13/11/25.
//

import Foundation

enum IntegrityChecker {
    static var isTampered: Bool {
        // Alternative: check for injected frameworks in bundle path
        let suspicious = ["/Library/MobileSubstrate/", "/usr/lib/frida/"]
        return suspicious.contains { FileManager.default.fileExists(atPath: $0) }
    }
}

