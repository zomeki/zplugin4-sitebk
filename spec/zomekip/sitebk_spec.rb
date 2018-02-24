describe Zplugin::Sitebk do
  before do
    ENV["SITE_ID"] = "1"
    ENV["DIR"] = Rails.root.join('data').to_s
  end

  it 'dumps a site' do
    Rake::Task["zomeki:db:site:dump"].invoke
  end

  it 'dumps all sites' do
    Rake::Task["zomeki:db:site:dump_all"].invoke
  end

  it 'restores a site' do
    Rake::Task["zomeki:db:site:restore"].invoke
  end
end
