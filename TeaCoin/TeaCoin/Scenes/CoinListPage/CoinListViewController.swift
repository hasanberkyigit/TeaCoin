//
//  CoinListViewController.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 24.01.2022.
//

import UIKit

final class CoinListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: CoinListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private var coinList: [CoinPresentation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
        tableView.register(UINib(nibName: "CoinListCell", bundle: nil), forCellReuseIdentifier: "CoinListCell")
        
        
    }
    
    
}

extension CoinListViewController: CoinListViewModelDelegate {
    
    func handleViewModelOutput(_ output: CoinListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showCoinList(let coinList):
            self.coinList = coinList
            tableView.reloadData()
        }
    }
    
    func navigate(to route: CoinListViewRoute) {
        //TODO: add to navigate func to delegate and change viewroute enum after created detail contracts.
    }
}

extension CoinListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoinListCell", for: indexPath) as! CoinListCell
        let coins = coinList[indexPath.row]
        cell.cellConfigure(data: coins)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinList.count
    }
    
}

extension CoinListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
