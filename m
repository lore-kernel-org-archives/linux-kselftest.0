From: luto@amacapital.net (Andy Lutomirski)
Date: Mon, 29 Jan 2018 10:26:44 -0800
Subject: [Linux-kselftest-mirror] selftests/x86/fsgsbase_64 test problem
In-Reply-To: <624b9e67-14ee-6882-e55e-f337ec2471d3@zytor.com>
References: <20180126153631.ha7yc33fj5uhitjo@xps>
 <CALCETrXVFC=6wPNpL0Dc7pkSv4JSaoEZZcu3Rtw0sg7KJsE5Pg@mail.gmail.com>
 <CALCETrUi7Ub2TbFy3Cvj+j4VXZeYULPY+mgL7OX7bz9L8GO9ew@mail.gmail.com>
 <CALCETrWvkd68wPCxGwmzqgsLTr_59+=L9u8obwt+f+oUQwDY=w@mail.gmail.com>
 <CALCETrW5=K5wJqLRZACmJJ+LF8Nb+Yf3OJ1tTNwqiOCxHu3w1Q@mail.gmail.com>
 <CALCETrWq04AngUHkSv-bqDYXDSVH8N0bhXS_Nh63SpMmndexSA@mail.gmail.com>
 <CALCETrUcJ2dVkSXGhtRvQeYQZZhPca95VhjQB8j6dFN6hzceSQ@mail.gmail.com>
 <46328204-e363-e517-f30c-c8c94ac1442c@zytor.com>
 <CALCETrW6SY8ktqSA-r108WkNf15js4eu0grDds=JVbNtBdSGqA@mail.gmail.com>
 <624b9e67-14ee-6882-e55e-f337ec2471d3@zytor.com>
Message-ID: <F6FCC323-841E-4337-B1E7-8F2E502552D6@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180129182644.pugDTxZvbWUImF992jiXOkRjwf0FxNqAq5SVyLqP-x4@z>



> On Jan 29, 2018,@10:12 AM, H. Peter Anvin <hpa@zytor.com> wrote:
> 
>> On 01/29/18 08:37, Andy Lutomirski wrote:
>> 
>> That's what I thought, too, and the SDM does say that, but the SDM
>> says all kinds of not-quite-correct things about segmentation.
>> 
>>> It is pretty much scratch space (I have
>>> suggested using it for the gsbase once all those issues get sorted out,
>>> because it lets the paranoid code do something like:
>>> 
>>>        rdgsbase %rax
>>>        push %rax       /* Save old gsbase */
>>>        push %rax       /* Reserve space on stack */
>>>        sgdt -2(%rsp)   /* We don't care about the limit */
>>>        pop %rax        /* %rax <- gdtbase */
>>>        mov (%rax),%rax /* GDT[0] holds the gsbase for this cpu */
>>>        wrgsbase %rax
>> 
>> That will utterly suck on non-UMIP machines that have
>> hypervisor-provided UMIP emulation.
>> 
> 
> Is that a valid thing to optimize for, especially given that paranoid
> entries aren't the most common anyway?
> 

A bunch of people seem to care about NMI performance for perf.  And the current patch set works without this trick.

FWIW, if we switch all entries to the entry text trampoline, we get direct percpu access for free.--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
