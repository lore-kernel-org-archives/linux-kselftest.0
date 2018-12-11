From: anton.ivanov@cambridgegreys.com (Anton Ivanov)
Date: Tue, 11 Dec 2018 17:01:48 +0000
Subject: [RFC v3 11/19] kunit: add Python libraries for handing KUnit
 config and kernel
In-Reply-To: <20181211094140.2a928fe7@gandalf.local.home>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-12-brendanhiggins@google.com>
 <841cf4ae-501b-05ae-5863-a51010709b67@ideasonboard.com>
 <CAFd5g47x-UNja72k-CWPmWz9+LTn8pF8Wj5Poq+2FJ93E=vymA@mail.gmail.com>
 <20181204204701.GT28501@garbanzo.do-not-panic.com>
 <f8722f4a-44c8-24c2-c433-5178f9f40b82@ideasonboard.com>
 <20181206153718.GD24603@bombadil.infradead.org>
 <20181211140926.7wzd5jh6klcfsfgz@pathway.suse.cz>
 <20181211094140.2a928fe7@gandalf.local.home>
Message-ID: <34f9e9f3-6bca-f11f-097c-c6e0cb779b61@cambridgegreys.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181211170148.5-mYVJpzQUBbZktZb-Xk-VW3KKdWdmBYGkRpRy3wC7k@z>


On 12/11/18 2:41 PM, Steven Rostedt wrote:
> On Tue, 11 Dec 2018 15:09:26 +0100
> Petr Mladek <pmladek@suse.com> wrote:
>
>>> We have liburcu already, which is good.  The main sticking points are:
>>>
>>>   - printk has started adding a lot of %pX enhancements which printf
>>>     obviously doesn't know about.
>> I wonder how big problem it is and if it is worth using another
>> approach.
> No, please do not change the %pX approach.
>
>> An alternative would be to replace them with helper functions
>> the would produce the same string. The meaning would be easier
>> to understand. But concatenating with the surrounding text
>> would be less elegant. People might start using pr_cont()
>> that is problematic (mixed lines).
>>
>> Also the %pX formats are mostly used to print context of some
>> structures. Even the helper functions would need some maintenance
>> to keep them compatible.
>>
>> BTW: The printk() feature has been introduced 10 years ago by
>> the commit 4d8a743cdd2690c0bc8 ("vsprintf: add infrastructure
>> support for extended '%p' specifiers").
> trace-cmd and perf know about most of the %pX data and how to read it.
> Perhaps we can extend the libtraceevent library to export a generic way
> to read data from printk() output for other tools to use.

Going back for a second to using UML for this. UML console at present is 
interrupt driven - it emulates serial IO using several different 
back-ends (file descriptors, xterm or actual tty/ptys). Epoll events on 
the host side are used to trigger the UML interrupts - both read and write.

This works OK for normal use, but may result in all kinds of interesting 
false positives/false negatives when UML is used to run unit tests 
against a change which changes interrupt behavior.

IMO it may be useful to consider some alternatives specifically for unit 
test coverage purposes where printk and/or the whole console output 
altogether bypass some of the IRQ driven semantics.

-- 

Anton R. Ivanov

Cambridge Greys Limited, England and Wales company No 10273661
http://www.cambridgegreys.com/
