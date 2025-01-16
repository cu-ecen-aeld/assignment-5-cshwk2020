
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################
 
#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 'bb19e9c4584d4461e1ac7b135a52c04a404b1e90'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-cshwk2020.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all

	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/finder-app

	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/server

endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS

	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin

	$(SED) 's/conf\/username.txt/\/etc\/finder-app\/conf\/username.txt/' $(TARGET_DIR)/usr/bin/finder-test.sh
	$(SED) 's/..\/conf\/assignment.txt/\/etc\/finder-app\/conf\/assignment.txt/' $(TARGET_DIR)/usr/bin/finder-test.sh


	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/server/S99aesdsocket $(TARGET_DIR)/etc/init.d/

	$(SED) 's/CMD=\.\/aesdsocket/CMD=\/usr\/bin\/aesdsocket/' "$(TARGET_DIR)/usr/bin/aesdsocket-start-stop"

	 

	 

endef



#  APPLY AFTER COPIED_TO_TARGET:: modify config path to /etc/finder-app/conf/
define AESD_ASSIGNMENTS_POST_INSTALL_HOOKS:
	 
endef

$(eval $(generic-package))
