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
        
        getCovidData()
    }
    func getCovidData(){
        
        let urlAPICountries = URL(string: "https://covid19-brazil-api.now.sh/api/report/v1/countries")
        guard let url = urlAPICountries else { return}
        print(url)
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil{
                DispatchQueue.main.async {
                    Alert.showNetworkingAlert(on: self)
                }
                print(error?.localizedDescription ?? "Erro encontrado")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                DispatchQueue.main.async {
                    Alert.showNetworkingAlert(on: self)
                }
                print(error?.localizedDescription ?? "Erro na resposta da API")
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    Alert.showNetworkingAlert(on: self)
                }
                print(error?.localizedDescription ?? "Erro ao carregar data")
                return
            }
            do {
                if let jsonCountries = try? JSONDecoder().decode(CountryInfo.self, from: data){
                    self.countries = jsonCountries.data!
                }
               
            }catch{
                DispatchQueue.main.async {
                    Alert.showNetworkingAlert(on: self)
                }
                print(error.localizedDescription,"Erro no PARSE json")
            }
            DispatchQueue.main.async {
                self.countriesTableView.reloadData()
            }
        }.resume()
       
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
