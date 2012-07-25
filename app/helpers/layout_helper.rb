# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    @show_title = show_title
  end

  def page_title(text=nil)
    return text unless text.blank?
    'Jobster'
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  def include_base_css_framework(use_bootstrap=false)
    if use_bootstrap 
      stylesheet_link_tag 'bootystrap'
    else
      stylesheet_link_tag 'blueprint/screen', :media => 'screen'
    end
  end

  def old_browser_js_support
    content_tag(:script) do
      <<-JS.html_safe
        if(Array.isArray === undefined) {
          Array.isArray = function (arg) {
            return Object.prototype.toString.call(arg) == '[object Array]';
          };
        }
        if ((window.history) && (window.history.pushState === undefined)) {
          window.history.pushState = function() { };
        }
      JS
    end
  end

  def flash_messages
    flash.map do |name, msg|
      content_tag(:div, :id => "flash_#{name}") do
        content_tag(:div, msg, :class => 'message')
      end
    end.join(' ').html_safe
  end

end
