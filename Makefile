.phony: container rpm

container:
	podman build -t avr-tools-builder -f build-container/Containerfile

avarice-rpm:
	@mkdir -p rpms/avarice
	podman run -i --rm --entrypoint="[\"/bin/bash\", \"/root/build-avarice.sh\"]" \
		-v ./avarice:/root/rpmbuild/SOURCES:Z \
		-v ./rpms/avarice:/root/rpmbuild/RPMS/x86_64/:Z avr-tools-builder

avr-gdb-rpm:
	@mkdir -p rpms/avr-gdb
	podman run -i --rm --entrypoint="[\"/bin/bash\", \"/root/build-avr-gdb.sh\"]"\
		-v ./avr-gdb:/root/rpmbuild/SOURCES:Z \
		-v ./rpms/avr-gdb:/root/rpmbuild/RPMS/x86_64:Z avr-tools-builder
