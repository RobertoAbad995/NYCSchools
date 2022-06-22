//
//  NYCSchools.swift
//  NYCSchools
//
//  Created by Consultant on 6/15/22.
//

import Foundation

final class NYCSchools{
    
    internal func getList() -> [School]
    {
        return schoolsApiDAO().getList()
    }
    
}

