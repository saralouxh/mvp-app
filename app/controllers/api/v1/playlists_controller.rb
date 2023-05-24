module Api
    module V1
        class PlaylistsController < Api::V1::ApplicationController
            skip_before_action :authenticate, only: %i[index show]
                
                def create 
                    result = Playlists::Operations.new_playlist(params, @current_user)
                    render_error(errors: result.errors.all, status: 400) and return unless result.success?
                    payload = {
                        playlist: PlaylistBlueprint.render_as_hash(result.payload),
                        status: 201
                    }
                    render_success(payload: payload)
                end 

                def index 
                    playlists = Playlist.all
                    payload = {
                        playlists: PlaylistBlueprint.render_as_hash(playlists),
                        status: 200
                    }
                    render_success(payload: payload)
                end

                def user_playlists 
                    user = User.find(params[:user_id])
                    playlists = user.playlists
                    payload = {
                      playlists: PlaylistBlueprint.render_as_hash(playlists),
                      status: 200
                    }
                    render_success(payload: payload)
                end

                def show
                    playlist = Playlist.find(params[:id])
                    movies = playlist.movies
                    payload = {
                        playlist: PlaylistBlueprint.render_as_hash(playlist),
                        movies: MovieBlueprint.render_as_hash(movies),
                        status: 201
                    }
                    render_success(payload: payload)
                end

                def update
                    result = Playlists::Operations.update_playlist(params)
                    render_error(errors: result.errors.all, status: 400) and return unless result.success?
                    payload = {
                        playlist: PlaylistBlueprint.render_as_hash(result.payload),
                        status: 201
                    }
                    render_success(payload: payload)
                end

                def destroy 
                    playlist = Playlist.find(params[:id])
                    playlist.destroy
                    render_success(payload: "Playlist Deleted")
                end
                
        end
    end
end