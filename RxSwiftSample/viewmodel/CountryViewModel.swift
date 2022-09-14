//
//  CountryViewModel.swift
//  RxSwiftSample
//
//  Created by Htain Lin Shwe on 14/09/2022.
//

import Foundation
import RxSwift
import RxCocoa
class CountryViewModel {
    var items = PublishSubject<[CountryListModel]>()
    let apiCalling = APICalling()
    let dispose = DisposeBag()
    func fetchCountryList() {
        
        let request =  APIRequest()
        let country:Observable<CountryModel> = apiCalling.callAPI(apiRequest: request)
        country.subscribe(onNext: { model in
            if let list = model.result {
                self.items.onNext(list)
                self.items.onCompleted()
            }
        }).disposed(by: self.dispose)
    }
    
}
