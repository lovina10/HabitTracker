//
//  IconPickerViewController.swift
//  Habit
//
//  Created by Lovina on 1/2/20.
//  Copyright © 2020 Buildschool. All rights reserved.
//

import UIKit

class IconPickerViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private var icons: [UIImage] = [UIImage(named: "book")!,
                                    UIImage(named: "bulb")!,
                                    UIImage(named: "clock")!,
                                    UIImage(named: "code")!,
                                    UIImage(named: "drop")!,
                                    UIImage(named: "food")!,
                                    UIImage(named: "grow")!,
                                    UIImage(named: "gym")!,
                                    UIImage(named: "heart")!,
                                    UIImage(named: "other")!]

    let newHabitVC = NewHabitVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select Image"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
        let nib = UINib(nibName: "IconCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self

        if let iconLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            iconLayout.itemSize = CGSize(width: 90, height: 90)
        }
    }

    @objc func cancelPressed() {
        navigationController?.popViewController(animated: true)
    }
}

extension IconPickerViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IconCollectionViewCell
        cell.imageView.image = icons[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let icon = icons[indexPath.row]
        newHabitVC.selectedIcon = icon
        navigationController?.pushViewController(newHabitVC, animated: true)
    }
}
