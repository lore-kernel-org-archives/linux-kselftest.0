From: hpa at zytor.com (H. Peter Anvin)
Date: Mon, 29 Jan 2018 01:13:59 -0800
Subject: [Linux-kselftest-mirror] selftests/x86/fsgsbase_64 test problem
In-Reply-To: <CALCETrUcJ2dVkSXGhtRvQeYQZZhPca95VhjQB8j6dFN6hzceSQ@mail.gmail.com>
References: <20180126153631.ha7yc33fj5uhitjo@xps>
 <CALCETrXVFC=6wPNpL0Dc7pkSv4JSaoEZZcu3Rtw0sg7KJsE5Pg@mail.gmail.com>
 <CALCETrUi7Ub2TbFy3Cvj+j4VXZeYULPY+mgL7OX7bz9L8GO9ew@mail.gmail.com>
 <CALCETrWvkd68wPCxGwmzqgsLTr_59+=L9u8obwt+f+oUQwDY=w@mail.gmail.com>
 <CALCETrW5=K5wJqLRZACmJJ+LF8Nb+Yf3OJ1tTNwqiOCxHu3w1Q@mail.gmail.com>
 <CALCETrWq04AngUHkSv-bqDYXDSVH8N0bhXS_Nh63SpMmndexSA@mail.gmail.com>
 <CALCETrUcJ2dVkSXGhtRvQeYQZZhPca95VhjQB8j6dFN6hzceSQ@mail.gmail.com>
Message-ID: <46328204-e363-e517-f30c-c8c94ac1442c@zytor.com>

On 01/28/18 11:21, Andy Lutomirski wrote:
>>
>> I think the bug is here.  I think that, when writing a NULL selector
>> to DS, ES, FS, or GS, Intel CPUs incorrectly set DPL == RPL, whereas
>> they should set DPL to 3.
> 
> As an experiment, I did this:
> 
>  DEFINE_PER_CPU_PAGE_ALIGNED(struct gdt_page, gdt_page) = { .gdt = {
> +       [0] = { .dpl = 3, },
> +
> 
> This had no apparent effect.  I was hoping that maybe loading NULL
> into a selector would copy DPL from from gdt[0], but it seems like it
> doesn't.
> 

GDT[0] doesn't actually exist.  It is pretty much scratch space (I have
suggested using it for the gsbase once all those issues get sorted out,
because it lets the paranoid code do something like:

	rdgsbase %rax
	push %rax	/* Save old gsbase */
	push %rax	/* Reserve space on stack */
	sgdt -2(%rsp)	/* We don't care about the limit */
	pop %rax	/* %rax <- gdtbase */
	mov (%rax),%rax	/* GDT[0] holds the gsbase for this cpu */
	wrgsbase %rax
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
