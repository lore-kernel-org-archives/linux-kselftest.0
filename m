From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 1 Mar 2019 11:28:26 +0900
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190228150054.GB156098@google.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <20190228173444.54403795211d80ba540b61cb@kernel.org>
 <20190228150054.GB156098@google.com>
Message-ID: <20190301112826.ced40b59fb7e8118fa5b40d6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190301022826._lBj-g_2j26e0pK6b2TS3eBlOh8s7fk3Wfi1kr-zJSg@z>

Hi Joel,

On Thu, 28 Feb 2019 10:00:54 -0500
Joel Fernandes <joel@joelfernandes.org> wrote:

> > Hmm, isn't it easier to add kernel-headers package on Android?
> 
> I have already been down that road. In the Android ecosystem, the Android
> teams only provide a "userspace system image" which goes on the system
> partition of the flash (and a couple other images are also provided but
> system is the main one). The system image cannot contain GPL source code. It
> is also not possible to put kernel headers for every kernel version on the
> system images that ship and is not practical. Android boots on 1000s of forked
> kernels. It does not make sense to provide headers on the system image for
> every kernel version and I already had many discussions on the subject with
> the teams, it is something that is just not done. Now for kernel modules,
> there's another image called the "vendor image" which is flashed onto the
> vendor parition, this is where kernel modules go.  This vendor image is not
> provided by Google for non-Pixel devices. So we have no control over what
> goes there BUT we do know that kernel modules that are enabled will go there,
> and we do have control over enforcing that certain kernel modules should be
> built and available as they are mandatory for Android to function properly.
> We would also possibly make it a built-in option as well. Anyway my point is
> keeping it in the kernel is really the easiest and the smartest choice IMO.

Sorry, I'm not convinced yet. This sounds like "because Android decided not
to put the header files on vendor partition, but kernel module is OK"
Why don't google ask vendors to put their kernel headers (or header tarball)
on vendor partition instead?

> 
> > > The feature is also buildable as a module just in case the user desires
> > > it not being part of the kernel image. This makes it possible to load
> > > and unload the headers on demand. A tracing program, or a kernel module
> > > builder can load the module, do its operations, and then unload the
> > > module to save kernel memory. The total memory needed is 3.8MB.
> > 
> > But it also requires to install build environment (tools etc.)
> > on the target system...
> 
> Yes, that's true. Check the other thread with Masahiro that we are discussing
> this point on and let us continue discussing there:
> https://lore.kernel.org/patchwork/patch/1046307/#1238223
> https://lore.kernel.org/patchwork/patch/1046307/#1238491
> 
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
> > 
> > It seems a bit complex, but no difference from compared with carrying
> > kheaders.tar.gz. I think we would better have a psudo filesystem
> > which can mount this compressed header file directly :) Then it becomes
> > simpler, like
> > 
> > modprobe headerfs
> > mkdir $HOME/headers
> > mount -t headerfs $HOME/headers
> > 
> > And this doesn't consume any disk-space.
> 
> I felt using a compressed tar is really the easiest way because of all the
> tools are already available.

As I asked above, if the pure tarball is useful, you can simply ask vendors
to put the header tarball on their vendor directory. I feel making it as
a module is not a right way.

> There isn't a compressed in-ram filesystem right
> now that I'm aware off that can achieve the kind of high compression ratio
> this patchset does.

I think if linux can support something like tarfs(or compressed initramfs)
in kernel, it gives linux an improvement not only a hack. :-)

Thank you,


-- 
Masami Hiramatsu <mhiramat at kernel.org>
