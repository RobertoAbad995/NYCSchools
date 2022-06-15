//
//  mainOpenDataAPI.swift
//  NYCSchools
//
//  Created by Consultant on 6/15/22.
//

import Foundation

protocol openDataAPIRestProtocol{
    
    associatedtype T
    var privateToken: String { get }
    
    
    var baseUrl: String { get set }
    func getList() -> [T]
//    internal func postData()
    
}
