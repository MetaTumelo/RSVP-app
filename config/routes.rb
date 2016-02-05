class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rsvp::Application.routes.draw do
  constraints(SubdomainPresent) do
    root 'guests#new', as: :subdomain_root
    resources :guests
    devise_for :users
  end
  
  constraints(SubdomainBlank) do
    root 'welcome#index'
    
    resources :accounts, only: [:new, :create]
  end
end