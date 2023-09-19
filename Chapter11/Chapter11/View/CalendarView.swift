//
//  CalendarView.swift
//  Chapter11
//

import SwiftUI

struct CalendarView: View {
    let daysInWeek = ["日", "一", "二", "三", "四", "五", "六"]
    let gridItemLayout = Array(repeating: GridItem(), count: 7)
    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            yearMonthView

            LazyVGrid(columns: gridItemLayout) {
                weekView
                firstDayOfWeekForMonthView
                daysOfMonthView
            }
            
            Spacer()
        }
        .padding()
    }

    // 当前年月
    private var yearMonthView: some View {
        Text("\(viewModel.currentDate, formatter: DateFormatter.yearMonth)")
            .font(.largeTitle)
            .padding(.top, 16)
    }

    // 工作周
    private var weekView: some View {
        ForEach(daysInWeek, id: \.self) { day in
            Text(day)
                .font(.headline)
                .frame(maxWidth: .infinity)
        }
    }
    
    // 日历开始时间
    private var firstDayOfWeekForMonthView: some View {
        ForEach(0 ..< viewModel.firstDayOfWeekForMonth(), id: \.self) { _ in
            Text(" ")
                .frame(maxWidth: .infinity, minHeight: 48)
        }
    }

    // 日历时间
    private var daysOfMonthView: some View {
        ForEach(viewModel.daysOfMonth(), id: \.self) { day in
            Text("\(day.day)")
                .font(.system(size: 20))
                .foregroundColor(day.isSameDay(as: viewModel.selectedDate) ? Color.white : Color.black)
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(day.isSameDay(as: viewModel.selectedDate) ? Color.blue : Color.clear)
                .cornerRadius(8)
                .onTapGesture {
                    viewModel.selectedDate = day
                }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
