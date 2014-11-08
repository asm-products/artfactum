require 'rails_helper'

RSpec.describe ArtworksController do
  describe ArtworksController::Params do
    describe '#permit' do
      context 'clean params' do
        it 'returns params' do
          artwork_params = attributes_for(:full_artwork)
          params = ActionController::Parameters.new(artwork: artwork_params)
          permitted_params = ArtworksController::Params.permit(params)
          expect(permitted_params).to eq(artwork_params.with_indifferent_access)
        end
      end
      context 'unclean params' do
        it 'throws an exception' do
          params = ActionController::Parameters.new(artwork: { random: 'text' })
          expect { ArtworksController::Params.permit(params) }
            .to raise_error(ActionController::UnpermittedParameters)
        end
      end
    end
  end
end
