class BowlingGame
    def pins(rolls)
        @rolls = rolls
    end

    def score
        frame = 0
        score = 0
        first_in_frame = 0

        while frame < 10
            score += @rolls[first_in_frame] + @rolls[first_in_frame + 1]

            frame += 1
            first_in_frame += 2
        end

        score
    end
end
