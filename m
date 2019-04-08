From: olof at lixom.net (Olof Johansson)
Date: Mon, 8 Apr 2019 09:29:30 -0700
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <20190320163116.39275-1-joel@joelfernandes.org>
References: <20190320163116.39275-1-joel@joelfernandes.org>
Message-ID: <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>

Hi,

On Wed, Mar 20, 2019 at 9:31 AM Joel Fernandes (Google)
<joel at joelfernandes.org> wrote:
>
> Introduce in-kernel headers and other artifacts which are made available
> as an archive through proc (/proc/kheaders.tar.xz file). This archive makes
> it possible to build kernel modules, run eBPF programs, and other
> tracing programs that need to extend the kernel for tracing purposes
> without any dependency on the file system having headers and build
> artifacts.
>
> On Android and embedded systems, it is common to switch kernels but not
> have kernel headers available on the file system. Further once a
> different kernel is booted, any headers stored on the file system will
> no longer be useful. By storing the headers as a compressed archive
> within the kernel, we can avoid these issues that have been a hindrance
> for a long time.
>
> The best way to use this feature is by building it in. Several users
> have a need for this, when they switch debug kernels, they donot want to
> update the filesystem or worry about it where to store the headers on
> it. However, the feature is also buildable as a module in case the user
> desires it not being part of the kernel image. This makes it possible to
> load and unload the headers from memory on demand. A tracing program, or
> a kernel module builder can load the module, do its operations, and then
> unload the module to save kernel memory. The total memory needed is 3.8MB.
>
> By having the archive available at a fixed location independent of
> filesystem dependencies and conventions, all debugging tools can
> directly refer to the fixed location for the archive, without concerning
> with where the headers on a typical filesystem which significantly
> simplifies tooling that needs kernel headers.
>
> The code to read the headers is based on /proc/config.gz code and uses
> the same technique to embed the headers.
>
> To build a module, the below steps have been tested on an x86 machine:
> modprobe kheaders
> rm -rf $HOME/headers
> mkdir -p $HOME/headers
> tar -xvf /proc/kheaders.tar.xz -C $HOME/headers >/dev/null
> cd my-kernel-module
> make -C $HOME/headers M=$(pwd) modules
> rmmod kheaders
>
> Additional notes:
> (1) external modules must be built on the same arch as the host that
> built vmlinux. This can be done either in a qemu emulated chroot on the
> target, or natively. This is due to host arch dependency of kernel
> scripts.
>
> (2)
> If module building is used, since Module.symvers is not available in the
> archive due to a cyclic dependency with building of the archive into the
> kernel or module binaries, the modules built using the archive will not
> contain symbol versioning (modversion). This is usually not an issue
> since the idea of this patch is to build a kernel module on the fly and
> load it into the same kernel. An appropriate warning is already printed
> by the kernel to alert the user of modules not having modversions when
> built using the archive. For building with modversions, the user can use
> traditional header packages. For our tracing usecases, we build modules
> on the fly with this so it is not a concern.
>
> (3) I have left IKHD_ST and IKHD_ED markers as is to facilitate
> future patches that would extract the headers from a kernel or module
> image.
>
> (v4 was Tested-by the following folks,
>  v5 only has minor changes and has passed my testing).
> Tested-by: qais.yousef at arm.com
> Tested-by: dietmar.eggemann at arm.com
> Tested-by: linux at manojrajarao.com
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>

Sorry to be late at the party with this kind of feedback, but I find
the whole ".tar.gz in procfs" to be an awkward solution, especially if
there's expected to be userspace tooling that depends on this
long-term.

Wouldn't it be more convenient to provide it in a standardized format
such that you won't have to take an additional step, and always have
it in a known location?

Something like:

 - Pseudo-filesystem, that can just be mounted under
/sys/kernel/headers or something (similar to debugfs or
/proc/device-tree).
 - Exporting something like a squashfs image instead, allowing
loopback mounting of it (or by providing a pseudo-/dev entry for it),
again allowing direct export of the contents and avoiding the
extracted directory from being out of sync with currently running
kernel.

Having to copy and extract the tarball is the most awkward step, IMHO.
I also find the waste of kernel memory for it to be an issue, but
given that it can be built as a module I guess that's the obvious
solution for those who care about memory consumption.


-Olof
