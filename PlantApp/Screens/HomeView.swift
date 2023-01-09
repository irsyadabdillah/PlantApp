//
//  HomeView.swift
//  PlantApp
//
//  Created by Irsyad Abdillah on 06/01/23.
//

import SwiftUI

struct HomeView: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color("grey")
                .ignoresSafeArea()
            VStack {
                SearchView(search: $search)
                ScrollView(showsIndicators: false) {
                    VStack {
                        CategoryView(selectedIndex: $selectedIndex)
                        CategoryItemView()
                        PopularItemView()
                    }
                }
                .padding(.top, 8)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct SearchView: View {
    @Binding var search: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 4)
                    .foregroundColor(Color.black.opacity(0.40))
                TextField("Search Plant", text: $search)
            }
            .padding(.all, 14)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.10), radius: 8)
            
            Button(action: {}) {
                Image(systemName: "bell.badge")
                    .font(.title2)
                    .padding(.horizontal, 8)
                    .symbolRenderingMode(.multicolor)
            }
        }
        .padding(.horizontal)
    }
}


struct CategoryView: View {
    @Binding var selectedIndex: Int
    private let categories = ["All", "Indoor", "Outdoor", "Aesthetic", "Garden"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<categories.count, id: \.self) { item in
                    Button(action: { selectedIndex = item }) {
                        ZStack {
                            Text(categories[item])
                                .foregroundColor(selectedIndex == item ? .white : Color("green"))
                                .fontWeight(.semibold)
                                .padding(.horizontal, 14)
                        }
                        .padding(.vertical, 8)
                        .background(selectedIndex == item ? Color("green") : .clear)
                        .cornerRadius(14)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
    }
}

struct CategoryItemView: View {
    private let plants: [Plants] = Plant.list
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(plants, id: \.self) { item in
                    VStack {
                        Image(item.image)
                            .resizable()
                            .frame(width: 180, height: 200)
                            .background(Color("tosca"))
                            .cornerRadius(8)
                        Spacer(minLength: 14)
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.body)
                                    .fontWeight(.light)
                                    .lineLimit(1)
                                Spacer()
                                Text(item.price)
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                            Image(systemName: "plus.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(Color("green"))
                        }
                    }
                    .padding()
                    .frame(width: 200)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: Color.gray.opacity(0.10), radius: 8)
                }
            }
            .padding()
        }
    }
}

struct PopularItemView: View {
    private let plants: [Plants] = Plant.list
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Popular")
                    .font(.title)
                Spacer()
                Text("See All")
                    .foregroundColor(Color("green"))
            }
            
            ForEach(plants, id: \.self) { item in
                HStack {
                    Image(item.image)
                        .resizable()
                        .frame(width: 120, height: 140)
                        .cornerRadius(8)
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.body)
                            .foregroundColor(Color("green"))
                            .padding(.vertical, 4)
                        Text(item.desc)
                            .font(.caption)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                            .padding(.trailing, 14)
                            .lineLimit(3)
                        Spacer()
                        HStack {
                            Text(item.price)
                                .fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "plus.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(Color("green"))
                                .padding(.trailing, 10)
                        }
                    }
                    .padding(.vertical, 10)
                }
                .background(.white)
                .cornerRadius(12)
                .shadow(color: .gray.opacity(0.10), radius: 8)
            }
        }
        .padding()
    }
}
