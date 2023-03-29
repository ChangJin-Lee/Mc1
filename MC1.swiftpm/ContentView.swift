import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView(){
            Home()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct DetailView: View {
    var body: some View{
        HStack{
            Text("hello!")
        }
    }
}
struct Home: View {
    public let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        @State private var selection = 0
    let images = ["bear1","bear2","bear3","bear4","bear5"]
    
    var body: some View{
        
        
        VStack(spacing: 200){
            
            
            HStack {
                Text("chapter 1. Coding")
                Spacer().frame(width: 800)
                Text("STAGE").padding(.horizontal, -600)
            }
            .padding(.vertical, -60)
            
            HStack(spacing: 50){
                Image("test9")
                    .frame(width: 300, alignment: .leading)
                
                TabView(selection : $selection){
                    
                    ForEach(0..<5){ i in
                        Image("\(images[i])")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    
                }.tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .onReceive(timer, perform: { _ in
                        
                        withAnimation{
                            print("selection is",selection)
                            selection = selection < 5 ? selection + 1 : 0
                        }
                    })
                    .frame(width: 200, height: 200, alignment: .center)
            }
            .padding(.vertical, -180)
            
            HStack(spacing: 50){
                Image("test9")
                    .frame(width: 300, alignment: .leading)
                
                Image("test9")
                    .frame(width: 300, alignment: .center)
                
                NavigationLink(destination: Home2()) {
                    Text("Go Home2")
                }
            }
            .padding(.vertical, -10)
        }
    }
}

struct Home2: View {
    @State var showPopup: Bool = false
    var body: some View{
        
        NavigationView{
            
            VStack(spacing: 200){
                
                
                HStack {
                    Text("chapter 1. Coding")
                    Spacer().frame(width: 800)
                    Text("STAGE").padding(.horizontal, -600)
                }
                .padding(.vertical, -60)
                
                HStack(spacing: 50){
                    Image("test9")
                        .frame(width: 300, alignment: .leading)
                    
                    Image("test9")
                        .frame(width: 300, alignment: .center)
                }
                .padding(.vertical, -180)
                
                
                HStack(spacing: 50){
                    Image("test9")
                        .frame(width: 300, alignment: .leading)
                    
                    NavigationLink(destination: BlackScene()) {
                        Text("Go BlackScene")
                    }
                    
                    Image("test9")
                        .frame(width: 300, alignment: .center)
                    
                    Button("Show Popup"){
                        withAnimation{
                            showPopup.toggle()
                        }
                        
                        
                    }
                }
                
            }
            .padding(.vertical, -10)
                
        }
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .popupNavigationView(horizontalPadding: 40, show: $showPopup){
            
            // MARK: Your Popup content which will also performs navigations
            List{
                ForEach(tasks){task in
                    NavigationLink(task.taskTitle) {
                        Text (task.taskDescription)
                            .navigationTitle ("Destination" )
                    }
                }
            }
            .navigationTitle("Popup Navigation")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Close"){
                        withAnimation{
                            showPopup.toggle()
                        }
                    }
                }
            }
        }
    }
}

struct BlackScene: View{
    var body: some View{
        
        ZStack {
            Color.black.ignoresSafeArea()
            VStack{
                Text("두번째, ")
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                Text("Chapter 3.  검은색 페이지")
                    .font(.system(size: 55))
                    .foregroundColor(.white)
            }
        }
    }
}


//            .frame(height: 5)
//            Spacer().frame(height: 130)
//            Spacer(minLength: 0)
//            Spacer()
//            Spacer().frame(height: <#T##CGFloat?#>)
//        Text("test12")
//            .padding(.horizontal)
//            .padding(.top)


// 이하 코드는 MAX가 작성
// print("Hello git!")
