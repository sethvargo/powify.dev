PowifyDev::Application.routes.draw do
  get 'proxy' => 'proxy#result', :as => :proxy

  get ':action' => 'home'
  root :to => redirect('/home')
end