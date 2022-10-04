//
//  AdvertisementData.swift
//  BluetoothBarebones
//
//  Created by Jeffrey Thompson on 9/16/22.
//

import Foundation

struct AdvertisementData: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case serviceUUIDs = "kCBAdvDataServiceUUIDs"
        case timeStamp = "kCBAdvDataTimestamp"
        case localName = "kCBAdvDataLocalName"
        case isConnectable = "kCBAdvDataIsConnectable"
        case mfgData = "kCBAdvDataManufacturerData"
    }
    
    var serviceUUIDs: [BlueToothAllocatedUUID]?
    var timeStamp: Double?
    var localName: String?
    var isConnectable: Bool?
    var mfgData: String?
    
}

extension AdvertisementData {
    var augustIdentifier: String? {
        guard let uuids = serviceUUIDs else { return nil }
        guard ((serviceUUIDs?.contains(.august)) != nil) else { return nil }
        guard let mfgDataId = mfgData?.suffix(32),
              (mfgData?.count ?? 0) > 31 else { return nil }
        return "\(mfgDataId)"
    }
}
