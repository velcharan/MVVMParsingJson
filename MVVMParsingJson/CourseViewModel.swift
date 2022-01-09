//
//  CourseViewModel.swift
//  MVVMParsingJson
//
//  Created by velcharan sridhar on 09/01/22.
//

import Foundation
import UIKit
import Alamofire

class CourseViewModel {
    
    var vc: ViewController?
    var course_arr = [MyCourse]()
    var faq_arr = [Faq]()
    var string = [String]()

     func CourseServiceCall() {
        AF.request("http://demo7953690.mockable.io/test").response { response in
            if let data = response.data {
                do {
                    let CourseResponse = try JSONDecoder().decode(HomeCourse.self, from: data)
                    print(CourseResponse.status as Any)
                    print(CourseResponse.BaseURL as Any)
                    //completion(CourseResponse)
                    
                    DispatchQueue.main.async {
                        self.vc?.modelTableView.reloadData()
                        self.vc?.labelOne.text = CourseResponse.BaseURL
                        self.vc?.labelTwo.text = "\(CourseResponse.status)"
                    }
                    for Course in CourseResponse.course {
                        let heading = Course.Heading
                        let chaptercount = Course.ChapterCount
                        print(heading as Any)
                        print(chaptercount as Any)
                        self.course_arr.append(Course)
                    }
                }catch {
                    dump(error.localizedDescription)
                }
            }
            
        }
    }
    
    func FAQSeerviceCall() {
        AF.request("http://demo7953690.mockable.io/test").response { response in
            if let data = response.data {
                do{
                    let faqResponse = try JSONDecoder().decode(HomeFaq.self, from: data)
                    print(faqResponse.base_url)
                    print(faqResponse.status)
                    
                    for faq in faqResponse.faq {
                        self.faq_arr.append(faq)
                        self.string.append(faq.question ?? "")
                        self.string[0]
                    }
                    
                    DispatchQueue.main.async {
                        self.vc?.modelTableView.reloadData()
                        self.vc?.labelOne.text = "\(faqResponse.status!)"
                        self.vc?.labelTwo.text = faqResponse.base_url

                    }
                }catch {
                    dump(error.localizedDescription)
                }
            }
        }
    }
}

