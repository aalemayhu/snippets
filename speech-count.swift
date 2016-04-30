import AVFoundation

let speech = AVSpeechSynthesizer()  
for n in 1...3 {  
    var utter = AVSpeechUtterance(string: "\(n)")
    speech.speakUtterance(utter)
    sleep(1)
}

import XCPlayground  
XCPSetExecutionShouldContinueIndefinitely(true)  
