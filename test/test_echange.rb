require 'minitest/autorun'
require 'kata'

class TestEchange < MiniTest::Test
    def setup
        @e1 = Echange.new
    end

    def test_update
        @e1.update! 1
        assert_equal @e1.j1, 1
        assert_equal @e1.j2, 0
    end

    def test_to_s
        assert_equal @e1.to_s, 'zéro partout'
        @e1.update! 1
        @e1.update! 2
        assert_equal @e1.to_s, 'quinze partout'
    end
end

