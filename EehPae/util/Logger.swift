//
//  Logger.swift
//  RydeEssays
//
//  Created by Morris Murega on 5/23/21.
//

import Foundation
import UIKit
class Logger{
    
    static func Log(from obj:AnyObject, with :String){
        print("\(String(describing: type(of: obj))) |:> \(with)")
    }
    
    
}
