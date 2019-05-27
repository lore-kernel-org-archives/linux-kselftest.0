From: catalin.marinas at arm.com (Catalin Marinas)
Date: Mon, 27 May 2019 10:42:48 +0100
Subject: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
In-Reply-To: <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
Message-ID: <20190527094247.GA45660@MBP.local>

On Mon, May 06, 2019 at 06:30:51PM +0200, Andrey Konovalov wrote:
> +SYSCALL_DEFINE2(arm64_mlock2, unsigned long, start, size_t, len)
> +{
> +	start = untagged_addr(start);
> +	return ksys_mlock(start, len, VM_LOCKED);
> +}

Copy/paste error: sys_mlock2() has 3 arguments and should call
ksys_mlock2().

Still tracking down an LTP failure on test mlock01.

-- 
Catalin
