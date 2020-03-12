//
//  AppDelegate.swift
//  RxSwift-Testing
//
//  Created by Kevin Li on 3/11/20.
//  Copyright © 2020 kevinli. All rights reserved.
//

import UIKit
import RxSubproject
import RxExternalProject
import RxSwift
import RxCocoa
import DrX

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let subproject = RxSubproject()
    let externalProject = RxExternalProject()
    let relay = BehaviorRelay(value: "A")
    let bag = DisposeBag()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        relay
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: bag)

        subproject.x
            .bind(to: relay)
            .disposed(by: bag)

        externalProject.y
            .bind { print($0) }
            .disposed(by: bag)

        relay.drx
            .do { print("AA") }
            .bind(onNext: { print("\($0)")})
            .disposed(by: bag)
        
        return true
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

