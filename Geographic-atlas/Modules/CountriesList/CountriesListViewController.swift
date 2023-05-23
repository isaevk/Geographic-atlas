//
//  CountriesListViewController.swift
//  Geographic-atlas
//
//  Created by Kirill Dev on 12.05.2023.
//

import UIKit
import SkeletonView

final class CountriesListViewController: UIViewController {
  
  // MARK: - Public Properties
  var viewModel: CountriesListViewModel?
  var networkManagerProtocol: NetworkManagerProtocol
  
  // MARK: - Private Properties
  @IBOutlet private var countriesListTableView: UITableView!
  
  private var countries: [Country] = []
  private var detailCountries: [DetailCountryInfo] = []
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    getCountries()
  }
  
  // MARK: - Initializers
  init(networkManager: NetworkManagerProtocol) {
    self.networkManagerProtocol = networkManager
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension CountriesListViewController {
  
  // Setup UI
  func setupUI() {
    title = "World countries"
    countriesListTableView.register(CountryTableViewCell.nib(), forCellReuseIdentifier: CountryTableViewCell.identifier)
    countriesListTableView.delegate = self
    countriesListTableView.dataSource = self
  }
  
  // Get List of Countries
  func getCountries() {
    self.networkManagerProtocol.getCountries { [weak self] result in
      switch result {
      case .success(let countries):
        self?.update(with: countries)
      case .failure:
        print("Error")
      }
    }
  }
  
  // Reload Table View
  func update(with countries: [Country]) {
    DispatchQueue.main.async { [weak self] in
      self?.countries = countries
      
      self?.detailCountries.append(contentsOf: (self?.countries.map{DetailCountryInfo(name: $0.name, population: $0.population, area: $0.area, capital: $0.capital, currencies: $0.currencies, flags: $0.flags)} ?? [DetailCountryInfo(name: .init(common: "", official: "", nativeName: nil),population: 0, area: 0.0, capital: nil, currencies: nil, flags: .init(png: "", svg: "", alt: nil))]))
      
      self?.countriesListTableView.reloadData()
    }
  }
}

// MARK: - SkeletonTableViewDataSource
extension CountriesListViewController: SkeletonTableViewDataSource {
  func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
    return CountryTableViewCell.identifier
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    detailCountries.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = countriesListTableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.identifier, for: indexPath) as? CountryTableViewCell else { return UITableViewCell() }
    
    let expendableItem = detailCountries[indexPath.row]
    
    cell.confugure(with: detailCountries[indexPath.row])
    cell.delegate = self
    cell.bottomView.isHidden = !(expendableItem.isHidden)
    
    if expendableItem.isHidden {
      cell.arrowImageView.image = UIImage(systemName: "chevron.up")
    } else  {
      cell.arrowImageView.image = UIImage(systemName: "chevron.down")
    }
    
    return cell
  }
}

// MARK: - SkeletonTableViewDelegate
extension CountriesListViewController: SkeletonTableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    detailCountries[indexPath.row].isHidden.toggle()
    countriesListTableView.reloadRows(at: [indexPath], with: .automatic)
  }
}

// MARK: - CountryTableViewCellDelegate
extension CountriesListViewController: CountryTableViewCellDelegate {
  
  func didTapLearnMore(with country: DetailCountryInfo) {
    let viewController = CountryDetailsViewController()
    viewController.configure(with: country)
    navigationController?.pushViewController(viewController, animated: true)
  }
}
