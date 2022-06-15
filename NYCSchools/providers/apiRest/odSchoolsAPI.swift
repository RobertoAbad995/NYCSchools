//
//  odSchoolsAPI.swift
//  NYCSchools
//
//  Created by Consultant on 6/15/22.
//

import Foundation

struct schoolsDAO:openDataAPIRestProtocol{
    var privateToken = "soome text"
    
    
    typealias T = School
    
    var baseUrl = "https://data.cityofnewyork.us/"
    
    
    
    
    /// This function request at the endpoint of open data to fetch the
    ///  directory of Department of Education Schools in 2017. Also return the
    /// - Returns: an array of the selected Type(School)
    func getList() -> [T]{
        
        
        var returnData = [T]()
       //create the url by urlString
        guard let url = URL(string: baseUrl + "resource/s3k6-pzi2.json"
        ) else {
            print("Invalid url...")
            return returnData
        }
        //create a semaophore to wait until get the response
        let semaphore = DispatchSemaphore(value: 0)
        URLSession.shared.dataTask(with: url) { data, response, error in
            let dataRecived = try! JSONDecoder().decode([T].self, from: data!)
            DispatchQueue.global().sync {
                returnData = dataRecived
                //response is correct, semaphore set signal
                semaphore.signal()
            }
        }.resume()
       //semaphore wait until response is correct
        _ = semaphore.wait(wallTimeout: .distantFuture)
        return returnData
        
    }

}
