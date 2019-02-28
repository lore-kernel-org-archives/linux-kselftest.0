From: joel at joelfernandes.org (Joel Fernandes)
Date: Thu, 28 Feb 2019 10:00:54 -0500
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190228173444.54403795211d80ba540b61cb@kernel.org>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <20190228173444.54403795211d80ba540b61cb@kernel.org>
Message-ID: <20190228150054.GB156098@google.com>

On Thu, Feb 28, 2019 at 05:34:44PM +0900, Masami Hiramatsu wrote:
> Hi Joel,
> 
> On Wed, 27 Feb 2019 14:37:47 -0500
> "Joel Fernandes (Google)" <joel at joelfernandes.org> wrote:
> 
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
> 
> Hmm, isn't it easier to add kernel-headers package on Android?

I have already been down that road. In the Android ecosystem, the Android
teams only provide a "userspace system image" which goes on the system
partition of the flash (and a couple other images are also provided but
system is the main one). The system image cannot contain GPL source code. It
is also not possible to put kernel headers for every kernel version on the
system images that ship and is not practical. Android boots on 1000s of forked
kernels. It does not make sense to provide headers on the system image for
every kernel version and I already had many discussions on the subject with
the teams, it is something that is just not done. Now for kernel modules,
there's another image called the "vendor image" which is flashed onto the
vendor parition, this is where kernel modules go.  This vendor image is not
provided by Google for non-Pixel devices. So we have no control over what
goes there BUT we do know that kernel modules that are enabled will go there,
and we do have control over enforcing that certain kernel modules should be
built and available as they are mandatory for Android to function properly.
We would also possibly make it a built-in option as well. Anyway my point is
keeping it in the kernel is really the easiest and the smartest choice IMO.

> > The feature is also buildable as a module just in case the user desires
> > it not being part of the kernel image. This makes it possible to load
> > and unload the headers on demand. A tracing program, or a kernel module
> > builder can load the module, do its operations, and then unload the
> > module to save kernel memory. The total memory needed is 3.8MB.
> 
> But it also requires to install build environment (tools etc.)
> on the target system...

Yes, that's true. Check the other thread with Masahiro that we are discussing
this point on and let us continue discussing there:
https://lore.kernel.org/patchwork/patch/1046307/#1238223
https://lore.kernel.org/patchwork/patch/1046307/#1238491

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
> It seems a bit complex, but no difference from compared with carrying
> kheaders.tar.gz. I think we would better have a psudo filesystem
> which can mount this compressed header file directly :) Then it becomes
> simpler, like
> 
> modprobe headerfs
> mkdir $HOME/headers
> mount -t headerfs $HOME/headers
> 
> And this doesn't consume any disk-space.

I felt using a compressed tar is really the easiest way because of all the
tools are already available. There isn't a compressed in-ram filesystem right
now that I'm aware off that can achieve the kind of high compression ratio
this patchset does.

thanks,

 - Joel
