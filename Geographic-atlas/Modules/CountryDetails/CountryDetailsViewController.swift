//
//  CountryDetailsViewController.swift
//  Geographic-atlas
//
//  Created by Kirill Dev on 12.05.2023.
//

import UIKit
import Kingfisher

//TODO: - add bullet points, pass data

final class CountryDetailsViewController: UIViewController {
  
  // MARK: - Private Properties
  @IBOutlet private var flagImageView: UIImageView!
  
  @IBOutlet private var regionLabel: UILabel!
  
  @IBOutlet private var regionInfoLabel: UILabel!
  
  @IBOutlet private var capitalLabel: UILabel!
  
  @IBOutlet private var capitalInfoLabel: UILabel!
  
  @IBOutlet private var coordinatesLabel: UILabel!
  
  @IBOutlet private var coordinatesInfoLabel: UILabel!
  
  @IBOutlet private var populationLabel: UILabel!
  
  @IBOutlet private var populationInfoLabel: UILabel!
  
  @IBOutlet private var areaLabel: UILabel!
  
  @IBOutlet private var areaInfoLabel: UILabel!
  
  @IBOutlet private var currencyLabel: UILabel!
  
  @IBOutlet private var currencyInfoLabel: UILabel!
  
  @IBOutlet private var timezonesLabel: UILabel!
  
  // MARK: -Override methods
  override func viewDidLoad() {
        super.viewDidLoad()
//    [regionLabel.text, capitalLabel.text, coordinatesLabel.text, populationLabel.text, areaLabel.text, currencyLabel.text, timezonesLabel.text].forEach {
//      $0 = "\u{2022}"
//    }
    }

  // MARK: - Public methods
  func configure(with country: DetailCountryInfo) {
    guard let url = URL(string: "\(country.flags.png)") else { return }
    
    flagImageView.kf.setImage(with: url)
//    regionInfoLabel.text = String(country.capital?.regions[0])
    capitalInfoLabel.text = country.capital?[0]
//    coordinatesInfoLabel.text = country.capitalInfo.latlng
    populationInfoLabel.text = String(country.population)
    areaInfoLabel.text = String(country.area)
    currencyInfoLabel.text = country.currencies?.all?.symbol
  }
}
