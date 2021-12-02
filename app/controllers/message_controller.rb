class MessageController < ApplicationController
    def index

    end

    def balancedMessage
        str = Array.new
        str = params[:message]
        @result = true
        i = 0
        smile = -1
        op = 0
        cl = 0
        sad = 0
        happy = 0
        
        puts str
        if str == nil || str.length == 0
            @result = true
        else
            str.each_char do |c|
                smile = smile + 1
                    case c
                        when '('
                            i = i + 1
                            
                        when ')'
                            i = i - 1
                        when ':'
                            if str.at(smile +1) == '('
                                str.each_char do |par|
                                    if par == '('
                                        op = op + 1
                                    elsif par == ')'
                                        cl = cl + 1
                                    end
                                end
                            elsif str.at(smile +1) == ')'
                                str.each_char do |par|
                                    if par == '('
                                        op = op + 1
                                    elsif par == ')'
                                        cl = cl + 1
                                    end
                                end
                            end
                            
                            if op > cl
                                sad = sad + 1
                            elsif op < cl
                                happy = happy + 1
                            end
                    end
                end
        end

       if i == 0
            @result = true
            render 'index'
       elsif (i == sad) || (i.abs == happy)
            @result = true
            render 'index'
       else
            if i != 0
                @result = false
                render 'index'  
            end      
        end
    end
end
