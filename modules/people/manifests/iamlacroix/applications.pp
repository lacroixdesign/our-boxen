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
  include notational_velocity::nvalt
  include marked2

  include rubymine
  include android::sdk
  include android::tools
  include android::platform_tools
  include android::studio
}
