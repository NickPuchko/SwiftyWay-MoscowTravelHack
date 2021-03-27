//
//  ViewController.swift
//  AudioTour
//
//  Created by Administrator on 26.03.2021.
//

import UIKit
import AVFoundation

class FeedViewController: UIViewController {
    var a = NetworkManager()
    var player: AVAudioPlayer?
    private var feedView: FeedView {
        view as! FeedView
    }
    
    override func loadView() {
        view = FeedView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        a.fetchImage(uuid: "d319471a-1108-4d97-a938-b82ed956f138", image_uuid: "ab9ac94d-61ca-4167-83f3-cf31804c92b6_800x600") { (result) in
//            switch result {
//            case .success(let imageData):
//                self.view.backgroundColor = UIColor(patternImage: UIImage(data: imageData)!)
//            case .failure(let error):
//                print("Errror \(error.localizedDescription)")
//            }
//        }
        a.fetchAudio(uuid: "d319471a-1108-4d97-a938-b82ed956f138", audio_uuid: "357cc390-81f2-46ea-b3b7-5a0800c1e69e") { (result) in
            switch result {
            case .success(let dataAudio):
                
                if let player = self.player, player.isPlaying {
                    
                }
                else {
                    do {
                        
                        try AVAudioSession.sharedInstance().setMode(.default)
                        try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                        self.player = try AVAudioPlayer(data: dataAudio)
                        guard let player = self.player else {
                            print("Player")
                            return
                        }
                        player.play()
                    }
                    catch {
                        print("something wrong")
                    }
                }
            case .failure(let error):
                print("Errror \(error.localizedDescription)")
            }
        }
//        a.fetchDataTour(symbol: "Мурманск") { (result) in
//            switch result {
//            case .success(let tours):
//                print(tours)
//            case .failure(let error):
//                print("Errror \(error.localizedDescription)")
//            }
//        }
        title = "City"
        // Do any additional setup after loading the view.
    }

}
