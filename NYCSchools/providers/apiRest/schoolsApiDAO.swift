//
//  odSchoolsAPI.swift
//  NYCSchools
//
//  Created by Consultant on 6/15/22.
//

import Foundation

struct schoolsApiDAO:openDataAPIRestProtocol{
    var privateToken = "3k61g9y3fsmt45dhkkbe8jmi48rsa7zybppp4i84j5ig6mvx4j"
    
    
    typealias T = School
    
    var baseUrl = "https://data.cityofnewyork.us/"
    
    
    
    
    /// This function request at the endpoint of open data to fetch the
    ///  directory of Department of Education Schools in 2017. Also return the
    /// - Returns: an array of the selected Type(School)
    func getList() -> [T]{
        
        var returnData = [T]()
       //create the url by urlString
        guard let url = URL(string: baseUrl + "resource/s3k6-pzi2.json") else {
            print("Invalid url...")
            return returnData
        }
        
//        var request = URLRequest(url: url)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type" )
//        request.addValue(privateToken, forHTTPHeaderField: "Content-Type" )
//        request.httpMethod = "POST"
//        request.httpBody = jsonData
        
        
        //create a semaophore to wait until get the response
        let semaphore = DispatchSemaphore(value: 0)
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            print(data!)
            let dataRecived = try! JSONDecoder().decode([School].self, from: data!)
            DispatchQueue.global().sync {
                returnData = dataRecived
                //response is correct, semaphore set signal
                semaphore.signal()
            }
        }.resume()
            
       //semaphore wait until response is correct
        _ = semaphore.wait(wallTimeout: .distantFuture)
        return returnData
            
        /**
         do{
         }
         }catch let DecodingError.dataCorrupted(context) {
             print(context)
         } catch let DecodingError.keyNotFound(key, context) {
             print("Key '\(key)' not found:", context.debugDescription)
             print("codingPath:", context.codingPath)
         } catch let DecodingError.valueNotFound(value, context) {
             print("Value '\(value)' not found:", context.debugDescription)
             print("codingPath:", context.codingPath)
         } catch let DecodingError.typeMismatch(type, context)  {
             print("Type '\(type)' mismatch:", context.debugDescription)
             print("codingPath:", context.codingPath)
         } catch {
             print("error: ", error)
         }
         catch {
              print("decode error")
              print(error)
          }
         
         */
            
            
        
    }

}
