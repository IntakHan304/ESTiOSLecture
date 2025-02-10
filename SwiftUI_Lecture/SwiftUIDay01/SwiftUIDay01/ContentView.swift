
import SwiftUI

struct ContentView: View {
    @State private var words: [String] = []   // 단어를 저장할 배열
    @State private var newWord: String = ""  // 새로 입력할 단어
    @State private var wordToDelete: String = "" // 삭제할 단어
    @State private var searchWord: String = ""   // 검색할 단어
    @State private var message: String = ""  // 상태 메시지
    
    var body: some View {
        VStack {
            Text ("단어 관리 프로그램")
                .font(.largeTitle)
                .padding()
        
            // 현재 단어 수 표시
            Text("현재 단어 수: \(words.count)개")
                .font(.subheadline)
                .padding(.bottom)
            
            //단어 추가
            HStack {
                TextField("단어 입력", text: $newWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("추가") {
                    addWord()
                }
                .padding(.horizontal)
            }
            
            //단어 목록
            List (words, id: \.self) { word in
                Text(word)
                    .transition(.opacity)
            }
            .padding()
            
            //단어 삭제
            HStack {
                TextField("단어 삭제", text: $wordToDelete)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("삭제") {
                    deleteWord()
                }
                .padding(.horizontal)
            }
            
            //단어 검색
            HStack {
                TextField("검색할 단어 입력", text: $searchWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("검색") {
                    searchWordArr()
                }
                .padding(.horizontal)
            }
            
            //상테 메시지 표시
            Text(message)
                .foregroundStyle(.red)
                .padding()
        }// end VStack
        .padding()
        .animation(.easeInOut, value: words)
    }
    
    //단어 추가 함수
    func addWord() {
        if newWord.isEmpty {
            message = "단어를 입력하세요."
        } else if words.contains(newWord) {
            message = "이미 존재하는 단어입니다."
        } else {
            words.append(newWord)
            newWord = ""
            message = "단어가 추가되었습니다."
        }
    }
    
    // 단어 삭제 함수
    func deleteWord() {
        if let index = words.firstIndex(of: wordToDelete) {
            words.remove(at: index)
            wordToDelete = ""
            message = "'\(wordToDelete)'을(를) 삭제했습니다."
        } else {
            message = "해당 단어가 목록에 없습니다."
        }
    }
    
    // 단어 검색 함수
    func searchWordArr() {
        if let index = words.firstIndex(of: searchWord) {
            message = "\(searchWord)은(는) \(index + 1)번째 위치에 있습니다."
        } else {
            message = "해당 단어가 목록에 없습니다."
        }
    }
}

#Preview {
    ContentView()
}
