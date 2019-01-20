//
//  Helper.swift
//  sampler1
//
//  Created by 森川彩音 on 2018/10/28.
//  Copyright © 2018年 森川彩音. All rights reserved.
//

import Foundation
import RealmSwift

class AlertData: Object {
    
    @objc dynamic var title = ""
    @objc dynamic var contents  = ""
    @objc dynamic var month  = 0
    @objc dynamic var day  = 0
}
