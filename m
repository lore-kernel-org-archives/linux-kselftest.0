From: catalin.marinas@arm.com (Catalin Marinas)
Date: Thu, 30 May 2019 17:57:18 +0100
Subject: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
In-Reply-To: <f79336b5-46b4-39c0-b754-23366207e32d@oracle.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
 <20190528145411.GA709@e119886-lin.cambridge.arm.com>
 <20190528154057.GD32006@arrakis.emea.arm.com>
 <11193998209cc6ff34e7d704f081206b8787b174.camel@oracle.com>
 <20190529142008.5quqv3wskmpwdfbu@mbp>
 <b2753e81-7b57-481f-0095-3c6fecb1a74c@oracle.com>
 <20190530151105.GA35418@arrakis.emea.arm.com>
 <f79336b5-46b4-39c0-b754-23366207e32d@oracle.com>
Message-ID: <20190530165717.GC35418@arrakis.emea.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190530165718.2Ax0F9EIZK3PWZea8AA2RGm_MoG927kvHAS9IyU-e_M@z>

On Thu, May 30, 2019@10:05:55AM -0600, Khalid Aziz wrote:
> On 5/30/19 9:11 AM, Catalin Marinas wrote:
> > So if a database program is doing an anonymous mmap(PROT_TBI) of 100GB,
> > IIUC for sparc the faulted-in pages will have random colours (on 64-byte
> > granularity). Ignoring the information leak from prior uses of such
> > pages, it would be the responsibility of the db program to issue the
> > stxa. On arm64, since we also want to do this via malloc(), any large
> > allocation would require all pages to be faulted in so that malloc() can
> > set the write colour before being handed over to the user. That's what
> > we want to avoid and the user is free to repaint the memory as it likes.
> 
> On sparc, any newly allocated page is cleared along with any old tags on
> it. Since clearing tag happens automatically when page is cleared on
> sparc, clear_user_page() will need to execute additional stxa
> instructions to set a new tag. It is doable. In a way it is done already
> if page is being pre-colored with tag 0 always ;)

Ah, good to know. On arm64 we'd have to use different instructions,
although the same loop.

> Where would the pre-defined tag be stored - as part of address stored
> in vm_start or a new field in vm_area_struct?

I think we can discuss the details when we post the actual MTE patches.
In our internal hack we overloaded the VM_HIGH_ARCH_* flags and selected
CONFIG_ARCH_USES_HIGH_VMA_FLAGS (used for pkeys on x86).

For the time being, I'd rather restrict tagged addresses passed to
mmap() until we agreed that they have any meaning. If we allowed them
now but get ignored (though probably no-one would be doing this), I feel
it's slightly harder to change the semantics afterwards.

Thanks.

-- 
Catalin
