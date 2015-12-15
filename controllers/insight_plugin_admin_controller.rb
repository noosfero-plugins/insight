class InsightPluginAdminController < PluginAdminController

  append_view_path File.join(File.dirname(__FILE__) + '/../views')

  def index
    if request.post?
      if @environment.update_attributes(params[:environment])
        session[:notice] = _('Insight plugin settings updated successfully.')
      else
        session[:notice] = _('Insight plugin settings could not be saved.')
      end
      redirect_to :controller => 'plugins', :action => 'index'
    end
  end

end
