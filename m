From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 6 May 2019 09:17:19 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190506095631.6f71ad7c@gandalf.local.home>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
 <CAHk-=wjrOLqBG1qe9C3T=fLN0m=78FgNOGOEL22gU=+Pw6Mu9Q@mail.gmail.com>
 <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
 <20190506095631.6f71ad7c@gandalf.local.home>
Message-ID:
 <CAHk-=wgw_Jmn1iJWanoSFb1QZn3mbTD_JEoMsWcWj5QPeyHZHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190506161719.GD9nup7H08GzekyMNT2_BVO8TZV04uA-Gg7w5rbFZ4I@z>

On Mon, May 6, 2019@6:56 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> I can test this too. I was hoping to get this in by this merge window.
> I spent 3 hours yesterday trying to get Linus's version working on
> i386 with no success. Not sure how much time Linus will have to look at
> this, as he just opened the merge window.

I acvtually just tested it in qemu, and it worked fine.

Ok, so my test was admittedly really simple and stupid, in that al I did was

        printk("Before int3\n");
        asm("int3; nop; nop; nop; nop" : : :"ax","dx","cx");
        printk("After int3\n");

and then I hacked up do_kernel_int3() to just unconditionally do

        return int3_emulate_call(regs, (unsigned long)test_int3);

with a stupid test-function:

    void test_int3(void)
    {
        printk("In int3 handler");
    }

instead fo anything fancy.

But it did exactly the expected thing, and resulted in

    Before int3
    In int3 handler
    After int3

on the screen.

So what is it that doesn't actually work? I've looked at the patch
even more, and I can't for the life of me see how it wouldn't work.

Of course, I didn't test any of the actual ftrace parts, since I
short-circuited them intentionally with the above test function hack.
I have no idea what the semantics for those
ftrace_location(ip)/is_ftrace_caller(ip) cases are supposed to be, I
only tested that yes, the infrastructure clearly emulates a call
instruction.

               Linus
