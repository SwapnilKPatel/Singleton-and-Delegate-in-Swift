# DataManager: A Simple Singleton Pattern Example in Swift

## Introduction
This repository demonstrates the **Singleton Pattern** and the **Delegate Pattern** in Swift. It provides a simple way to manage data updates across different components of an application. This is useful for beginners who want to understand design patterns in Swift using `UIKit`.

## Features
✅ Uses **Singleton Pattern** to ensure a single instance of `DataManager` throughout the app.  
✅ Implements **Delegate Pattern** to notify view controllers about data updates.  
✅ Demonstrates best practices in Swift coding conventions.  

## Code Overview
### **1. Protocol Definition**
```swift
import Foundation

// Protocol to notify about data updates
protocol DataUpdateDelegate: AnyObject {
    func didUpdateData(success: Bool)
}
```

### **2. DataManager Singleton**
```swift
// Singleton class to manage data updates
class DataManager {
    static let shared = DataManager() // Shared instance
    
    weak var delegate: DataUpdateDelegate?  // Delegate property
    
    private init() {}  // Prevents external initialization
    
    func updateData(success: Bool) {
        // Notify the delegate (e.g., a ViewController)
        delegate?.didUpdateData(success: success)
    }
}
```

### **3. Implementing the Delegate in a View Controller**
```swift
import UIKit

class HomeViewController: UIViewController, DataUpdateDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assigning self as delegate
        DataManager.shared.delegate = self
    }
    
    // Delegate method implementation
    func didUpdateData(success: Bool) {
        if success {
            print("Data updated successfully!")
        } else {
            print("Data update failed.")
        }
    }
}
```

## How It Works
1. `DataManager` is a **singleton**, meaning only one instance exists.
2. A **protocol** `DataUpdateDelegate` is defined to notify when data updates occur.
3. `HomeViewController` **conforms** to this protocol and registers itself as a delegate.
4. When `updateData(success:)` is called, `DataManager` notifies the delegate.

## Installation & Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/DataManagerExample.git
   ```
2. Open the project in **Xcode**.
3. Run the project and check the console for delegate method execution.

## Use Cases
- **Managing Global State**: Example - Keeping track of user login state.
- **Communicating Between ViewControllers**: Example - Sending updates from a background task to UI.
- **Handling API Data Updates**: Example - Refreshing UI when API data changes.

## Contributing
Feel free to fork this repository and improve upon it. If you find any issues, create a pull request! 🚀

## License
This project is licensed under the MIT License.

---
### ⭐ If you found this helpful, give this repo a star on GitHub! ⭐
