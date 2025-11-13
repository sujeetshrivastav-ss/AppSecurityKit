//
//  JailbreakDetection.swift
//  AppSecurityKit
//
//  Created by Sujeet Shrivastav on 13/11/25.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

enum JailbreakDetection {
    static var isJailbroken: Bool {
        #if targetEnvironment(simulator)
        return false
        #else
        // 1. Check for known jailbreak paths
        let suspiciousPaths = [
            "/Applications/Cydia.app",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/bin/bash",
            "/usr/sbin/sshd",
            "/etc/apt"
        ]
        if suspiciousPaths.contains(where: FileManager.default.fileExists(atPath:)) {
            return true
        }

        // 2. Attempt to write outside sandbox
        let testFile = "/private/jb_test.txt"
        do {
            try "test".write(toFile: testFile, atomically: true, encoding: .utf8)
            try FileManager.default.removeItem(atPath: testFile)
            return true
        } catch { }

        // 3. Check if cydia:// URL can be opened (only when UIKit is available)
        #if canImport(UIKit)
        if let cydiaURL = URL(string: "cydia://package/com.example.package"),
           UIApplication.shared.canOpenURL(cydiaURL) {
            return true
        }
        #endif

        return false
        #endif
    }
}
