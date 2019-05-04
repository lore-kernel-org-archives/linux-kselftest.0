From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Sat, 4 May 2019 11:59:41 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wiuSFbv_rELND-BLWcP0GSZ0yF=xOAEcf61GE3bU9d=yg@mail.gmail.com>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <CAHk-=wh8bi5c_GkyjPtDAiaXaZRqtmhWs30usUvs4qK_F+c9tg@mail.gmail.com>
 <20190503152405.2d741af8@gandalf.local.home>
 <CAHk-=wiA-WbrFrDs-kOfJZMXy4zMo9-SZfk=7B-GfmBJ866naw@mail.gmail.com>
 <20190503184919.2b7ef242@gandalf.local.home>
 <CAHk-=wh2vPLvsGBi6JtmEYeqHxB5UpTzHDjY5JsWG=YR0Lypzw@mail.gmail.com>
 <20190504001756.17fad840@oasis.local.home>
 <CAHk-=wiuSFbv_rELND-BLWcP0GSZ0yF=xOAEcf61GE3bU9d=yg@mail.gmail.com>
Message-ID:
 <CAHk-=wjGNx8xcwg=7nE_0-nLQ_d4UALHvJ8O+TurbA25n8MyNg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190504185941._wT7buOBQCWssga2c8tkI2VCGe-0xcwmk7oexcQUXzQ@z>

On Fri, May 3, 2019 at 10:08 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'll look at it tomorrow, but I think this actually makes unnecessary changes.
>
> In particular, I think we could keep the existing entry code almost unchanged with this whole approach.

So here's what I *think* should work. Note that I also removed your
test-case code, because it really didn't have a chance in hell of
working. Doing that

        int3_emulate_call(regs, (unsigned long)&int3_magic);

inside of int3_exception_notify() could not possibly be valid, since
int3_emulate_call() returns the new pt_regs that need to be used, and
throwing it away is clearly wrong.

So you can't use a register_die_notifier() to try to intercept the
'int3' error and then do it manually, it needs to be done by the
ftrace_int3_handler() code that actually returns the new regs, and
where do_kernel_int3() will then return it to the low-level handler.

End result: I haven't actually tested this code, but I've looked
through the patch something like ten times without finding any new
errors.

I've also tried *very* hard to make the patch minimal, with the
exception of the comments, which I tried to make extensive for any of
the subtle cases.

But without testing, it's probably still buggy.

I have to say, I finally like the end result here. Maybe it's because
I got to make my mark and pee in the snow, but I will say that

 (a) the actual entry code modifications really are minimal now

 (b) the instruction emulation really is very simple and straightforward

 (c) yes, we play some stack tricks (and yes, we play them differently
on x86-64 and x86-32), but the tricks are again at least
straightforward, and we never really change the layout of any stack.

So on the whole, I think this is about as good as it gets. Did I get
all the details actually right, and it _works_? I guess we'll see.

                 Linus
-------------- next part --------------
A non-text attachment was scrubbed...
Name: patch.diff
Type: text/x-patch
Size: 8818 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190504/104ce857/attachment.bin>
