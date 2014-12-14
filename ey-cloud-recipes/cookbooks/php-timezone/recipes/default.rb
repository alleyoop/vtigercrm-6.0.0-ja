template "/etc/php/fpm-php5.4/ext-active/timezone.ini" do
    owner "root"
    group "root"
    mode 0644
    backup 0
    source "timezone.ini.erb"
end

template "/etc/php/cli-php5.4/ext-active/timezone.ini" do
    owner "root"
    group "root"
    mode 0644
    backup 0
    source "timezone.ini.erb"
end
