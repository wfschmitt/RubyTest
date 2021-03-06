require_relative '../base_classes/base_class_for_test'

require_relative '../endpoints/posts/delete_posts_id'
require_relative '../endpoints/posts/get_posts'
require_relative '../endpoints/posts/get_posts_id'
require_relative '../endpoints/posts/post_posts'
require_relative '../endpoints/posts/put_posts_id'

class PostsTest < BaseClassForTest

  def test_delete_posts_id

    prelude do |client, log|
      log.section('Test DeletePostsId') do
        post_to_delete = nil
        log.section('Get a post to delete') do
          post_to_delete = Post.get_first(client)
        end
        log.section('Delete the post') do
          DeletePostsId.verdict_call_and_verify_success(client, log, :delete_post, post_to_delete)
        end
      end
    end
  end

  def test_get_posts

    prelude do |client, log|
      log.section('Test GetPosts') do

        all_posts = nil

        log.section('GetPosts with no query') do
          all_posts = GetPosts.verdict_call_and_verify_success(client, log, :no_query)
        end

        log.section('GetPosts with simple query') do
          post = all_posts.first
          query_elements = {
              :userId => post.userId,
          }
          expected_posts = all_posts.select { |p| p.userId == post.userId }
          actual_posts = GetPosts.call(client, query_elements)
          if log.verdict_assert_equal?(:count_for_simple_query, expected_posts.size, actual_posts.size, message: 'Count')
            (0...expected_posts.size).each do |i|
              expected_post = expected_posts[i]
              actual_post = actual_posts[i]
              v_id = format('with_simple_query_%d', i).to_sym
              Post.verdict_equal?(log, v_id, expected_post, actual_post)
            end
          end
        end

        log.section('GetPosts with complex query') do
          post = all_posts.first
          query_elements = {
              :userId => post.userId,
              :title => post.title,
          }
          expected_posts = all_posts.select { |p| (p.userId == post.userId) && (p.title == post.title) }
          actual_posts = GetPosts.call(client, query_elements)
          if log.verdict_assert_equal?(:count_for_complex_query, expected_posts.size, actual_posts.size)
            (0...expected_posts.size).each do |i|
              expected_post = expected_posts[i]
              actual_post = actual_posts[i]
              v_id = format('with_complex_query_%d', i).to_sym
              Post.verdict_equal?(log, v_id, expected_post, actual_post)
            end
          end
        end

      end

    end

  end

  def test_get_posts_id

    prelude do |client, log|
      log.section('Test GetPostsId') do
        post_to_fetch = nil
        log.section('Get a post to fetch') do
          post_to_fetch = Post.get_first(client)
        end
        log.section('Fetch the post') do
          GetPostsId.verdict_call_and_verify_success(client, log, :get_post, post_to_fetch)
        end
      end
    end

  end

  def test_post_posts

    prelude do |client, log|
      log.section('Test PostPosts') do
        post_to_create = Post.new(
            :id => nil,
            :userId => 1,
            :title => 'New title',
            :body => 'New body',
        )
        PostPosts.verdict_call_and_verify_success(client, log, :post_to_create, post_to_create)
      end
    end

  end

  def test_put_posts_id

    prelude do |client, log|
      log.section('Test PutPostsId') do
        post_to_update = nil
        log.section('Get a post to update') do
          post_original = Post.get_first(client)
          post_to_update = post_original.clone
        end
        log.section('Put the modifications') do
          post_to_update.title = 'New title'
          post_to_update.body = 'New body'
          PutPostsId.verdict_call_and_verify_success(client, log, :post_to_update, post_to_update)
        end
      end

    end

  end

end

