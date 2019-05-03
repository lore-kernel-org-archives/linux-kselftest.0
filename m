From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Fri, 3 May 2019 11:57:22 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
References: <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
Message-ID:
 <CAHk-=wjrOLqBG1qe9C3T=fLN0m=78FgNOGOEL22gU=+Pw6Mu9Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503185722.W6_u1tD2799vYdiDT4CfzZfaXHjjexPFDYti98w-y4c@z>

On Fri, May 3, 2019@9:21 AM Andy Lutomirski <luto@amacapital.net> wrote:
>
> So here’s a somewhat nutty suggestion: how about we tweak the 32-bit entry code to emulate the sane 64-bit frame, not just for int3 but always?

What would the code actually end up looking like? I don't necessarily
object, since that kernel_stack_pointer() thing certainly looks
horrible, but honestly, my suggestion to just pass in the 'struct
pt_regs' and let the call emulation fix it up would have also worked,
and avoided that bug (and who knows what else might be hiding).

I really think that you're now hitting all the special case magic
low-level crap that I wanted to avoid.

                   Linus
