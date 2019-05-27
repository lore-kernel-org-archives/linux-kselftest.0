From: catalin.marinas@arm.com (Catalin Marinas)
Date: Mon, 27 May 2019 15:37:20 +0100
Subject: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
In-Reply-To: <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
Message-ID: <20190527143719.GA59948@MBP.local>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190527143720.lxpb2tbUT4d_Bu422bkIBLpEmJc63Iwb3GPkGhAzsqs@z>

On Mon, May 06, 2019@06:30:51PM +0200, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
> 
> This patch allows tagged pointers to be passed to the following memory
> syscalls: brk, get_mempolicy, madvise, mbind, mincore, mlock, mlock2,
> mmap, mmap_pgoff, mprotect, mremap, msync, munlock, munmap,
> remap_file_pages, shmat and shmdt.
> 
> This is done by untagging pointers passed to these syscalls in the
> prologues of their handlers.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>

Actually, I don't think any of these wrappers get called (have you
tested this patch?). Following commit 4378a7d4be30 ("arm64: implement
syscall wrappers"), I think we have other macro names for overriding the
sys_* ones.

-- 
Catalin
