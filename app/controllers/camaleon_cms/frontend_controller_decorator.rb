CamaleonCms::FrontendController.class_eval do
	def index
    @cama_visited_home = true
    @posts = CamaleonCms::Post.visible_frontend.all.limit(10)
    if @_site_options[:home_page].present?
      render_post(@_site_options[:home_page].to_i)
    else
      r = {layout: nil, render: "index"}; hooks_run("on_render_index", r)
      render r[:render], (!r[:layout].nil? ? {layout: r[:layout]} : {})
    end
  end
end