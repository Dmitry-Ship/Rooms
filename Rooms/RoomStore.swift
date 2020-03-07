//
//  RoomStore.swift
//  Rooms
//
//  Created by Dmitry Shipunov on 07.03.2020.
//  Copyright © 2020 Dmitry Shipunov. All rights reserved.
//

import SwiftUI
import Combine

class RoomStore : ObservableObject {
    @Published var rooms: [Room]
    
    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
}
