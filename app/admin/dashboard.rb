ActiveAdmin.register_page "Dashboard" do

  menu priority: 1,

  label:  "Genius Lounge"

  content title:  "The Genius Lounge" do
    link_to "www.hiddengeniusproject.org"
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

              li link_to "Rich 1"
              li link_to "Oak 1"
              li link_to "Oak 2"
              li link_to "Oak 3"
              li link_to "Oak 4"
              li link_to "Oak 5"
              li link_to "Create a new HGP Cohort", new_admin_cohort_path
            end
           end
        end
      end

      column do
        panel "Geniuses" do
          para "Welcome to the Hidden Genius Project!"
          table_for Cohort.order("id desc").limit(10) do
            ul "Feature Geniuses" do

              li link_to "Isaiah"
              li link_to "George"
              li link_to "Malik", features_path
              li link_to "Create a new HGP featured Genius", new_feature_path
            end
          end
        end
       end
     end
    end
  end
#end
