class OnlyHgpAuthorization < ActiveAdmin::AuthorizationAdapter

#   def authorized?(action, subject = nil)
#     case subject
#     when normalized(Post)
#       # Only let the admin update and delete posts
#       if action == :update || action == :destroy
#         subject.author == user
#       else
#         true
#       end
#     else
#       true
#     end
#   end
#
end
