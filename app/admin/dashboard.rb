ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Posts" do
          ul do
            Post.recent(5).map do |post|
              li link_to(post.title, admin_post_path(post))
            end
          end
        end
      end

      column do
        panel "All Categories" do
					ul do
						Category.all.each do |category|
					    li category.name
						end
					end
        end
      end

      column do
        panel "Recent Feedbacks" do
          ul do
            Feedback.recent(5).map do |feedback|
							li link_to(feedback.description, admin_feedback_path(feedback))
            end
          end
        end
      end

      column do
        panel "Recent Comments" do
          ul do
            Comment.recent(5).map do |comment|
							li link_to(comment.content, admin_comment_path(comment))
            end
          end
        end
      end

    end
  end # content
end
