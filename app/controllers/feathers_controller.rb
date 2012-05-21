class FeathersController < ApplicationController

  if FeatherCms::Config.authentication.kind_of?(Hash)
    http_basic_authenticate_with FeatherCms::Config.authentication.merge(except: :published)
  else
    before_filter FeatherCms::Config.authentication.to_sym, except: :published
  end

  before_filter :find_page, only: [:page, :preivew]

  layout 'feather_layout', except: [:preivew, :published]

  def index
    @pages = FeatherPage.all
  end

  def page
    if request.put? or request.post?
      @feather_page.attributes = params[:feather_page]
      @feather_page.name = params[:type]
      @feather_page.save
    end
    render action:  @feather_page.name
  end

  def preivew
    render inline: @feather_page.content, type: 'html',  layout: @feather_page.layout
  end

  def published
    @feather_page = FeatherPage.where(name: params[:type], status: 'published').first 
    render inline: @feather_page.content, type: 'html',  layout: @feather_page.layout
  end

  def find_page
    status = params[:feather_page] ? params[:feather_page][:status] : (params[:status] || 'draft')
    @feather_page = FeatherPage.where(name: params[:type], status: status)
    @feather_page = @feather_page.first || @feather_page.new
  end
end
