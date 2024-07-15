import Foundation

extension Date {
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "a hh:mm"
        return formatter.string(from: self)
    }
    
    var formmatedDay: String {
        let now = Date()
        let calendar = Calendar.current
        
        let nowStartOfDay = calendar.startOfDay(for: now)
        let dateStartOfDay = calendar.startOfDay(for: self)
        let numOfDaysDifference = calendar.dateComponents([.day], from: nowStartOfDay, to: dateStartOfDay).day!
        
        // 티켓 날짜 정보에 표시할 문자열 반환
        if numOfDaysDifference == 0 {
            return "오늘"
        } else if numOfDaysDifference < 0 {
            return "티켓 만료됨"
        }
        else{
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "mm/dd"
            return formatter.string(from: self)
        }
    }
}