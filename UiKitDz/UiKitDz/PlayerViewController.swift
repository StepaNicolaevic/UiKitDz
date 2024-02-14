// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

///  плеер для моих треков
final class PlayerViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet private var durationMisic: UISlider!
    @IBOutlet private var valueSlayder: UISlider!
    @IBOutlet private var muteButton: UIButton!
    @IBOutlet private var playStopLabel: UIButton!
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var nameTrackLabel: UILabel!
    @IBOutlet private var setImage: UIImageView!
    // MARK: - Public Properties
    
    var currentIndex = 0
    

    // MARK: - Private Properties

    private var player = AVAudioPlayer()
    private var tracks = ["KorolLesnik", "KuklaKolduna"]
    private var nameTrack = ["Лесник", "Кукла колдуна"]
    private var trackImage = ["song1", "song2"]
    private var timer = Timer()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTrackLabel.text = nameTrack[currentIndex]
        setImage.image = UIImage(named: trackImage[currentIndex])
    }

    // MARK: - Private Methods

    private func setupUI() {
        durationMisic.addTarget(self, action: #selector(durationChanged), for: .valueChanged)
        playStopLabel.setImage(UIImage(named: "play"), for: .normal)
        do {
            if let audioPath = Bundle.main.path(forResource: tracks[currentIndex], ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                player.prepareToPlay()
                durationMisic.maximumValue = Float(player.duration)
            }
        } catch {
            print("error")
        }
        valueSlayder.frame = CGRect(x: 20, y: 200, width: 30, height: 200)
        let interval = 0.1
        timer = Timer.scheduledTimer(
            timeInterval: interval,
            target: self,
            selector: #selector(updateTimeLabel),
            userInfo: nil,
            repeats: true
        )
        muteButton.setImage(UIImage(named: "minusVolume"), for: .normal)
    }

    @objc private func updateTimeLabel() {
        let time = Int(player.duration) - Int(player.currentTime)
        let minutes = time / 60
        let seconds = time % 60
        timeLabel.text = NSString(format: "-%02d:%02d", minutes, seconds) as String
    }

    @objc private func durationChanged(sender: UISlider) {
        if sender == durationMisic {
            player.currentTime = TimeInterval(sender.value)
        }
    }

    // MARK: - IBAction

    @IBAction private func openPlaylist(_ sender: UIButton) {
        let alertController = UIAlertController(
            title: "Упс!",
            message: "Функционал в разработке",
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alertController, animated: true)
    }

    @IBAction private func muteVolume(_ sender: UIButton) {
        if muteButton.currentImage == UIImage(named: "minusVolume") {
            muteButton.setImage(UIImage(named: "plusVolume"), for: .normal)
            player.volume = 0
            valueSlayder.value = 0

        } else {
            muteButton.setImage(UIImage(named: "minusVolume"), for: .normal)
            player.volume = 0.2
            valueSlayder.value = 0.2
        }
    }

    @IBAction private func maxValueSlayder(_ sender: UISlider) {
        player.volume = valueSlayder.value
    }

    @IBAction private func nextTrack(_ sender: UIButton) {
        if currentIndex < (tracks.count - 1) {
            currentIndex += 1
            nameTrackLabel.text = nameTrack[currentIndex]
            setImage.image = UIImage(named: trackImage[currentIndex])
        } else {
            currentIndex = 0
            nameTrackLabel.text = nameTrack[currentIndex]
            setImage.image = UIImage(named: trackImage[currentIndex])
        }
    }

    @IBAction private func previousTrack(_ sender: UIButton) {
        if currentIndex != 0 {
            currentIndex -= 1
            nameTrackLabel.text = nameTrack[currentIndex]
            setImage.image = UIImage(named: trackImage[currentIndex])
        } else {
            currentIndex = (tracks.count - 1)
            nameTrackLabel.text = nameTrack[currentIndex]
            setImage.image = UIImage(named: trackImage[currentIndex])
        }
    }

    @IBAction private func dismisViewController(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction private func playMusic(_ sender: UIButton) {
        if playStopLabel.currentImage == UIImage(named: "play") {
            playStopLabel.setImage(UIImage(named: "stop"), for: .normal)
            player.play()
        } else {
            playStopLabel.setImage(UIImage(named: "play"), for: .normal)
            player.stop()
        }
    }
}
