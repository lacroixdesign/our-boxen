class people::jamesdlacroix::applications {
  include people::jamesdlacroix::applications::sublime
  include people::jamesdlacroix::applications::atom_editor

  include transmit
  include skype
  include github_for_mac

  include fluid
  include imageoptim
  include applications::imagealpha
  include marked2

  include android::sdk
  include android::tools
  include android::platform_tools
  include android::studio
}
