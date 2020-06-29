//
//  MainViewController.swift
//  KoreaTourApp
//
//  Created by 정문기 on 2020/04/14.
//  Copyright © 2020 jmk. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    

    @IBOutlet var MainTableView: UITableView!
    var page = 2
    var cotentsTyped = 76
    var areacode = 1
    var searchText : String?
    var listMainPicture : [PhotoData] = []
    var count00 : String? = "0"
    var count01 : String? = "0"
    var count02 : String? = "0"
    var count03 : String? = "0"
    var count04 : String? = "0"
    var withurl = "http://tong.visitkorea.or.kr/cms/resource/30/2477030_image2_1.jpg"
    var x : Double = 37.573194
    var y : Double = 126.978060
    var maintitle : String = "SEOUL"
    var subtitle : String = "I SEOUL U"
    let callWeather = WeatherCall ()
    let call = CallRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainTableView.delegate = self
        MainTableView.dataSource = self

        call.callAPI(areacode: areacode, typeId: 76, numberOfRow: 10, tv: MainTableView)
        call.callAPI(areacode: areacode, typeId: 85, numberOfRow: 10, tv: MainTableView)
        call.callAPI(areacode: areacode, typeId: 78, numberOfRow: 10, tv: MainTableView)
        call.callAPI(areacode: areacode, typeId: 79, numberOfRow: 10, tv: MainTableView)
        call.callAPI(areacode: areacode, typeId: 82, numberOfRow: 10, tv: MainTableView)
        callWeather.weatherCallRequest (x : x, y : y, tv : MainTableView)
    }

    
    
// MARK: Clicked method
    @objc func searchButtonClicked(sender : UIButton!) {
        
            let sb = UIStoryboard(name: "Main", bundle: nil)
             
             let vc = sb.instantiateViewController(withIdentifier: "searchViewController") as! searchViewController
             
           
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        //3. 화면전환
        
        present(nav, animated: true, completion: nil)
    }
    
    
    @objc func anotherRegion(sender : UIButton!) {
        
    
        let sb = UIStoryboard(name: "Main", bundle: nil)
             

         let vc = sb.instantiateViewController(withIdentifier: "AnotherRegionViewController") as! AnotherRegionViewController
         
         //2.5 (옵션) 문제점 1.뒤로가기(닫기) 버튼을 만들어주어야한다. 2.네비게이션 컨트롤러 (제목바) 영역 생성
         
            vc.modalPresentationStyle = .fullScreen
         
         //2.6 (옵션) 제목바를 포함해서 아래에서 위로 등장시키고 싶은 경우
         
         let nav = UINavigationController(rootViewController: vc)
         nav.modalPresentationStyle = .fullScreen
         //3. 화면전환
         
         present(nav, animated: true, completion: nil)
        
        
        
        
        
    }
    
    
    
    
    @objc func Button00Clicked(sender : UIButton!) {
        
        if sender.tag == 0 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
             
             let vc = sb.instantiateViewController(withIdentifier: "AttractionViewController") as! AttractionViewController
            
            vc.typeId = call.list[sender.tag].contenttypeId
            vc.areacode = areacode
            
             navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    @objc func Button01Clicked(sender : UIButton!) {
      
        if sender.tag == 1 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
             
             let vc = sb.instantiateViewController(withIdentifier: "AttractionViewController") as! AttractionViewController
            
            vc.typeId = call.listFestival[sender.tag].contenttypeId
            vc.areacode = areacode
            
             navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    
    @objc func Button02Clicked(sender : UIButton!) {
        
        if sender.tag == 2 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
             
             let vc = sb.instantiateViewController(withIdentifier: "AttractionViewController") as! AttractionViewController
            
            vc.typeId = call.listCulture[sender.tag].contenttypeId
            vc.areacode = areacode
            
             navigationController?.pushViewController(vc, animated: true)
    }
    }
    
    
    @objc func Button03Clicked(sender : UIButton!) {
    
        if sender.tag == 3 {
                    
               let sb = UIStoryboard(name: "Main", bundle: nil)
                
                let vc = sb.instantiateViewController(withIdentifier: "AttractionViewController") as! AttractionViewController
               
               vc.typeId = call.listshopping[sender.tag].contenttypeId
                vc.areacode = areacode
            
                navigationController?.pushViewController(vc, animated: true)
    }
    }
    
    @objc func Button04Clicked(sender : UIButton!) {
        
        if sender.tag == 4 {
              let sb = UIStoryboard(name: "Main", bundle: nil)
               
               let vc = sb.instantiateViewController(withIdentifier: "AttractionViewController") as! AttractionViewController
              
              vc.typeId = call.listFood[sender.tag].contenttypeId
               vc.areacode = areacode
            
               navigationController?.pushViewController(vc, animated: true)
        }
        }
                
    

    // MARK: TableView method
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 360
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("MainHeaderTableViewCell", owner: self, options: nil)?.first as! MainHeaderTableViewCell
        
        
        headerView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
        let url = URL(string: "\(withurl)")

        if url != nil {
            headerView.mainImageView.kf.setImage(with: url)
            } else {
            headerView.mainImageView = UIImageView(image: UIImage(named: "Stop"))
        }
        headerView.mainTitle.text = maintitle
        
        headerView.mainSubTitle.text = subtitle

        headerView.mainbutton.addTarget(self, action: #selector(anotherRegion), for: .touchUpInside)
    

        
        headerView.mainTemperatureLabel.text = "\(Int(callWeather.weatherTemterature!))°C / \(Int(callWeather.weatherTemterature! * 1.8 + 32))℉"
        headerView.subTemperatureLabel.text = "Current temperature"
        
        return headerView
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 5
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        
        cell.mainMoreButton.tag = indexPath.row
        
        if indexPath.row == 0 {
            cell.MainTitleLabel.text = "Attraction"
            cell.mainMoreButton.setTitle("more \(call.count00!)", for: .normal)
            cell.mainMoreButton.addTarget(self, action: #selector(Button00Clicked), for: .touchUpInside)

            
        }else if indexPath.row == 1 {
            cell.MainTitleLabel.text = "Festival"
            cell.mainMoreButton.setTitle("more \(call.count01!)", for: .normal)
            cell.mainMoreButton.addTarget(self, action: #selector(Button01Clicked), for: .touchUpInside)
            
        }else if indexPath.row == 2 {
            cell.MainTitleLabel.text = "Culture"
            cell.mainMoreButton.setTitle("more \(call.count02!)", for: .normal)
            cell.mainMoreButton.addTarget(self, action: #selector(Button02Clicked), for: .touchUpInside)
     
        }else if indexPath.row == 3 {
            cell.MainTitleLabel.text = "Shoppping"
            cell.mainMoreButton.setTitle("more \(call.count03!)", for: .normal)
            cell.mainMoreButton.addTarget(self, action: #selector(Button03Clicked), for: .touchUpInside)
 
        }else if indexPath.row == 4 {
            cell.MainTitleLabel.text = "Food"
            cell.mainMoreButton.setTitle("more \(call.count04!)", for: .normal)
            cell.mainMoreButton.addTarget(self, action: #selector(Button04Clicked), for: .touchUpInside)
  
        }

            cell.MainCollectionView.delegate = self
            cell.MainCollectionView.dataSource = self
            cell.MainCollectionView.tag = indexPath.row
                  
            cell.MainCollectionView.reloadData()
     
       
          
 
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
        
        
    }
    
    
    // MARK: CollectionView method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
                       
            let vc = sb.instantiateViewController(withIdentifier: "InfoDataViewController") as! InfoDataViewController
            
            vc.id = call.list[indexPath.row].contentsId
                          
                   navigationController?.pushViewController(vc, animated: true)
        } else if collectionView.tag == 1 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
                       
            let vc = sb.instantiateViewController(withIdentifier: "InfoDataViewController") as! InfoDataViewController
            
            vc.id = call.listFestival[indexPath.row].contentsId
                          
                   navigationController?.pushViewController(vc, animated: true)
        } else if collectionView.tag == 2 {
                   let sb = UIStoryboard(name: "Main", bundle: nil)
                       
                   let vc = sb.instantiateViewController(withIdentifier: "InfoDataViewController") as! InfoDataViewController
            
            vc.id = call.listCulture[indexPath.row].contentsId
                          
                   navigationController?.pushViewController(vc, animated: true)
        } else if collectionView.tag == 3 {
                   let sb = UIStoryboard(name: "Main", bundle: nil)
                       
                   let vc = sb.instantiateViewController(withIdentifier: "InfoDataViewController") as! InfoDataViewController
            
            vc.id = call.listshopping[indexPath.row].contentsId
                          
                   navigationController?.pushViewController(vc, animated: true)
        } else if collectionView.tag == 4 {
                             let sb = UIStoryboard(name: "Main", bundle: nil)
                       
                   let vc = sb.instantiateViewController(withIdentifier: "InfoDataViewController") as! InfoDataViewController
            
            vc.id = call.listFood[indexPath.row].contentsId
                          
                   navigationController?.pushViewController(vc, animated: true)
        }
        

     }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return call.list.count
        } else if collectionView.tag == 1 {
            return call.listFestival.count
        } else if collectionView.tag == 2 {
            return call.listCulture.count
        } else if collectionView.tag == 3 {
            return call.listshopping.count
        } else if collectionView.tag == 4 {
            return call.listFood.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellitem = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionCellCollectionViewCell", for: indexPath) as! MainCollectionCellCollectionViewCell
        
        cellitem.MainImageView.layer.cornerRadius = 8
        
        
        
        if collectionView.tag == 0 {
        
        cellitem.MainTyped.text = "Attraction"
        cellitem.MainTitle.text = call.list[indexPath.row].titleData

        let url = URL(string: call.list[indexPath.row].imageData!)
        if let url = url {
            cellitem.MainImageView.kf.setImage(with: url)
        }else {
            cellitem.MainImageView.image = UIImage(named: "NoImage")
        }
            
            
        return cellitem
            
        }else if collectionView.tag == 1 {

            cellitem.MainTyped.text = "Festival"
            cellitem.MainTitle.text = call.listFestival[indexPath.row].titleData
            let url = URL(string: call.listFestival[indexPath.row].imageData!)
            
            if let url = url {
                cellitem.MainImageView.kf.setImage(with: url)
            }else {
                cellitem.MainImageView.image = UIImage(named: "NoImage")
            }

            return cellitem
            
        }else if collectionView.tag == 2 {
            
            cellitem.MainTyped.text = "Culture"
            cellitem.MainTitle.text = call.listCulture[indexPath.row].titleData
            
            let url = URL(string: call.listCulture[indexPath.row].imageData!)
            
            if let url = url {
                cellitem.MainImageView.kf.setImage(with: url)
            }else {
                cellitem.MainImageView.image = UIImage(named: "NoImage")
            }
            return cellitem
            
        }else if collectionView.tag == 3 {
            cellitem.MainTyped.text = "Shopping"
            cellitem.MainTitle.text = call.listshopping[indexPath.row].titleData
            
            let url = URL(string: call.listshopping[indexPath.row].imageData!)
            
            if let url = url {
                cellitem.MainImageView.kf.setImage(with: url)
            }else {
                cellitem.MainImageView.image = UIImage(named: "NoImage")
            }
            return cellitem
            
        }else if collectionView.tag == 4 {
            cellitem.MainTyped.text = "Food"
            cellitem.MainTitle.text = call.listFood[indexPath.row].titleData
            
            let url = URL(string: call.listFood[indexPath.row].imageData!)
            
            if let url = url {
                cellitem.MainImageView.kf.setImage(with: url)
            }else {
                cellitem.MainImageView.image = UIImage(named: "NoImage")
            }
            
            return cellitem
            
        }else {
            return cellitem
        }

      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 220)
        
       
        
    }
    

}
