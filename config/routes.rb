Selfstarter::Application.routes.draw do
  root :to => "preorder#index"

  match '/preorder' 			=> 'preorder#index'
  get "preorder/checkout"
  match '/preorder/checkout/:option'    => 'preorder#checkout', :via => :get
  match '/preorder/prefill'   	=> 'preorder#prefill', :via => :post
  get "preoder/postfill"
  match '/preorder/postfill'    => 'preorder#postfill!', :via => :post
end
