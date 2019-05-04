From: luto@amacapital.net (Andy Lutomirski)
Date: Sat, 4 May 2019 13:12:09 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wjGNx8xcwg=7nE_0-nLQ_d4UALHvJ8O+TurbA25n8MyNg@mail.gmail.com>
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
 <CAHk-=wjGNx8xcwg=7nE_0-nLQ_d4UALHvJ8O+TurbA25n8MyNg@mail.gmail.com>
Message-ID: <2BF1AE4B-8105-49F0-8B6A-AA3B11FD66FD@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190504201209.GtRIQtSpUc_TcTrsYXHFITJJ013maal0eEMMG8yo7Lc@z>



> On May 4, 2019,@11:59 AM, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> On Fri, May 3, 2019 at 10:08 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>> 
>> I'll look at it tomorrow, but I think this actually makes unnecessary changes.
>> 
>> In particular, I think we could keep the existing entry code almost unchanged with this whole approach.
> 
> So here's what I *think* should work. Note that I also removed your
> test-case code, because it really didn't have a chance in hell of
> working. Doing that
> 
>        int3_emulate_call(regs, (unsigned long)&int3_magic);
> 
> inside of int3_exception_notify() could not possibly be valid, since
> int3_emulate_call() returns the new pt_regs that need to be used, and
> throwing it away is clearly wrong.
> 
> So you can't use a register_die_notifier() to try to intercept the
> 'int3' error and then do it manually, it needs to be done by the
> ftrace_int3_handler() code that actually returns the new regs, and
> where do_kernel_int3() will then return it to the low-level handler.

I hate register_die_notifier(), so I consider this a plus. I’ve occasionally considered removing the ability for the notifiers to skip normal processing, because, as it stands, figuring out what actually happens in the trap handlers is almost impossible.

It generally looks sane to me.

As an aside, is it even *possible* to get #BP from v8086 mode?  On a quick SDM read, the INT3 instruction causes #GP if VM=1 and IOPL<3.  And, if we allow vm86() to have IOPL=3, we should just remove that ability. It’s nuts.

(We should maybe consider a config option for iopl() that defaults off. We’ve supported ioperm() for a long, long time.)
