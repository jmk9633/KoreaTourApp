//
//  searchViewController.swift
//  KoreaTourApp
//
//  Created by 정문기 on 2020/04/22.
//  Copyright © 2020 jmk. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


class searchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    

    var count00 : String? = "0"
    var count01 : String? = "0"
    var count02 : String? = "0"
    var count03 : String? = "0"
    var count04 : String? = "0"
    var call = CallRequest()
    var contentsTyped = ["A0101" : "Natural Sites", "A0102" : "Natural Resources", "A0201" : "Historical Sites", "A0202" : "Recreational Sites", "A0203" : "Experience Programs", "A0204" : "Industrial Sites", "A0205" : "Architectural Sights", "A0206" : "Cultural Facilities", "A0207" : "Festivals", "A0208" : "Events/Performances", "A0301" : "Introduction", "A0302" : "Leisure/Sports (Land)", "A0303" : "Leisure/Sports (Water)", "A0304" : "Leisure/Sports (Sky)", "A0305" : "Leisure/Sports (Others)", "A0401" : "Shopping", "A0502" : "Restaurants"]
    
    var recommandList = ["Seoul", "River", "Festival", "Itaewon", "Hongdae", "Gyeongnidan", "Jamsil", "Bukchon", "Myeongdong"]
    
    @IBOutlet var searchTextField: UISearchBar!

    @IBOutlet var searchTableView: UITableView!
    @IBOutlet var segment: UISegmentedControl!
   
    
    var selectClcked = 1
  

    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchTableView.delegate = self
        searchTableView.dataSource = self

        searchTextField.delegate = self

        call.callAPI(areacode: 1, typeId: 76, numberOfRow: 3, tv: searchTableView)
        call.callAPI(areacode: 1, typeId: 85, numberOfRow: 3, tv: searchTableView)
        call.callAPI(areacode: 1, typeId: 78, numberOfRow: 3, tv: searchTableView)
        call.callAPI(areacode: 1, typeId: 79, numberOfRow: 3, tv: searchTableView)
        call.callAPI(areacode: 1, typeId: 82, numberOfRow: 3, tv: searchTableView)

        
        navigationItem.title = "Search"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "back" , style: .plain, target: self, action: #selector(closeButtonClicked))
    }
    
    

         
//    @objc func closeButtonClicked () {
//
//        dismiss(animated: true, completion: nil)
//    }
    
    
    
    
    @objc func recommnadList00(sender : UIButton!) {

            let sb = UIStoryboard(name: "Main", bundle: nil)
             
             let vc = sb.instantiateViewController(withIdentifier: "AttractionViewController") as! AttractionViewController
            vc.typeId = 76
            vc.areacode = 1
             
             navigationController?.pushViewController(vc, animated: true)

    }
    
    @objc func recommnadList01(sender : UIButton!) {

            let sb = UIStoryboard(name: "Main", bundle: nil)
             
             let vc = sb.instantiateViewController(withIdentifier: "AttractionViewController") as! AttractionViewController
            vc.typeId = 85
            vc.areacode = 1
             
             navigationController?.pushViewController(vc, animated: true)

    }
    
    @objc func recommnadList02(sender : UIButton!) {

            let sb = UIStoryboard(name: "Main", bundle: nil)
             
             let vc = sb.instantiateViewController(withIdentifier: "AttractionViewController") as! AttractionViewController
            vc.typeId = 78
            vc.areacode = 1
             
             navigationController?.pushViewController(vc, animated: true)

    }
    
    @objc func recommnadList03(sender : UIButton!) {

            let sb = UIStoryboard(name: "Main", bundle: nil)
             
             let vc = sb.instantiateViewController(withIdentifier: "AttractionViewController") as! AttractionViewController
            vc.typeId = 79
            vc.areacode = 1
             
             navigationController?.pushViewController(vc, animated: true)

    }
    
    @objc func recommnadList04(sender : UIButton!) {

            let sb = UIStoryboard(name: "Main", bundle: nil)
             
             let vc = sb.instantiateViewController(withIdentifier: "AttractionViewController") as! AttractionViewController
            vc.typeId = 82
            vc.areacode = 1
             
             navigationController?.pushViewController(vc, animated: true)

    }
    
    
    
    @IBAction func recommandSegment(_ sender: Any) {
        
        if segment.selectedSegmentIndex == 0 {
            selectClcked = 1
            searchTableView.reloadData()
        }else {
            selectClcked = 2
        }
        searchTableView.reloadData()
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

            let sb = UIStoryboard(name: "Main", bundle: nil)
                      

                      
            let vc = sb.instantiateViewController(withIdentifier: "searchDetailViewController") as! searchDetailViewController
            
            vc.searchText = self.searchTextField.text ?? ""
            searchTextField.text = ""

               navigationController?.pushViewController(vc, animated: true)
      
        
    }
    

    @IBAction func moreButtonClicked(_ sender: UIButton) {
        
//        if sender.cuu{
//            print("344")
//
//        }else {
//            print("ddf")
//        }
    }
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segment.selectedSegmentIndex == 0 {
            if indexPath.section == 0 {
                let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "InfoDataViewController") as! InfoDataViewController
            vc.id = call.list[indexPath.row].contentsId
            navigationController?.pushViewController(vc, animated: true)
                
            }else if indexPath.section == 1{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "InfoDataViewController") as! InfoDataViewController
            vc.id = call.listFestival[indexPath.row].contentsId
            navigationController?.pushViewController(vc, animated: true)
            
            }else if indexPath.section == 2 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "InfoDataViewController") as! InfoDataViewController
            vc.id = call.listCulture[indexPath.row].contentsId
            navigationController?.pushViewController(vc, animated: true)
                
            }else if indexPath.section == 3 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "InfoDataViewController") as! InfoDataViewController
            vc.id = call.listshopping[indexPath.row].contentsId
            navigationController?.pushViewController(vc, animated: true)
                
            }else if indexPath.section == 4 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "InfoDataViewController") as! InfoDataViewController
            vc.id = call.listFood[indexPath.row].contentsId
            navigationController?.pushViewController(vc, animated: true)
            }
        }else {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            if #available(iOS 13.0, *) {
                let vc = sb.instantiateViewController(identifier: "searchDetailViewController") as!searchDetailViewController
                vc.searchText = recommandList[indexPath.row]
                navigationController?.pushViewController(vc, animated: true)
            } else {
                // Fallback on earlier versions
            }


        }
    }

    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
        if segment.selectedSegmentIndex == 0 {
            
            let headerView = Bundle.main.loadNibNamed("HeaderSectionTableViewCell", owner: self, options: nil)?.first as! HeaderSectionTableViewCell
            
            headerView.headerButton.addTarget(self, action: #selector(moreButtonClicked), for: .touchUpInside)
            
            if section == 0 {
                headerView.headerTitleLabel.text = "Attraction"
                headerView.headerButton.setTitle("More \(call.count00!)", for: .normal)
                
                headerView.headerButton.addTarget(self, action: #selector(recommnadList00), for: .touchUpInside)
                
            }else if section == 1 {
                headerView.headerTitleLabel.text = "Festival"
                headerView.headerButton.setTitle("More \(call.count01!)", for: .normal)
                headerView.headerButton.addTarget(self, action: #selector(recommnadList01), for: .touchUpInside)
                
            }else if section == 2 {
                headerView.headerTitleLabel.text = "Culture"
                headerView.headerButton.setTitle("More \(call.count02!)", for: .normal)
                headerView.headerButton.addTarget(self, action: #selector(recommnadList02), for: .touchUpInside)
                
            }else if section == 3 {
                headerView.headerTitleLabel.text = "Shopping"
                headerView.headerButton.setTitle("More \(call.count03!)", for: .normal)
                headerView.headerButton.addTarget(self, action: #selector(recommnadList03), for: .touchUpInside)
                
            }else if section == 4 {
                headerView.headerTitleLabel.text = "Food"
                headerView.headerButton.setTitle("More \(call.count04!)", for: .normal)
                headerView.headerButton.addTarget(self, action: #selector(recommnadList04), for: .touchUpInside)
            }
            
            
            
            
            return headerView
            
            
        }else {
            return nil
        }
 
    }

 
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if segment.selectedSegmentIndex == 0 {
            return 45
        }else {
            return 0
        }
    }


    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if segment.selectedSegmentIndex == 0 {
            return 5
        }else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if segment.selectedSegmentIndex == 0 {
            
            if section == 0 {
                return call.list.count
            }else if section == 1 {
                return call.listFestival.count
            }else if section == 2 {
                return call.listCulture.count
            }else {
                return call.listFood.count
            }
        }else {
            return recommandList.count

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if segment.selectedSegmentIndex == 0 {
            if indexPath.section == 0 {
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "searchRecommandPlaceTableViewCell", for: indexPath) as! searchRecommandPlaceTableViewCell
    
                cell.searchPlaceImageView.contentMode = .scaleAspectFill
                cell.searchTitleLabel.text = call.list[indexPath.row].titleData
                cell.searchPlaceImageView.layer.cornerRadius = 8
                cell.searchAdress.text = call.list[indexPath.row].addressData
                cell.searchTypedLabel.text = contentsTyped[call.list[indexPath.row].contentsTyped!]

                let url = URL(string: call.list[indexPath.row].imageData!)

                if let url = url {
                    cell.searchPlaceImageView.kf.setImage(with: url)
                }else {
                    cell.searchPlaceImageView.image = UIImage(named: "NoImage")
                }
                
                return cell
                
            }else if indexPath.section == 1 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "searchRecommandPlaceTableViewCell", for: indexPath) as! searchRecommandPlaceTableViewCell
                cell.searchPlaceImageView.contentMode = .scaleAspectFill
                cell.searchTitleLabel.text = call.listFestival[indexPath.row].titleData
                cell.searchPlaceImageView.layer.cornerRadius = 8
                cell.searchAdress.text = call.listFestival[indexPath.row].addressData
                cell.searchTypedLabel.text = contentsTyped[call.listFestival[indexPath.row].contentsTyped!]

                let url = URL(string: call.listFestival[indexPath.row].imageData!)
                    if let url = url {
                        cell.searchPlaceImageView.kf.setImage(with: url)
                    }else {
                        cell.searchPlaceImageView.image = UIImage(named: "NoImage")
                    }
                
                return cell
                  
            }else if indexPath.section == 2 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "searchRecommandPlaceTableViewCell", for: indexPath) as! searchRecommandPlaceTableViewCell
                
                if  call.listCulture[indexPath.row].titleData != nil {
                    
               
                    cell.searchPlaceImageView.contentMode = .scaleAspectFill
                    cell.searchTitleLabel.text = call.listCulture[indexPath.row].titleData
                    cell.searchAdress.text = call.listCulture[indexPath.row].addressData
                    cell.searchTypedLabel.text = contentsTyped[call.listCulture[indexPath.row].contentsTyped!]
                    cell.searchPlaceImageView.layer.cornerRadius = 8
                }else {
                   
                }
                
                let url = URL(string: call.listCulture[indexPath.row].imageData!)
                    if let url = url {
                        cell.searchPlaceImageView.kf.setImage(with: url)
                    }else {
                        cell.searchPlaceImageView.image = UIImage(named: "NoImage")
                    }
                return cell
                
            }else if indexPath.section == 3 {

            let cell = tableView.dequeueReusableCell(withIdentifier: "searchRecommandPlaceTableViewCell", for: indexPath) as! searchRecommandPlaceTableViewCell
                cell.searchPlaceImageView.contentMode = .scaleAspectFill
                cell.searchTitleLabel.text = call.listshopping[indexPath.row].titleData
                cell.searchAdress.text = call.listshopping[indexPath.row].addressData
                cell.searchTypedLabel.text = contentsTyped[call.listshopping[indexPath.row].contentsTyped!]
                
                let url = URL(string: call.listshopping[indexPath.row].imageData!)
                if let url = url {
                    cell.searchPlaceImageView.kf.setImage(with: url)
                }else {
                    cell.searchPlaceImageView.image = UIImage(named: "NoImage")
                }
            return cell
                
            }else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "searchRecommandPlaceTableViewCell", for: indexPath) as! searchRecommandPlaceTableViewCell
                cell.searchPlaceImageView.contentMode = .scaleAspectFill
                cell.searchTitleLabel.text = call.listFood[indexPath.row].titleData
                cell.searchAdress.text = call.listFood[indexPath.row].addressData
                cell.searchTypedLabel.text = contentsTyped[call.listFood[indexPath.row].contentsTyped!]
    
                let url = URL(string: call.listFood[indexPath.row].imageData!)
                    if let url = url {
                        cell.searchPlaceImageView.kf.setImage(with: url)
                    }else {
                        cell.searchPlaceImageView.image = UIImage(named: "NoImage")
                    }
                return cell
            }
            
            
        }else {
          let cell = tableView.dequeueReusableCell(withIdentifier: "searchRecommandKeywordTableViewCell", for: indexPath) as! searchRecommandKeywordTableViewCell
            cell.searchKeywordLabel.text = recommandList[indexPath.row]
            
        return cell
        
        }
        
        






    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
      if segment.selectedSegmentIndex == 0 {
            return 110
      }else {
            return 40
       
        }
    }
}
