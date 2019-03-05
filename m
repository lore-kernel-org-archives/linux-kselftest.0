From: joel@joelfernandes.org (Joel Fernandes)
Date: Tue, 5 Mar 2019 11:25:23 -0500
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <934dc2dc-18b6-bc7c-9845-dac0577f7b47@arm.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <934dc2dc-18b6-bc7c-9845-dac0577f7b47@arm.com>
Message-ID: <20190305162523.GA78911@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190305162523.1cSnUcMC-_DdRzLo6m-cBaFPEOYYRbcFKQXwh7yYSUQ@z>

On Mon, Mar 04, 2019@11:48:52PM +0100, Dietmar Eggemann wrote:
> On 3/1/19 5:08 PM, Joel Fernandes (Google) wrote:
> > Introduce in-kernel headers and other artifacts which are made available
> > as an archive through proc (/proc/kheaders.tar.xz file). This archive makes
> > it possible to build kernel modules, run eBPF programs, and other
> > tracing programs that need to extend the kernel for tracing purposes
> > without any dependency on the file system having headers and build
> > artifacts.
> > 
> > On Android and embedded systems, it is common to switch kernels but not
> > have kernel headers available on the file system. Raw kernel headers
> > also cannot be copied into the filesystem like they can be on other
> > distros, due to licensing and other issues. There's no linux-headers
> > package on Android. Further once a different kernel is booted, any
> > headers stored on the file system will no longer be useful. By storing
> > the headers as a compressed archive within the kernel, we can avoid these
> > issues that have been a hindrance for a long time.
> > 
> > The feature is also buildable as a module just in case the user desires
> > it not being part of the kernel image. This makes it possible to load
> > and unload the headers on demand. A tracing program, or a kernel module
> > builder can load the module, do its operations, and then unload the
> > module to save kernel memory. The total memory needed is 3.8MB.
> > 
> > The code to read the headers is based on /proc/config.gz code and uses
> > the same technique to embed the headers.
> > 
> > To build a module, the below steps have been tested on an x86 machine:
> > modprobe kheaders
> > rm -rf $HOME/headers
> > mkdir -p $HOME/headers
> > tar -xvf /proc/kheaders.tar.xz -C $HOME/headers >/dev/null
> > cd my-kernel-module
> > make -C $HOME/headers M=$(pwd) modules
> > rmmod kheaders
> > 
> > Additional notes:
> > (1) external modules must be built on the same arch as the host that
> > built vmlinux. This can be done either in a qemu emulated chroot on the
> > target, or natively. This is due to host arch dependency of kernel
> > scripts.
> > 
> > (2)
> > A limitation of module building with this is, since Module.symvers is
> > not available in the archive due to a cyclic dependency with building of
> > the archive into the kernel or module binaries, the modules built using
> > the archive will not contain symbol versioning (modversion). This is
> > usually not an issue since the idea of this patch is to build a kernel
> > module on the fly and load it into the same kernel. An appropriate
> > warning is already printed by the kernel to alert the user of modules
> > not having modversions when built using the archive. For building with
> > modversions, the user can use traditional header packages. For our
> > tracing usecases, we build modules on the fly with this so it is not a
> > concern.
> > 
> > (3) I have left IKHD_ST and IKHD_ED markers as is to facilitate
> > future patches that would extract the headers from a kernel or module
> > image.
> > 
> > Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> > ---
> > 
> >      Changes since v3:
> >      - Blank tar was being generated because of a one line I
> >        forgot to push. It is updated now.
> >      - Added module.lds since arm64 needs it to build modules.
> 
> Tested on x86 with eBPF scripts and exporting an alternative
> BCC_KERNEL_SOURCE.
> 
> Tested-by: Dietmar Eggemann <dietmar.eggemann at arm.com>

Thank you! Will repost with the tags soon.

- Joel
