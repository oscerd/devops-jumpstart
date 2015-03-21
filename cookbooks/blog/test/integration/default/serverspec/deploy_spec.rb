require 'spec_helper'

describe 'blog::deploy' do
  describe user('deploy') do
    it { should exist }
    it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXAVVo/IXVPMwxvigt0PNC9xPF0DZrdGokIeXBYoRYl5dF2LHDP+JhmjgQosPAq5lvRtphfFkchYVgOY8ZXO7eDc7kX7NyRT0HsgjY0x2LK+TcDhNzvR824XFLzW92LUytHb5SOGBFkPgF6VE32QZ/bCwsNe1xDBT2mZm+cUY9w7GJYxrp/Ifb/y6lsj69nrUX57ECdnZeBOHHpE/ECnkNk7aFRrLXzaTtb6sygPYA3aTCdh5/+feazXzaujbX6LHdYgU0DM8TerJuaw9FYptAF7DN2DPgJuomDnYMfZLObuupDXQZ1U056egyQ3rDaslLgFstzd1mt9AyBtzD1gWt jenkins@xpeppers.com' }
  end
end
