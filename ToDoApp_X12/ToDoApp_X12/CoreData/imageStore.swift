//
//  imageStore.swift
//  ToDoApp_X12
//
//  Created by Robin George on 08/10/21.
//

import Foundation


enum StorageType {
    case userDefaults
    case fileSystem
}


private func store(image: UIImage,
                    forKey key: String,
                    withStorageType storageType: StorageType) {
    if let pngRepresentation = image.pngData() {
        switch storageType {
        case .fileSystem:
            if let filePath = filePath(forKey: key) {
                do  {
                    try pngRepresentation.write(to: filePath,
                                                options: .atomic)
                } catch let err {
                    print("Saving file resulted in error: ", err)
                }
            }
        case .userDefaults:
            UserDefaults.standard.set(pngRepresentation,
                                        forKey: key)
        }
    }
}
