//
//  ViewController.swift
//  Projeto Covid19
//
//  Created by Bruna Fernanda Drago on 20/07/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getBrasilData(_ sender: Any) {
        
        let brasilVC = self.storyboard?.instantiateViewController(withIdentifier: "BrasilVC")as! BrasilViewController
        self.navigationController?.pushViewController(brasilVC, animated: true)
    }
    
    
    @IBAction func getData(_ sender: UIButton) {
   
        let countryVC = self.storyboard?.instantiateViewController(identifier: "CountryVC") as! CountriesViewController
       
        self.navigationController?.pushViewController(countryVC, animated: true)
    }
    

    
}


