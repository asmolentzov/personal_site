require 'rack'

class PersonalSite
  def self.call(env)
    case env["PATH_INFO"]
    when '/' then index
    when '/about' then about
    when '/reset.css' then reset_css
    when '/main.css' then css
    when '/blog' then blog
    else
      check_static(env["PATH_INFO"])
    end
  end
  
  def self.index
    render_view('index.html')
  end
  
  def self.about
    render_view('about.html')
  end
  
  def self.blog
    render_view('blog.html')
  end
  
  def self.error
    render_view('error.html', '404')
  end
  
  def self.render_view(page, code = '200')
    [code, {'Content-Type' => 'text/html'}, [File.read("./app/views/#{page}")]]
  end
  
  def self.check_static(asset)
    if File.file?("./public/#{asset}")
      render_static(asset)
    else
      error
    end
  end
  
  def self.render_static(asset)
    ['200', {'Content-Type' => 'text/html'}, [File.read("./public/#{asset}")]]
  end
end