From: Szabolcs.Nagy at arm.com (Szabolcs Nagy)
Date: Tue, 19 Feb 2019 18:38:31 +0000
Subject: [RFC][PATCH 0/3] arm64 relaxed ABI
In-Reply-To: <20190212180223.GD199333@arrakis.emea.arm.com>
References: <cover.1544445454.git.andreyknvl@google.com>
 <20181210143044.12714-1-vincenzo.frascino@arm.com>
 <CAAeHK+xPZ-Z9YUAq=3+hbjj4uyJk32qVaxZkhcSAHYC4mHAkvQ@mail.gmail.com>
 <20181212150230.GH65138@arrakis.emea.arm.com>
 <CAAeHK+zxYJDJ7DJuDAOuOMgGvckFwMAoVUTDJzb6MX3WsXhRTQ@mail.gmail.com>
 <20181218175938.GD20197@arrakis.emea.arm.com>
 <20181219125249.GB22067@e103592.cambridge.arm.com>
 <9bbacb1b-6237-f0bb-9bec-b4cf8d42bfc5@arm.com>
 <CAFKCwrhH5R3e5ntX0t-gxcE6zzbCNm06pzeFfYEN2K13c5WLTg@mail.gmail.com>
 <20190212180223.GD199333@arrakis.emea.arm.com>
Message-ID: <ac8f4e3b-84b8-6067-6a7a-fac7dc48daea@arm.com>

On 12/02/2019 18:02, Catalin Marinas wrote:
> On Mon, Feb 11, 2019 at 12:32:55PM -0800, Evgenii Stepanov wrote:
>> On Mon, Feb 11, 2019 at 9:28 AM Kevin Brodsky <kevin.brodsky at arm.com> wrote:
>>> On 19/12/2018 12:52, Dave Martin wrote:
>>>> Really, the kernel should do the expected thing with all "non-weird"
>>>> memory.
>>>>
>>>> In lieu of a proper definition of "non-weird", I think we should have
>>>> some lists of things that are explicitly included, and also excluded:
>>>>
>>>> OK:
>>>>       kernel-allocated process stack
>>>>       brk area
>>>>       MAP_ANONYMOUS | MAP_PRIVATE
>>>>       MAP_PRIVATE mappings of /dev/zero
>>>>
>>>> Not OK:
>>>>       MAP_SHARED
>>>>       mmaps of non-memory-like devices
>>>>       mmaps of anything that is not a regular file
>>>>       the VDSO
>>>>       ...
>>>>
>>>> In general, userspace can tag memory that it "owns", and we do not assume
>>>> a transfer of ownership except in the "OK" list above.  Otherwise, it's
>>>> the kernel's memory, or the owner is simply not well defined.
>>>
>>> Agreed on the general idea: a process should be able to pass tagged pointers at the
>>> syscall interface, as long as they point to memory privately owned by the process. I
>>> think it would be possible to simplify the definition of "non-weird" memory by using
>>> only this "OK" list:
>>> - mmap() done by the process itself, where either:
>>>    * flags = MAP_PRIVATE | MAP_ANONYMOUS
>>>    * flags = MAP_PRIVATE and fd refers to a regular file or a well-defined list of
>>> device files (like /dev/zero)
>>> - brk() done by the process itself
>>> - Any memory mapped by the kernel in the new process's address space during execve(),
>>> with the same restrictions as above ([vdso]/[vvar] are therefore excluded)
> 
> Sounds reasonable.

OK. this non-weird memory definition works for me too.

rule 1: if weird memory pointers are passed to the kernel
with top byte set then the behaviour is undefined.

>>>>   * When the kernel dereferences a pointer on userspace's behalf, it
>>>>     shall behave equivalently to userspace dereferencing the same pointer,
>>>>     including use of the same tag (where passed by userspace).
>>>>
>>>>   * Where the pointer tag affects pointer dereference behaviour (i.e.,
>>>>     with hardware memory colouring) the kernel makes no guarantee to
>>>>     honour pointer tags correctly for every location a buffer based on a
>>>>     pointer passed by userspace to the kernel.
>>>>
>>>>     (This means for example that for a read(fd, buf, size), we can check
>>>>     the tag for a single arbitrary location in *(char (*)[size])buf
>>>>     before passing the buffer to get_user_pages().  Hopefully this could
>>>>     be done in get_user_pages() itself rather than hunting call sites.
>>>>     For userspace, it means that you're on your own if you ask the
>>>>     kernel to operate on a buffer than spans multiple, independently-
>>>>     allocated objects, or a deliberately striped single object.)
>>>
>>> I think both points are reasonable. It is very valuable for the kernel to access
>>> userspace memory using the user-provided tag, because it enables kernel accesses to
>>> be checked in the same way as user accesses, allowing to detect bugs that are
>>> potentially hard to find. For instance, if a pointer to an object is passed to the
>>> kernel after it has been deallocated, this is invalid and should be detected.
>>> However, you are absolutely right that the kernel cannot *guarantee* that such a
>>> check is carried out for the entire memory range (or in fact at all); it should be a
>>> best-effort approach.
>>
>> It would also be valuable to narrow down the set of "relaxed" (i.e.
>> not tag-checking) syscalls as reasonably possible. We would want to
>> provide tag-checking userspace wrappers for any important calls that
>> are not checked in the kernel. Is it correct to assume that anything
>> that goes through copy_from_user  / copy_to_user is checked?
> 
> I lost track of the context of this thread but if it's just about
> relaxing the ABI for hwasan, the kernel has no idea of the compiler
> generated structures in user space, so nothing is checked.
> 
> If we talk about tags in the context of MTE, than yes, with the current
> proposal the tag would be checked by copy_*_user() functions.

rule 2: kernel derefs as if user derefs when non-weird memory
pointers are passed to the kernel.

note that the important bit is what happens on valid pointer
derefs, invalid pointer deref is usually undefined for user
programs, so what happens in case of mte tag failures is
more of a QoI issue than abi i think.

(e.g. EFAULT is not guaranteed by the kernel currently, i can
successfully do write(open("/dev/null",O_WRONLY), 0, 1), or
get a crash when passing invalid pointer to a vdso function,
so userspace should not rely on some strict EFAULT behaviour).

>>>>   * The kernel shall not extend the lifetime of user pointers in ways
>>>>     that are not clear from the specification of the syscall or
>>>>     interface to which the pointer is passed (and in any case shall not
>>>>     extend pointer lifetimes without good reason).
>>>>
>>>>     So no clever transparent caching between syscalls, unless it _really_
>>>>     is transparent in the presence of tags.
>>>
>>> Do you have any particular case in mind? If such caching is really valuable, it is
>>> always possible to access the object while ignoring the tag. For sure, the
>>> user-provided tag can only be used during the syscall handling itself, not
>>> asynchronously later on, unless otherwise specified.
>>
>> For aio* operations it would be nice if the tag was checked at the
>> time of the actual userspace read/write, either instead of or in
>> addition to at the time of the system call.
> 
> With aio* (and synchronous iovec-based syscalls), the kernel may access
> the memory while the corresponding user process is scheduled out. Given
> that such access is not done in the context of the user process (and
> using the user VA like copy_*_user), the kernel cannot handle potential
> tag faults. Moreover, the transfer may be done by DMA and the device
> does not understand tags.
> 
> I'd like to keep tags as a property of the pointer in a specific virtual
> address space. The moment you convert it to a different address space
> (e.g. kernel linear map, physical address), the tag property is stripped
> and I don't think we should re-build it (and have it checked).

OK.

i don't think the new abi needs special rules about
pointer lifetime.

>>>>   * For purposes other than dereference, the kernel shall accept any
>>>>     legitimately tagged pointer (according to the above rules) as
>>>>     identifying the associated memory location.
>>>>
>>>>     So, mprotect(some_page_aligned_object, ...); is valid irrespective
>>>>     of where page_aligned_object() came from.  There is no implicit
>>>>     derefence by the kernel here, hence no tag check.
>>>>
>>>>     The kernel does not guarantee to work correctly if the wrong tag
>>>>     is used, but there is not always a well-defined "right" tag, so
>>>>     we can't really guarantee to check it.  So a pointer derived by
>>>>     any reasonable means by userspace has to be treated as equally
>>>>     valid.
>>>
>>> This is a disputed point :) In my opinion, this is the the most reasonable approach.
>>
>> Yes, it would be nice if the kernel explicitly promised, ex.
>> mprotect() over a range of differently tagged pages to be allowed
>> (i.e. address tag should be unchecked).
> 
> I don't think mprotect() over differently tagged pages was ever a
> problem. I originally asked that mprotect() and friends do not accept
> tagged pointers since these functions deal with memory ranges rather
> than dereferencing such pointer (the reason being minimal kernel
> changes). However, given how complicated it is to specify an ABI, I came
> to the conclusion that a pointer passed to such function should be
> allowed to have non-zero top byte. It would be the kernel's
> responsibility to strip it out as appropriate.

OK.

rule 3: kernel accepts legitimately tagged non-weird memory
pointers and untags them before usage other than deref.

this is relevant if a syscall uses pointers for address range
specification, instead of deref. (mprotect, madvise,...)

i also propose:

rule 4: kernel keeps legitimate tags on non-weird memory
pointers that it returns to the user.

e.g. clone passes stack/arg/tls pointers on without dropping
tags, same for set/get_robust_list. i'm not sure if there
are pointer values observable in /proc etc but those should
keep tags too.

"legitimately tagged" may not always be obvious, but the
illegitimately tagged case can be left unspecified i think,
so dropping tags is ok, but not required if tbi is off and
mte is not used (i.e. tag is illegitimate).

i think these rules work for the cases i care about, a more
tricky question is when/how to check for the new syscall abi
and when/how the TCR_EL1.TBI0 setting may be turned off.
consider the following cases (tb == top byte):

binary 1: user tb = any, syscall tb = 0
  tbi is on, "legacy binary"

binary 2: user tb = any, syscall tb = any
  tbi is on, "new binary using tb"
  for backward compat it needs to check for new syscall abi.

binary 3: user tb = 0, syscall tb = 0
  tbi can be off, "new binary",
  binary is marked to indicate unused tb,
  kernel may turn tbi off: additional pac bits.

binary 4: user tb = mte, syscall tb = mte
  like binary 3, but with mte, "new binary using mte"
  does it have to check for new syscall abi?
  or MTE HWCAP would imply it?
  (is it possible to use mte without new syscall abi?)

in userspace we want most binaries to be like binary 3 and 4
eventually, i.e. marked as not-relying-on-tbi, if a dso is
loaded that is unmarked (legacy or new tb user), then either
the load fails (e.g. if mte is already used? or can we turn
mte off at runtime?) or tbi has to be enabled (prctl? does
this work with pac? or multi-threads?).

as for checking the new syscall abi: i don't see much semantic
difference between AT_HWCAP and AT_FLAGS (either way, the user
has to check a feature flag before using the feature of the
underlying system and it does not matter much if it's a syscall
abi feature or cpu feature), but i don't see anything wrong
with AT_FLAGS if the kernel prefers that.

the discussion here was mostly about binary 2, but for
me the open question is if we can make binary 3/4 work.
(which requires some elf binary marking, that is recognised
by the kernel and dynamic loader, and efficient handling of
the TBI0 bit, ..if it's not possible, then i don't see how
mte will be deployed).

and i guess on the kernel side the open question is if the
rules 1/2/3/4 can be made to work in corner cases e.g. when
pointers embedded into structs are passed down in ioctl.
