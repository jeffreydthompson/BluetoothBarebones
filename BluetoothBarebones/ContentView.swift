//
//  ContentView.swift
//  BluetoothBarebones
//
//  Created by Jeffrey Thompson on 9/16/22.
//

import SwiftUI

struct ContentView: View {
    
    var btController = BTController()
    
    init() {
        btController.enable()
    }
    
    var body: some View {
        Button("Scan BLE") {
            btController.startScanning()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
