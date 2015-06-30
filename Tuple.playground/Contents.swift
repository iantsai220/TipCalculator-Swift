//: Playground - noun: a place where people can play

import UIKit

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
