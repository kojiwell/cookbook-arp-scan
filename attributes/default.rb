default['arp-scan']['version'] = '1.9'
default['arp-scan']['download_url'] = "http://www.nta-monitor.com/files/arp-scan/arp-scan-#{node['arp-scan']['version']}.tar.gz"
default['arp-scan']['download_dir'] = "/root/source"
default['arp-scan']['prefix'] = "/opt/arp-scan-#{node['arp-scan']['version']}"
