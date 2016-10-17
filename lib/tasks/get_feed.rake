namespace :get_feed do
  desc 'フィードをターミナルに出力するテスト' # rakeタスクの説明

  # Feedjiraを利用した場合
  # http://feedjira.com/
  # https://github.com/feedjira/feedjira
task :test1 => :environment do

  organizations = Organization.all

  organizations.each do |organization|

    parsedFeed = Feedjira::Feed.fetch_and_parse(organization.feed_url)
    
    puts parsedFeed.title
    puts '-----'
    puts '-----'
    
    if organization.latest_published == parsedFeed.last_modified
      puts 'Skipped Feed ' + parsedFeed.title
      next
    end

    parsedFeed.entries.each do |feed_entry|
    
    if organization.latest_published != nil && organization.latest_published > feed_entry.published
      puts 'Skipped - already published ' + feed_entry.url.to_s
      puts '-----'
      next
    end
    
    if 0 == feed_entry.summary.index("RT")
      puts 'Skipped - retweet ' + feed_entry.url.to_s
      puts '-----'
      next
    end
    
    puts feed_entry.url.to_s
    puts '-----'     
  
    m = organization.microposts.build
    m.title = feed_entry.title
    m.url = feed_entry.url
    m.summary = feed_entry.summary
    m.published = feed_entry.published
    m.save
      
    end
    
    organization.latest_published = parsedFeed.last_modified
    organization.save
    
  end
end
















  # 標準のRSSライブラリー利用した場合
  task :test2 => :environment do

    require 'rss' # 必要

    urls = ['http://news.livedoor.com/topics/rss/eco.xml','http://news.livedoor.com/topics/rss/ent.xml']

    urls.each do |url|

      parsedFeed = RSS::Parser.parse(url)

      puts parsedFeed.channel.title          # RSSのタイトル
      puts parsedFeed.channel.link           # RSSのURL
      puts parsedFeed.channel.lastBuildDate  # 最後に更新された日時
      puts ''                                # ターミナルで出力するときに見やすくしているだけ
      puts ''

      # 個別のデータはitemsという配列に入っている。
      parsedFeed.items.each do |feed_entry|
        puts feed_entry.title
        puts feed_entry.link
        puts feed_entry.description
        puts feed_entry.pubDate
        puts '-----'                         # ターミナルで出力するときに見やすくしているだけ
      end

    end
  end
end