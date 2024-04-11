require 'nokogiri'

def flesch_reading_ease_score(words, sentences, syllables)
  206.835 - (1.015 * (words / sentences)) - (84.6 * (syllables / words))
end
def extract_keywords(content)
  return [] if content.nil? || content.empty?
  words = content.downcase.split(/\W+/)
  # Remove common stop words
  stop_words = %w{a about above after again against all am an and any are aren't as at be because been before being below between both but by can't cannot could couldn't did didn't do does doesn't doing don't down during each few for from further had hadn't has hasn't have haven't having he he'd he'll he's her here here's hers herself him himself his how how's i i'd i'll i'm i've if in into is isn't it it's its itself let's me more most mustn't my myself no nor not of off on once only or other ought our ours ourselves out over own same shan't she she'd she'll she's should shouldn't so some such than that that's the their theirs them themselves then there there's these they they'd they'll they're they've this those through to too under until up very was wasn't we we'd we'll we're we've were weren't what what's when when's where where's which while who who's whom why why's with won't would wouldn't you you'd you'll you're you've your yours yourself yourselves}
  words.reject! { |word| stop_words.include?(word) }
  # Calculate word frequency
  word_freq = Hash.new(0)
  words.each { |word| word_freq[word] += 1 }
  # Sort by frequency and return top 5 keywords
  word_freq.sort_by { |_, freq| -freq }.first(5).map(&:first)
end
def analyze_post(file_path)
  post = File.read(file_path)
  doc = Nokogiri::HTML(post)
  content = doc.at('body').text
  meta_description = doc.at('meta[name="description"]')['content'] if doc.at('meta[name="description"]')
  url = doc.at('link[rel="canonical"]')['href'] if doc.at('link[rel="canonical"]')
  title = doc.at('title').text if doc.at('title')
  # Extract subheadings
  temp = []
  doc.css('h1, h2, h3, h4, h5, h6').each do |tag|
    temp << tag.text
  end
  outbound_links = doc.css('a[href^="http"]').count
  word_count = content.split.size
  # Calculate Flesch Reading Ease score
  sentences = content.scan(/[^\.!?]+[\.!?]/).count
  syllables = content.split.map { |word| word.downcase.gsub(/[^a-z]/, '').gsub(/(?:[^laeiouy]es|ed|[^laeiouy]e)$/, '').gsub(/^y/, '').scan(/[aeiouy]{1,2}/).size }.sum
  reading_ease_score = flesch_reading_ease_score(word_count, sentences, syllables)
  # Automatic keyword suggestion
  suggested_keywords = extract_keywords(content)

  keyword = suggested_keywords.first || 'SEO' # If no suggested keywords, use 'SEO'
  keyword_in_url = url.nil? ? false : url.downcase.include?(keyword.downcase)
  keyword_in_subheadings = temp.any? { |heading| heading.downcase.include?(keyword.downcase) }
  images_present = !doc.css('img').empty?
  meta_description_length = meta_description.nil? || (meta_description.length >= 120 && meta_description.length <= 156)

  keyword_in_page_title_beginning = title.nil? || title.downcase.start_with?(keyword.downcase)


  keyword_density = (content.downcase.scan(keyword.downcase).count.to_f / word_count) * 100

  keyword_in_meta_description = meta_description.nil? || meta_description.downcase.include?(keyword.downcase)

  title_length = title.nil? || (title.length >= 40 && title.length <= 70)

  # Print results
  puts "Suggested keyword: #{keyword}"
  puts "URL: #{keyword_in_url}"
  puts "Keyword in subheadings: #{keyword_in_subheadings}"
  puts "Images present: #{images_present}"
  puts "Meta description length: #{meta_description_length}"
  puts "Keyword at the beginning of page title: #{keyword_in_page_title_beginning}"
  puts "Flesch Reading Ease score: #{reading_ease_score}"
  puts "Outbound links count: #{outbound_links}"
  puts "Keyword density: #{keyword_density}%"
  puts "Keyword in meta description: #{keyword_in_meta_description}"
  puts "Word count: #{word_count}"
  puts "Title length: #{title_length}"
end

if ARGV.empty?
  puts "Please provide the path to the HTML file."
  puts "Usage: ruby seo_analyzer.rb path/to/file.html"
  exit
end

# Analyze the provided HTML file
file_path = ARGV[0]
analyze_post(file_path)
