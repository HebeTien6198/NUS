## Review code 20190726

1. Khi bỏ gem vào Gemfile thì nên đưa thêm version vào. Tốt nhất muôn xài gem nào lên `rubygems.org` copy + paste cái chỗ `Gemfile:` vào app mình.

2. Refer dùng coffeescript thay vì dùng pure js để viết JS

3. Không nên lặp lại những công việc mà những thư viện mình đã được train đã support sẵn.

    - app/assets/javascripts/discovers.js: việc chuyển tab có bootstrap làm cho rồi, mình đâu cần hanlde việc active tab làm gì
    - app/assets/javascripts/register.js: việc validation đã có jquery validation support sẵn đâu cần làm lại.

4. App ko có cơ chế authorization phù hợp

    - Hiện tại bất kỳ user nào cũng có thể access vào admin pages để manage các resources trong app.

5. Code còn bị duplicate

    - app/controllers/admin/manage_photos_controller.rb: nhiều action sử dụng `photo = Photo.find(params[:id])` => nên move vào 1 `before_action`
    - app/controllers/admin/manage_users_controller.rb: tương tự trên


6. Không tận dụng được sức mạnh của ActiveRecord: association and enum

    - app/controllers/discovers_controller.rb

    ```
    @followingRecords = Follow.where(follower: @user)
    @followerRecords = Follow.where(following: @user)
    ```

    =>

    ```
    @followingRecords = @user.follower
    @followerRecords = @user.following
    ```
    - app/controllers/feeds_controller.rb: tương tự trên
    - app/controllers/people_controller.rb: tương tự trên
    - app/controllers/profile_controller.rb: tương tự trên

    - app/controllers/discovers_controller.rb#index: `Photo.where(sharing_mode: "is_public")` => model photo co dùng enum cho `sharing_mode` nên chỗ này chỉ cần `Photo.is_public`

7. Name của variable, method không theo best practice của Ruby

    - app/controllers/application_controller.rb: `setUser` => `set_user`
    - app/controllers/discovers_controller.rb: `@followingRecords` => `@following_records`, `@followerRecords` => `@follower_records`
    - app/views/admin/manage_albums/edit.html.erb: `albumRecord` => `album_record`

8. Đừng commit những files không dùng đến

    - app/helpers/*

9. Nên viết template bằng SLIM thay vì ERB

10. Format code xấu quá

    - app/views/admin/manage_albums/edit.html.erb: `<%photos = Array.new%>` => `<% photos = Array.new %>`

11. Tránh dùng inline CSS, inline JS, nên sử dụng asset pipeline khai báo rule CSS cho template

    - app/views/admin/manage_albums/edit.html.erb
    - app/views/admin/manage_albums/index.html.erb
    - Nhiều chỗ khác nữa
    - app/views/photos/new.html.erb => inline JS và cả CSS

12. N+1 query issue

    - app/views/discovers/index.html.erb: loop qua `@photos` và access `photo.user` sẽ gậy N+1 query issue, tương tư với chỗ loop `@albums`
    - app/views/feeds/index.html.erb: tương tự trên
    - app/views/people/show.html.erb
    - Nhiều chỗ loop khác trong view nữa

13. Thư mục `views/layout` chỉ nên chưa những gì dùng cho layout. Nếu muốn bỏ những code share giữa các page thì bỏ vào `views/share/*`

14. Tránh dủng asset từ CDN. Nên download asset về và bỏ vào asset pipeline để dùng

    - app/views/layouts/application.html.erb

        + https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js
        + https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js
        + ...

15. Các template đang render với layout thì sao lại khai báo thẻ body làm gì nữa.

    - app/views/photos/*
    - app/views/profile/index.html.erb
