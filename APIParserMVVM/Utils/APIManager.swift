//
//  APIManager.swift
//  APIParser
//
//  Created by Sunkara on 4/17/23.
//

import Foundation

enum NetworkError : Error {
    case badURL
    case clientSideEroor
    case serverSideError
    case somethingBadError
    
//    var errorDescripton : String {
//        switch self {
//            
//        case .badURL : return "URL not found"
//        case .clientSideEroor : return ""
//        case .serverSideError : return ""
//        
//    
//        }
//    }
}

class APIManager: NSObject {
    

    func getAllTodos(urlStr : String,completion:@escaping (Result<Data,NetworkError>) -> ()) {

        URLSession.shared.dataTask(with: URLRequest(url: URL(string: urlStr)!), completionHandler:{
            (data,response, error) in
            if let error = error {
                completion(.failure(.somethingBadError))
                print("error.localizedDescription\(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode)
            else {
                completion(.failure(.somethingBadError))
                return
            }
            
            completion(.success(data!))
            
        }
         ).resume()
        
    }
    
/*
    func addTodoItemToServie(urlStr : String,completion:@escaping (Data) -> ()) {
        print(#function)
        // Prepare URL
        let url = URL(string: urlStr)
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "todo=My urgent task is Open house&completed=false&userId=456";
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8)
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
              // Check for Error
                if let error = error {
                    print("Error took place \(error.localizedDescription)")
                    return
                }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode)
            else {
                print("response.statusCode\((response as? HTTPURLResponse)!.statusCode)")
                return
            }
            print("response.statusCode\(response.statusCode)")
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
                          
            completion(data!)
        }
        task.resume()
    }
 */
    
    
    func addTodoItemToServie(urlStr : String,completion:@escaping (Result<Data,NetworkError>) -> ()) {
        print(#function)
        // Prepare URL
        let url = URL(string: urlStr)
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "todo=My urgent task is Open house&completed=false&userId=1";
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8)
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
              // Check for Error
                if let error = error {
                    
                    completion(.failure( NetworkError.badURL) )
                    print("Error took place \(error.localizedDescription)")
                    return
                }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode)
            else {
                print("response.statusCode\((response as? HTTPURLResponse)!.statusCode)")
                completion(.failure( NetworkError.clientSideEroor) )
                return
            }
            print("response.statusCode\(response.statusCode)")
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                  
                }
            completion(.success(data!))
           
        }
        task.resume()
    }
    
}
