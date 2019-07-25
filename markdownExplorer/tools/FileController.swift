//
//  FileController.swift
//  markdownExplorer
//
//  Created by role on 2019/7/24.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit

class FileController: NSObject {

    class func saveFile(filename:String,content:String) -> Bool{
        let fm = FileManager.default
        var path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/files/"
        if !fm.fileExists(atPath: path){
            try? fm.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        path += filename
        if fm.fileExists(atPath: path) {
            return false
        }else{
            fm.createFile(atPath: path, contents: nil, attributes: nil)
            do {
                try content.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            }catch{
                return false
            }
            return true
        }
    }
    
    class func getFileNames() -> [String]{
        let fm = FileManager.default
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/files/"
        let files = try? fm.contentsOfDirectory(atPath: path)
        if files == nil {
            return []
        }else{
            return files!
        }
    }
    
    class func getFileAttribute(filename:String) ->  [FileAttributeKey : Any]{
        let fm = FileManager.default
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/files/" + filename
        if fm.fileExists(atPath: path) {
            let attribute = try? fm.attributesOfItem(atPath: path)
            if attribute != nil {
                return attribute!
            }
        }
        return [FileAttributeKey : Any].init()
    }
    
    class func deleteFile(filename:String){
        let fm = FileManager.default
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/files/" + filename
        if fm.fileExists(atPath: path){
            try? fm.removeItem(atPath: path)
        }
    }
    
    class func readFile(filename:String) -> String{
        let fm = FileManager.default
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/files/" + filename
        if fm.fileExists(atPath: path){
            let textData = fm.contents(atPath: path)
            if textData != nil {
                let text = String.init(data: textData!, encoding: String.Encoding.utf8)
                return text!
            }
        }
        return ""
    }
    
    class func modifyFile(filename:String, content:String) -> Bool {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/files/" + filename
        do {
            try content.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
        }catch{
            return false
        }
        return true
    }
}
