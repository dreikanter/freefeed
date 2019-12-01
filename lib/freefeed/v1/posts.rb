# frozen_string_literal: true

require "freefeed/utils"

module Freefeed
  module V1
    module Posts
      include Freefeed::Utils

      # post '/v1/posts'
      # get '/v1/posts/:postId'
      # put '/v1/posts/:postId'
      # delete '/v1/posts/:postId'
      # post '/v1/posts/:postId/like'
      # post '/v1/posts/:postId/unlike'
      # post '/v1/posts/:postId/hide'
      # post '/v1/posts/:postId/unhide'
      # post '/v1/posts/:postId/save'
      # delete '/v1/posts/:postId/save'
      # post '/v1/posts/:postId/disableComments'
      # post '/v1/posts/:postId/enableComments'
    end
  end
end
