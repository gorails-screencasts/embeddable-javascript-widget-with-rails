json.partial! "discussions/discussion", discussion: @discussion

json.comments @discussion.comments, partial: 'comments/comment', as: :comment
