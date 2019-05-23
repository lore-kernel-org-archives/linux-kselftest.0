From: catalin.marinas@arm.com (Catalin Marinas)
Date: Thu, 23 May 2019 17:57:09 +0100
Subject: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
In-Reply-To: <20190523104256.GX28398@e103592.cambridge.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <20190521184856.GC2922@ziepe.ca>
 <20190522134925.GV28398@e103592.cambridge.arm.com>
 <20190523002052.GF15389@ziepe.ca>
 <20190523104256.GX28398@e103592.cambridge.arm.com>
Message-ID: <20190523165708.q6ru7xg45aqfjzpr@mbp>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523165709.GF50m0vVUKfzicfzp5CYRKZZRybnBuxbIMnd6idSkhs@z>

On Thu, May 23, 2019@11:42:57AM +0100, Dave P Martin wrote:
> On Wed, May 22, 2019@09:20:52PM -0300, Jason Gunthorpe wrote:
> > On Wed, May 22, 2019@02:49:28PM +0100, Dave Martin wrote:
> > > If multiple people will care about this, perhaps we should try to
> > > annotate types more explicitly in SYSCALL_DEFINEx() and ABI data
> > > structures.
> > > 
> > > For example, we could have a couple of mutually exclusive modifiers
> > > 
> > > T __object *
> > > T __vaddr * (or U __vaddr)
> > > 
> > > In the first case the pointer points to an object (in the C sense)
> > > that the call may dereference but not use for any other purpose.
> > 
> > How would you use these two differently?
> > 
> > So far the kernel has worked that __user should tag any pointer that
> > is from userspace and then you can't do anything with it until you
> > transform it into a kernel something
> 
> Ultimately it would be good to disallow casting __object pointers execpt
> to compatible __object pointer types, and to make get_user etc. demand
> __object.
> 
> __vaddr pointers / addresses would be freely castable, but not to
> __object and so would not be dereferenceable even indirectly.

I think it gets too complicated and there are ambiguous cases that we
may not be able to distinguish. For example copy_from_user() may be used
to copy a user data structure into the kernel, hence __object would
work, while the same function may be used to copy opaque data to a file,
so __vaddr may be a better option (unless I misunderstood your
proposal).

We currently have T __user * and I think it's a good starting point. The
prior attempt [1] was shut down because it was just hiding the cast
using __force. We'd need to work through those cases again and rather
start changing the function prototypes to avoid unnecessary casting in
the callers (e.g. get_user_pages(void __user *) or come up with a new
type) while changing the explicit casting to a macro where it needs to
be obvious that we are converting a user pointer, potentially typed
(tagged), to an untyped address range. We may need a user_ptr_to_ulong()
macro or similar (it seems that we have a u64_to_user_ptr, wasn't aware
of it).

It may actually not be far from what you suggested but I'd keep the
current T __user * to denote possible dereference.

[1] https://lore.kernel.org/lkml/5d54526e5ff2e5ad63d0dfdd9ab17cf359afa4f2.1535629099.git.andreyknvl at google.com/

-- 
Catalin
