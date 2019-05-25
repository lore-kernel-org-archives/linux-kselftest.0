From: catalin.marinas@arm.com (Catalin Marinas)
Date: Sat, 25 May 2019 10:57:55 +0100
Subject: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
In-Reply-To: <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
Message-ID: <20190525095753.caehqipafdc5m3yp@mbp>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190525095755.qFXNntfAJz9eHh8c75A8gXf__s6aBkqpI9S_LSTa7zI@z>

On Mon, May 06, 2019@06:30:51PM +0200, Andrey Konovalov wrote:
> +SYSCALL_DEFINE5(arm64_get_mempolicy, int __user *, policy,
> +		unsigned long __user *, nmask, unsigned long, maxnode,
> +		unsigned long, addr, unsigned long, flags)
> +{
> +	addr = untagged_addr(addr);
> +	return ksys_get_mempolicy(policy, nmask, maxnode, addr, flags);
> +}
[...]
> +SYSCALL_DEFINE6(arm64_mbind, unsigned long, start, unsigned long, len,
> +		unsigned long, mode, const unsigned long __user *, nmask,
> +		unsigned long, maxnode, unsigned int, flags)
> +{
> +	start = untagged_addr(start);
> +	return ksys_mbind(start, len, mode, nmask, maxnode, flags);
> +}

The kernel fails to build with CONFIG_NUMA disabled because the above
are in mm/mempolicy.c which is no longer compiled in.

-- 
Catalin
