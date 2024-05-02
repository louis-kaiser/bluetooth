//
//  ContentView.swift
//  bluetooth
//
//  Created by Louis Kaiser on 2024-05-02.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var bluetoothManager = BluetoothManager()
    
    var body: some View {
        VStack {
            List(bluetoothManager.discoveredDevices, id: \.self) { device in
                Button(action: {
                    bluetoothManager.connectToDevice(device)
                }) {
                    Text(device.name ?? "Unnamed Device")
                }
            }
        }
    }
}
