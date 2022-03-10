//
//  ImageHandling.swift
//  ImagePicker_Camera_VS_Library
//
//  Created by Yasser Hajlaoui on 3/9/22.
//

import Foundation
import UIKit







func documentDirectoryPath() -> URL? {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path.first
}

func saveJpg(_ image: UIImage) -> String {
    var myPath = ""
    genImageName()

    if let jpgData = image.jpegData(compressionQuality: 0.5),
        let path = documentDirectoryPath()?.appendingPathComponent("exampleJpg.jpg") {
        try? jpgData.write(to: path)
        myPath = path.description
    }
    return myPath
}

// Generate Image Name from Current date
func genImageName(){
    let date :NSDate = NSDate()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HHmmssddMMyyyy"//"dd-MM-yyyy'_'HH_mm_ss"
    dateFormatter.timeZone = NSTimeZone(name: "PT") as TimeZone?
    let imageName = "/\(dateFormatter.string(from: date as Date)).jpg"
    print("imageName: ", imageName)
}



