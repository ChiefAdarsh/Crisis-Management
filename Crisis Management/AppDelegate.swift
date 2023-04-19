//
//  AppDelegate.swift
//  Crisis Management
//
//  Created by Adarsh Goura on 11/1/22.
//hi

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

extension String {
    var numberOfLines: Int {
        return self.components(separatedBy: "\n").count
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var hasAlreadyLaunched: Bool!
    static var numResourceURL: URL!
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
    static var numOfResources: Int = 0
    static var alrExists: Bool = false
    static var archiveURLs: [URL] = []
    static var extraResources: [Resource] = []
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        hasAlreadyLaunched = UserDefaults.standard.bool(forKey: "hasAlreadyLaunched")
        //check first launched
        if (hasAlreadyLaunched)
        {
            hasAlreadyLaunched = true
        }else{
            UserDefaults.standard.set(true, forKey: "hasAlreadyLaunched")
        }
        
        if let dataUrl = URL(string: "http://student-central-resources-default-rtdb.firebaseio.com/users.json") {
           URLSession.shared.dataTask(with: dataUrl) { data, response, error in
              if let data = data {
                 if let jsonString = String(data: data, encoding: .utf8) {
                    print("json:", jsonString)
                 }
               }
           }.resume()
        }
        
        AppDelegate.numResourceURL = AppDelegate.documentsDirectory.appendingPathComponent("numResource")
            .appendingPathExtension("plist")
        
        let jsonDecoder = JSONDecoder()
        if let retrievedData = try? Data(contentsOf: AppDelegate.numResourceURL),
            let decodedData = try?
           jsonDecoder.decode(numResource.self,
           from: retrievedData) {
            print(decodedData)
            AppDelegate.numOfResources = decodedData.numOfResources
            AppDelegate.alrExists = true
        }
        
        print(AppDelegate.alrExists)
        print("resources: ",AppDelegate.numOfResources)
        
        for i in 0..<AppDelegate.numOfResources {
            AppDelegate.archiveURLs.append(AppDelegate.documentsDirectory.appendingPathComponent("resource\(i + 1)")
               .appendingPathExtension("plist"))
        }
        
        for i in 0..<AppDelegate.numOfResources {
            let jsonDecoder = JSONDecoder()
            if let retrievedData = try? Data(contentsOf: AppDelegate.archiveURLs[i]),
                let decodedData = try?
               jsonDecoder.decode(Resource.self,
               from: retrievedData) {
                print(decodedData)
                yourArray.append(decodedData)
                AppDelegate.extraResources.append(decodedData)
                
//                teacherLabels[i]!.text = decodedData.name
//                teacherMails[i]!.text = decodedData.email
            }
        }
        
        return true
    }
    
    func sethasAlreadyLaunched(){
        hasAlreadyLaunched = true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

