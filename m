From: luto at kernel.org (Andy Lutomirski)
Date: Fri, 26 Jan 2018 14:42:40 -0800
Subject: [Linux-kselftest-mirror] selftests/x86/fsgsbase_64 test problem
In-Reply-To: <CALCETrW5=K5wJqLRZACmJJ+LF8Nb+Yf3OJ1tTNwqiOCxHu3w1Q@mail.gmail.com>
References: <20180126153631.ha7yc33fj5uhitjo@xps>
 <CALCETrXVFC=6wPNpL0Dc7pkSv4JSaoEZZcu3Rtw0sg7KJsE5Pg@mail.gmail.com>
 <CALCETrUi7Ub2TbFy3Cvj+j4VXZeYULPY+mgL7OX7bz9L8GO9ew@mail.gmail.com>
 <CALCETrWvkd68wPCxGwmzqgsLTr_59+=L9u8obwt+f+oUQwDY=w@mail.gmail.com>
 <CALCETrW5=K5wJqLRZACmJJ+LF8Nb+Yf3OJ1tTNwqiOCxHu3w1Q@mail.gmail.com>
Message-ID: <CALCETrWq04AngUHkSv-bqDYXDSVH8N0bhXS_Nh63SpMmndexSA@mail.gmail.com>

On Fri, Jan 26, 2018 at 2:38 PM, Andy Lutomirski <luto at kernel.org> wrote:
> On Fri, Jan 26, 2018 at 11:46 AM, Andy Lutomirski <luto at kernel.org> wrote:
>> On Fri, Jan 26, 2018 at 10:59 AM, Andy Lutomirski <luto at kernel.org> wrote:
>>> On Fri, Jan 26, 2018 at 8:22 AM, Andy Lutomirski <luto at kernel.org> wrote:
>>>> On Fri, Jan 26, 2018 at 7:36 AM, Dan Rue <dan.rue at linaro.org> wrote:
>>>>>
>>>>> We've noticed that fsgsbase_64 can fail intermittently with the
>>>>> following error:
>>>>>
>>>>>         [RUN]   ARCH_SET_GS(0x0) and clear gs, then schedule to 0x1
>>>>>                 Before schedule, set selector to 0x1
>>>>>                 other thread: ARCH_SET_GS(0x1) -- sel is 0x0
>>>>>         [FAIL]  GS/BASE changed from 0x1/0x0 to 0x0/0x0
>>>>>
>>>>> This can be reliably reproduced by running fsgsbase_64 in a loop. i.e.
>>>>>
>>>>>     for i in $(seq 1 10000); do ./fsgsbase_64 || break; done
>>>>>
>>>>> This problem isn't new - I've reproduced it on latest mainline and every
>>>>> release going back to v4.12 (I did not try earlier). This was tested on
>>>>> a Supermicro board with a Xeon E3-1220 as well as an Intel Nuc with an
>>>>> i3-5010U.
>>>>>
>>>>
>>>> Hmm, I can reproduce it, too.  I'll look in a bit.
>>>
>>> I'm triggering a different error, and I think what's going on is that
>>> the kernel doesn't currently re-save GSBASE when a task switches out
>>> and that task has save gsbase != 0 and in-register GS == 0.  This is
>>> arguably a bug, but it's not an infoleak, and fixing it could be a wee
>>> bit expensive.  I'm not sure what, if anything, to do about this.  I
>>> suppose I could add some gross perf hackery to the test to detect this
>>> case and suppress the error.
>>>
>>> I can also trigger the problem you're seeing, and I don't know what's
>>> up.  It may be related to and old problem I've seen that causes signal
>>> delivery to sometimes corrupt %gs.  It's deterministic, but it depends
>>> in some odd way on register state.  I can currently reproduce that
>>> issue 100% of the time, and I'm trying to see if I can figure out
>>> what's happening.
>>
>> I think it's a CPU bug, and I'm a bit mystified.  I can trigger the
>> following, plausibly related issue:
>>
>> Write a program that writes %gs = 1.
>> Run that program under gdb
>> break in which %gs == 1
>> display/x $gs
>> si
>>
>> Under QEMU TCG, gs stays equal to 1.  On native or KVM, on Skylake, it
>> changes to 0.
>>
>> On KVM or native, I do not observe do_debug getting called with %gs ==
>> 1.  On TCG, I do.  I don't think that's precisely the problem that's
>> causing the test to fail, since the test doesn't use TF or ptrace, but
>> I wouldn't be shocked if it's related.
>>
>> hpa, any insight?
>>
>> (NB: if you want to play with this as I've described it, you may need
>> to make invalid_selector() in ptrace.c always return false.  The
>> current implementation is too strict and causes problems.)
>
> Much simpler test.  Run the attached program (gs1).  It more or less
> just sets %gs to 1 and spins until it stops being 1.  Do it on a
> kernel with the attached patch applied.  I see stuff like this:
>
> # ./gs1
> PID = 129
> [   15.703015] pid 129 saved gs = 1
> [   15.703517] pid 129 loaded gs = 1
> [   15.703973] pid 129 prepare_exit_to_usermode: gs = 1
> ax = 0, cx = 0, dx = 0
>
> So we're interrupting the program, switching out, switching back in,
> setting %gs to 1, observing that %gs is *still* 1 in
> prepare_exit_to_usermode(), returning to usermode, and observing %gs
> == 0.
>
> Presumably what's happening is that the IRET microcode matches the
> SDM's pseudocode, which says:
>
> RETURN-TO-OUTER-PRIVILEGE-LEVEL:
> ...
> FOR each SegReg in (ES, FS, GS, and DS)
>   DO
>     tempDesc ← descriptor cache for SegReg (* hidden part of segment register *)
>     IF tempDesc(DPL) < CPL AND tempDesc(Type) is data or non-conforming code
>     THEN (* Segment register invalid *)
>       SegReg ← NULL;
>     FI;
>   OD;
>
> But this is very odd.  The actual permission checks (in the docs for MOV) are:
>
> IF DS, ES, FS, or GS is loaded with non-NULL selector
> THEN
>   IF segment selector index is outside descriptor table limits
>   or segment is not a data or readable code segment
>   or ((segment is a data or nonconforming code segment)
>   or ((RPL > DPL) and (CPL > DPL))
>     THEN #GP(selector); FI;
>
> ^^^^
> This makes no sense.  This says that the data segments cannot be
> loaded with MOV.  Empirically, it seems like MOV works if CPL <= DPL
> and RPL <= DPL, but I haven't checked that hard.

Surely Intel meant:

... or ((segment is a data segment or nonconforming code segment) and
((RPL > DPL) or (CPL > DPL))

This would be consistent with the AMD APM #GP condition of "The DS,
ES, FS, or GS register was loaded and the segment pointed to was a
data or non-conforming code segment, but the RPL or CPL was greater
than the DPL."

>
>   IF segment not marked present
>     THEN #NP(selector);
>   ELSE
>     SegmentRegister ← segment selector;
>     SegmentRegister ← segment descriptor; FI;
>   FI;
>
>   IF DS, ES, FS, or GS is loaded with NULL selector
>   THEN
>     SegmentRegister ← segment selector;
>     SegmentRegister ← segment descriptor;
>     ^^^^
>     wtf?  There is no "segment descriptor".  Presumably what actually
> gets written to segment.DPL is nonsense.
>   FI;

I think the bug is here.  I think that, when writing a NULL selector
to DS, ES, FS, or GS, Intel CPUs incorrectly set DPL == RPL, whereas
they should set DPL to 3.

>
> Anyway, I think it's nonsense that user code can load a selector using
> MOV that is, in turn, rejected by IRET.  I don't suppose Intel would
> consider fixing this going forward.
>
> Borislav, any chance you could run the attached program on an AMD
> machine to see what it does?
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
