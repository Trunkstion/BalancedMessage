class MessageController < ApplicationController
    def index

    end

    def balancedMessage
        str = Array.new
        str = params[:message]

        @result = true
        i = 0
        smile = 0
        #flag = false
        
        if str == nil || str.length == 0
            @result = true
        else
            str.each_char do |c|
               if c == ')' && i == 0
                    @result = false
                    break
               else
                    case c
                        when '('
                            i += 1
                            
                        when ')'
                            i -= 1
                    end
                end
            end
        end

        # if @result == false
        #     render 'index'
        # elsif i == 0
        #     @result = true
        #     render 'index'
        # else
        #     @result = false
        #     render 'index'
        # end

       if i == 0
            @result = true
            render 'index'
        else
            str.each_char do |c|

                if (c == ':' && str.at(smile + 1) == ')') || (c == ':' && str.at(smile + 1) == '(')
                    @result = true
                    i == 0
                end
                smile += 1
            end
            if i > 0
                @result = false
                render 'index'  
            end
            
        end

        
    end
end
