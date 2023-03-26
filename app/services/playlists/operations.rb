module Playlists
    module Operations 
        def self.new_playlist(params, current_user)
            playlist = current_user.playlists.new(name: params[:name]) 
            return ServiceContract.success(playlist) if playlist.save
            ServiceContract.error(playlist.errors.full_messages)
        end

        def self.update_playlist(params)
            playlist = Playlist.find(params[:id])
            return ServiceContract.success(playlist) if playlist.update(name: params[:name])
            ServiceContract.error(playlist.errors.full_messages)
        end
    end
end