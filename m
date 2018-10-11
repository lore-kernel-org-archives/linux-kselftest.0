From: gorcunov at gmail.com (Cyrill Gorcunov)
Date: Fri, 12 Oct 2018 01:00:09 +0300
Subject: [PATCH] proc: fix proc-self-map-files selftest for arm
In-Reply-To: <20181011213006.GA13485@avx2>
References: <20181011184359.15627-1-rafael.tinoco@linaro.org>
 <20181011205601.GA32757@avx2> <20181011210256.GE2401@uranus.lan>
 <20181011213006.GA13485@avx2>
Message-ID: <20181011220009.GF2401@uranus.lan>

On Fri, Oct 12, 2018 at 12:30:06AM +0300, Alexey Dobriyan wrote:
> On Fri, Oct 12, 2018 at 12:02:56AM +0300, Cyrill Gorcunov wrote:
> > On Thu, Oct 11, 2018 at 11:56:01PM +0300, Alexey Dobriyan wrote:
> > > 
> > > As the comment in the beginning says this test is specifically for addresss 0.
> > > Maybe it should be ifdeffed with __arm__ then.
> > 
> > Is there some other reason than allocating non-mergable VMA?
> 
> IIRC the reason is to test address 0 as it is effectively banned
> for userspace so if it will be broken, it will be broken silently
> for a long time.

This is rather a side effect of the test because the primary reason
was to check procfs numbers conversion, right? Don't get me wrong,
I don't mind about __arm__ define or similar, this is fine for
one architecture, but if there comes more we will get a number
of #ifdefs which is unrelated to procfs numeric routines at all.

> As for "unmergeable" libc here doesn't map /dev/zero. I know how to
> avoid even theoretical breakage by creating binaries by hand but it
> will be probably too much.

Sure.
