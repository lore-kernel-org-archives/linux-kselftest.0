From: hpa@zytor.com (H. Peter Anvin)
Date: Fri, 26 Jan 2018 14:51:19 -0800
Subject: [Linux-kselftest-mirror] selftests/x86/fsgsbase_64 test problem
In-Reply-To: <CALCETrWvkd68wPCxGwmzqgsLTr_59+=L9u8obwt+f+oUQwDY=w@mail.gmail.com>
References: <20180126153631.ha7yc33fj5uhitjo@xps>
 <CALCETrXVFC=6wPNpL0Dc7pkSv4JSaoEZZcu3Rtw0sg7KJsE5Pg@mail.gmail.com>
 <CALCETrUi7Ub2TbFy3Cvj+j4VXZeYULPY+mgL7OX7bz9L8GO9ew@mail.gmail.com>
 <CALCETrWvkd68wPCxGwmzqgsLTr_59+=L9u8obwt+f+oUQwDY=w@mail.gmail.com>
Message-ID: <9630de94-83ba-85ad-c5f3-a515f7aa7243@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180126225119.dPZUs-gXxvOnfQ6PXx-PEbEtdGJbq9XAcQ4B22t9oWE@z>

On 01/26/18 11:46, Andy Lutomirski wrote:
> 
> Under QEMU TCG, gs stays equal to 1.  On native or KVM, on Skylake, it
> changes to 0.
> 
> On KVM or native, I do not observe do_debug getting called with %gs ==
> 1.  On TCG, I do.  I don't think that's precisely the problem that's
> causing the test to fail, since the test doesn't use TF or ptrace, but
> I wouldn't be shocked if it's related.
> 
> hpa, any insight?
> 
> (NB: if you want to play with this as I've described it, you may need
> to make invalid_selector() in ptrace.c always return false.  The
> current implementation is too strict and causes problems.)
> 

Looking at it.  I want to grok this in the general context of fsgsbase
as well, of course.

	-hpa
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
