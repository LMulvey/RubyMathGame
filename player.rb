module MathGame
    class Player
        attr_accessor :name
        attr_accessor :lives

        def initialize(params = {})
            @name = params.fetch(:name, false)
            @lives = 3
        end
    end
end
