Jekyll::Hooks.register(:site, :post_write) do |site|
  # Temporary file to store options
  config_file = 'tmp/purgecss.js'

  # Ensure the tmp directory exists
  FileUtils.mkdir_p('tmp')

  # Delete existing config file if it exists
  File.delete(config_file) if File.exist?(config_file)

  # Generate configuration text
  css_file = Dir.glob('_site/css/*.css').first
  if css_file.nil?
    puts "No CSS file found to purge."
    next
  end

  config_text = <<~CONFIG
    module.exports = {
      content: ['_site/**/*.html'],
      css: ['#{css_file}'],
    }
  CONFIG

  # Write configuration to file
  File.open(config_file, 'w') { |f| f.write(config_text) }

  # Run PurgeCSS command
  success = system("purgecss --config #{config_file} --output _site/css/main.css")

  unless success
    puts "PurgeCSS command failed. Check if PurgeCSS is installed and try again."
  end

  # Cleanup config file
  File.delete(config_file) if File.exist?(config_file)
end
