//
//  AnotherRegionViewController.swift
//  KoreaTourApp
//
//  Created by 정문기 on 2020/05/24.
//  Copyright © 2020 jmk. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import Alamofire

class AnotherRegionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet var AnotherRegionTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnotherRegionTableView.delegate = self
        AnotherRegionTableView.dataSource = self
        AnotherRegionTableView.register(UINib(nibName: "AnotherRegionTableViewCell", bundle: nil), forCellReuseIdentifier: "AnotherRegionTableViewCell")

        
        navigationItem.title = "Other Parts Of Korea"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(closeButtonClicked))
        
    }
    
    @objc func closeButtonClicked () {
         
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnotherRegionTableViewCell", for: indexPath) as! AnotherRegionTableViewCell
        
        cell.shadowView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.shadowView.layer.shadowOpacity = 1
        cell.shadowView.layer.shadowRadius = 10
        cell.shadowView.layer.shadowOffset = .zero
        cell.shadowView.layer.cornerRadius = 10
        cell.anotherRegionImageView.layer.cornerRadius = 10
        cell.anotherRegionImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        if indexPath.row == 0 {
            let url02 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/30/2477030_image2_1.jpg")
            cell.anotherRegionImageView.kf.setImage(with: url02)
            cell.anotherRegionTitle.text = "SEOUL"

        }else if indexPath.row == 1 {
            
            let url02 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/91/2023691_image2_1.jpg")
            cell.anotherRegionImageView.kf.setImage(with: url02)
            cell.anotherRegionTitle.text = "JEJU-DO"
            
        }else if indexPath.row == 2 {
            
            let url02 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/90/2489290_image2_1.jpg")
            cell.anotherRegionImageView.kf.setImage(with: url02)
            cell.anotherRegionTitle.text = "INCHEON"

            
        }else if indexPath.row == 3 {
            
            let url03 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/25/2597225_image2_1.jpg")
            cell.anotherRegionImageView.kf.setImage(with: url03)
            cell.anotherRegionTitle.text = "JEOLLABUK-DO"
            
        }else if indexPath.row == 4 {
            
            let url04 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/21/2616821_image2_1.jpg")
            cell.anotherRegionImageView.kf.setImage(with: url04)
            cell.anotherRegionTitle.text = "GYEONGSANGBUK-DO"
            
        }else if indexPath.row == 5 {

            let url05 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/43/780843_image2_1.jpg")
            cell.anotherRegionImageView.kf.setImage(with: url05)
            cell.anotherRegionTitle.text = "GANGWON-DO"

        }else if indexPath.row == 6 {
            
            let url05 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/40/2367340_image2_1.jpg")
            cell.anotherRegionImageView.kf.setImage(with: url05)
            cell.anotherRegionTitle.text = "JEOLLANAM-DO"
            
        }else if indexPath.row == 7 {
            
            let url05 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/30/2552030_image2_1.JPG")
            cell.anotherRegionImageView.kf.setImage(with: url05)
            cell.anotherRegionTitle.text = "GYEONGSANGNAM-DO"
            
        }else if indexPath.row == 8 {
            
            let url10 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/52/1941352_image2_1.jpg")
            cell.anotherRegionImageView.kf.setImage(with: url10)
            cell.anotherRegionTitle.text = "DAEGU"
            
        }else if indexPath.row == 9 {
            
            let url10 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/39/1953739_image2_1.jpg")
            cell.anotherRegionImageView.kf.setImage(with: url10)
            cell.anotherRegionTitle.text = "GWANGJU"
            
        }else if indexPath.row == 10 {
            
            let url10 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/23/2565723_image2_1.JPG")
            cell.anotherRegionImageView.kf.setImage(with: url10)
            cell.anotherRegionTitle.text = "BUSAN"
            
        }else if indexPath.row == 11 {
            
            let url10 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/51/2552851_image2_1.bmp")
            cell.anotherRegionImageView.kf.setImage(with: url10)
            cell.anotherRegionTitle.text = "GYEONGGI-DO"
            
        }else if indexPath.row == 12 {
            
            let url10 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/00/2601500_image2_1.jpg")
            cell.anotherRegionImageView.kf.setImage(with: url10)
            cell.anotherRegionTitle.text = "CHUNGCHEONGNAM-DO"
            
        }else if indexPath.row == 13 {
            
            let url10 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/71/1589271_image2_1.jpg")
            cell.anotherRegionImageView.kf.setImage(with: url10)
            cell.anotherRegionTitle.text = "DAEJEON"
            
        }
        
        
        
        
//        else if indexPath.row == 14 {
//
//
//            let url05 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/25/2593125_image2_1.jpg")
//            cell.anotherRegionImageView.kf.setImage(with: url05)
//            cell.anotherRegionTitle.text = "ULSAN"
//
//
//        }else if indexPath.row == 15 {
//
//            let url10 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/71/1201571_image2_1.jpg")
//            cell.anotherRegionImageView.kf.setImage(with: url10)
//            cell.anotherRegionTitle.text = "CHUNGCHEONGBUK-DO"
//
//        }else if indexPath.row == 16 {
//
//            let url10 = URL(string: "http://tong.visitkorea.or.kr/cms/resource/47/876047_image2_1.jpg")
//            cell.anotherRegionImageView.kf.setImage(with: url10)
//            cell.anotherRegionTitle.text = "SEJONG"
//
//        }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)

            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
           

            vc.areacode = 1
            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/30/2477030_image2_1.jpg"
            vc.x = 37.573194
            vc.y = 126.978060
            vc.maintitle = "SEOUL"
            vc.subtitle = "I Seoul U"
      
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)

            
        }else if indexPath.row == 1 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.areacode = 39
            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/91/2023691_image2_1.jpg"
            vc.x = 33.499682
            vc.y = 126.531211
            vc.maintitle = "JEJU-DO"
            vc.subtitle = "Only Jeju Island"
 
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)
            
        
        }else if indexPath.row == 2 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.areacode = 2
            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/90/2489290_image2_1.jpg"
            vc.x = 37.457702
            vc.y = 126.702212
            vc.maintitle = "INCHEON"
            vc.subtitle = "All Ways INCHEON"
            
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)

        }else if indexPath.row == 3 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.areacode = 37
            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/25/2597225_image2_1.jpg"
            vc.x = 35.824182
            vc.y = 127.148015
            vc.maintitle = "JEOLLABUK-DO"
            vc.subtitle = "We Make History"
            
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)
            
        }else if indexPath.row == 4 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.areacode = 35
            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/21/2616821_image2_1.jpg"
            vc.x = 36.019077
            vc.y = 129.343644
            vc.maintitle = "GYEONGSANGBUK-DO"
            vc.subtitle = "Pride GyeongBuk"
                        
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)
            
        }else if indexPath.row == 5 {

            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.areacode = 32

            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/43/780843_image2_1.jpg"
            vc.x = 37.370745
            vc.y = 128.390331
            vc.maintitle = "GANGWON-DO"
            vc.subtitle = "Lively GangWon"
            
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)
                        
        }else if indexPath.row == 6 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.areacode = 38
            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/40/2367340_image2_1.jpg"
            vc.x = 34.811824
            vc.y = 126.392205
            vc.maintitle = "JEOLLANAM-DO"
            vc.subtitle = "Land of Life, Best Jeonnam"
            
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)
            
        }else if indexPath.row == 7 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.areacode = 36
            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/30/2552030_image2_1.JPG"
            vc.x = 35.238038
            vc.y = 128.692348
            vc.maintitle = "GYEONGSANGNAM-DO"
            vc.subtitle = "Bravo Gyeongnam"
            
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)
            
        }else if indexPath.row == 8 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.areacode = 4
            
             vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/52/1941352_image2_1.jpg"
            vc.x = 35.871408
            vc.y = 128.601743
            vc.maintitle = "DAEGU"
            vc.subtitle = "Happy Citizens & Proud Daegu"
            
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)
            
            
        }else if indexPath.row == 9 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.areacode = 5
            
            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/39/1953739_image2_1.jpg"
            vc.x = 35.160073
            vc.y = 126.851453
            vc.maintitle = "GWANGJU"
            vc.subtitle = "Bitgoeul Gwangju"
            
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)
            
        }else if indexPath.row == 10 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.areacode = 6
            
            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/23/2565723_image2_1.JPG"
            vc.x = 35.179783
            vc.y = 129.075005
            vc.maintitle = "BUSAN"
            vc.subtitle = "Dynamic Busan"
            
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)
            
        }else if indexPath.row == 11 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.areacode = 31
            
            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/51/2552851_image2_1.bmp"
            vc.x = 37.274922
            vc.y = 127.008734
            vc.maintitle = "GYEONGGI-DO"
            vc.subtitle = "Cultural city Gyeonggi-do"
            
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)
            
        }else if indexPath.row == 12 {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.areacode = 34
            
            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/00/2601500_image2_1.jpg"
            vc.x = 36.658930
            vc.y = 126.672829
            vc.maintitle = "CHUNGCHEONGNAM-DO"
            vc.subtitle = "ChungNam Heart of Korea"
            
            vc.modalPresentationStyle = .fullScreen
             
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             
             present(nav, animated: true, completion: nil)
            
        }else if indexPath.row == 13 {
            
             let sb = UIStoryboard(name: "Main", bundle: nil)
              let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
              vc.areacode = 3
              
              vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/71/1589271_image2_1.jpg"
              vc.x = 36.350469
              vc.y = 127.384814
              vc.maintitle = "DAEJEON"
              vc.subtitle = "It's Daejeon"
              
              vc.modalPresentationStyle = .fullScreen
               
               let nav = UINavigationController(rootViewController: vc)
               nav.modalPresentationStyle = .fullScreen
               
               present(nav, animated: true, completion: nil)
            
        }
        
        
        
//        else if indexPath.row == 14 {
//
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
//            vc.areacode = 7
//
//            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/25/2593125_image2_1.jpg"
//            vc.x = 35.539568
//            vc.y = 129.311510
//            vc.maintitle = "ULSAN"
//            vc.subtitle = "THE RISING CITY"
//
//            vc.modalPresentationStyle = .fullScreen
//
//             let nav = UINavigationController(rootViewController: vc)
//             nav.modalPresentationStyle = .fullScreen
//
//             present(nav, animated: true, completion: nil)
//
//
//
//        }else if indexPath.row == 15 {
//
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//             let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
//             vc.areacode = 33
//
//             vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/71/1201571_image2_1.jpg"
//             vc.x = 36.635662
//             vc.y = 127.491396
//             vc.maintitle = "CHUNGCHEONGBUK-DO"
//             vc.subtitle = "Land of Life and the Sun"
//
//             vc.modalPresentationStyle = .fullScreen
//
//              let nav = UINavigationController(rootViewController: vc)
//              nav.modalPresentationStyle = .fullScreen
//
//              present(nav, animated: true, completion: nil)
//
//
//
//        }else if indexPath.row == 16 {
//
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//            let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
//            vc.areacode = 8
//
//            vc.withurl = "http://tong.visitkorea.or.kr/cms/resource/47/876047_image2_1.jpg"
//
//            vc.x = 36.480249
//            vc.y = 127.289085
//            vc.maintitle = "SEJONG"
//            vc.subtitle = "Sejong City"
//
//            vc.modalPresentationStyle = .fullScreen
//
//             let nav = UINavigationController(rootViewController: vc)
//             nav.modalPresentationStyle = .fullScreen
//
//             present(nav, animated: true, completion: nil)
//
//        }
//
        
        
        
        
        
        
    }
    
    
    
    
    
}
