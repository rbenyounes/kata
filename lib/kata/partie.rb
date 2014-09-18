class Partie
    attr_reader :echanges

    def initialize
        @echanges = [Echange.new]
    end

    def update! winner
        s1 = score( 1 )
        s2 = score( 2 )
        if s1 < 6 and s2 < 6
            begin
                @echanges.last.update! winner
            rescue EchangeTermineError
                @echanges << Echange.new
                @echanges.last.update! winner
            end
        elsif (s1 == 6 and s2 <= 4) or (s2 == 6 and s1 <= 4)
            raise PartieTermineeError
        end
    end

    def run winners
        begin
            nb_echanges_termines = 0
            winners.each{ |w|
                update! w
                if nb_echanges_termines < @echanges.length - 1
                    puts self
                    nb_echanges_termines += 1
                end
                puts @echanges.last
            }
            puts self
        rescue PartieTermineeError
            puts self
        end
    end

    def score joueur
        s = 0
        case joueur
        when 1
            s = @echanges.find_all{ |e| e.j1 == 5 }.length
        when 2
            s = @echanges.find_all{ |e| e.j2 == 5 }.length
        end
        s
    end

    def to_s
        s1 = score( 1 )
        s2 = score( 2 )

        if s1 == 6 and s2 <= 4
            w = '+Partie terminée: Joueur1 gagnant'
        elsif s2 == 6 and s1 <= 4
            w = '+Partie terminée: Joueur2 gagnant'
        else
            w = "+Partie non terminée: #{s1}, #{s2}"
        end
        w
    end
end
