require 'rails_helper'

RSpec.describe GalleriesController do
  describe GalleriesController::Params do
    describe '#permit' do
      context 'clean params' do
        it 'returns params' do
          gallery_params = attributes_for(:full_gallery)
          params = ActionController::Parameters.new(gallery: gallery_params)
          permitted_params = GalleriesController::Params.permit(params)
          expect(permitted_params).to eq(gallery_params.with_indifferent_access)
        end
      end
      context 'unclean params' do
        it 'throws an exception' do
          params = ActionController::Parameters.new(gallery: { random: 'text' })
          expect { GalleriesController::Params.permit(params) }
            .to raise_error(ActionController::UnpermittedParameters)
        end
      end
    end
  end
end
