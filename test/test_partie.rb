require 'minitest/autorun'
require 'kata'

class TestPartie < MiniTest::Test
    def setup
        @p1 = Partie.new
    end

    def test_update
        @p1.update! 1
        @p1.update! 1
        @p1.update! 1
        @p1.update! 1
        @p1.update! 1
        assert_equal @p1.echanges.length, 2
    end
    def test_score
        @p1.update! 1 # 15,0
        @p1.update! 1 # 30,0
        @p1.update! 1 # 40,0
        @p1.update! 1 # j1
        @p1.update! 1 # 15,0
        assert_equal @p1.score( 1 ), 1
        assert_equal @p1.score( 2 ), 0
        @p1.update! 2 # 15,15
        @p1.update! 2 # 15,30
        @p1.update! 2 # 15,40
        @p1.update! 2 # j2
        assert_equal @p1.score( 1 ), 1
        assert_equal @p1.score( 2 ), 1
    end
end

