//
//  searchDetailViewController.swift
//  KoreaTourApp
//
//  Created by 정문기 on 2020/04/27.
//  Copyright © 2020 jmk. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON

class searchDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet var searchTextField: UISearchBar!
    var searchText : String?
    var list : [MainInfo] = []
    @IBOutlet var searchDetailTableView: UITableView!
    var page = 1
    let sCall = SearchCall()
    var contentsTyped = ["A0101" : "Natural Sites", "A0102" : "Natural Resources", "A0201" : "Historical Sites", "A0202" : "Recreational Sites", "A0203" : "Experience Programs", "A0204" : "Industrial Sites", "A0205" : "Architectural Sights", "A0206" : "Cultural Facilities", "A0207" : "Festivals", "A0208" : "Events/Performances", "A0301" : "Introduction", "A0302" : "Leisure/Sports (Land)", "A0303" : "Leisure/Sports (Water)", "A0304" : "Leisure/Sports (Sky)", "A0305" : "Leisure/Sports (Others)", "A0401" : "Shopping", "A0502" : "Restaurants"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchTextField.delegate = self
        searchDetailTableView.dataSource = self
        searchDetailTableView.delegate = self
        sCall.searchRequest(page: page, searchText: searchText, tv: searchDetailTableView)
        
         
    }

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        let sb = UIStoryboard(name: "Main", bundle: nil)
                      

                      
        let vc = sb.instantiateViewController(withIdentifier: "searchDetailViewController") as! searchDetailViewController
            
        vc.searchText = self.searchTextField.text ?? ""


        navigationController?.pushViewController(vc, animated: true)
      
        
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sCall.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchDetailTableViewCell", for: indexPath) as!  searchDetailTableViewCell
        
        cell.searchDetailTitleLabel.text = sCall.list[indexPath.row].titleData
        cell.searchDetailTyped.text = contentsTyped[sCall.list[indexPath.row].contentsTyped!]
        cell.searchDetailAddress.text = sCall.list[indexPath.row].addressData
        cell.searchDetailImageView.layer.cornerRadius = 10
        cell.searchDetailImageView.contentMode = .scaleAspectFill
            let url = URL(string: sCall.list[indexPath.row].imageData!)
            if let url = url {
                cell.searchDetailImageView.kf.setImage(with: url)
            }else {
                cell.searchDetailImageView.image = UIImage(named: "NoImage")
            }


        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let heigth = UIScreen.main.bounds.width
        return heigth * 0.35
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
        if sCall.list.count - 2 == indexPath.row {
                let totalNumber = sCall.list[indexPath.row].totalCount
                let maxpage = totalNumber! / 10
                print("\(maxpage), \(totalNumber!)")
                if maxpage == 0 {
                    if maxpage <= page {
                        print(page)
                        print("sdfdf")
                    }
                }else {
                    if page < maxpage {
                        page = page + 1
                        sCall.searchRequest(page: page, searchText: searchText, tv: searchDetailTableView)
                        print("sd")
                        print(page)
                    }
                }

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let sb = UIStoryboard(name: "Main", bundle: nil)
               
        
               
        let vc = sb.instantiateViewController(withIdentifier: "InfoDataViewController") as! InfoDataViewController
               
        vc.id = sCall.list[indexPath.row].contentsId
               
        navigationController?.pushViewController(vc, animated: true)
    
    
   }
    
    
}

