From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Sat, 4 May 2019 13:28:00 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <2BF1AE4B-8105-49F0-8B6A-AA3B11FD66FD@amacapital.net>
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
 <2BF1AE4B-8105-49F0-8B6A-AA3B11FD66FD@amacapital.net>
Message-ID:
 <CAHk-=wiwc8NDahj455iBWmYyvDDS+sN1TObFsxxS51gNbtZ9iw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190504202800.qU2D2F6mXUAFoqTK102Ia2s-tDNY91Lnc3GeMcFtZy8@z>

On Sat, May 4, 2019@1:12 PM Andy Lutomirski <luto@amacapital.net> wrote:
>
> As an aside, is it even *possible* to get #BP from v8086 mode?  On a quick SDM read, the INT3 instruction causes #GP if VM=1 and IOPL<3.  And, if we allow vm86() to have IOPL=3, we should just remove that ability. It’s nuts.

We've definitely historically allowed IOPL=3 with the whole "iopl()"
system call. And yes, afaik it works together with the vm86 system
call too. I think we copy the unsafe bits from the original eflags, so
if you do iopl(3) followed by vm86(), you will be running in vm86 mode
with iopl 3.

> (We should maybe consider a config option for iopl() that defaults off. We’ve supported ioperm() for a long, long time.)

It's entirely possible that nobody uses iopl() and we should make it a
config option that defaults to off.

But we've already done that with the VM86 support entirely, and I'm
not sure modern distros even enable it.

And obviously vm86 mode isn't available at all with a 64-bit kernel,
so this is all slowly becoming more or less moot.

                  Linus
