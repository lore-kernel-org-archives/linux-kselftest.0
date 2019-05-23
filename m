From: catalin.marinas@arm.com (Catalin Marinas)
Date: Thu, 23 May 2019 08:34:25 +0100
Subject: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
In-Reply-To: <CAJgzZorUPzrXu0ysDdKwnqdvgWZJ9tqRjF-9_5CU_UV+c0bRCA@mail.gmail.com>
References: <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <20190522101110.m2stmpaj7seezveq@mbp>
 <CAJgzZoosKBwqXRyA6fb8QQSZXFqfHqe9qO9je5TogHhzuoGXJQ@mail.gmail.com>
 <20190522163527.rnnc6t4tll7tk5zw@mbp>
 <201905221316.865581CF@keescook>
 <CAFKCwrjOjdJAbcABp3qxwyYy+hgfyQirvmqGkDSJVJe5pSz0Uw@mail.gmail.com>
 <CAJgzZorUPzrXu0ysDdKwnqdvgWZJ9tqRjF-9_5CU_UV+c0bRCA@mail.gmail.com>
Message-ID: <20190523073425.GA43379@MBP.local>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523073425.lIt9hdqPCnoqgMXEMTldSBjy4KxutNhqrZQuoT0rwLA@z>

On Wed, May 22, 2019@04:09:31PM -0700, enh wrote:
> On Wed, May 22, 2019@4:03 PM Evgenii Stepanov <eugenis@google.com> wrote:
> > On Wed, May 22, 2019@1:47 PM Kees Cook <keescook@chromium.org> wrote:
> > > On Wed, May 22, 2019@05:35:27PM +0100, Catalin Marinas wrote:
> > > > I would also expect the C library or dynamic loader to check for the
> > > > presence of a HWCAP_MTE bit before starting to tag memory allocations,
> > > > otherwise it would get SIGILL on the first MTE instruction it tries to
> > > > execute.
> > >
> > > I've got the same question as Elliot: aren't MTE instructions just NOP
> > > to older CPUs? I.e. if the CPU (or kernel) don't support it, it just
> > > gets entirely ignored: checking is only needed to satisfy curiosity
> > > or behavioral expectations.
> >
> > MTE instructions are not NOP. Most of them have side effects (changing
> > register values, zeroing memory).
> 
> no, i meant "they're encoded in a space that was previously no-ops, so
> running on MTE code on old hardware doesn't cause SIGILL".

It does result in SIGILL, there wasn't enough encoding left in the NOP
space for old/current CPU implementations (in hindsight, we should have
reserved a bigger NOP space).

As Evgenii said, the libc needs to be careful when tagging the heap as
it would cause a SIGILL if the HWCAP_MTE is not set. The standard
application doesn't need to be recompiled as it would not issue MTE
colouring instructions, just standard LDR/STR.

Stack tagging is problematic if you want to colour each frame
individually, the function prologue would need the non-NOP MTE
instructions. The best we can do here is just having the (thread) stacks
of different colours.

-- 
Catalin
