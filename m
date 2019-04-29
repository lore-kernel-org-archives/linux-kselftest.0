From: gregkh@linuxfoundation.org (Greg KH)
Date: Mon, 29 Apr 2019 15:54:55 +0200
Subject: [PATCH v7 resend 1/2] Provide in-kernel headers to make
 extending kernel easier
In-Reply-To: <20190429132602.GA165075@google.com>
References: <20190426190430.172543-1-joel@joelfernandes.org>
 <20190427133844.GA29366@kroah.com>
 <20190429132602.GA165075@google.com>
Message-ID: <20190429135455.GA2412@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429135455.rLF9GS-e6YweWK2dL_hmvZ3jd2EJkW2vvielrWQ49nw@z>

On Mon, Apr 29, 2019@09:26:02AM -0400, Joel Fernandes wrote:
> On Sat, Apr 27, 2019@03:38:44PM +0200, Greg KH wrote:
> > On Fri, Apr 26, 2019@03:04:29PM -0400, Joel Fernandes (Google) wrote:
> > > Introduce in-kernel headers which are made available as an archive
> > > through proc (/proc/kheaders.tar.xz file). This archive makes it
> > > possible to run eBPF and other tracing programs that need to extend the
> > > kernel for tracing purposes without any dependency on the file system
> > > having headers.
> > > 
> > > A github PR is sent for the corresponding BCC patch at:
> > > https://github.com/iovisor/bcc/pull/2312
> > > 
> > > On Android and embedded systems, it is common to switch kernels but not
> > > have kernel headers available on the file system. Further once a
> > > different kernel is booted, any headers stored on the file system will
> > > no longer be useful. This is an issue even well known to distros.
> > > By storing the headers as a compressed archive within the kernel, we can
> > > avoid these issues that have been a hindrance for a long time.
> > > 
> > > The best way to use this feature is by building it in. Several users
> > > have a need for this, when they switch debug kernels, they do not want to
> > > update the filesystem or worry about it where to store the headers on
> > > it. However, the feature is also buildable as a module in case the user
> > > desires it not being part of the kernel image. This makes it possible to
> > > load and unload the headers from memory on demand. A tracing program can
> > > load the module, do its operations, and then unload the module to save
> > > kernel memory. The total memory needed is 3.3MB.
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
> > > Other approaches were discussed such as having an in-memory mountable
> > > filesystem, but that has drawbacks such as requiring an in-kernel xz
> > > decompressor which we don't have today, and requiring usage of 42 MB of
> > > kernel memory to host the decompressed headers at anytime. Also this
> > > approach is simpler than such approaches.
> > > 
> > > Reviewed-by: Masahiro Yamada <yamada.masahiro at socionext.com>
> > > Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> > 
> > Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> 
> Thanks for the Reviewed-by tag. I believe there are still 2 logistical things
> to merge this.
> 1. Location of the header archive:
> Olof and Steve did not like it to be in /proc and instead /sys seemed a better
> choice they are Ok with. Me and Greg were Ok with it being in /sys/kernel/.
> Alexei, Greg and me are Ok with either proc or Sys.

As you say, either is fine with me.

> 2. Who is going to pull this patch: This seems a matter of where the header
> archive resides. If it is in /sys/kernel/ then I am assuming Greg will pull
> it.  Masahiro has given his Reviewed-by tag, is he the one to pull it?

I can take it, but it probably should just go through the kbuild tree,
as that makes more sense to me.

thanks,

greg k-h
