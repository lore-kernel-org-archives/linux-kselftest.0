From: joel@joelfernandes.org (Joel Fernandes)
Date: Thu, 7 Mar 2019 10:03:43 -0500
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
Message-ID: <20190307150343.GB258852@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190307150343.jeIE7exXDZFd0H1IlI7ee5oyRfy3kvc111Zv7jqEy08@z>

On Thu, Mar 07, 2019@09:58:24AM +0100, Geert Uytterhoeven wrote:
> Hi Joel,
> 
> On Fri, Mar 1, 2019 at 5:10 PM Joel Fernandes (Google)
> <joel@joelfernandes.org> wrote:
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
> 
> As the usage pattern will be accessing the individual files, what about
> implementing a file system that provides read-only access to the internal
> kheaders archive?
> 
>     mount kheaders $HOME/headers -t kheaders

I thought about it already. This is easier said than done though. The archive
is compressed from 40MB to 3.6MB. If we leave it uncompressed in RAM, then it
will take up the entire 40MB of RAM and in Android we don't even use
disk-based swap.

So we will need some kind of intra file compressed memory representation that
a filesystem can use for the backing store. I thought of RAM-backed squashfs
but it requires squashfs-tools to be installed at build time (which my host
distro itself didn't have).

It is just so much easier to use tar + xz at build time, and leave the
decompression task to the user. After decompression, the files will live on
the disk and the page-cache mechanism will free memory when/if the files fall
off the LRUs.

WDYT?

thanks,

  - Joel
