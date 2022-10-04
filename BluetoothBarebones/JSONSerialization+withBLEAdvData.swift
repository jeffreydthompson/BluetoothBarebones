//
//  JSONSerialization+withBLEAdvData.swift
//  BluetoothBarebones
//
//  Created by Jeffrey Thompson on 9/18/22.
//

import Foundation

enum BlueToothAllocatedUUID: String, Decodable {
    case allegion = "FCF4"
    case august = "FE24"
    case bose = "FEBE"
    case google = "FEAA"
    case salto = "FE88"
}

extension JSONSerialization {
    class func data(withBLEAdvertisementData advData: [String: Any]) throws -> Data {
        
        var swiftAdvertisementData = [String: Any]()

        if let uuids = advData["kCBAdvDataServiceUUIDs"] as? NSArray {
            swiftAdvertisementData["kCBAdvDataServiceUUIDs"] = uuids.map { "\($0)" }
        }
        
        if let name = advData["kCBAdvDataLocalName"] {
            swiftAdvertisementData["kCBAdvDataLocalName"] = name as? String
        }
        
        if let data = advData["kCBAdvDataManufacturerData"] as? Data {
            swiftAdvertisementData["kCBAdvDataManufacturerData"] = data.hexString
        }
        
        if let connectable = advData["kCBAdvDataIsConnectable"] as? Bool {
            swiftAdvertisementData["kCBAdvDataIsConnectable"] = connectable
        }
        
        if let timestamp = advData["kCBAdvDataTimestamp"] as? Double {
            swiftAdvertisementData["kCBAdvDataTimestamp"] = timestamp
        }
        
        return try JSONSerialization.data(withJSONObject: swiftAdvertisementData, options: .fragmentsAllowed)
    }
}
