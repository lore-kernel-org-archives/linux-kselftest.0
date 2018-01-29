From: hpa at zytor.com (H. Peter Anvin)
Date: Mon, 29 Jan 2018 10:30:05 -0800
Subject: [Linux-kselftest-mirror] selftests/x86/fsgsbase_64 test problem
In-Reply-To: <F6FCC323-841E-4337-B1E7-8F2E502552D6@amacapital.net>
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
 <F6FCC323-841E-4337-B1E7-8F2E502552D6@amacapital.net>
Message-ID: <0b0a3cea-d951-d3be-16de-a0e9d50cb2ba@zytor.com>

On 01/29/18 10:26, Andy Lutomirski wrote:
>>>
>>> That will utterly suck on non-UMIP machines that have
>>> hypervisor-provided UMIP emulation.
>>
>> Is that a valid thing to optimize for, especially given that paranoid
>> entries aren't the most common anyway?
> 
> A bunch of people seem to care about NMI performance for perf.
>

That wasn't really the question...

> And the current patch set works without this trick.

But I believe the tricks it uses are fragile.

> FWIW, if we switch all entries to the entry text trampoline, we get direct percpu access for free.

That might be a better option.

	-hpa

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
