path_install = ${HOME}/bin
path_current = $(shell pwd)

source_path_devs    = "${path_current}/devs.sh"
target_path_devs_1  = "${path_install}/devs.sh"
target_path_devs_2  = "${path_install}/devs"
target_path_devs_3  = "${path_install}/d"

source_path_lib     = "${path_current}/devs_lib.sh"
target_path_lib     = "${path_install}/devs_lib.sh"

source_path_startup = "${path_current}/devs_startup.sh"
target_path_startup = "${path_install}/devs_startup.sh"

install:
	@echo "Installing workspace management tools"
	@echo " Installing from : ${path_current}"
	@echo " Installing to   : ${path_install}"

	@echo " Installing lib"
	@ln -sf ${source_path_lib}     ${target_path_lib}

	@echo " Installing startup script"
	@ln -sf ${source_path_startup} ${target_path_startup}

	@echo " Installing devs tool"
	@ln -sf ${source_path_devs}    ${target_path_devs_1}
	@ln -sf ${source_path_devs}    ${target_path_devs_2}
	@ln -sf ${source_path_devs}    ${target_path_devs_3}
	
	@echo " Setting up permissions"
	@chmod +x ${source_path_lib}
	@chmod +x ${source_path_startup}
	@chmod +x ${source_path_devs}

	@echo "Done"
