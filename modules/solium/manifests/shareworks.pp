# You must pass in the password variable via hiera. See https://github.com/TomPoulton/hiera-eyaml
# Example:
#  /opt/boxen/repo/hiera/users/samsonnguyen.eyaml

class solium::shareworks($user = "${::boxen_user}",
                         $password,
                         $host = "https://svn.solium.com/svn/shareworks/branches/") {
  include wget

  $home = "/Users/${user}"
  $branches = [ { 'name'      => 'solium-branch1',
                  'sw_branch' => 'shareworks-5_21_br' },
                { 'name'      => 'solium-branch2',
                  'sw_branch' => 'shareworks-5_22_br' },
                { 'name'      => 'solium-branch3',
                  'sw_branch' => 'shareworks-5_23_br' } ]
  
  file { [ "${home}/dev/${branches[0]['name']}/solium",
           "${home}/dev/${branches[1]['name']}/solium",
           "${home}/dev/${branches[2]['name']}/solium" 
         ]:
    ensure       => directory,
    recurse      => true,
    owner        => "${::boxen_user}",
    group        => "staff",
    recurselimit => 2,
  }

  vcsrepo {
    "${home}/dev/${branches[0]['name']}/solium":
      ensure              => present,
      provider            => svn,
      basic_auth_username => $user,
      basic_auth_password => $password,
      source              => "${host}/${branches[0]['sw_branch']}";
    "${home}/dev/${branches[1]['name']}/solium":
      ensure              => present,
      provider            => svn,
      basic_auth_username => $user,
      basic_auth_password => $password,
      source              => "${host}/${branches[1]['sw_branch']}";
    "${home}/dev/${branches[2]['name']}/solium":
      ensure              => present,
      provider            => svn,
      basic_auth_username => $user,
      basic_auth_password => $password,
      source              => "${host}/${branches[2]['sw_branch']}";
  }
  
}
