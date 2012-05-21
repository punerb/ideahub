module IdeasHelper

  def source_url(url)
    url =~ /^http/ ? url : "http://github.com/" 
  end
end
