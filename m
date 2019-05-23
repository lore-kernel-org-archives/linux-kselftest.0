From: khalid.aziz@oracle.com (Khalid Aziz)
Date: Thu, 23 May 2019 15:42:33 -0600
Subject: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
In-Reply-To: <20190523201105.oifkksus4rzcwqt4@mbp>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp> <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
Message-ID: <047e3b90-d73e-0ca8-869c-d03b7580e644@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523214233.Ny8UBZhQpmQmk6V75CgkVzbUgYMBANAPunFrMrNVRIw@z>

On 5/23/19 2:11 PM, Catalin Marinas wrote:
> Hi Khalid,
> 
> On Thu, May 23, 2019@11:51:40AM -0600, Khalid Aziz wrote:
>> On 5/21/19 6:04 PM, Kees Cook wrote:
>>> As an aside: I think Sparc ADI support in Linux actually side-stepped
>>> this[1] (i.e. chose "solution 1"): "All addresses passed to kernel must
>>> be non-ADI tagged addresses." (And sadly, "Kernel does not enable ADI
>>> for kernel code.") I think this was a mistake we should not repeat for
>>> arm64 (we do seem to be at least in agreement about this, I think).
>>>
>>> [1] https://lore.kernel.org/patchwork/patch/654481/
>>
>> That is a very early version of the sparc ADI patch. Support for tagged
>> addresses in syscalls was added in later versions and is in the patch
>> that is in the kernel.
> 
> I tried to figure out but I'm not familiar with the sparc port. How did
> you solve the tagged address going into various syscall implementations
> in the kernel (e.g. sys_write)? Is the tag removed on kernel entry or it
> ends up deeper in the core code?

Tag is not removed from the user addresses. Kernel passes tagged
addresses to copy_from_user and copy_to_user. MMU checks the tag
embedded in the address when kernel accesses userspace addresses. This
maintains the ADI integrity even when userspace attempts to access any
userspace addresses through system calls.

On sparc, access_ok() is defined as:

#define access_ok(addr, size) __access_ok((unsigned long)(addr), size)
#define __access_ok(addr, size) (__user_ok((addr) & get_fs().seg, (size)))
#define __user_ok(addr, size) ({ (void)(size); (addr) < STACK_TOP; })

STACK_TOP for M7 processor (which is the first sparc processor to
support ADI) is 0xfff8000000000000UL. Tagged addresses pass the
access_ok() check fine. Any tag mismatches that happen during kernel
access to userspace addresses are handled by do_mcd_err().

--
Khalid
