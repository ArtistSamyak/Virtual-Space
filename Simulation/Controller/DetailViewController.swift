//
//  DetailViewController.swift
//  Simulation
//
//  Created by Samyak Pawar on 18/07/20.
//  Copyright © 2020 ArtistSamyak. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    var audioPlayer1 = AVAudioPlayer()
    
    @IBOutlet weak var image: UIImageView!
    var placeIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if placeIndex == 0 {
            image.image = imageArray[placeIndex]
            let path1 = Bundle.main.path(forResource: "Airplane", ofType: "mp3")!
            let url1 = URL(fileURLWithPath: path1)
            let path2 = Bundle.main.path(forResource: "Airplane White Noise", ofType: "mp3")!
            let url2 = URL(fileURLWithPath: path2)
            do{
                audioPlayer1 = try AVAudioPlayer(contentsOf: url1)
                audioPlayer1.play()
                
                let seconds = 47.0
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    // Put your code which should be executed with a delay here
                    self.audioPlayer1 = try! AVAudioPlayer(contentsOf: url2)
                    self.audioPlayer1.play()
                    self.audioPlayer1.numberOfLoops = 10000
                    
                }
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
                    print("Playback OK")
                    try AVAudioSession.sharedInstance().setActive(true)
                    print("Session is Active")
                } catch {
                    print(error)
                }
                
                
            }catch{
                
             }
        } else {
            image.image = imageArray[placeIndex]
            let path1 = Bundle.main.path(forResource: placeArray[placeIndex].song, ofType: "mp3")!
            let url1 = URL(fileURLWithPath: path1)
            self.audioPlayer1 = try! AVAudioPlayer(contentsOf: url1)
            self.audioPlayer1.play()
            self.audioPlayer1.numberOfLoops = 10000
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
                print("Playback OK")
                try AVAudioSession.sharedInstance().setActive(true)
                print("Session is Active")
            } catch {
                print(error)
            }
            
        }
            
        
    }
    

    @IBAction func back(_ sender: UIButton) {
        audioPlayer1.stop()
        performSegue(withIdentifier: K.toMainSegue, sender: self)
        
    }
}
