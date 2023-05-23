//
//  CountryTableViewCell.swift
//  Geographic-atlas
//
//  Created by Kirill Dev on 13.05.2023.
//

import UIKit
import Kingfisher

// MARK: - Delegate Protocol
protocol CountryTableViewCellDelegate: AnyObject {
  func didTapLearnMore(with country: DetailCountryInfo)
}

final class CountryTableViewCell: UITableViewCell {
  
  // MARK: - Static
  static let identifier = "CountryTableViewCell"
  
  static func nib() -> UINib {
    return UINib(nibName: "CountryTableViewCell", bundle: nil)
  }
  
  // MARK: - Private Properties
  @IBOutlet private var containerStackView: UIStackView!
  
  @IBOutlet private var flagImageView: UIImageView!
  
  @IBOutlet private var countryNameLabel: UILabel!
  
  @IBOutlet private var сapitalNameLabel: UILabel!
  
  @IBOutlet private var populationLabel: UILabel!
  
  @IBOutlet private var areaLabel: UILabel!
  
  @IBOutlet private var currenciesLabel: UILabel!
  
  @IBOutlet private var learnMoreButton: UIButton!
  
  // MARK: - Public Properties
  @IBOutlet weak var bottomView: UIView!
  
  @IBOutlet weak var arrowImageView: UIImageView!
  
  weak var delegate: CountryTableViewCellDelegate?
  
  // MARK: - Override Methods
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  
  // MARK: - Public methods
  func confugure(with country: DetailCountryInfo) {
    
    guard let capitalName = country.capital?[0],
          let url = URL(string: "\(country.flags.png)") else { return  }
    
    countryNameLabel.text = country.name.common
    сapitalNameLabel.text = capitalName
    flagImageView.kf.setImage(with: url)
    
    populationLabel.text = String(country.population)
    areaLabel.text = String(country.area)
    currenciesLabel.text = country.currencies?.all?.name
    
    delegate?.didTapLearnMore(with: country)
  }
  
  // MARK: - Private Methods
  private func setupUI() {
    applyShadow(cornerRadios: 10)
    selectionStyle = .none
    contentView.layer.cornerRadius = 8
    contentView.layer.masksToBounds = true
  }
}
