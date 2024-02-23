


RDEPENDS_kernel-base = ""
KERNEL_IMAGETYPE_zynq ?= "zImage"
do_configure[depends] += "kern-tools-native:do_populate_sysroot"
SRC_URI += "file://plnx_kernel.cfg"
FILESEXTRAPATHS_prepend := "${THISDIR}/configs:"

do_configure_append () {
	merge_config.sh -m ${B}/.config ${@" ".join(find_sccs(d))}
	oe_runmake -C ${S} O=${B} oldconfig
}

do_deploy_append () {
	install -m 0644 ${D}/boot/System.map-${KERNEL_VERSION} ${DEPLOYDIR}/System.map.linux
	install -m 0644 ${D}/boot/vmlinux-${KERNEL_VERSION} ${DEPLOYDIR}/vmlinux
}
