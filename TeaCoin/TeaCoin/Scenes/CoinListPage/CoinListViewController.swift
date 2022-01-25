//
//  CoinListViewController.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 24.01.2022.
//

import UIKit

final class CoinListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let pickerViewContainer = UIView()
    
    var viewModel: CoinListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    private var coinList: [CoinPresentation] = []
    private let selectedTypeList: [ListedType] = ListedType.allCases
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Price", style: .plain, target: self, action: #selector(addTapped))
        viewModel.load()
        tableView.register(UINib(nibName: "CoinListCell", bundle: nil), forCellReuseIdentifier: "CoinListCell")
        addPickerView()
        
    }
    @objc func addTapped(){
        pickerViewContainer.isHidden = false
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
        case .selectedType(let selectedType):
            self.navigationItem.rightBarButtonItem?.title = selectedType.rawValue
            pickerViewContainer.isHidden = true
        }
    }
    
    func navigate(to route: CoinListViewRoute) {
        switch route {
        case .detail(let vm):
            let viewController = CoinDetailBuilder.make(with: vm)
            show(viewController, sender: nil)
        }
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
        viewModel.selectCoin(at: indexPath.row)
        tableView.reloadData()
    }
}
extension CoinListViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectedTypeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectedTypeList[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.updateSelectedType(with: selectedTypeList[row])
    }
}

//MARK: - UIHelper

extension CoinListViewController {
    func addPickerView() {
        
        pickerViewContainer.frame = CGRect(x: 0, y: (self.view.frame.height - self.view.frame.width), width: self.view.frame.width, height: self.view.frame.width)
        pickerViewContainer.isHidden = true
        
        let picker = UIPickerView(frame: CGRect(x: 0, y: 44, width: self.view.frame.width, height: self.view.frame.width - 44))
        picker.backgroundColor = .white
        picker.dataSource = self
        picker.delegate = self
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: picker.frame.width, height: 44))
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = false
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        toolBar.setItems([.flexibleSpace(), doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        pickerViewContainer.addSubview(toolBar)
        pickerViewContainer.addSubview(picker)
        pickerViewContainer.bringSubviewToFront(tableView)
        
        view.addSubview(pickerViewContainer)
    }
    
    @objc func donePicker() {
        viewModel.sortData()
    }
}
