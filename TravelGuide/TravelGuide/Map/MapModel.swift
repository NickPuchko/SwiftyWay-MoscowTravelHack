//
//  MapModel.swift
//  TravelGuide
//
//  Created by Николай Пучко on 28.03.2021.
//

import Foundation
import AVFoundation
class MapModel {
    weak var mapViewController: MapViewController!
    var audioManager = AudioNetworkService()
    
    var route: Route
    var tour: Tour
    var audioData: Data?
    
    var playerAudio: AVAudioPlayer?
    init(vc: MapViewController, selectedRoute: Route, selectedTour: Tour) {
        mapViewController = vc
        route = selectedRoute
        tour = selectedTour
    }
    func playSound(){
        print("aaaaaa")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            playerAudio = try AVAudioPlayer(data: audioData!)

            guard playerAudio != nil else {
                return
            }
            playerAudio?.play()
        }
        catch (let error){
            print(error.localizedDescription)
        }

    }
    func stopSound(){
        if ((playerAudio?.isPlaying) != nil){
            playerAudio?.stop()
        }
    }
    func loadAudio() {
        if let audio = route.content[0].audio?[0] {
            audioManager.getAudio(providerUuid: tour.contentProvider.uuid, audio: audio) { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    self.audioData = data
                }
            }

        }
    }
}
