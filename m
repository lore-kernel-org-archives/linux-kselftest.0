From: eugenis@google.com (Evgenii Stepanov)
Date: Mon, 20 May 2019 16:53:07 -0700
Subject: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
In-Reply-To: <20190517144931.GA56186@arrakis.emea.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
Message-ID:
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190520235307.hwQs9qbYQeoWqBw8UiwJ0hmGu2ps-MIvjnb9ywzTfgU@z>

On Fri, May 17, 2019@7:49 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> Hi Andrey,
>
> On Mon, May 06, 2019@06:30:46PM +0200, Andrey Konovalov wrote:
> > One of the alternative approaches to untagging that was considered is to
> > completely strip the pointer tag as the pointer enters the kernel with
> > some kind of a syscall wrapper, but that won't work with the countless
> > number of different ioctl calls. With this approach we would need a custom
> > wrapper for each ioctl variation, which doesn't seem practical.
>
> The more I look at this problem, the less convinced I am that we can
> solve it in a way that results in a stable ABI covering ioctls(). While
> for the Android kernel codebase it could be simpler as you don't upgrade
> the kernel version every 2.5 months, for the mainline kernel this
> doesn't scale. Any run-time checks are relatively limited in terms of
> drivers covered. Better static checking would be nice as a long term
> solution but we didn't get anywhere with the discussion last year.
>
> IMO (RFC for now), I see two ways forward:
>
> 1. Make this a user space problem and do not allow tagged pointers into
>    the syscall ABI. A libc wrapper would have to convert structures,
>    parameters before passing them into the kernel. Note that we can
>    still support the hardware MTE in the kernel by enabling tagged
>    memory ranges, saving/restoring tags etc. but not allowing tagged
>    addresses at the syscall boundary.
>
> 2. Similar shim to the above libc wrapper but inside the kernel
>    (arch/arm64 only; most pointer arguments could be covered with an
>    __SC_CAST similar to the s390 one). There are two differences from
>    what we've discussed in the past:
>
>    a) this is an opt-in by the user which would have to explicitly call
>       prctl(). If it returns -ENOTSUPP etc., the user won't be allowed
>       to pass tagged pointers to the kernel. This would probably be the
>       responsibility of the C lib to make sure it doesn't tag heap
>       allocations. If the user did not opt-in, the syscalls are routed
>       through the normal path (no untagging address shim).
>
>    b) ioctl() and other blacklisted syscalls (prctl) will not accept
>       tagged pointers (to be documented in Vicenzo's ABI patches).
>
> It doesn't solve the problems we are trying to address but 2.a saves us
> from blindly relaxing the ABI without knowing how to easily assess new
> code being merged (over 500K lines between kernel versions). Existing
> applications (who don't opt-in) won't inadvertently start using the new
> ABI which could risk becoming de-facto ABI that we need to support on
> the long run.
>
> Option 1 wouldn't solve the ioctl() problem either and while it makes
> things simpler for the kernel, I am aware that it's slightly more
> complicated in user space (but I really don't mind if you prefer option
> 1 ;)).
>
> The tagged pointers (whether hwasan or MTE) should ideally be a
> transparent feature for the application writer but I don't think we can
> solve it entirely and make it seamless for the multitude of ioctls().
> I'd say you only opt in to such feature if you know what you are doing
> and the user code takes care of specific cases like ioctl(), hence the
> prctl() proposal even for the hwasan.
>
> Comments welcomed.

Any userspace shim approach is problematic for Android because of the
apps that use raw system calls. AFAIK, all apps written in Go are in
that camp - I'm not sure how common they are, but getting them all
recompiled is probably not realistic.

The way I see it, a patch that breaks handling of tagged pointers is
not that different from, say, a patch that adds a wild pointer
dereference. Both are bugs; the difference is that (a) the former
breaks a relatively uncommon target and (b) it's arguably an easier
mistake to make. If MTE adoption goes well, (a) will not be the case
for long.

This is a bit of a chicken-and-egg problem. In a world where memory
allocators on one or several popular platforms generate pointers with
non-zero tags, any such breakage will be caught in testing.
Unfortunately to reach that state we need the kernel to start
accepting tagged pointers first, and then hold on for a couple of
years until userspace catches up.

Perhaps we can start by whitelisting ioctls by driver?
