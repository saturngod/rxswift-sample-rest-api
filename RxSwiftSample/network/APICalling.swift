//
//  APICalling.swift
//  RxSwiftSample
//
//  Created by Htain Lin Shwe on 14/09/2022.
//

import Foundation
import RxSwift

class APICalling {
    
    public func callAPI<ItemModel: Decodable>(apiRequest: APIRequest)
    -> Observable<ItemModel> {
        
        let request = apiRequest.request(with: apiRequest.baseURL)
        //MARK: creating our observable
        return Observable.create { observer in
            //MARK: create URLSession dataTask
            let task = URLSession.shared.dataTask(with: request) { (data,
                                                                  response, error) in
                if let httpResponse = response as? HTTPURLResponse{
                    let statusCode = httpResponse.statusCode
                    do {
                        let _data = data ?? Data()
                        if (200...399).contains(statusCode) {
                            let objs = try JSONDecoder().decode(ItemModel.self, from:
                                                                    _data)
                            //MARK: observer onNext event
                            observer.onNext(objs)
                        }
                        else {
                            observer.onError(error!)
                        }
                    } catch {
                        //MARK: observer onNext event
                        observer.onError(error)
                    }
                }
                //MARK: observer onCompleted event
                observer.onCompleted()
            }
            task.resume()
            //MARK: return our disposable
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
   
}
