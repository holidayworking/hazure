require 'spec_helper'

describe Hazure::Detector do
  let(:detector) { Hazure::Detector.new }

  let(:examples) { [0, 0, 0, 0] }

  describe '.new' do
    context 'with examples' do
      it 'builds a model' do
        expect_any_instance_of(Hazure::Detector).to receive(:train).with(examples, cache_size: 1, eps: 0.001, nu: 0.5)
        Hazure::Detector.new(examples)
      end
    end

    context 'without examples' do
      it "doesn't build a model" do
        expect_any_instance_of(Hazure::Detector).not_to receive(:train)
        Hazure::Detector.new
      end
    end
  end

  describe '#train' do
    before do
      allow(Libsvm::Model).to receive(:train)
      detector.train(examples)
    end

    it 'calls Libsvm::Model.train' do
      expect(Libsvm::Model).to have_received(:train).with(instance_of(Libsvm::Problem), instance_of(Libsvm::SvmParameter))
    end
  end

  describe '#outlier?' do
    subject { detector.outlier?(10) }

    before do
      model = instance_double(Libsvm::Model)
      detector.instance_variable_set(:@model, model)

      allow(model).to receive(:predict) { value }
    end

    context 'when Libsvm::Model#predict returns 1.0' do
      let(:value) { 1.0 }
      it { is_expected.to be true }
    end

    context 'when Libsvm::Model#predict returns -1.0' do
      let(:value) { -1.0 }
      it { is_expected.to be false }
    end
  end
end
