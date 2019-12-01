# frozen_string_literal: true

require "freefeed/utils"

module Freefeed
  module V2
    module Posts
      include Freefeed::Utils

      # get '/v2/posts/:postId'
      # get '/v2/posts-opengraph/:postId'
    end
  end
end
