require 'rails_helper'

describe ApplicationHelper do
  describe '#flash_messages' do
    context 'when there is no flash messages' do
      it 'should return nothing' do
        expect(helper.flash_messages).to be_nil
      end
    end
    context 'when there are some flash messages' do
      let(:flashes) do
        { success: 'Construction complete',
          notice: 'Systems operational',
          error: 'Huston, we have a problem!',
          alert: "I'm afraid I can't do that" }
      end

      before do
        flashes.each { |type, message| flash[type] = message }
      end

      subject { helper.flash_messages }

      it do
        is_expected.to have_selector('div.alert.alert-success > .container',
                                     text: flashes[:success])
      end
      it do
        is_expected.to have_selector('div.alert.alert-info > .container',
                                     text: flashes[:notice])
      end
      it do
        is_expected.to have_selector('div.alert.alert-danger > .container',
                                     text: flashes[:error])
      end
      it do
        is_expected.to have_selector('div.alert.alert-warning > .container',
                                     text: flashes[:alert])
      end
    end
  end

  describe '#page_title' do
    context 'no hash' do
      it 'returns the app name' do
        expect(helper.page_title).to eq(t 'titles.application')
      end
    end
  end

  describe '#destroy_link_to' do
    let(:item) { { item: 'User' } }
    subject { helper.destroy_link_to root_path, item }
    it do
      is_expected.to(
      have_selector('a.btn.btn-danger.btn-sm'\
        "[data-confirm='#{t('action.destroy.confirm.body', item)}']"\
        '[data-confirm-fade=true]'\
        "[data-confirm-title='#{t('action.destroy.confirm.title', item)}']"\
        "[data-confirm-cancel='#{t('action.destroy.confirm.cancel', item)}']"\
        "[data-confirm-cancel-class='btn-default']"\
        "[data-confirm-proceed='#{t('action.destroy.confirm.proceed', item)}']"\
        "[data-confirm-proceed-class='btn-danger']",
                    text: t('action.destroy.link', item))
      )
    end
  end
end
