//
//  TodoRepresentable.swift
//  TestSwiftUI
//
//  Created by Eric Downey on 7/2/19.
//  Copyright © 2019 Downey. All rights reserved.
//

import Foundation

protocol TodoRepresentable {
    var uuid: UUID { get }
    var task: String { get set }
    var complete: Bool { get set }
}
