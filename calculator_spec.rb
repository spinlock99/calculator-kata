class Calculator
  def initialize(expression="")
    @expression = expression.split(",").map(&:to_i) || 0
    if !@expression.any?
      @expression = [0]
    end
  end

  def expr
    @expression
  end

  def sum
    @expression.inject(&:+) || 0
  end

  def diff
    if @expression.compact.count < 2
      raise "expect 2 or more elements but recieved #{@expression.compact.count}"
    end
    @expression.inject(&:-)
  end

  def prod
    @expression.inject(&:*)
  end

  def div
    if @expression.find { |element| element == 0 }
      raise "divide by zero"
    end
    @expression.inject(&:/)
  end
end

describe "Calculator" do
  subject(:calculator) { Calculator.new(expression) }

  shared_examples "methods" do
    specify { expect { calculator }.to_not raise_exception }

    it { should respond_to(:expr) }
    it { should respond_to(:sum)  }
    it { should respond_to(:diff) }
    it { should respond_to(:prod) }
    it { should respond_to(:div)  }
  end

  shared_examples "too few elements" do
    specify { expect { calculator.diff }.to raise_exception }
  end

  shared_examples "divide by zero" do
    specify { expect { calculator.div }.to raise_exception }
  end

  context "with argument ''" do
    let(:expression) { "" }

    it_behaves_like "methods"
    it_behaves_like "too few elements"
    it_behaves_like "divide by zero"

    its(:expr) { should eq([0]) }
    its(:sum)  { should eq(0)   }
    its(:prod) { should eq(0)   }
  end

  context "with argument '1'" do
    let(:expression) { "1" }

    it_behaves_like "methods"
    it_behaves_like "too few elements"

    its(:expr) { should eq([1]) }
    its(:sum)  { should eq(1)   }
    its(:prod) { should eq(1)   }
  end

  context "with argument '1,2'" do
    let(:expression) { "1,2" }

    it_behaves_like "methods"

    its(:expr) { should eq([1,2]) }
    its(:sum)  { should eq(3)     }
    its(:diff) { should eq(-1)    }
    its(:prod) { should eq(2)     }
  end

  context "with argument '1,2,3," do
    let(:expression) { "1,2,3" }

    it_behaves_like "methods"

    its(:expr) { should eq([1,2,3]) }
    its(:sum)  { should eq(6)       }
    its(:diff) { should eq(-4)      }
    its(:prod) { should eq(6)       }
    its(:div)  { should eq(0)       }
  end

  context "with argument '1,2,5,8'" do
    let(:expression) { "1,2,5,8" }

    it_behaves_like "methods"

    its(:expr) { should eq([1,2,5,8]) }
    its(:sum)  { should eq(16)        }
    its(:diff) { should eq(-14)       }
    its(:prod) { should eq(80)        }
  end

  context "with argument '1,0'" do
    let(:expression) { "1,0" }

    it_behaves_like "divide by zero"

    its(:diff) { should eq(1) }
    its(:prod) { should eq(0) }
  end

  context "with argument '3,2,1'" do
    let(:expression) { "3,2,1" }

    its(:diff) { should eq(0)   }
    its(:prod) { should eq(6)   }
    its(:div)  { should eq(1) }
  end

  context "with argument '5,4,3,2,1,'" do
    let(:expression) { "5,4,3,2,1" }

    its(:diff) { should eq(-5)  }
    its(:prod) { should eq(120) }
  end

  context "with arguments '2,1'" do
    let(:expression) { "2,1" }

    its(:div) { should eq(2) }
  end
end
