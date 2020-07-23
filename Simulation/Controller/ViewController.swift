//
//  ViewController.swift
//  Simulation
//
//  Created by Samyak Pawar on 16/07/20.
//  Copyright © 2020 ArtistSamyak. All rights reserved.
//

import UIKit
import AVFoundation

let imageArray = [ #imageLiteral(resourceName: "Airplane"), #imageLiteral(resourceName: "train"), #imageLiteral(resourceName: "bar"), #imageLiteral(resourceName: "cafe"), #imageLiteral(resourceName: "campfire"), #imageLiteral(resourceName: "car"), #imageLiteral(resourceName: "forest"), #imageLiteral(resourceName: "lake"), #imageLiteral(resourceName: "waterfall") ]
let placeArray = [ place(description: "Night AirPlane", song: "Airplane"), place(description: "Coastline Train", song: "Train-Coast"), place(description: "Busy bar", song: "barFinal"), place(description: "Productive café", song: "café"), place(description: "Campfire on Beach", song: "campfire"), place(description: "Car", song: "car"), place(description: "Dark Forest", song: "Forest White Noise"), place(description: "Calm Lake", song: "lake"), place(description: "Waterfall", song: "waterfall") ]
class ViewController: UIViewController {

    
    var index = 0
    @IBOutlet weak var colView: UICollectionView!
    //var audioPlayer1: AVAudioPlayer?
    //var audioPlayer2: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.placeDesc.text = placeArray[indexPath.row].desc
        cell.placeImage.image = imageArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: K.toDetailSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC = segue.destination as! DetailViewController
        VC.placeIndex = index
        
        
    }
    
    
}
