//
//  CountriesViewController.swift
//  Projeto Covid19
//
//  Created by Bruna Fernanda Drago on 20/07/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var countriesTableView: UITableView!
    
    //Properties
    var countries = [Countries]()

    override func viewDidLoad() {
        super.viewDidLoad()

        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        
        NetworkService.instance.getCovidData { (countries) in
            self.countries = countries
            DispatchQueue.main.async {
                self.countriesTableView.reloadData()
            }
            
        }
      
       
    }
 
}

extension CountriesViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countries.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countriesTableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! countryTableViewCell
        cell.countryNameLbl.text = countries[indexPath.row].country
        
        
        let caseNumber = countries[indexPath.row].confirmed
        cell.casesConfirmedLbl.text = caseNumber?.numberFormat
        
        let deathNumber = countries[indexPath.row].deaths
        cell.deathConfirmedLbl.text = deathNumber?.numberFormat
        
        return cell
    }
    
    
}
extension CountriesViewController:UITableViewDelegate{
    
}
