# Il s'agit d'une machine a etats composee de 20 etats (combinaisons de
# 0,15,30,40,40+ et 40++).
class Echange
    attr_reader :j1, :j2
    @@valid_results = ['zéro','quinze','trente','quarante','avantage','gagnant']

    def initialize
        @j1 = 0
        @j2 = 0
    end

    def update!( winner )
        if (@j1 == 5 or @j2 == 5)
            raise EchangeTermineError
        elsif (@j1 == 4 and @j2 == 3)
            case winner
            when 1
                @j1 += 1
            when 2
                @j1 -= 1
            end
        elsif (@j1 == 3 and @j2 == 4)
            case winner
            when 1
                @j2 -= 1
            when 2
                @j2 += 1
            end
        elsif (winner == 1 and @j1 == 3 and @j2 != 3)
            @j1 += 2
        elsif (winner == 2 and @j2 == 3 and @j1 != 3)
            @j2 += 2
        else
            case winner
            when 1
                @j1 += 1
            when 2
                @j2 += 1
            end
        end
    end

    def to_s
        str = 'Erreur'
        if (@j1 == @j2) and @j1 <= 2
            str = "#{@@valid_results[@j1]} partout"
        elsif (@j1 == @j2) and @j1 == 3
            str = "égalité"
        elsif @j1 == 5
            str = "j1 gagnant"
        elsif @j2 == 5
            str = "j2 gagnant"
        elsif @j1 == 4
            str = "avantage j1"
        elsif @j2 == 4
            str = "avantage j2"
        else
            str = "#{@@valid_results[@j1]} #{@@valid_results[@j2]}"
        end
        str
    end
end
