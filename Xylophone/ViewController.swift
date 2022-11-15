//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // importei a biblioteca AVFoundation para poder usar as funcionalidades de audio/midia

class ViewController: UIViewController {

    var player: AVAudioPlayer! // produz audios simples
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        playSound(soundName: sender.currentTitle!) // chama a funcao abaixo quando o botao é pressionado
        
            // Reduz a opacidade para 0.5 quando o botão é pressionado
          sender.alpha = 0.5

            // Executa o código depois de 0.2 segundos
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
              
            // A opacidade volta ao normal
            sender.alpha = 1.0
    }
    
    func playSound(soundName: String) { // funcao que sera chamada quando clicar o botao
            let url = Bundle.main.url(forResource: soundName, withExtension: "wav") // pesquisa o arquivo na pasta
            player = try! AVAudioPlayer(contentsOf: url!) // reproduz a variavel criada acima
            player.play() // seleciona a variavel e reproduz o som
        }

    }

}


// Maneira mais complexa de fazer que inclui tocar mesmo se o Iphone estiver no modo silencioso

/*func playSound() {
    guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return } // Bundle localiza e identifica arquivos armazenados no disco    arquivo C     extensao wav

    do { // as duas linhas abaixo faz com que o som seja produzido mesmo se o iphone estiver silenciado
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)
        
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue) //audio que que queremos tocar

        guard let player = player else { return }

        player.play() // chama a funcao para tocar

    } catch let error { // se houver algum erro, pegue e print na tela
        print(error.localizedDescription)
    }
}*/
