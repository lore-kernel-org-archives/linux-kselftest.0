From: keescook@chromium.org (Kees Cook)
Date: Tue, 21 May 2019 17:04:39 -0700
Subject: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
In-Reply-To: <20190521182932.sm4vxweuwo5ermyd@mbp>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
Message-ID: <201905211633.6C0BF0C2@keescook>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190522000439.8cjttfxrkMM8ckY2vu4x0mc-MVzFHNh9ikbNqWHJ0BU@z>

On Tue, May 21, 2019@07:29:33PM +0100, Catalin Marinas wrote:
> On Mon, May 20, 2019@04:53:07PM -0700, Evgenii Stepanov wrote:
> > On Fri, May 17, 2019@7:49 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > IMO (RFC for now), I see two ways forward:
> > > [...]
> > > 2. Similar shim to the above libc wrapper but inside the kernel
> > >    (arch/arm64 only; most pointer arguments could be covered with an
> > >    __SC_CAST similar to the s390 one). There are two differences from
> > >    what we've discussed in the past:
> > >
> > >    a) this is an opt-in by the user which would have to explicitly call
> > >       prctl(). If it returns -ENOTSUPP etc., the user won't be allowed
> > >       to pass tagged pointers to the kernel. This would probably be the
> > >       responsibility of the C lib to make sure it doesn't tag heap
> > >       allocations. If the user did not opt-in, the syscalls are routed
> > >       through the normal path (no untagging address shim).
> > >
> > >    b) ioctl() and other blacklisted syscalls (prctl) will not accept
> > >       tagged pointers (to be documented in Vicenzo's ABI patches).
> >
> > The way I see it, a patch that breaks handling of tagged pointers is
> > not that different from, say, a patch that adds a wild pointer
> > dereference. Both are bugs; the difference is that (a) the former
> > breaks a relatively uncommon target and (b) it's arguably an easier
> > mistake to make. If MTE adoption goes well, (a) will not be the case
> > for long.
> 
> It's also the fact such patch would go unnoticed for a long time until
> someone exercises that code path. And when they do, the user would be
> pretty much in the dark trying to figure what what went wrong, why a
> SIGSEGV or -EFAULT happened. What's worse, we can't even say we fixed
> all the places where it matters in the current kernel codebase (ignoring
> future patches).

So, looking forward a bit, this isn't going to be an ARM-specific issue
for long. In fact, I think we shouldn't have arm-specific syscall wrappers
in this series: I think untagged_addr() should likely be added at the
top-level and have it be a no-op for other architectures. So given this
becoming a kernel-wide multi-architecture issue (under the assumption
that x86, RISC-V, and others will gain similar TBI or MTE things),
we should solve it in a way that we can re-use.

We need something that is going to work everywhere. And it needs to be
supported by the kernel for the simple reason that the kernel needs to
do MTE checks during copy_from_user(): having that information stripped
means we lose any userspace-assigned MTE protections if they get handled
by the kernel, which is a total non-starter, IMO.

As an aside: I think Sparc ADI support in Linux actually side-stepped
this[1] (i.e. chose "solution 1"): "All addresses passed to kernel must
be non-ADI tagged addresses." (And sadly, "Kernel does not enable ADI
for kernel code.") I think this was a mistake we should not repeat for
arm64 (we do seem to be at least in agreement about this, I think).

[1] https://lore.kernel.org/patchwork/patch/654481/

> > This is a bit of a chicken-and-egg problem. In a world where memory
> > allocators on one or several popular platforms generate pointers with
> > non-zero tags, any such breakage will be caught in testing.
> > Unfortunately to reach that state we need the kernel to start
> > accepting tagged pointers first, and then hold on for a couple of
> > years until userspace catches up.
> 
> Would the kernel also catch up with providing a stable ABI? Because we
> have two moving targets.
> 
> On one hand, you have Android or some Linux distro that stick to a
> stable kernel version for some time, so they have better chance of
> clearing most of the problems. On the other hand, we have mainline
> kernel that gets over 500K lines every release. As maintainer, I can't
> rely on my testing alone as this is on a limited number of platforms. So
> my concern is that every kernel release has a significant chance of
> breaking the ABI, unless we have a better way of identifying potential
> issues.

I just want to make sure I fully understand your concern about this
being an ABI break, and I work best with examples. The closest situation
I can see would be:

- some program has no idea about MTE
- malloc() starts returning MTE-tagged addresses
- program doesn't break from that change
- program uses some syscall that is missing untagged_addr() and fails
- kernel has now broken userspace that used to work

The trouble I see with this is that it is largely theoretical and
requires part of userspace to collude to start using a new CPU feature
that tickles a bug in the kernel. As I understand the golden rule,
this is a bug in the kernel (a missed ioctl() or such) to be fixed,
not a global breaking of some userspace behavior.

I feel like I'm missing something about this being seen as an ABI
break. The kernel already fails on userspace addresses that have high
bits set -- are there things that _depend_ on this failure to operate?

-- 
Kees Cook
