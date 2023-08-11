//
//  Result.swift
//  RydeEssays
//
//  Created by Morris Murega on 5/23/21.
//

import Foundation


//Result enum to show success or failure
enum Result<T, U> where U : Error {
    case success(T)
    case failure(U)
}
