From: joel@joelfernandes.org (Joel Fernandes)
Date: Tue, 5 Mar 2019 11:27:00 -0500
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190304140059.5t2bhq7x27jbiuqx@e107158-lin.cambridge.arm.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <20190304140059.5t2bhq7x27jbiuqx@e107158-lin.cambridge.arm.com>
Message-ID: <20190305162700.GB78911@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190305162700.3lUVJ-mH53uI5TBRftG8uiTFhaG6sUGAw9PouimYBps@z>

On Mon, Mar 04, 2019@02:00:59PM +0000, Qais Yousef wrote:
> On 03/01/19 11:08, Joel Fernandes (Google) wrote:
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
> 
> I could get the headers using this patch in both built-in and modules options.
> 
> You can add my tested-and-reviewed-by: Qais Yousef <qais.yousef at arm.com>
> 
> I am not familiar with running kselftests so didn't get a chance to try the
> next patch.

Thanks a lot for testing! Will repost with the tags soon.

 - Joel
