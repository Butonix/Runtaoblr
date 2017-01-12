json.id post.id
json.author_id post.author_id
json.username post.author.username
json.profile_pic asset_path(post.author.profile_image.url)
json.title post.title
json.content post.content
json.kind post.kind
json.liked post.liked_by_user?(current_user)
json.follow current_user.follows?(post.author)
json.notes post.notes_count
json.own current_user.post?(post)
json.media asset_path(post.media_content.url)
