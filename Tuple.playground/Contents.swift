//: Playground - noun: a place where people can play

import UIKit
import Foundation

//let tipAndTotal = (4.00, 25.19)

let tipAndTotal:(Double, Double) = (4.00, 25.19)

tipAndTotal.0

tipAndTotal.1

let(theTipAmount, theTotal) = tipAndTotal
theTipAmount
theTotal

let tipAndTotalNamed = (tipAmt: 4.00, total: 25.19)
tipAndTotalNamed.tipAmt
tipAndTotalNamed.total

let total = 21.19
let taxPct = 0.06

let subTotal = total / (taxPct + 1)

func calcTipWithTipPct(tipPct:Double) ->(tipAmt:Double, total:Double) {
    
    let tipAmt = subTotal * tipPct
    let finalTotal = total + tipAmt
    return (tipAmt, finalTotal)
}

calcTipWithTipPct(0.20)

class TipCalculatorModel {
    var total: Double
    var taxPct: Double
    var subTotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total:Double, taxPct: Double) {
        
        self.total = total
        self.taxPct = taxPct
        
    }
    
    func calcTipWithTipPct(tipPct: Double) -> (tipAmt:Double, total:Double) {
        
        let tipAmt = subTotal * tipPct
        let finaltTotal = total + tipAmt
        
        return (tipAmt, finaltTotal)
    }
    
    //    func printPossibleTips() {
    //
    ////        println("15% \(calcTipWithTipPct(0.15))")
    ////        println("18% \(calcTipWithTipPct(0.18))")
    ////        println("20% \(calcTipWithTipPct(0.20))")
    //
    //        let possibleTipsInferred = [0.15, 0.18, 0.20]
    //        let possibleTipsExplicit: [Double] = [0.15, 0.18, 0.20]
    //
    //        for possibleTip in possibleTipsInferred {
    //            println("\(possibleTip*100)%: \(calcTipWithTipPct(possibleTip))")
    //
    //        }
    //
    //    }
    
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)] {
        
        let possibleTipsinferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit: [Double] = [0.15, 0.18, 0.20]
        
        var retval = Dictionary<Int, (tipAmt:Double, total:Double)>()
        for possibleTip in possibleTipsinferred {
            let intPct = Int(possibleTip * 100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        
        return retval
    }
    
}

@objc protocol Speaker {
    func Speak()
    optional func TellJoke()
}

class Vicki: Speaker {
    @objc func Speak() {
        println("Hello I am Vicki!")
    }
    @objc func TellJoke() {
        println("Q: what did sushi A say to sushi b")
    }
    
}

class Ray: Speaker {
    @objc func Speak() {
        println("Yo I am Ray")
    }
    @objc func TellJoke() {
        println("Q: whats the objct oriented way to become wealthy")
    }
    
    func WriteTutorial() {
    
        println("I'm on it")
    }
    
    
    
}

class Animal {
    
}

class Dog: Animal, Speaker {
    @objc func Speak() {
        println("Woof!")
    }
}

var speaker:Speaker
speaker = Ray()
speaker.Speak()
(speaker as! Ray).WriteTutorial()
speaker = Vicki()
speaker.Speak()

(speaker as! Vicki).TellJoke()
speaker = Dog()
speaker = Ray()
speaker.TellJoke?()

class DateSimulator {
    
    let a:Speaker
    let b:Speaker
    
    var delegate:DateSimulatorDelegate?

    
    init(a:Speaker, b:Speaker) {
        
        self.a = a
        self.b = b
        
    }
    
    func simulate() {
        
        println("off to dinner ...")
        delegate?.dateSimulatorDidStart(self, a: a, b: b)
        a.Speak()
        b.Speak()
        delegate?.dateSimulatorDidEnd(self, a: a, b: b)
        println("Walking back home")
        a.TellJoke?()
        b.TellJoke?()
    }
}

protocol DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker)
    func dateSimulatorDidEnd(sim:DateSimulator, a:Speaker, b:Speaker)
}

class LoggingDateSimulator: DateSimulatorDelegate {
    
    func dateSimulatorDidStart(sim: DateSimulator, a: Speaker, b: Speaker) {
        println("Date started!")
    }
    func dateSimulatorDidEnd(sim: DateSimulator, a: Speaker, b: Speaker) {
        println("Date Ended!")
    }
}

let sim = DateSimulator(a: Vicki(), b: Ray())
sim.delegate = LoggingDateSimulator()
sim.simulate()

class TestDataSource: NSObject, UITableViewDataSource {
    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = Dictonary<Int, (tipAmt:Double, total:Double)>()
    var sortedKeys:[Int] = []
    
    override init() {
        possibleTips = tipCalc.returnPossibleTips()
        sortedKeys = sorted(Array(possibleTips.keys))
        super.init()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedKeys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle, reuseIdentifier: nil)
        let tipPct = sortedKeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        cell.textLabel?.text = "\(tipPct)%:"
        cell.detailTextLabel?.text = String(format:"Tip: $%0.2f, Total: $%0.2f", tipAmt, total)
        
        return cell
        
    }
    
}

