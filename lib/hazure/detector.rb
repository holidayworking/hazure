require 'libsvm'

module Hazure
  class Detector
    def initialize(examples = nil, cache_size: 1, eps: 0.001, nu: 0.5)
      train(examples, cache_size: cache_size, eps: eps, nu: nu) if examples
    end

    def train(examples, cache_size: 1, eps: 0.001, nu: 0.5)
      problem = Libsvm::Problem.new
      problem.set_examples([1] * examples.size, examples.map { |item| Libsvm::Node.features(Array(item)) })

      parameter = Libsvm::SvmParameter.new
      parameter.cache_size = cache_size
      parameter.eps        = eps
      parameter.nu         = nu
      parameter.svm_type   = Libsvm::SvmType::ONE_CLASS

      @model = Libsvm::Model.train(problem, parameter)
    end

    def outlier?(x)
      @model.predict(Libsvm::Node.features(Array(x))) == 1.0
    end
  end
end
