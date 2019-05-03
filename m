From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 3 May 2019 12:31:26 -0400
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
Message-ID: <20190503123126.3a2801be@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503163126.xd4tio8iGq-jTTDkBwB-rTxpbyt3pRJmOdk_htLOJoo@z>

On Fri, 3 May 2019 09:20:55 -0700
Andy Lutomirski <luto@amacapital.net> wrote:

> So here’s a somewhat nutty suggestion: how about we tweak the 32-bit entry code to emulate the sane 64-bit frame, not just for int3 but always?  Basically, the entry asm for entries from kernel mode would do, roughly:
> 
> push $0 ;dummy for call emulation
> push %ss
> push $0 ;a dummy for ESP
> push 3*4(%esp) ;EFLAGS
> push 3*4(%esp) ;CS
> push 3*4(%esp) ;EIP
> push %rax
> lea 7*4(%esp), %rax
> mov %rax, 4*4(%esp) ;ESP
> 
> And the exit asm would do a little dance to write EFLAGS, CS, and EIP to the right spot, then load ESP-3*4 into %esp and do IRET.
> 
> Now the annoying kernel_stack_pointer() hack can just go away, since regs->sp is always correct!
> 
> I probably screwed up some arithmetic there, but it’s the idea that counts :)

Yeah, as it will end up with:

 $0 ; dummy for call emulation
 %ss
 $0 ; dummy for ESP
 EIP
 $0
 %ss
 $0

As 3 only gets you over what you already pushed. I think 5*4 is what
you want.

I guess the real question is, what's the performance impact of doing
that? Although, this is only needed for kernel -> kernel exceptions,
which are hopefully a rarity.

-- Steve
