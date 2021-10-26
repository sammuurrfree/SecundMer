//
//  SettingsViewController.swift
//  SecundMer
//
//  Created by Преподаватель on 25.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var backoundCollectionView: UICollectionView!
    @IBOutlet weak var foregroundCollectionView: UICollectionView!
    @IBOutlet weak var showMillisecondLabel: UISwitch!
    @IBOutlet weak var showHourLabel: UISwitch!
    @IBOutlet weak var animedetText: UISwitch!
    
    
    let settings = Settings.main
    let color: [UIColor] = [.black , .blue, .brown, .cyan, .darkGray, .gray, .green, .lightGray, .lightText, .magenta, .orange, .purple, .red, .systemPurple, .systemPink, .systemYellow]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMillisecondLabel.isOn = settings.showMilliseconds
        showHourLabel.isOn = settings.showHour
        animedetText.isOn = settings.animedetText
        
    }
    
    @IBAction func showHour(_ sender: UISwitch) {
        settings.showHour = sender.isOn
    }
    @IBAction func showMilliseconds(_ sender: UISwitch) {
        settings.showMilliseconds = sender.isOn
    }
    @IBAction func animedetText(_ sender: UISwitch) {
        settings.animedetText = sender.isOn
    }
    

}

extension SettingsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return color.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = color[indexPath.item]
        
        return cell
    }
}

extension SettingsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == backoundCollectionView{
            settings.backroundColor = color[indexPath.item]
        }else{
            settings.foregroundColor = color[indexPath.item]
        }
    }
}
