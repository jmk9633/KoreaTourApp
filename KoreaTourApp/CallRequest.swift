//
//  CallRequest.swift
//  KoreaTourApp
//
//  Created by 정문기 on 2020/06/08.
//  Copyright © 2020 jmk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher
import ImageSlideshow
import MapKit

class CallRequest {
    
    var list : [MainInfo] = []
    var listFestival : [MainInfo] = []
    var listFood : [MainInfo] = []
    var listCulture : [MainInfo] = []
    var listshopping : [MainInfo] = []
    var count00 : String? = "0"
    var count01 : String? = "0"
    var count02 : String? = "0"
    var count03 : String? = "0"
    var count04 : String? = "0"
    

    func callAPI (areacode : Int, typeId : Int, numberOfRow : Int, tv: UITableView) {
              
              let url = "http://api.visitkorea.or.kr/openapi/service/rest/EngService/areaBasedList?serviceKey=IqI0VyLHJX%2FHMWhHNBqRyGCMyIlpe6gYLGtFdFUxPkoE9QNcrY%2BqNOYyP4oIzErl6XpIUEmH1dsRoRDlmoGtGQ%3D%3D&numOfRows=\(numberOfRow)&pageSize=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&listYN=Y&arrange=p&contentTypeId=\(typeId)&areaCode=\(areacode)&_type=json"
                  
                AF.request(url, method: .get).validate().responseJSON { response in
                      switch response.result {
                      case .success(let value):
                          let json = JSON(value)
                          print("JSON: \(json)")
                          switch typeId {
                          case 76:
                              self.count00 = json["response"]["body"]["totalCount"].stringValue
                                     
                                 for i in json["response"]["body"]["items"]["item"].array!{

                                    var Mdata = MainInfo()
                                     Mdata.titleData = i["title"].stringValue
                                     Mdata.imageData = i["firstimage"].stringValue
                                     Mdata.contentsId = i["contentid"].intValue
                                     Mdata.contenttypeId = i["contenttypeid"].intValue
                                     Mdata.addressData = i["addr1"].stringValue
                                     Mdata.contentsTyped = i["cat2"].stringValue
                                     self.list.append(Mdata)

                                 }
                          case 85:
                                self.count01 = json["response"]["body"]["totalCount"].stringValue
                              
                                for i in json["response"]["body"]["items"]["item"].array!{
                                  
                                    var FestData = MainInfo()
                                  FestData.titleData = i["title"].stringValue
                                  FestData.imageData = i["firstimage"].stringValue
                                  FestData.contentsId = i["contentid"].intValue
                                  FestData.contenttypeId = i["contenttypeid"].intValue
                                  FestData.addressData = i["addr1"].stringValue
                                  FestData.contentsTyped = i["cat2"].stringValue
                                    
                                    self.listFestival.append(FestData)
                                    }
                      case 78:
                            self.count02 = json["response"]["body"]["totalCount"].stringValue
                            
                                                for i in json["response"]["body"]["items"]["item"].array!{
                            
                                                var CulData = MainInfo()
                                                    CulData.titleData = i["title"].stringValue
                                                    CulData.imageData = i["firstimage"].stringValue
                                                    CulData.contentsId = i["contentid"].intValue
                                                    CulData.contenttypeId = i["contenttypeid"].intValue
                                                    CulData.addressData = i["addr1"].stringValue
                                                    CulData.contentsTyped = i["cat2"].stringValue
                                                  self.listCulture.append(CulData)
                                                    }
                     
                          case 79:
                            self.count03 = json["response"]["body"]["totalCount"].stringValue
                            
                                                for i in json["response"]["body"]["items"]["item"].array!{
                            
                                                    var shopData = MainInfo()
                                                    shopData.titleData = i["title"].stringValue
                                                    shopData.imageData = i["firstimage"].stringValue
                                                    shopData.contentsId = i["contentid"].intValue
                                                    shopData.contenttypeId = i["contenttypeid"].intValue
                                                    shopData.addressData = i["addr1"].stringValue
                                                    shopData.contentsTyped = i["cat2"].stringValue
                                                  self.listshopping.append(shopData)
                                                }
                            
                          case 82:
                            self.count04 = json["response"]["body"]["totalCount"].stringValue
                            
                                                for i in json["response"]["body"]["items"]["item"].array!{
                            
                                                    var foodData = MainInfo()
                                                    foodData.titleData = i["title"].stringValue
                                                    foodData.imageData = i["firstimage"].stringValue
                                                    foodData.contentsId = i["contentid"].intValue
                                                    foodData.contenttypeId = i["contenttypeid"].intValue
                                                    foodData.addressData = i["addr1"].stringValue
                                                    foodData.contentsTyped = i["cat2"].stringValue
                                                    
                                                    
                                                  self.listFood.append(foodData)
                                                    }
                          default:
                            break
                            
                            }
                          
                            tv.reloadData()

                      case .failure(let error):
                                       print(error)
                    
                      
              }
      }
}
}




class DetailCallRequest {
    var titleLableContents : String?
    var overviewLableContents : String?
    var homepageLableContents : String?
    var directionLableContents : String?
    var telLableContents : String?
    var addressLableContents : String?
    var mapX : Double?
    var mapY : Double?
    var list : [PhotoData] = []
    var photolist : [KingfisherSource] = []

    
    func detailCallReuqest (id : Int, tv : UITableView, uv : ImageSlideshow) {
      let url = "http://api.visitkorea.or.kr/openapi/service/rest/EngService/detailCommon?serviceKey=IqI0VyLHJX%2FHMWhHNBqRyGCMyIlpe6gYLGtFdFUxPkoE9QNcrY%2BqNOYyP4oIzErl6XpIUEmH1dsRoRDlmoGtGQ%3D%3D&numOfRows=10&pageSize=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentId=\(id)&defaultYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json"
     
     AF.request(url, method: .get).validate().responseJSON { response in
         switch response.result {
         case .success(let value):
             let json = JSON(value)
             print("JSON: \(json)")
             
     
             self.titleLableContents = json["response"]["body"]["items"]["item"]["title"].stringValue
             
             self.overviewLableContents = json["response"]["body"]["items"]["item"]["overview"].stringValue
             
             self.homepageLableContents = json["response"]["body"]["items"]["item"]["homepage"].stringValue
             
             self.directionLableContents = json["response"]["body"]["items"]["item"]["directions"].stringValue
             
             self.telLableContents = json["response"]["body"]["items"]["item"]["tel"].stringValue

             self.addressLableContents
                = json["response"]["body"]["items"]["item"]["addr1"].stringValue
             
             self.mapY  = json["response"]["body"]["items"]["item"]["mapy"].doubleValue
             
             self.mapX = json["response"]["body"]["items"]["item"]["mapx"].doubleValue

             tv.reloadData()
            
         case .failure(let error):
             print(error)
         }
        
        
     }
        let url02 = "http://api.visitkorea.or.kr/openapi/service/rest/EngService/detailImage?serviceKey=IqI0VyLHJX%2FHMWhHNBqRyGCMyIlpe6gYLGtFdFUxPkoE9QNcrY%2BqNOYyP4oIzErl6XpIUEmH1dsRoRDlmoGtGQ%3D%3D&numOfRows=20&pageSize=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentId=\(id)&imageYN=Y&_type=json"
               
        let url05 = "https://k.kakaocdn.net/dn/bDdp6u/btqEXJ6n6Oe/Whu4appTkCnjDOUTChLA41/img.png"
            
                AF.request(url02, method: .get).validate().responseJSON { response in
                    switch response.result {
                    case .success(let value):
                    let json = JSON(value)
                    print("JSON: \(json)")
                    if let n = json ["response"]["body"]["items"]["item"].array {
                        for i in n{
                                                    
                        let phoData = PhotoData ()
                                         
                            phoData.photoImageData = i["originimgurl"].stringValue
                            phoData.photoID = i["contentid"].intValue
                        
                            self.photolist.append(KingfisherSource(urlString: i["originimgurl"].stringValue)!)
                            }
                    }else{
                        self.photolist.append(KingfisherSource(urlString: url05)!)
                    }


                                uv.setImageInputs(self.photolist)
                                     tv.reloadData()
                                    
                                 case .failure(let error):
                                     print(error)
   
             }

         }
    }
}


class SearchCall {
    
    var list : [MainInfo] = []
    
    func searchRequest (page : Int, searchText : String?, tv : UITableView) {
        
        let url = "http://api.visitkorea.or.kr/openapi/service/rest/EngService/searchKeyword?serviceKey=IqI0VyLHJX%2FHMWhHNBqRyGCMyIlpe6gYLGtFdFUxPkoE9QNcrY%2BqNOYyP4oIzErl6XpIUEmH1dsRoRDlmoGtGQ%3D%3D&numOfRows=10&pageSize=50&pageNo=\(page)&MobileOS=ETC&MobileApp=AppTest&listYN=Y&arrange=P&keyword=\(searchText!)&_type=json"
    
    AF.request(url, method: .get).validate().responseJSON { response in
        switch response.result {
        case .success(let value):
            let json = JSON(value)
            print("JSON: \(json)")
            
          if json["response"]["body"]["items"] != "" {
                
                for i in json["response"]["body"]["items"]["item"].array!{
                    
                    var SD = MainInfo()
                    
                        SD.titleData = i["title"].stringValue
                        SD.addressData = i["addr1"].stringValue
                    
                    if json["response"]["body"]["items"]["item"]["firstimage"] != "" {
                        SD.imageData = i["firstimage"].stringValue
                    }

                        SD.contentsId = i["contentid"].intValue
                        SD.contentsTyped = i["cat2"].stringValue
                        SD.totalCount = json["response"]["body"]["totalCount"].intValue
                  
                    
                    self.list.append(SD)
                    tv.reloadData()
                
                    
            }
            }
            
                    tv.reloadData()

            
        case .failure(let error):
            print(error)
        }
    }
    }
    
    
}



class WeatherCall {
    var weather : [weatherInfo] = []
    var weatherTemterature : Double? = 0.0
    
    func weatherCallRequest (x : Double, y : Double, tv : UITableView) {
            
            let url = "https://api.darksky.net/forecast/d71b817dd8c3b327393b5b0033d01f88/\(x),\(y)?units=si"
                
                AF.request(url, method: .get).validate().responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        print("JSON: \(json)")


                        self.weatherTemterature = json["currently"]["apparentTemperature"].doubleValue

                        tv.reloadData()
                
                        
                    case .failure(let error):
                                     print(error)
                  
                    }
            }
    }
}


class Atrraction {
    
    var list : [MainInfo] = []
    
    func attractionCallRequest (page : Int, typeId : Int, areacode : Int, tv : UITableView) {

        let url = "http://api.visitkorea.or.kr/openapi/service/rest/EngService/areaBasedList?serviceKey=IqI0VyLHJX%2FHMWhHNBqRyGCMyIlpe6gYLGtFdFUxPkoE9QNcrY%2BqNOYyP4oIzErl6XpIUEmH1dsRoRDlmoGtGQ%3D%3D&numOfRows=10&pageSize=10&pageNo=\(page)&MobileOS=ETC&MobileApp=AppTest&listYN=Y&arrange=p&contentTypeId=\(typeId)&areaCode=\(areacode)&_type=json"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                
                            
                for i in json["response"]["body"]["items"]["item"].array!{
                    
                    var attData = MainInfo()
                    attData.titleData = i["title"].stringValue
                    attData.addressData = i["addr1"].stringValue
                    attData.imageData = i["firstimage"].stringValue
                    attData.contentsId = i["contentid"].intValue
                    attData.contentsTyped = i["cat2"].stringValue
                    attData.totalCount = json["response"]["body"]["totalCount"].intValue
                    
                    self.list.append(attData)
                }
                
                    tv.reloadData()
                
                
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
