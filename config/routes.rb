SpdxDashboard::Application.routes.draw do
  resources :spdx_docs do
    get :compare, on: :member
    get :files, on: :member

    resources :comments
    resources :package_files, path: "files"
  end

  resources :packages do
    get "find", on: :collection
    resources :package_files, path: "files"
    resources :comments
  end

  resources :package_files

  resources :licenses

  root to: "spdx_docs#index"
end
