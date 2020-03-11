//
//  RxExternalProject.swift
//  RxExternalProject
//
//  Created by Kevin Li on 3/11/20.
//  Copyright © 2020 kevinli. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

public class RxExternalProject {

    public let y = BehaviorRelay(value: MainScheduler.instance)

    public init() { }

}
