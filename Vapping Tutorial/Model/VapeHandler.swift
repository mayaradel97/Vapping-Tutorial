//
//  VapeHandler.swift
//  Vapping Tutorial
//
//  Created by Mayar Adel on 1/27/22.
//

import Foundation
struct VapeHandler
{
    var  vapeFeatures = [
        VapeFeature(title: "Welcome",  image: "v1"),
        VapeFeature(title: "Charging Your Device", image: "v2"),
        VapeFeature(title: "First Puff",  image: "v3"),
        VapeFeature(title: "Usage Statistics",  image: "v4"),
        VapeFeature(title: "Device Locator", image: "v5"),
        VapeFeature(title: "Lock & Unlock",  image: "v6")
    ]
    static var index = 0
    var vape:VapeFeature!
    mutating func getFirstFeature() -> VapeFeature?
    {
        if VapeHandler.index == 0
        {
            vape = vapeFeatures[VapeHandler.index]
            return vape
        }
       return nil
    }
    func getVapeNextFeature() ->VapeFeature?
    {
        VapeHandler.index += 1
        guard  VapeHandler.index < 6 else
        {
            print("exeed")
            return nil
        }
        return vapeFeatures[VapeHandler.index]
    }
    func getValuePropositionText() -> String
    {
        let index = VapeHandler.index
        return "\(vapeFeatures[index].valueProposition)  #\(index+1)"
    }
    
}
