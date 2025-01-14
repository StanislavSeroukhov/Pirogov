//
//  MenuTableViewCell.swift
//  Pirogov
//
//  Created by Stanislav Seroukhov on 17.05.2024.
//

import Foundation
import UIKit

class ProductsTableViewCell: UITableViewCell {
    
    static let id = "Cell"
    

    // MARK: - UIProrerties
    
    private lazy var productImageView: UIImageView = {
        let image = UIImage(named: "image1.jpg")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 130, height: 83)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameProductLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.06274509804, green: 0.231372549, blue: 0.3019607843, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 2
//        label.backgroundColor = .systemBlue
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = .monospacedDigitSystemFont(ofSize: 13, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
        label.layer.cornerRadius = 15
//        label.text = "2 250" + " ₽"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
//        stackView.backgroundColor = .gray
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        stackView.addArrangedSubview(nameProductLabel)
        stackView.addArrangedSubview(priceLabel)
        
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Method Update Cell
    
    func configureCell(model product: Product) {
        productImageView.image = product.image.images[0] ?? UIImage(named: "picture")
        nameProductLabel.text = product.name
        priceLabel.text = "\(product.price)" + " ₽"
    }
}



    // MARK: - Settings Constraints

extension ProductsTableViewCell {
    
    func setConstraints() {
        self.addSubview(productImageView)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productImageView.widthAnchor.constraint(equalToConstant: 130),
//            productImageView.heightAnchor.constraint(equalToConstant: 83),
            productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            productImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            productImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.70),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor)
        ])
        
        stackView.addSubview(nameProductLabel)
        nameProductLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameProductLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.90),
            nameProductLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
        
        stackView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.widthAnchor.constraint(equalToConstant: 70),
            priceLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}


