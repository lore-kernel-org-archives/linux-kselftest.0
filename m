From: adobriyan at gmail.com (Alexey Dobriyan)
Date: Fri, 12 Oct 2018 00:30:06 +0300
Subject: [PATCH] proc: fix proc-self-map-files selftest for arm
In-Reply-To: <20181011210256.GE2401@uranus.lan>
References: <20181011184359.15627-1-rafael.tinoco@linaro.org>
 <20181011205601.GA32757@avx2> <20181011210256.GE2401@uranus.lan>
Message-ID: <20181011213006.GA13485@avx2>

On Fri, Oct 12, 2018 at 12:02:56AM +0300, Cyrill Gorcunov wrote:
> On Thu, Oct 11, 2018 at 11:56:01PM +0300, Alexey Dobriyan wrote:
> > 
> > As the comment in the beginning says this test is specifically for addresss 0.
> > Maybe it should be ifdeffed with __arm__ then.
> 
> Is there some other reason than allocating non-mergable VMA?

IIRC the reason is to test address 0 as it is effectively banned
for userspace so if it will be broken, it will be broken silently
for a long time.

As for "unmergeable" libc here doesn't map /dev/zero. I know how to
avoid even theoretical breakage by creating binaries by hand but it
will be probably too much.
