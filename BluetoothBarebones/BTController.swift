//
//  BTController.swift
//  BluetoothBarebones
//
//  Created by Jeffrey Thompson on 9/16/22.
//

import Foundation
import CoreBluetooth

class BTController: NSObject {
    
    lazy var cbQueue: DispatchQueue = {
        DispatchQueue.global(qos: .default)
    }()
    
    var centralManager: CBCentralManager!
    
    public func enable() {
        centralManager = CBCentralManager(delegate: self, queue: cbQueue)
    }
    
    public func startScanning() {
        centralManager.scanForPeripherals(withServices: nil)
    }
}

extension BTController: CBCentralManagerDelegate {
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
//        dump(advertisementData)
        
        if let coded = try? JSONSerialization.data(withBLEAdvertisementData: advertisementData),
           let advData = try? JSONDecoder().decode(AdvertisementData.self, from: coded) {
            
            dump(advData)
            
        }
        
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
    }

}
