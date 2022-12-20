class Calendario < Struct.new(:view, :data, :datas_agendamentos, :callback)
    HEADER = %w[D S T Q Q S S]
    START_DAY = :sunday

    delegate :content_tag, to: :view

    def table
      content_tag :table, class: "calendario table" do
        header + week_rows
      end
    end

    def header
      content_tag :tr do
        HEADER.map { |day| content_tag :th, day, class: 'calendario__tr_semana' }.join.html_safe 
      end    
    end

    def week_rows
      weeks.map do |week|
        content_tag :tr do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe

    end

    def day_cell(day)
      content_tag :td, view.capture(day, &callback), class: day_classes(day)
    end

    def day_classes(day)
      classes = []
      classes << "calendario__dia_hoje" if day == Date.today
      classes << "calendario__dia_selecionado" if day.month == data.month && day.year == data.year && day.day == data.day
      classes << "calendario__outro_mes" if day.month != data.month
      classes << "calendario__contem_agendamento" if datas_agendamentos.include?(day.to_s)
      classes.empty? ? nil : classes.join(" ")
    end

    def weekday_classes(day)
      classes = []
      classes << "calendario__semana_hoje" if day.strftime("%A") == Date.today.strftime("%A")
      classes.empty? ? nil : classes.join(" ")
    end
      
    def weekday_cell(day)
      content_tag :th, view.capture(day, &callback), class: weekday_classes(day)
    end
   

    def weeks
      first = data.beginning_of_month.beginning_of_week(START_DAY)
      last = data.end_of_month.end_of_week(START_DAY)
      (first..last).to_a.in_groups_of(7)
    end
end