From: gregkh@linuxfoundation.org (Greg KH)
Date: Sat, 9 Mar 2019 13:11:41 +0100
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAMuHMdUT+UGt9p2QhOXzAtCUmqy-a8YN-ceDa-0qANJE53pWBA@mail.gmail.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
 <20190307150343.GB258852@google.com>
 <CAMuHMdW_7BTZREsnz7uMTToCZ4HDOZboMJH8k8UZica2pB=Jew@mail.gmail.com>
 <CAEXW_YQUcA+bnav20tAFQPXYE=epMie4X85diudKs_s-TJ7dsw@mail.gmail.com>
 <20190308140251.GC25768@kroah.com>
 <CAMuHMdUmnrJtu8bBeUgtiU6y_TLHM27z1WxpPia4dXMpApeijw@mail.gmail.com>
 <20190309071648.GE3882@kroah.com>
 <CAMuHMdUT+UGt9p2QhOXzAtCUmqy-a8YN-ceDa-0qANJE53pWBA@mail.gmail.com>
Message-ID: <20190309121141.GA30173@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190309121141.h5fjB1UO_qqSVfRFeHuTEy7FALwuYUj-9l6SsXQIe2M@z>

On Sat, Mar 09, 2019@12:40:01PM +0100, Geert Uytterhoeven wrote:
> > Signing keys should be kept secure, or better yet, just deleted entirely
> > after creating and signing with them.  That's what I do for my kernels
> > and I'm pretty sure that some distros also do this.  That way there's no
> > chance that someone else can sign a module and have it loaded without
> > detection, which is what signing is supposed to prevent from happening.
> 
> If you want that kind of security, there's no point in allowing to extend the
> kernel by building more kernel modules after deployment.

That's not what these files are for (in the original user's case).  They
want these for doing tracing/ebpf stuff, which require kernel headers to
build against.

> "Raw kernel headers also cannot be copied into the filesystem like they
>  can be on other distros, due to licensing and other issues. There's no
>  linux-headers package on Android."
> 
> What's the licensing issue? What's the (legal) difference between having
> the headers on the file system, and having a kernel module including the
> headers on the file system?

There is no licensing issue, see my follow-up comment about that.

It's all in ease-of-use here.  You want to build a trace function
against a running kernel, and now you have the header files for that
specific kernel right there in the kernel itself to build against.  It
doesn't get easier than that.

thanks,

greg k-h
