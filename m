From: khalid.aziz at oracle.com (Khalid Aziz)
Date: Thu, 23 May 2019 11:51:40 -0600
Subject: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
In-Reply-To: <201905211633.6C0BF0C2@keescook>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp> <201905211633.6C0BF0C2@keescook>
Message-ID: <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>

On 5/21/19 6:04 PM, Kees Cook wrote:
> As an aside: I think Sparc ADI support in Linux actually side-stepped
> this[1] (i.e. chose "solution 1"): "All addresses passed to kernel must
> be non-ADI tagged addresses." (And sadly, "Kernel does not enable ADI
> for kernel code.") I think this was a mistake we should not repeat for
> arm64 (we do seem to be at least in agreement about this, I think).
> 
> [1] https://lore.kernel.org/patchwork/patch/654481/


That is a very early version of the sparc ADI patch. Support for tagged
addresses in syscalls was added in later versions and is in the patch
that is in the kernel.

That part "Kernel does not enable ADI for kernel code." is correct. It
is a possible enhancement for future.

--
Khalid
