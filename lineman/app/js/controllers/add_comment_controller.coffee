angular.module('loomioApp').controller 'AddCommentController', ($scope, CommentService) ->
  $scope.newComment =
    discussion_id: $scope.discussion.id
    body: ''

  $scope.isExpanded = false

  $scope.expand = ->
    $scope.isExpanded = true

  $scope.collapseIfEmpty = ->
    if ($scope.newComment.body.length == 0)
      $scope.isExpanded = false

  $scope.processForm = () ->
    CommentService.add($scope.newComment, $scope.discussion)

  $scope.$on 'showReplyToCommentForm', (event, originalComment) ->
    $scope.newComment.parent_id = originalComment.id
    $scope.expand()
