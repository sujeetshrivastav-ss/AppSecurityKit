// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation

@MainActor
public final class SecurityManager {
    public static let shared = SecurityManager()
    private init() {}

    /// Returns `true` if any security violation is detected
    public var isDeviceCompromised: Bool {
        JailbreakDetection.isJailbroken ||
        DebuggerDetection.isDebuggerAttached ||
        IntegrityChecker.isTampered
    }

    /// Immediately terminates the app securely
    public func terminateApp() -> Never {
        fatalError("⚠️ Security violation detected. Application terminated.")
    }
}
