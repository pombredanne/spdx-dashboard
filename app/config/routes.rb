SpdxDashboard::Application.routes.draw do
  resources :spdx_docs do
    get :files, on: :member

    resources :comments
    resources :package_files, path: "files"
  end

  resources :packages do
    resources :package_files, path: "files"
    resources :comments
  end
  
  resources :package_files

  root to: "spdx_docs#index"
end
