//
//  ContentView.swift
//  p3m4_5
//
//  Created by Amina TomasMart on 15.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isError = false
    @State var selected = 1
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selected) {
                MainScreen(selected: $selected)
                    .tag(1)
                    .tabItem {
                        Image(.search)
                        Text("Поиск")
                    }
                
                Input()
                    .tag(2)
                    .tabItem {
                        Image(.heart)
                        Text("Избранное")
                    }
                
                HomeScreen(selected: $selected)
                    .tag(3)
                    .tabItem {
                        Image(.letter)
                        Text("Отклики")
                    }
                
                JobVacancy(selected: $selected)
                    .tag(4)
                    .tabItem {
                        Image(.message)
                        Text("Сообщения")
                    }
                
                Favorites(selected: $selected)
                    .tag(5)
                    .tabItem {
                        Image(.person)
                        Text("Профиль")
                    }
            }
            
            HStack {
                ForEach(1...5, id: \.self) { item in
                    TabItem(item: item, selected: $selected)
                    
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .frame(maxWidth: .infinity)
            .background(.color1)
            .shadow(color: .color2, radius: 5)
        }
    }
}

struct TabItem: View {
    var item: Int
    @Binding var selected: Int
    var body: some View {
        Button {
            withAnimation {
                selected = item
            }
        } label: {
            VStack {
                if item == 1 {
                    Image(.search)
                    Text("Поиск")
                        .font(.system(size: 14, weight: .light))
                    
                } else if item == 2 {
                    Image(.heart)
                    Text("Избранное")
                        .font(.system(size: 14, weight: .light))
                    
                } else if item == 3 {
                    Image(.letter)
                    Text("Отклики")
                        .font(.system(size: 14, weight: .light))
                    
                } else if item == 4 {
                    Image(.message)
                    Text("Сообщения")
                        .font(.system(size: 14, weight: .light))
                    
                } else if item == 5 {
                    Image(.person)
                    Text("Профиль")
                        .font(.system(size: 14, weight: .light))
                }
            }
        }
    }
}

struct MainScreen: View {
    @State var email = ""
    @State var isNext = false
    @Binding var selected: Int
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    Color.color1
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        
                        Text("Вход в личный кабинет")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .font(.system(size: 20, weight: .bold))
                        Spacer(minLength: 100)
                        
                        // MARK: - Первый стек
                        
                        VStack(alignment: .leading, spacing: 16) {
                            
                            Text("Поиск работы")
                                .font(.system(size: 16, weight: .bold))
                            
                            HStack {
                                
                                Image(.letter)
                                    .padding(.all, 10)
                                
                                TextField("Электронная почта или телефон", text: $email)
                                    .foregroundColor(.gray)
                                
                            }
                            .background(.color3)
                            .foregroundColor(.gray)
                            .cornerRadius(10)
                            .shadow(color: .color1, radius: 10)
                            
                            HStack{
                                
                                Button {
                                    if email == "1" {
                                        isNext.toggle()
                                    }
                                } label: {
                                    Text("Продолжить")
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40)
                                        .font(.system(size: 16, weight: .bold))
                                        .background(.blue)
                                        .cornerRadius(10)
                                }
                                
                                Button {
                                    if isNext {
                                        isNext.toggle()
                                    } else {
                                        
                                    }
                                } label: {
                                    Text("Войти с паролем")
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 40)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.blue)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 16)
                        .padding(.top, 24)
                        .padding(.bottom, 60)
                        .background(.color2)
                        .cornerRadius(20)
                        
                        // MARK: - Второй стек
                        
                        VStack(alignment: .leading, spacing: 16) {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Поиск сотрудников")
                                    .font(.system(size: 16, weight: .bold))
                                
                                Text("Размещение вакансий и доступ к базе резюме")
                                    .font(.system(size: 14, weight: .regular))
                            }
                            Button {
                                if isNext {
                                    isNext.toggle()
                                } else {
                                    
                                }
                            } label: {
                                Text("Я ищу сотрудников")
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 30)
                                    .font(.system(size: 16, weight: .bold))
                                    .background(.green)
                                    .cornerRadius(50)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 24)
                        .background(.color2)
                        .cornerRadius(20)
                        
                    }
                }
                .foregroundStyle(.white)
                .sheet(isPresented: $isNext) {
                    Input()
                }
            }
            .background(.color1)
        }
    }
}

struct Input: View {
    @State var isNext = false
    @State var number = ""
    var body: some View {
        ZStack {
            Color.color1
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("Отправили код на  example@mail.ru")
                        .font(.system(size: 16, weight: .bold))
                    
                    Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                        .font(.system(size: 14, weight: .regular))
                }
                
                HStack(alignment: .center) {
                    
                    TextFild()
                    TextFild()
                    TextFild()
                    TextFild()
                    
                }
                
                NavigationLink {
                    
                } label: {
                    Text("Подтвердить")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                        .font(.system(size: 16, weight: .bold))
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
            .foregroundStyle(.white)
            .padding(.all, 10)
        }
        .sheet(isPresented: $isNext) {
            
        }
    }
}

struct HomeScreen: View {
    @StateObject var contentViewModel = ContentViewModel()
    @State var isNext = false
    @Binding var selected: Int
    var body: some View {
        ScrollView {
            ZStack {
                Color.color1
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    HStack {
                        HStack {
                            
                            Image(.search)
                                .padding(.all, 10)
                            
                            Text("Должность, ключевые слова")
                                .foregroundColor(.gray)
                                .padding(.all, 10)
                                .padding(.trailing,20)
                        }
                        .background(.color3)
                        .cornerRadius(10)
                        
                        Image(.setting)
                            .padding(.all, 10)
                            .background(.color3)
                            .cornerRadius(10)
                    }
                    .background(.color1)
                    .foregroundColor(.gray)
                    .cornerRadius(10)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            
                            VStack(alignment: .leading) {
                                
                                Image(.personBlue)
                                    .padding(.leading, 10)
                                    .padding(.top, 20)
                                
                                Spacer()
                                
                                Text("Вакансии рядом с вами")
                                    .padding(.horizontal)
                                    .padding(.bottom, 20)
                            }
                            .frame(maxWidth: 170, minHeight: 150)
                            .background(.color2)
                            .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                
                                Image(.star)
                                    .padding(.leading, 10)
                                    .padding(.top, 20)
                                
                                Spacer()
                                
                                VStack(alignment: .leading) {
                                    Text("Поднять резюме в поиске")
                                    Text("Поднять")
                                        .foregroundStyle(.green)
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 20)
                            }
                            .frame(maxWidth: 170, minHeight: 150)
                            .background(.color2)
                            .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                
                                Image(.blank)
                                    .padding(.leading, 10)
                                    .padding(.top, 20)
                                
                                Spacer()
                                
                                Text("Временная работа и подработка")
                                    .padding(.horizontal)
                                    .padding(.bottom, 20)
                            }
                            .frame(maxWidth: 170, minHeight: 150)
                            .background(.color2)
                            .cornerRadius(20)
                            
                            VStack(alignment: .leading) {
                                
                                Image(.heartBlue)
                                    .padding(.leading, 10)
                                    .padding(.top, 20)
                                
                                Spacer()
                                
                                Text("Полезные статьи и советы")
                                    .padding(.horizontal)
                                    .padding(.bottom, 20)
                            }
                            .frame(maxWidth: 170, minHeight: 150)
                            .background(.color2)
                            .cornerRadius(20)
                        }
                    }
                    
                    Text("Вакансии для вас")
                        .padding(.leading, 10)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .font(.system(size: 25, weight: .bold))
                    
                    
                    ForEach(contentViewModel.data, id: \.self) { vacancies in
                        ContentViewVacancies(vacancies: vacancies, selected: $selected)
                    }
                }
            }
            .foregroundStyle(.white)
            .sheet(isPresented: $isNext) {
                Input()
            }
        }
        .background(.color1)
    }
}

struct Favorites: View {
    @State var isNext = false
    @Binding var selected: Int
    var body: some View {
        ScrollView {
            ZStack {
                Color.color1
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    
                    Text("Избранное")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .font(.system(size: 30, weight: .bold))
                    
                    Spacer(minLength: 10)
                    
                    Text("1 вакансия")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.gray)
                    
                    Spacer(minLength: 20)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            HStack {
                                Text("Cейчас просматривает 1 человек")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundStyle(.green)
                                
                                Spacer()
                                
                                Image(.heartBlue)
                            }
                            
                            Text("UI/UX Designer")
                                .font(.system(size: 20, weight: .bold))
                            
                            Text("Минск")
                                .font(.system(size: 16, weight: .regular))
                            
                            HStack {
                                Text("Мобирикс")
                                    .font(.system(size: 16, weight: .regular))
                                
                                Image(.mark)
                            }
                            
                            HStack {
                                Image(.bag)
                                
                                Text("Опыт от 1 года до 3 лет")
                                    .font(.system(size: 16, weight: .regular))
                            }
                            
                            Text("Опубликовано 20 февраля")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundStyle(.gray)
                        }
                        
                        Button {
                            if isNext {
                                isNext.toggle()
                            } else {
                                
                            }
                        } label: {
                            Text("Откликнуться")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 30)
                                .font(.system(size: 16, weight: .bold))
                                .background(.green)
                                .cornerRadius(50)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 24)
                    .background(.color2)
                    .cornerRadius(20)
                    
                }
            }
            .foregroundStyle(.white)
            .sheet(isPresented: $isNext) {
                Input()
            }
        }
        .background(.color1)
    }
}

struct ContentViewVacancies: View {
    var vacancies: Vacancies
    @State var isNext = false
    @Binding var selected: Int
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack {
                    Text("Cейчас просматривает \(vacancies.lookingNumber ?? 0) человек")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.green)
                    
                    Spacer()
                    
                    Image(.heart)
                }
                
                Text(vacancies.title ?? "")
                    .font(.system(size: 20, weight: .bold))
                
                Text(vacancies.address.town ?? "")
                    .font(.system(size: 16, weight: .regular))
                
                HStack {
                    Text(vacancies.company ?? "")
                        .font(.system(size: 16, weight: .regular))
                    
                    Image(.mark)
                }
                
                HStack {
                    Image(.bag)
                    
                    Text(vacancies.experience.previewText ?? "")
                        .font(.system(size: 16, weight: .regular))
                }
                
                Text("Опубликовано \(vacancies.publishedDate ?? "")")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.gray)
            }
            
            NavigationLink {
                JobVacancy(selected: $selected)
            } label: {
                Text("Откликнуться")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 30)
                    .font(.system(size: 16, weight: .bold))
                    .background(.green)
                    .cornerRadius(50)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(.color2)
        .cornerRadius(20)
        
    }
}

struct JobVacancy: View {
    @Binding var selected: Int
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Color.color1
                        .ignoresSafeArea()
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("UI/UX Designer")
                        Text("Уровень дохода не указан")
                        Text("Требуемый опыт: от 1 года до 3 лет")
                        Text("Полная занятость, полный день")
                        
                        HStack {
                            HStack {
                                Text("147 человек уже откликнулись")
                                    .padding()
                                
                                Image(.personGreen)
                            }
                            .background(.color5)
                            
                            HStack{
                                Text("2 человека сейчас смотрят")
                                    .padding()
                                
                                Image(.eyeGreen)
                            }
                            .background(.color5)
                        }
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Мобирикс")
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                
                                Image(.mark)
                                    .padding(.leading, 5)
                                    .padding(.top, 20)
                            }
                            Image(.map)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 100)
                                .padding(.horizontal)
                            
                            Text("Минск, улица Бирюзова, 4/5")
                                .padding(.leading, 20)
                                .padding(.bottom, 20)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .background(.color2)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text("MOBYRIX - динамично развивающаяся продуктовая IT-компания, специализирующаяся на разработке мобильных приложений для iOS и Android. Наша команда работает над собственными продуктами в разнообразных сферах: от утилит до развлечений и бизнес-приложений. Мы ценим талант и стремление к инновациям и в данный момент в поиске талантливого UX/UI Designer, готового присоединиться к нашей команде и внести значимый вклад в развитие наших проектов.")
                            
                            Text("Ваши задачи")
                                .font(.title)
                                .bold()
                            
                            Text("-Проектировать пользовательский опыт, проводить UX исследования; -Разрабатывать адаптивный дизайн интерфейса для мобильных приложений; -Разрабатывать быстрые прототипы для тестирования идеи дизайна и их последующая; интеграция на основе обратной связи от команды и пользователей; -Взаимодействовать с командой разработчиков для обеспечения точной реализации ваших дизайнов; -Анализ пользовательского опыта и адаптация под тренды.")
                            
                            Text("Задайте вопрос работодателю")
                            
                            Text("Он получит его с откликом на вакансию")
                        }
                    }
                }
                .foregroundStyle(.white)
            }
            .background(.color1)
        }
    }
}

struct Stub: View {
    var body: some View {
        VStack {
            Text("Заглушка")
                .foregroundStyle(.red)
            
        }
    }
}

struct TextFild: View {
    @State var number = ""
    var body: some View {
        TextField("*", text: $number)
            .frame(width: 50, height: 50, alignment: .center)
            .background(.color3)
            .cornerRadius(10)
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
