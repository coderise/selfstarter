Selfstarter::Application.routes.draw do
  root :to => "preorder#index"

  match '/preorder' 						 => 'preorder#index'
  get "preorder/checkout"
  match '/preorder/checkout'     => 'preorder#checkout!', :via => :post
  match '/preorder/prefill'   => 'preorder#prefill', :via => :post
end
