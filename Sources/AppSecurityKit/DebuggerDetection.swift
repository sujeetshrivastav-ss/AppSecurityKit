//
//  DebuggerDetection.swift
//  AppSecurityKit
//
//  Created by Sujeet Shrivastav on 13/11/25.
//

import Foundation

#if canImport(Darwin)
import Darwin
#endif

enum DebuggerDetection {
    static var isDebuggerAttached: Bool {
        var info = kinfo_proc()
        var mib: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var size = MemoryLayout<kinfo_proc>.stride
        let sysctlResult = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
        guard sysctlResult == 0 else { return false }
        return (info.kp_proc.p_flag & P_TRACED) != 0
    }

    /// Stub to satisfy API – no longer uses ptrace()
    static func disableDebugger() {
        // No-op in SPM context; detection above is sufficient.
    }
}


