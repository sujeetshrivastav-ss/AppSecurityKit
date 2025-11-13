# 🔐 AppSecurityKit

[![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS-blue.svg)]()
[![SPM Compatible](https://img.shields.io/badge/SwiftPM-Compatible-brightgreen.svg)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg)](LICENSE)

**AppSecurityKit** is a modern Swift package that strengthens your iOS apps against  
🧩 **Jailbreaking**, 🪄 **Debugger & Frida attachment**, 🧬 **Runtime tampering**, and 🔑 **Unsafe data storage**.  

Built using **Swift 6** and fully compatible with **Swift Package Manager (SPM)** — clean, modular, and App Store–safe.

---

## ✨ Features

- 🚫 Jailbreak detection  
- 🧩 Debugger & Frida prevention  
- 🧬 Runtime integrity verification  
- 🔑 Secure Keychain data storage  
- 💡 Swift 6 syntax, App Store safe  
- 📦 Fully SPM-ready  

---

## 📦 Installation

### ➕ Using Swift Package Manager (SPM)

In **Xcode**:
1. Go to **File → Add Packages…**
2. Paste this URL:  
    https://github.com/sujeetshrivastav-ss/AppSecurityKit.git
3. Select the latest version (e.g. `1.0.0`)
4. Add it to your app target.

Or in your project’s `Package.swift`:

```swift
dependencies: [
 .package(url: "https://github.com/sujeetshrivastav-ss/AppSecurityKit.git", from: "1.0.0")
]
```

## How to use

### 1️⃣ Import the Package
```swift
import AppSecurityKit
```
### 2️⃣ Run Security Checks at Launch
```swift
// 1. Prevent debugger attachments
DebuggerDetection.disableDebugger()

// 2. Verify environment safety
if SecurityManager.shared.isDeviceCompromised {
SecurityManager.shared.terminateApp()
}
```
### 3️⃣ Securely Store Data in Keychain
```swift
// Save sensitive data
KeychainSecureStore.save("secretToken123", for: "authToken")

// Retrieve securely
if let token = KeychainSecureStore.read(for: "authToken") {
    print("Found token: \(token)")
}

// Delete securely
KeychainSecureStore.delete(for: "authToken")
```
### 4️⃣ Use Individual Modules (Optional)
```swift
let isJailbroken = JailbreakDetection.isJailbroken
let isDebuggerAttached = DebuggerDetection.isDebuggerAttached
let isTampered = IntegrityChecker.isTampered
```


## 🧱 Example Security Flow
```swift
[ App Launch ]
       ↓
[ DebuggerDetection.disableDebugger() ]
       ↓
[ SecurityManager.shared.isDeviceCompromised ]
       ↓
 ├── JailbreakDetection
 ├── DebuggerDetection
 └── IntegrityChecker
       ↓
[ Terminate App / Continue Safe Execution ]
```
