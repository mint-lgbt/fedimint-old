# frozen_string_literal: true

require 'rails_helper'

describe 'about/show.html.haml', without_verify_partial_doubles: true do
  let(:commit_hash) { '8925731c9869f55780644304e4420a1998e52607' }

  before do
    allow(view).to receive(:site_hostname).and_return('example.com')
    allow(view).to receive(:site_title).and_return('example site')
    allow(view).to receive(:new_user).and_return(User.new)
    allow(view).to receive(:use_seamless_external_login?).and_return(false)
    allow(view).to receive(:current_account).and_return(nil)
  end

  it 'has valid open graph tags' do
    instance_presenter = double(
      :instance_presenter,
      site_title: 'something',
      site_short_description: 'something',
      site_description: 'something',
      version_number: '1.0',
      source_url: 'https://github.com/mint-lgbt/fedimint',
      open_registrations: false,
      thumbnail: nil,
      hero: nil,
      mascot: nil,
      user_count: 420,
      status_count: 69,
      active_user_count: 420,
      commit_hash: commit_hash,
      contact_account: nil,
      sample_accounts: []
    )

    assign(:instance_presenter, instance_presenter)
    render

    header_tags = view.content_for(:header_tags)

    expect(header_tags).to match(%r{<meta content=".+" property="og:title" />})
    expect(header_tags).to match(%r{<meta content="website" property="og:type" />})
    expect(header_tags).to match(%r{<meta content=".+" property="og:image" />})
    expect(header_tags).to match(%r{<meta content="http://.+" property="og:url" />})
  end
end
