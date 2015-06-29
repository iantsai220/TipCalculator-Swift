//
//  TipCalculatorModel.swift
//  
//
//  Created by Ian Tsai on 2015-06-29.
//
//

import Foundation


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
    
    func calcTipWithTipPct(tipPct: Double) -> Double {
        
        return subTotal * tipPct
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
    
    func returnPossibleTips() -> [Int: Double] {
        
        let possibleTipsinferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit: [Double] = [0.15, 0.18, 0.20]
        
        var retval = [Int: Double]()
        for possibleTip in possibleTipsinferred {
            let intPct = Int(possibleTip * 100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        
        return retval
    }
    
    
}