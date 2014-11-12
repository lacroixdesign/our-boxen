class people::iamlacroix::applications {
  include people::iamlacroix::applications::sublime
  include people::iamlacroix::applications::atom_editor

  include cloudapp
  include transmit
  include skype
  include github_for_mac

  include fluid
  include imageoptim
  include applications::imagealpha
}
