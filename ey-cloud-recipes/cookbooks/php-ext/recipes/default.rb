if ['solo', 'app', 'app_master'].include?(node[:instance_role])
  ey_cloud_report "production_config" do
    message "PHP ini settings apc"
  end
  node['applications'].each do |app|
    app_name = app.first
    [ :cli, :fpm ].each do |exe_env|
      template "/etc/php/#{exe_env}-php5.4/ext-active/php-ext.ini" do
        owner node[:owner_name]
        group node[:owner_name]
        backup false
        mode 0777
        source "php-ext.ini.erb"
        variables({
          :app => app_name
        })
      end
    end
  end
end
