//
//  NetworkSessionmanager.swift
//  albumsCoreData
//
//  Created by Kirk Abbott on 11/25/22.
//

//import Foundation
//
//class NetworkSessionManager {
//    let session : URLSession
//    var albums: [Albums] = []
//    let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json")
//
//    init(session: URLSession = URLSession.shared) {
//        self.session = session
//    }
//
    
//    func getFeed(url: URL?) {
//        guard let url = url else {return}
//
//        session.dataTask(with: url) { (data, response, error) in
//        guard let data = data else {
//            print("No data.")
//            return
//        }
//
//        guard error == nil else {
//            print("errorrrrrr")
//            return
//        }
//        guard let response = response as? HTTPURLResponse else {
//            print("invalid res")
//            return
//        }
//        guard response.statusCode >= 200 && response.statusCode < 300 else {
//            print("status code wrong")
//            return
//        }
//
//        print("successfully got data")
//        print("printing data: \(data)")
        
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString ?? "default value")
            
//            guard let newResults = try? JSONDecoder().decode(Albums.self, from: data) else {
//                return
//            }
//
//
//            DispatchQueue.main.async { [weak self] in
//                self?.albums.append(newResults)
//            }
//            print(newResults)
//        }.resume()
        
        
//
//}
    
//    func fetchPageResult  <T : Decodable>(with url : URL?, completion : @escaping(Result<T, NetworkError>) -> Void) {
//        guard let url : URL = url else{
//            completion(.failure(.badURL))
//            return
//        }
//        let task = self.session.dataTask(with: url){
//            data, response, error in
//            guard let data = data else{
//                completion(.failure(.badData))
//                return
//            }
//            let decoder = JSONDecoder()
////            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            do {
//                let result = try decoder.decode(T.self, from: data)
//                
//                completion(.success(result))
//            }
//            catch {
//                print("failed to decode")
//                print(error)
//                completion(.failure(.decodeFailure(error as! DecodingError)))
//            }
//            
//        }
//        task.resume()
//    }
    
//    func fetchFeed(with url : URL, completion : @escaping(Result<Feed, NetworkError>) -> Void) {
//        let temp = self.session.dataTask(with: url) {data, response, error in
//            guard let data = data else{
//                completion(nil)
//                return
//            }
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            do {
//                let result = try decoder.decode(data, from: data)
//                completion(result)
//                print(result)
//            }
//            catch {
//                completion(nil)
//            }
//
//        }
//        temp.resume()
//    }
//
//    func fetchRawData(url : URL, completion: @escaping(Data?) -> Void){
//        let task = self.session.dataTask(with: url){
//            data, response, error in
//            if let _ = error{
//                completion(nil)
//                return
//            }
//            guard let data = data else {
//                completion(nil)
//                return
//            }
//            completion(data)
//        }
//
//        task.resume()
//    }
//
//}
