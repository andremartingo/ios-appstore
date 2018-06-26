//
//  Header.swift
//  appstore
//
//  Created by André Martingo on 18/06/2018.
//  Copyright © 2018 André Martingo. All rights reserved.
//

import UIKit

class HeaderCell: CategoryCell {
    private let bannerCellId = "bannerCellId"

    override func setupViews() {
        //super.setupViews()
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        appsCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: bannerCellId)
        addSubview(appsCollectionView)
        appsCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        appsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        appsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        appsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerCellId, for: indexPath) as? BannerCell else {
            return UICollectionViewCell()
        }
        cell.app = category?.apps?[indexPath.item]
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/2 + 50, height: frame.height)
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
