require 'rails_helper'

describe ParamsValidatorService do
  describe '#call' do
    context 'when invalid params' do
      context 'when property_type is not listed' do
        it 'does raises an exception' do
          expect do
            described_class.call(13.4236807, 52.5342963, 'flat', 'sell')
          end.to raise_error(Exceptions::InvalidInputParamsError)
        end
      end

      context 'when marketing_type is not listed' do
        it 'does raises an exception' do
          expect do
            described_class.call(13.4236807, 52.5342963, 'apartment', 'swap')
          end.to raise_error(Exceptions::InvalidInputParamsError)
        end
      end

      context 'when longitude is not numeric' do
        it 'does raises an exception' do
          expect do
            described_class.call('long', 52.5342963, 'apartment', 'sell')
          end.to raise_error(Exceptions::InvalidInputParamsError)
        end
      end

      context 'when latitude is not numeric' do
        it 'does raises an exception' do
          expect do
            described_class.call(13.4236807, 'lat', 'apartment', 'sell')
          end.to raise_error(Exceptions::InvalidInputParamsError)
        end
      end
    end

    context 'when valid params' do
      it 'does not raises an exception' do
        expect do
          described_class.call(13.4236807, 52.5342963, 'apartment', 'sell')
        end.to_not raise_error
      end
    end
  end
end
