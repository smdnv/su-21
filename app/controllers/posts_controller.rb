class PostsController < ApplicationController
	def vk_posts
		vk = VkontakteApi::Client.new(Settings.token)
		if Settings.vk_id
      @posts = vk.wall.get(domain: "su_21", count: "3", offset: params[:offset].to_i)
      @posts.shift
      @posts.each do |post|
      	unless post.from_id.abs == 42551290
      		post.user = vk.users.get(user_ids: post.from_id.abs, fields: [:photo])
      		post.user = post.user[0]
      	else
      		post.user = vk.groups.get_by_id(group_ids: "su_21")[0]
      	end
      end
    end
	end

  def index

  end
end
