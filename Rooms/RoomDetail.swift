//
//  RoomDetail.swift
//  Rooms
//
//  Created by Dmitry Shipunov on 07.03.2020.
//  Copyright © 2020 Dmitry Shipunov. All rights reserved.
//

import SwiftUI

struct RoomDetail: View {
    @State private var isZoomed = false
    
    let room: Room
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(room.thumbnailName)
                .resizable()
                .aspectRatio(contentMode: isZoomed ? .fill : .fit)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 2)) { self.isZoomed.toggle() }
                }
                .navigationBarTitle(Text(room.name), displayMode: .inline)
            
            if room.hasVideo && !isZoomed {
                Image(systemName: "video.fill")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .transition(.move(edge: .leading))
            }

        }

    }
}

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView { RoomDetail(room: testData[0]) }
            NavigationView { RoomDetail(room: testData[1]) }
        }
    }
}
