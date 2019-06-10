From: catalin.marinas at arm.com (Catalin Marinas)
Date: Mon, 10 Jun 2019 15:28:25 +0100
Subject: [PATCH v16 05/16] arm64: untag user pointers passed to memory
 syscalls
In-Reply-To: <045a94326401693e015bf80c444a4d946a5c68ed.1559580831.git.andreyknvl@google.com>
References: <cover.1559580831.git.andreyknvl@google.com>
 <045a94326401693e015bf80c444a4d946a5c68ed.1559580831.git.andreyknvl@google.com>
Message-ID: <20190610142824.GB10165@c02tf0j2hf1t.cambridge.arm.com>

On Mon, Jun 03, 2019 at 06:55:07PM +0200, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
> 
> This patch allows tagged pointers to be passed to the following memory
> syscalls: get_mempolicy, madvise, mbind, mincore, mlock, mlock2, mprotect,
> mremap, msync, munlock.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>

I would add in the commit log (and possibly in the code with a comment)
that mremap() and mmap() do not currently accept tagged hint addresses.
Architectures may interpret the hint tag as a background colour for the
corresponding vma. With this:

Reviewed-by: Catalin Marinas <catalin.marinas at arm.com>

-- 
Catalin
