require 'rubygems'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "CYBRpuZVtZ5CYEgfISmjQ412u"
  config.consumer_secret     = "lKePyZS66gkhVhr7FUXimcurzDIT1Zrn2cCDTcOLJ1ZigJmc6d"
  # config.access_token        = "735118524-brGmBC8g3Q95ZU80fkfJffRozzbAM8mfbkPogvfS"
  # config.access_token_secret = "tOqjr4rS66RKvAJ6fWztHXlNVB6Nf3hTQl4DvWSp82YtM"
end




if __FILE__ == $0

# puts Twitter::REST::API.class
# tRS = Twitter::REST::Search.new

# tSR = tRS.search("locaweb", count: 10)
# tSR.each { |e| puts e.text }



# client.update("I'm tweeting with @gem!")


# client.retweeted_by("@locaweb").take(10).each { |e| puts e.text }

s = client.search("@locaweb", options: { count: 2 } ).first

#puts s.methods
puts "filter_level" + s.filter_level.to_s
puts "filter_level?" + s.filter_level?.to_s
puts "in_reply_to_screen_name" + s.in_reply_to_screen_name.to_s
puts "in_reply_to_screen_name?" + s.in_reply_to_screen_name?.to_s
puts "lang" + s.lang.to_s
puts "lang?" + s.lang?.to_s
puts "source" + s.source.to_s
puts "source?" + s.source?.to_s
puts "text" + s.text.to_s
puts "text?" + s.text?.to_s
puts "favorite_count" + s.favorite_count.to_s
puts "favorite_count?" + s.favorite_count?.to_s
puts "in_reply_to_status_id" + s.in_reply_to_status_id.to_s
puts "in_reply_to_status_id?" + s.in_reply_to_status_id?.to_s
puts "in_reply_to_user_id" + s.in_reply_to_user_id.to_s
puts "in_reply_to_user_id?" + s.in_reply_to_user_id?.to_s
puts "retweet_count" + s.retweet_count.to_s
puts "retweet_count?" + s.retweet_count?.to_s
puts "favorites_count" + s.favorites_count.to_s
puts "favoriters_count" + s.favoriters_count.to_s
puts "in_reply_to_tweet_id" + s.in_reply_to_tweet_id.to_s
puts "reply?" + s.reply?.to_s
puts "retweeters_count" + s.retweeters_count.to_s
puts "geo" + s.geo.to_s
puts "geo?" + s.geo?.to_s
puts "metadata" + s.metadata.to_s
puts "metadata?" + s.metadata?.to_s
puts "place" + s.place.to_s
puts "place?" + s.place?.to_s
puts "retweeted_status" + s.retweeted_status.to_s
puts "retweeted_status?" + s.retweeted_status?.to_s
puts "retweeted_tweet" + s.retweeted_tweet.to_s
puts "retweet?" + s.retweet?.to_s
puts "retweeted_tweet?" + s.retweeted_tweet?.to_s
puts "user" + s.user.to_s
puts "user?" + s.user?.to_s
puts "favorited?" + s.favorited?.to_s
puts "favorited" + s.favorited.to_s
puts "possibly_sensitive?" + s.possibly_sensitive?.to_s
puts "possibly_sensitive" + s.possibly_sensitive.to_s
puts "retweeted?" + s.retweeted?.to_s
puts "retweeted" + s.retweeted.to_s
puts "truncated?" + s.truncated?.to_s
puts "truncated" + s.truncated.to_s
puts "full_text" + s.full_text.to_s
puts "uri" + s.uri.to_s
puts "url" + s.url.to_s
puts "entities?" + s.entities?.to_s
puts "hashtags" + s.hashtags.to_s
puts "hashtags?" + s.hashtags?.to_s
puts "media" + s.media.to_s
puts "media?" + s.media?.to_s
puts "symbols" + s.symbols.to_s
puts "symbols?" + s.symbols?.to_s
puts "uris" + s.uris.to_s
puts "urls" + s.urls.to_s
puts "uris?" + s.uris?.to_s
puts "urls?" + s.urls?.to_s
puts "user_mentions" + s.user_mentions.to_s
puts "user_mentions?" + s.user_mentions?.to_s
puts "created_at" + s.created_at.to_s
puts "created?" + s.created?.to_s
puts "id" + s.id.to_s
puts "id?" + s.id?.to_s
puts "hash" + s.hash.to_s
# puts "inspect" + s.inspect.to_s
# puts "attrs" + s.attrs.to_s
# puts "to_h" + s.to_h.to_s
# puts "to_hash" + s.to_hash.to_s
# puts "to_hsh" + s.to_hsh.to_s
puts "freeze" + s.freeze.to_s
puts "to_json" + s.to_json.to_s
puts "nil?" + s.nil?.to_s
puts "class" + s.class.to_s
puts "singleton_class" + s.singleton_class.to_s
puts "clone" + s.clone.to_s
puts "dup" + s.dup.to_s
puts "itself" + s.itself.to_s
puts "tainted?" + s.tainted?.to_s
puts "untaint" + s.untaint.to_s
puts "untrusted?" + s.untrusted?.to_s
puts "trust" + s.trust.to_s
puts "frozen?" + s.frozen?.to_s
puts "to_s" + s.to_s.to_s
# puts "methods" + s.methods.to_s
puts "singleton_methods" + s.singleton_methods.to_s
puts "protected_methods" + s.protected_methods.to_s
# puts "private_methods" + s.private_methods.to_s
# puts "public_methods" + s.public_methods.to_s
puts "instance_variables" + s.instance_variables.to_s
puts "display" + s.display.to_s
puts "object_id" + s.object_id.to_s
puts "to_enum" + s.to_enum.to_s
puts "enum_for" + s.enum_for.to_s
puts "__id__" + s.__id__.to_s


# client.search("@locaweb", options: { count: 2 } ).take(10).each { |e| puts e.text }



# client.friends.each { |e| puts e.name }

# puts client.class
# puts client.methods
# puts client.friends.first.methods

end






=begin

filter_level
filter_level?
in_reply_to_screen_name
in_reply_to_screen_name?
lang
lang?
source
source?
text
text?
favorite_count
favorite_count?
in_reply_to_status_id
in_reply_to_status_id?
in_reply_to_user_id
in_reply_to_user_id?
retweet_count
retweet_count?
favorites_count
favoriters_count
in_reply_to_tweet_id
reply?
retweeters_count
geo
geo?
metadata
metadata?
place
place?
retweeted_status
retweeted_status?
retweeted_tweet
retweet?
retweeted_tweet?
user
user?
favorited?
favorited
possibly_sensitive?
possibly_sensitive
retweeted?
retweeted
truncated?
truncated
full_text
uri
url
entities?
hashtags
hashtags?
media
media?
symbols
symbols?
uris
urls
uris?
urls?
user_mentions
user_mentions?
created_at
created?
id
id?
eql?
==
hash
inspect
attrs
to_h
to_hash
to_hsh
[]
freeze
memoize
to_json
nil?
===
=~
!~
<=>
class
singleton_class
clone
dup
itself
taint
tainted?
untaint
untrust
untrusted?
trust
frozen?
to_s
methods
singleton_methods
protected_methods
private_methods
public_methods
instance_variables
instance_variable_get
instance_variable_set
instance_variable_defined?
remove_instance_variable
instance_of?
kind_of?
is_a?
tap
send
public_send
respond_to?
extend
display
method
public_method
singleton_method
define_singleton_method
object_id
to_enum
enum_for
equal?
!
!=
instance_eval
instance_exec
__send__
__id__





bearer_token
bearer_token=
connection_options=
connection_options
middleware=
middleware
get
post
bearer_token?
credentials?
connection
settings
verify_credentials
current_user
update_delivery_device
update_profile
update_profile_background_image
update_profile_colors
update_profile_image
blocked
blocking
blocked_ids
block?
block
unblock
users
user
user?
user_search
contributees
contributors
remove_profile_banner
profile_banner_remove
update_profile_banner
profile_banner
mute
unmute
muted
muting
muted_ids
following_followers_of
tweet_count
retweets
retweeters_of
status
statuses
destroy_status
destroy_tweet
status_destroy
tweet_destroy
update
update!
retweet
retweet!
update_with_media
oembed
oembeds
retweeters_ids
trends
local_trends
trends_place
trends_available
trend_locations
trends_closest
mentions_timeline
mentions
user_timeline
retweeted_by_user
retweeted_by
retweeted_by_me
home_timeline
retweeted_to_me
retweets_of_me
suggestions
suggest_users
report_spam
search
saved_searches
saved_search
create_saved_search
saved_search_create
destroy_saved_search
saved_search_destroy
place
reverse_geocode
geo_search
places_nearby
similar_places
places_similar
token
invalidate_token
reverse_token
upload
lists
lists_subscribed_to
list_timeline
remove_list_member
list_remove_member
memberships
list_subscribers
list_subscribe
list_subscriber?
list_unsubscribe
add_list_members
list_add_members
list_member?
list_members
add_list_member
list_add_member
destroy_list
list_destroy
list_update
create_list
list_create
list
subscriptions
remove_list_members
list_remove_members
owned_lists
lists_ownerships
lists_owned
configuration
languages
privacy
tos
friend_ids
follower_ids
friendships
friendships_incoming
friendships_outgoing
follow
create_friendship
friendship_create
follow!
create_friendship!
friendship_create!
unfollow
destroy_friendship
friendship_destroy
friendship_update
friendship
friendship_show
relationship
friendship?
followers
friends
following
no_retweet_ids
no_retweets_ids
favorites
unfavorite
destroy_favorite
favorite_destroy
favorite
fav
fave
favorite_create
favorite!
create_favorite!
fav!
fave!
favorite_create!
direct_messages_received
direct_messages_sent
direct_message
direct_messages
destroy_direct_message
direct_message_destroy
create_direct_message
d
m
dm
direct_message_create
access_token
access_token=
access_token_secret
access_token_secret=
consumer_key
consumer_key=
consumer_secret
consumer_secret=
proxy
proxy=
user_agent=
oauth_token
oauth_token=
oauth_token_secret
oauth_token_secret=
user_token?
user_agent
credentials
to_json
nil?
===
=~
!~
eql?
hash
<=>
class
singleton_class
clone
dup
itself
taint
tainted?
untaint
untrust
untrusted?
trust
freeze
frozen?
to_s
inspect
methods
singleton_methods
protected_methods
private_methods
public_methods
instance_variables
instance_variable_get
instance_variable_set
instance_variable_defined?
remove_instance_variable
instance_of?
kind_of?
is_a?
tap
send
public_send
respond_to?
extend
display
method
public_method
singleton_method
define_singleton_method
object_id
to_enum
enum_for
==
equal?
!
!=
instance_eval
instance_exec
__send__
__id__

=end