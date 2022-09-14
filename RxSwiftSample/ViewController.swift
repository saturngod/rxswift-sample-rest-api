//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by Htain Lin Shwe on 14/09/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let apiCalling = APICalling()
    private let disposeBag = DisposeBag()
    var countryViewModel : CountryViewModel = CountryViewModel()
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(tableView)
        
        processData()
        
    }

    func processData() {
        countryViewModel.fetchCountryList()
        let _ = countryViewModel.items.bind(to: tableView.rx.items(cellIdentifier: "cell")) { ( row, model, cell) in
            cell.textLabel?.text = model.name
            cell.detailTextLabel?.text = model.code
        }.disposed(by: disposeBag)
    }
}

