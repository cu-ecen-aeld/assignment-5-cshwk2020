
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
BUILDROOT_VERSION = 'ef68ba43d965528bd5c622407dfb9a5e3b343493'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
BUILDROOT_SITE = 'git@gitlab.com:buildroot.org/buildroot.git'
BUILDROOT_SITE_METHOD = git
BUILDROOT_GIT_SUBMODULES = YES

define BUILDROOT_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define BUILDROOT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/buildroot $(TARGET_DIR)/bin
endef

$(eval $(generic-package))
