From: olof at lixom.net (Olof Johansson)
Date: Wed, 10 Apr 2019 08:07:25 -0700
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <20190408203601.GF133872@google.com>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <20190408203601.GF133872@google.com>
Message-ID: <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>

On Mon, Apr 8, 2019 at 1:36 PM Joel Fernandes <joel at joelfernandes.org> wrote:
>
> On Mon, Apr 08, 2019 at 09:29:30AM -0700, Olof Johansson wrote:
> > Hi,
> >
> > On Wed, Mar 20, 2019 at 9:31 AM Joel Fernandes (Google)
> > <joel at joelfernandes.org> wrote:
> > >
> > > Introduce in-kernel headers and other artifacts which are made available
> > > as an archive through proc (/proc/kheaders.tar.xz file). This archive makes
> > > it possible to build kernel modules, run eBPF programs, and other
> > > tracing programs that need to extend the kernel for tracing purposes
> > > without any dependency on the file system having headers and build
> > > artifacts.
> > >
> > > On Android and embedded systems, it is common to switch kernels but not
> > > have kernel headers available on the file system. Further once a
> > > different kernel is booted, any headers stored on the file system will
> > > no longer be useful. By storing the headers as a compressed archive
> > > within the kernel, we can avoid these issues that have been a hindrance
> > > for a long time.
> > >
> > > The best way to use this feature is by building it in. Several users
> > > have a need for this, when they switch debug kernels, they donot want to
> > > update the filesystem or worry about it where to store the headers on
> > > it. However, the feature is also buildable as a module in case the user
> > > desires it not being part of the kernel image. This makes it possible to
> > > load and unload the headers from memory on demand. A tracing program, or
> > > a kernel module builder can load the module, do its operations, and then
> > > unload the module to save kernel memory. The total memory needed is 3.8MB.
> > >
> > > By having the archive available at a fixed location independent of
> > > filesystem dependencies and conventions, all debugging tools can
> > > directly refer to the fixed location for the archive, without concerning
> > > with where the headers on a typical filesystem which significantly
> > > simplifies tooling that needs kernel headers.
> > >
> > > The code to read the headers is based on /proc/config.gz code and uses
> > > the same technique to embed the headers.
> > >
> > > To build a module, the below steps have been tested on an x86 machine:
> > > modprobe kheaders
> > > rm -rf $HOME/headers
> > > mkdir -p $HOME/headers
> > > tar -xvf /proc/kheaders.tar.xz -C $HOME/headers >/dev/null
> > > cd my-kernel-module
> > > make -C $HOME/headers M=$(pwd) modules
> > > rmmod kheaders
> > >
> > > Additional notes:
> > > (1) external modules must be built on the same arch as the host that
> > > built vmlinux. This can be done either in a qemu emulated chroot on the
> > > target, or natively. This is due to host arch dependency of kernel
> > > scripts.
> > >
> > > (2)
> > > If module building is used, since Module.symvers is not available in the
> > > archive due to a cyclic dependency with building of the archive into the
> > > kernel or module binaries, the modules built using the archive will not
> > > contain symbol versioning (modversion). This is usually not an issue
> > > since the idea of this patch is to build a kernel module on the fly and
> > > load it into the same kernel. An appropriate warning is already printed
> > > by the kernel to alert the user of modules not having modversions when
> > > built using the archive. For building with modversions, the user can use
> > > traditional header packages. For our tracing usecases, we build modules
> > > on the fly with this so it is not a concern.
> > >
> > > (3) I have left IKHD_ST and IKHD_ED markers as is to facilitate
> > > future patches that would extract the headers from a kernel or module
> > > image.
> > >
> > > (v4 was Tested-by the following folks,
> > >  v5 only has minor changes and has passed my testing).
> > > Tested-by: qais.yousef at arm.com
> > > Tested-by: dietmar.eggemann at arm.com
> > > Tested-by: linux at manojrajarao.com
> > > Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> >
> > Sorry to be late at the party with this kind of feedback, but I find
> > the whole ".tar.gz in procfs" to be an awkward solution, especially if
> > there's expected to be userspace tooling that depends on this
> > long-term.
>
> No problem, your feedback is welcome.
>
> > Wouldn't it be more convenient to provide it in a standardized format
> > such that you won't have to take an additional step, and always have
> > This is that form IMO.
>
> The location of the archive is fixed/known. If you are talking of the
> location where the user decompresses it to, then they a;ready know where they
> are decompressing to.

The location _of_ the archive, sure. But the format of what is in the
tarball, how it is versioned, and how to manage it will have to be
done by every user.

For any script that doesn't depend on some shared system state that
wants to, say, build a eBPF program and load it, it would need to
extract the tarball from scratch to make sure it is the current
correct version of it.

If that's required by all users, why not just present the data in a
way that it can be used directly?

> > Something like:
> >
> >  - Pseudo-filesystem, that can just be mounted under
> > /sys/kernel/headers or something (similar to debugfs or
> > /proc/device-tree).
>
> The headers are huge if uncompressed (~30MB). Currently we use xz compression
> in the archive. It would be a huge waste to decompress everything into
> memory such as through an in-memory filesystem. And compressing on a
> per-file basis would be too slow for build time. Currently the build of the
> archive is extrememly fast.

Keeping it around at all times in memory seems like a significant
waste, I agree.

Providing a standard way of presenting the contents without more
requirements on userspace, and without building up new cargo cult
methods for how to prepare the headers, would still be useful though
(see below).

> >  - Exporting something like a squashfs image instead, allowing
> > loopback mounting of it (or by providing a pseudo-/dev entry for it),
> > again allowing direct export of the contents and avoiding the
> > extracted directory from being out of sync with currently running
> > kernel.
>
> One drawback of squashfs (other than possibly the compression ratio) is that
> this would be kernel build unfriendly in comparison to tar+xz. On my machine,
> squashfs-tools needed to be installed. For users who don't have this package,
> that would break their kernel build.

Adding a new tool that is required to use a new feature isn't that bad
-- it's not like you're breaking the build for everyone.

We've also done this before in the past, by importing the tools into
the kernel tree if needed. It can be solved.

> > Having to copy and extract the tarball is the most awkward step, IMHO.
> > I also find the waste of kernel memory for it to be an issue, but
> > given that it can be built as a module I guess that's the obvious
> > solution for those who care about memory consumption.
>
> Yes. We discussed in previous threads that for users who really want the
> archive to be completely uncompressed and in-memory, can just load the
> module, decompress into tmpfs, and unload the module. That is an extra step,
> yes.

Most users will need to decompress it every time they use it anyway,
especially if there's no versioned prefix in the tarball that they can
use to key to a previously decompressed version with the exact same
kernel version and config.

So, if you need to do that anyway, wouldn't it be easier if you just
mounted a FS to get to it. If you're on a system where you can't use
it in-place for resource reasons, you can copy it off and unmount it.
No extra tools needed in userspace then at run/use time.

Said filesystem could be populated by a compressed cpio archive since
we already have code in the kernel to do this for initramfs, and could
do so at mount time -- and at unmount time it'd be freed up.

If you absolutely need to export a file to userspace with the archive,
my suggestion is to do it through debugfs. That way the format isn't
in a /proc ABI that can't be changed in the future (debugfs isn't
required to be stable in the same way). This way we can change the
format carried in the kernel over time without changing the official
way we present the data to userspace (via a filesystem view).

As far as format goes; there's clear precedent on cpio being used and
supported; we already have build time requirements on the userspace
tools with some options. Using tar would actually be a new dependency
even if it is a common tool to have installed. With a self-populating
FS, there's no new tool requirements on the runtime side either.

> We had close to 2-3 months of discussions now with various folks up until v5.
> I am about to post v6 which is in line with Masahiro Yamada's expecations. In
> that I will be dropping module building artifacts due to his module building
> concerns and only include the headers.

I've found some of the old discussion and read up on it. I think it
was pretty quick at dismissing ideas for more robust implementations
("it needs squashfs-tools"), and had some narrow viewpoints (exporting
a tarball is the least amount of kernel change, while adding
complexity at the system/usage side).

I'd also like to clarify: I'm not opposed to the general idea of
providing the needed headers with the kernel somehow. I just think
it's worth spending effort making sure an interface for it that we'll
need to live with forever is appropriately thought through and not
rushed in, especially since we're likely to get substantial
infrastructure on top of it quickly (eBPF and friends in particular).


-Olof
