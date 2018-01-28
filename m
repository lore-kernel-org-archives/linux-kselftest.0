From: luto at kernel.org (Andy Lutomirski)
Date: Sun, 28 Jan 2018 11:21:51 -0800
Subject: [Linux-kselftest-mirror] selftests/x86/fsgsbase_64 test problem
In-Reply-To: <20180126225611.2nebardhgblxhs5x@pd.tnic>
References: <20180126153631.ha7yc33fj5uhitjo@xps>
 <CALCETrXVFC=6wPNpL0Dc7pkSv4JSaoEZZcu3Rtw0sg7KJsE5Pg@mail.gmail.com>
 <CALCETrUi7Ub2TbFy3Cvj+j4VXZeYULPY+mgL7OX7bz9L8GO9ew@mail.gmail.com>
 <CALCETrWvkd68wPCxGwmzqgsLTr_59+=L9u8obwt+f+oUQwDY=w@mail.gmail.com>
 <CALCETrW5=K5wJqLRZACmJJ+LF8Nb+Yf3OJ1tTNwqiOCxHu3w1Q@mail.gmail.com>
 <20180126225611.2nebardhgblxhs5x@pd.tnic>
Message-ID: <CALCETrXq0T+SbUgY-yPwAsqkeCvyNGdVwGtgqDLQb4CXphOtFw@mail.gmail.com>

On Fri, Jan 26, 2018 at 2:56 PM, Borislav Petkov <bp at alien8.de> wrote:
> On Fri, Jan 26, 2018 at 02:38:28PM -0800, Andy Lutomirski wrote:
>> Borislav, any chance you could run the attached program on an AMD
>> machine to see what it does?
>
> [boris at pd: /tmp> ./gs1
> PID = 3420
> ax = 0, cx = 0, dx = 0
>
> This is on 4.15-rc7-ish + tip/master from 2 wks ago.

Phooey :(
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
