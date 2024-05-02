//
//  BluetoothManager.swift
//  bluetooth
//
//  Created by Louis Kaiser on 2024-05-02.
//

import SwiftUI
import CoreBluetooth

class BluetoothManager: NSObject, CBCentralManagerDelegate, ObservableObject {
    private var centralManager: CBCentralManager!
    @Published var discoveredDevices: [CBPeripheral] = []
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        } else {
            print("Bluetooth is not available.")
        }
    }
    
    // Discover Devices & Add Devices to List
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        // Check if the peripheral is already in the discoveredDevices array
        if !discoveredDevices.contains(peripheral) {
            // If not, append it
            discoveredDevices.append(peripheral)
        }
    }
    
    
    //
    // Connect to Device
    func connectToDevice(_ peripheral: CBPeripheral) {
        centralManager.connect(peripheral, options: nil)
    }
    
    // Connect to Device Info
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected to \(peripheral.name ?? "device")")
    }
    

}
