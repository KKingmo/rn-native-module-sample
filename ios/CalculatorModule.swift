//
//  CalculatorModule.swift
//  RnSample1
//
//  Created by GoodBlock on 2023/10/31.
//

import Foundation

@objc(CalculatorModule)
class CalculatorModule:NSObject {
  
  @objc(executeCalc:numberA:numberB:resolver:rejector:)
  public func executaeCalc(_ action:String, numberA:Int, numberB:Int, resolver:RCTPromiseResolveBlock, rejector:RCTPromiseRejectBlock) -> Void{
    if(action == "plus"){
      resolver(numberA + numberB);
      return;
    }
    
    if(action == "minus"){
      resolver(numberA - numberB);
      return;
    }
    
    if(action == "multiply"){
      resolver(numberA * numberB)
      return;
    }
    
    if(action == "divide"){
      resolver(numberA / numberB);
      return;
    }
    
    rejector("Unexpected action type", action, nil);
  }
}
