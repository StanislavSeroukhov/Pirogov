//
//  MenuCollectionView.swift
//  Pirogov
//
//  Created by Stanislav Seroukhov on 16.05.2024.
//

import UIKit

//    MARK: - Protocol

protocol MenuDelegate: AnyObject {
    func didUpdateTableViewData(by selectedIndex: Int)
}


class MenuCollectionView: UICollectionView {

    var cells = [MenuProducts]()

    private var selectedIndexGroup: Int = 0
        
    weak var menuDelegate: MenuDelegate?

    
    init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.backgroundColor = .white
        
        
        delegate = self
        dataSource = self
        register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.id)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        
//        set(cell: MenuProducts.fetchMenu())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cell: [MenuProducts]) {
        self.cells = cell
    }
}




//    MARK:  - UICollectionViewDelegate

extension MenuCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        self.selectedIndexGroup = indexPath.item
        collectionView.reloadData()
        
        menuDelegate?.didUpdateTableViewData(by: indexPath.item)
        
        print(selectedIndexGroup)
    }
}



//    MARK: - UICollectionViewDataSource

extension MenuCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.id, for: indexPath) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }
            cell.nameProductLabel.text = self.cells[indexPath.row].name
            cell.layer.cornerRadius = 15

            if indexPath.item == selectedIndexGroup {
                cell.nameProductLabel.textColor = .white
                cell.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.231372549, blue: 0.3019607843, alpha: 0.8709160003)
            } else {
                cell.nameProductLabel.textColor = #colorLiteral(red: 0.06274509804, green: 0.231372549, blue: 0.3019607843, alpha: 1)
                cell.backgroundColor = .white
            }
            return cell
        }
    }


//    MARK: - UICollectionViewDelegateFlowLayout

extension MenuCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Create dinamic width items
        let label = UILabel(frame: CGRect.zero)
        label.text = self.cells[indexPath.row].name
        label.sizeToFit()
        
        return CGSize(width: label.frame.width + 20, height: 32)
    }
}
