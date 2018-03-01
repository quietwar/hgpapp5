ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: "Genius Lounge" #proc{ I18n.t("active_admin.dashboard") }
  #active_admin_comments
  controller do
    def permitted_params
      params.permit :utf8, :_method, :authenticity_token, :commit, :id

    end
   end

      content title:  "The Genius Lounge" do
        div class: "blank_slate_container", id: "dashboard_default_message" do
          span class: "blank_slate" do
            span I18n.t("active_admin.dashboard_welcome.welcome")
            small I18n.t("active_admin.dashboard_welcome.call_to_action")
          end
      end
        # Here is an example of a simple dashboard with columns and panels.
        #
        columns do
          column do
            panel "Cohorts" do
              table_for Cohort.order("id desc").limit(10) do
                ul "HGP Cohorts" do

                  li link_to "Rich 1", admin_cohort_path('Rich1')
                  li link_to "Rich 2", admin_cohort_path('Rich2')
                  li link_to "Oak 1", admin_cohort_path('Oak1')
                  li link_to "Oak 2", admin_cohort_path('Oak2')
                  li link_to "Oak 3", admin_cohort_path('Oak3')
                  li link_to "Oak 4", admin_cohort_path('Oak4')
                  li link_to "Oak 5", admin_cohort_path('Oak5')
                  li link_to "Oak 6", admin_cohort_path('Oak6')
                  li link_to "Create a new HGP Cohort",   new_admin_cohort_path
                end
               end
            end
          end

          column do
            panel "Staff" do
                ul link_to "Staff signin", admin_login_path
            end
          end

          column do
            panel "Geniuses" do
                para "Welcome to the Hidden Genius Project! Please click on the logo to go back to the Genius home screen"
                table_for Cohort.order("id desc").limit(10) do

                  ul "Feature Geniuses" do

                     li link_to "Isaiah", page_path('isaiah')
                     li link_to "George", page_path('george')
                     li link_to "Malik",  page_path('malik')
                     li link_to "Create a new HGP featured Genius", new_admin_geniu_path
                   end
                end
              end
            end


           column do
             panel "Events" do
               table_for Event.order("id desc").limit(10) do
                 ul "Upcoming Events" do
                   li link_to "HGP Events Calendar",  event_path(:calendar_id)
                 end
                end
              end
            end
          end
        end
      end
