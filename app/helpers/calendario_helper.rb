module CalendarioHelper
    def calendario(data = Date.today, &block)
        Calendario.new(self, data, @datas_agendamentos, block).table
    end
end
