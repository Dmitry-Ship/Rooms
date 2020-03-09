//
//  RoomCell.swift
//  Rooms
//
//  Created by Dmitry Shipunov on 09.03.2020.
//  Copyright © 2020 Dmitry Shipunov. All rights reserved.
//

import SwiftUI

struct RoomCell: View {
    let room: Room
    
    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)) {
            if !room.thumbnailName.isEmpty {
                Image(room.thumbnailName)
                         .resizable()
                         .frame(width: 50.0, height: 50.0)
                         .cornerRadius(8)
            } else {
                Image(systemName: "person.fill")
                       .resizable()
                       .frame(width: 50.0, height: 50.0)
            }
     
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct RoomCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            Section {
                RoomCell(room: testData[2])
            }

        }.listStyle(GroupedListStyle())
    }
}

