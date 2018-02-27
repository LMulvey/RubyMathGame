module MathGame
    class Questions
        def new_question
            num1 = rand(0..20)
            num2 = rand(0..20)
            question = "What is #{num1} + #{num2}?"
            answer = num1 + num2
            response = { :question => question, :answer => answer }
            return response
        end
    end
end