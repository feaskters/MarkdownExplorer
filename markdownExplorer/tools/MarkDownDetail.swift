//
//  MarkDownDetail.swift
//  markdownExplorer
//
//  Created by role on 2019/7/23.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit

struct markDownDetail {
    public var title = "default.md"
    public var time = "2019/07/22 19:00"
    public var text = "default text"
    
    mutating func setInfo(title:String, time:String, text:String) {
        self.title = title
        self.time = time
        self.text = text
    }
}

//class MarkDownDetail: NSObject {
//
//    public var title = "default.md"
//    public var time = "2019/07/22 19:00"
//    public var text = "default text"
//    
//    func setInfo(title:String, time:String, text:String) {
//        self.title = title
//        self.time = time
//        self.text = text
//    }
//}
