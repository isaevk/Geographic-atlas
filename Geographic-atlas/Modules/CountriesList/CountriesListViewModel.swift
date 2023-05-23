//
//  CountriesListViewModel.swift
//  Geographic-atlas
//
//  Created by Kirill Dev on 12.05.2023.
//

import UIKit

final class CountriesListViewModel {
  
  func setupTableView(with tableView: UITableView) {
    tableView.register(CountryTableViewCell.nib(), forCellReuseIdentifier: CountryTableViewCell.identifier)
  }
}
