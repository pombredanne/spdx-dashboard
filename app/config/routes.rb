SpdxDashboard::Application.routes.draw do
  resources :spdx_docs do
    get :files, on: :member

    resources :package_files, path: "files"
  end

  resources :package_files

  root to: "spdx_docs#index"
end
