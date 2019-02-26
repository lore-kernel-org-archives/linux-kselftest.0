From: luc.vanoostenryck at gmail.com (Luc Van Oostenryck)
Date: Wed, 27 Feb 2019 00:17:49 +0100
Subject: [PATCH v10 00/12] arm64: untag user pointers passed to the kernel
In-Reply-To: <CAAeHK+xCi2MxaykYWCz9mwbOzNpjrFcHex7B-VXektNNWBT+Hw@mail.gmail.com>
References: <cover.1550839937.git.andreyknvl@google.com>
 <2ad5f897-25c0-90cf-f54f-827876873a0a@intel.com>
 <CAAeHK+xCi2MxaykYWCz9mwbOzNpjrFcHex7B-VXektNNWBT+Hw@mail.gmail.com>
Message-ID: <20190226231747.z3lc6yr6xmrw5q2z@ltop.local>

On Tue, Feb 26, 2019 at 06:18:25PM +0100, Andrey Konovalov wrote:
> On Fri, Feb 22, 2019 at 11:55 PM Dave Hansen <dave.hansen at intel.com> wrote:
> >
> > On 2/22/19 4:53 AM, Andrey Konovalov wrote:
> > > The following testing approaches has been taken to find potential issues
> > > with user pointer untagging:
> > >
> > > 1. Static testing (with sparse [3] and separately with a custom static
> > >    analyzer based on Clang) to track casts of __user pointers to integer
> > >    types to find places where untagging needs to be done.
> >
> > First of all, it's really cool that you took this approach.  Sounds like
> > there was a lot of systematic work to fix up the sites in the existing
> > codebase.
> >
> > But, isn't this a _bit_ fragile going forward?  Folks can't just "make
> > sparse" to find issues with missing untags.
> 
> Yes, this static approach can only be used as a hint to find some
> places where untagging is needed, but certainly not all.
> 
> > This seems like something
> > where we would ideally add an __tagged annotation (or something) to the
> > source tree and then have sparse rules that can look for missed untags.
> 
> This has been suggested before, search for __untagged here [1].
> However there are many places in the kernel where a __user pointer is
> casted into unsigned long and passed further. I'm not sure if it's
> possible apply a __tagged/__untagged kind of attribute to non-pointer
> types, is it?
> 
> [1] https://patchwork.kernel.org/patch/10581535/

It's something that should need to be added to sparse since it's
different from what sparse already have (the existing __bitwise and
concept of address-space doesn't seem to do the job here).

-- Luc Van Oostenryck
