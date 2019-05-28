From: andrew.murray at arm.com (Andrew Murray)
Date: Tue, 28 May 2019 15:54:11 +0100
Subject: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
In-Reply-To: <20190527143719.GA59948@MBP.local>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
Message-ID: <20190528145411.GA709@e119886-lin.cambridge.arm.com>

On Mon, May 27, 2019 at 03:37:20PM +0100, Catalin Marinas wrote:
> On Mon, May 06, 2019 at 06:30:51PM +0200, Andrey Konovalov wrote:
> > This patch is a part of a series that extends arm64 kernel ABI to allow to
> > pass tagged user pointers (with the top byte set to something else other
> > than 0x00) as syscall arguments.
> > 
> > This patch allows tagged pointers to be passed to the following memory
> > syscalls: brk, get_mempolicy, madvise, mbind, mincore, mlock, mlock2,
> > mmap, mmap_pgoff, mprotect, mremap, msync, munlock, munmap,
> > remap_file_pages, shmat and shmdt.
> > 
> > This is done by untagging pointers passed to these syscalls in the
> > prologues of their handlers.
> > 
> > Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> 
> Actually, I don't think any of these wrappers get called (have you
> tested this patch?). Following commit 4378a7d4be30 ("arm64: implement
> syscall wrappers"), I think we have other macro names for overriding the
> sys_* ones.

What is the value in adding these wrappers?

The untagged_addr macro is defined for all in linux/mm.h and these patches
already use untagged_addr in generic code. Thus adding a few more
untagged_addr in the generic syscall handlers (which turn to a nop for most)
is surely better than adding wrappers?

Even if other architectures implement untagged_addr in the future it would
be more consistent if they untagged in the same places and thus not adding
these wrappers enforces that.

Thanks,

Andrew Murray

> 
> -- 
> Catalin
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
