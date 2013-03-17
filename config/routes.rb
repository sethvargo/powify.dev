PowifyDev::Application.routes.draw do
  get 'proxy' => 'proxy#result', :as => :proxy

  get ':app/delete' => 'proxy#delete', :as => :delete_app

  get ':action' => 'home'
  root :to => "home#home"
end