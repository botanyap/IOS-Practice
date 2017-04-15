//
//  String+Extention.swift
//  BoApps
//
//  Created by Macbook Air on 3/31/2560 BE.
//  Copyright © 2560 Botanyap. All rights reserved.
//

import Foundation

//เป็นการเพิ่ม method ลงใน คลาส String
extension String {
    func url() -> URL {
        return URL(string: self)!
    }
}
