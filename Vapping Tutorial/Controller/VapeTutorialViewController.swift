//
//  ViewController.swift
//  Vapping Tutorial
//
//  Created by Mayar Adel on 1/27/22.
//

import UIKit

class VapeTutorialViewController: UIViewController
{
    @IBOutlet weak var continueButtonOutllet: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueProposition: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    private var vapeHandler:VapeHandler!
    private var vapeFeature :VapeFeature!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configureUI()
        vapeHandler = VapeHandler()
        if let vape = vapeHandler.getFirstFeature()
        {
            self.vapeFeature = vape
        }
        guard vapeFeature != nil else
        {
            return
        }
        self.updateUI()
        
    }
    func updateUI()
    {
        titleLabel.text = vapeFeature.title
        descriptionLabel.text = vapeFeature.description
        valueProposition.text = vapeHandler.getValuePropositionText()
        imageView.image = UIImage(named: vapeFeature.image!)
    }
    func configureUI()
    {
        self.navigationItem.hidesBackButton = true
        self.continueButtonOutllet.layer.cornerRadius = 20
    }
    @IBAction func continueButtonPressed(_ sender: UIButton)
    {
        guard let vape =  vapeHandler.getVapeNextFeature()
        else
        {
            continueButtonOutllet.isEnabled = false
            return
        }
        let vapeTutorialViewController = storyboard?.instantiateViewController(identifier: String(describing: VapeTutorialViewController.self)) as! VapeTutorialViewController
        vapeTutorialViewController.vapeFeature = vape
        self.navigationController?.pushViewController(vapeTutorialViewController, animated: false)
        
    }

}

