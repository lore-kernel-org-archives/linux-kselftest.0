From: luto@kernel.org (Andy Lutomirski)
Date: Fri, 26 Jan 2018 11:46:19 -0800
Subject: [Linux-kselftest-mirror] selftests/x86/fsgsbase_64 test problem
In-Reply-To: <CALCETrUi7Ub2TbFy3Cvj+j4VXZeYULPY+mgL7OX7bz9L8GO9ew@mail.gmail.com>
References: <20180126153631.ha7yc33fj5uhitjo@xps>
 <CALCETrXVFC=6wPNpL0Dc7pkSv4JSaoEZZcu3Rtw0sg7KJsE5Pg@mail.gmail.com>
 <CALCETrUi7Ub2TbFy3Cvj+j4VXZeYULPY+mgL7OX7bz9L8GO9ew@mail.gmail.com>
Message-ID:
 <CALCETrWvkd68wPCxGwmzqgsLTr_59+=L9u8obwt+f+oUQwDY=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180126194619.AlnbVIbZNy2ecn_G5Gohp1dcnp8Ux7pnJGGvKFVu_sU@z>

On Fri, Jan 26, 2018@10:59 AM, Andy Lutomirski <luto@kernel.org> wrote:
> On Fri, Jan 26, 2018@8:22 AM, Andy Lutomirski <luto@kernel.org> wrote:
>> On Fri, Jan 26, 2018@7:36 AM, Dan Rue <dan.rue@linaro.org> wrote:
>>>
>>> We've noticed that fsgsbase_64 can fail intermittently with the
>>> following error:
>>>
>>>         [RUN]   ARCH_SET_GS(0x0) and clear gs, then schedule to 0x1
>>>                 Before schedule, set selector to 0x1
>>>                 other thread: ARCH_SET_GS(0x1) -- sel is 0x0
>>>         [FAIL]  GS/BASE changed from 0x1/0x0 to 0x0/0x0
>>>
>>> This can be reliably reproduced by running fsgsbase_64 in a loop. i.e.
>>>
>>>     for i in $(seq 1 10000); do ./fsgsbase_64 || break; done
>>>
>>> This problem isn't new - I've reproduced it on latest mainline and every
>>> release going back to v4.12 (I did not try earlier). This was tested on
>>> a Supermicro board with a Xeon E3-1220 as well as an Intel Nuc with an
>>> i3-5010U.
>>>
>>
>> Hmm, I can reproduce it, too.  I'll look in a bit.
>
> I'm triggering a different error, and I think what's going on is that
> the kernel doesn't currently re-save GSBASE when a task switches out
> and that task has save gsbase != 0 and in-register GS == 0.  This is
> arguably a bug, but it's not an infoleak, and fixing it could be a wee
> bit expensive.  I'm not sure what, if anything, to do about this.  I
> suppose I could add some gross perf hackery to the test to detect this
> case and suppress the error.
>
> I can also trigger the problem you're seeing, and I don't know what's
> up.  It may be related to and old problem I've seen that causes signal
> delivery to sometimes corrupt %gs.  It's deterministic, but it depends
> in some odd way on register state.  I can currently reproduce that
> issue 100% of the time, and I'm trying to see if I can figure out
> what's happening.

I think it's a CPU bug, and I'm a bit mystified.  I can trigger the
following, plausibly related issue:

Write a program that writes %gs = 1.
Run that program under gdb
break in which %gs == 1
display/x $gs
si

Under QEMU TCG, gs stays equal to 1.  On native or KVM, on Skylake, it
changes to 0.

On KVM or native, I do not observe do_debug getting called with %gs ==
1.  On TCG, I do.  I don't think that's precisely the problem that's
causing the test to fail, since the test doesn't use TF or ptrace, but
I wouldn't be shocked if it's related.

hpa, any insight?

(NB: if you want to play with this as I've described it, you may need
to make invalid_selector() in ptrace.c always return false.  The
current implementation is too strict and causes problems.)
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
