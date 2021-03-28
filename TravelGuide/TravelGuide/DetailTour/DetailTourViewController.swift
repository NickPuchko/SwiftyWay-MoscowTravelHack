//
//  DetailTourViewController.swift
//  AudioTour
//
//  Created by Максим Сурков on 27.03.2021.
//

import Foundation
import UIKit
import AVFoundation

class DetailTourViewController: UIViewController{
    
    var player: AVAudioPlayer?
    
    var detailTourModel: DetailTourModel!
    private let detailTourView = DetailTourView()
    
    override func loadView() {
        view = detailTourView
        view.backgroundColor = .white
        //setup()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sleep(3)
        showAudioAlert()
    }
    
    private func showAudioAlert(){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Продолжить с аудиогидом", style: .default, handler: { _ in
            print("push")
        }))
        alert.addAction(UIAlertAction(title: "Оставьте меня в тишине!", style: .default, handler: { _ in
            print("push")
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
//        if let player = player, player.isPlaying {
//            player.stop()
//        }
//        else {
//            do{
//                try AVAudioSession.sharedInstance().setMode(.default)
//                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
//                player = try AVAudioPlayer(data: <#T##Data#>)
//
//                guard let player  = player else {
//                    return
//                }
//                player.play()
//            }
//            catch (let error){
//                print(error.localizedDescription)
//            }
//        }
    }
}
