import SwiftUI

// This component is a clone of CashApp's profile page using SwiftUI.
// It consists of a profile image, user information, navigation links, and a sign-out button.
// The profile page can be accessed by tapping on a profile icon button.

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack{
                    Spacer()
                }
            }
            
            // 1. Main ScrollView containing all the elements
            ScrollView (showsIndicators: false) {
                VStack(spacing:10){
                    
                    // 1.1. QRCode and Close Button
                    HStack(spacing:310){
                        Image(systemName: "qrcode")
                            .font(.system(size:22, weight:.bold ))
                            .foregroundColor(Color.black)
                        Button(action:{
                            presentationMode.wrappedValue.dismiss()
                        }){ Image(systemName: "xmark")
                                .font(.system(size:22, weight:.bold ))
                                .foregroundColor(Color.black)}
                    }
                    .frame(width: geometry.size.width)
                    
                    Spacer()
                    
                    // 1.2. Profile Image
                    HStack {
                        Image(systemName: "camera.fill")
                            .font(.system(size: 18))
                            .foregroundColor(Color.white)
                    }
                    .frame(width:50, height:50)
                    .background(Color.green)
                    .cornerRadius(25)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(style:
                                        StrokeStyle(lineWidth: 3, lineCap: .round ,dash: [7])
                                   )
                            .foregroundColor(Color.green)
                    )
                    
                    // 1.3. User Information
                    Text("cash app")
                        .fontWeight(.medium)
                    Text("$cashapp")
                        .fontWeight(.regular)
                        .foregroundColor(Color(.systemGray2))
                    
                    // 1.4. Invite Friends Button
                    HStack{
                        Button(action:{
                            withAnimation{
                            }
                        }){
                            Text("Invite Friends, Get $15")
                                .fontWeight(.medium)
                                .frame(maxWidth:.infinity)
                                .padding(.vertical, 15)
                                .foregroundColor(Color.white)
                        }
                        .background(Color.green)
                        .cornerRadius(30, antialiased: true)
                    }.padding()
                    
                    // 1.5. Joined Date Information
                    HStack{
                        Image(systemName: "calendar")
                            .padding(.leading, 20)
                            .font(.system(size: 18))
                            .foregroundColor(Color.green)
                        
                        Text("Joined October 2023")
                            .fontWeight(.medium)
                            .padding(.leading, 10)
                            .foregroundColor(Color(.black))
                        
                        Spacer()
                        
                    }
                    .frame(width:geometry.size.width)
                    .padding()
                    
                    Divider()
                    
                    // 1.6. Navigation Links
                    VStack{
                        NavLink(title:"Personal", icon:"person.fill")
                        NavLink(title:"Support", icon:"questionmark.circle.fill")
                        NavLink(title:"Privacy & Security", icon:"checkmark.shield.fill")
                        NavLink(title:"Notifications", icon:"moon.circle")
                        NavLink(title:"Documents", icon:"doc.fill")
                    }
                    
                    // 1.7. Sign Out Button and Footer Text
                    VStack(alignment:.center){
                        
                        Button(action:{
                            withAnimation{
                                
                            }
                        }) {
                            Text("Sign Out")
                                .fontWeight(.medium)
                                .frame(maxWidth:.infinity)
                                .padding(.vertical, 20)
                                .foregroundColor(Color.green)
                        }
                        .background(Color.white)
                        .frame(width:geometry.size.width)
                        
                        Text("Sqaure, Inc.'s Privacy Policy, Terms of Service,\nand Open Source Software")
                            .font(.system(size: 15))
                            .multilineTextAlignment(.center)
                            .padding(.top, 20)
                            .foregroundColor(Color(.systemGray2))
                    }
                    .padding(.vertical, 50)
                    .frame(width:geometry.size.width)
                    .background(Color(.systemGray6))
                }
                .frame(width:geometry.size.width)
            }
        }
    }
}

// 2. Profile Icon Button
struct ProfileIcon:View {
    @State private var showProfileModal = false
    
    var body: some View {
        
        Button(action: {
            withAnimation{
                showProfileModal.toggle()
            }
        }) {
            Image(systemName: "person.crop.circle")
                .foregroundColor(Color(.black))
                .font(.system(size: 30))
        }
        .fullScreenCover(isPresented:$showProfileModal, content: ProfileView.init)
    }
}

// 3. NavLink Component
struct NavLink: View {
    var title:String
    var icon : String
    
    var body: some View {
        HStack{
            Button(action:{
                withAnimation{
                    
                }
            }) {
                HStack(alignment:.bottom){
                    Image(systemName: icon)
                        .padding(.leading, 5)
                        .font(.system(size: 18))
                        .foregroundColor(Color(.black))
                    
                    Text("\(title)")
                        .font(.system(size: 18))
                        .padding(.leading, 15)
                        .foregroundColor(Color(.black))
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size:15, weight:.bold))
                        .foregroundColor(Color(.systemGray2))
                }
                .padding()
            }
        }
        .padding(.vertical, 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}