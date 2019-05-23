From: catalin.marinas at arm.com (Catalin Marinas)
Date: Thu, 23 May 2019 21:11:05 +0100
Subject: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
In-Reply-To: <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
Message-ID: <20190523201105.oifkksus4rzcwqt4@mbp>

Hi Khalid,

On Thu, May 23, 2019 at 11:51:40AM -0600, Khalid Aziz wrote:
> On 5/21/19 6:04 PM, Kees Cook wrote:
> > As an aside: I think Sparc ADI support in Linux actually side-stepped
> > this[1] (i.e. chose "solution 1"): "All addresses passed to kernel must
> > be non-ADI tagged addresses." (And sadly, "Kernel does not enable ADI
> > for kernel code.") I think this was a mistake we should not repeat for
> > arm64 (we do seem to be at least in agreement about this, I think).
> > 
> > [1] https://lore.kernel.org/patchwork/patch/654481/
> 
> That is a very early version of the sparc ADI patch. Support for tagged
> addresses in syscalls was added in later versions and is in the patch
> that is in the kernel.

I tried to figure out but I'm not familiar with the sparc port. How did
you solve the tagged address going into various syscall implementations
in the kernel (e.g. sys_write)? Is the tag removed on kernel entry or it
ends up deeper in the core code?

Thanks.

-- 
Catalin
