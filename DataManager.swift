//
//  DataManager.swift
//  Verifacto
//
//  Created by Swapnil on 20/03/25.
//

import Foundation

// Protocol to notify about data updates
protocol DataUpdateDelegate: AnyObject {
    func didUpdateData(success: Bool)
}

// Singleton class to manage data updates
class DataManager {
    static let shared = DataManager()
    
    weak var delegate: DataUpdateDelegate?
    
    private init() {}  // Prevents external initialization
    
    func updateData(success: Bool) {
        // Notify the delegate (e.g., a ViewController)
        delegate?.didUpdateData(success: success)
    }
}
