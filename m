From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Mon, 4 Mar 2019 14:57:47 -0500 (EST)
Subject: [PATCH] selftest/rseq: Remove duplicate header
In-Reply-To: <CAFqt6zarwg3NnkbNYKEO-jrdHUw8GwMqUrLDTqgQV3D1dux-qQ@mail.gmail.com>
References: <20190304183827.GA6809@jordon-HP-15-Notebook-PC>
 <20190304184958.GR32494@hirez.programming.kicks-ass.net>
 <CAFqt6zarwg3NnkbNYKEO-jrdHUw8GwMqUrLDTqgQV3D1dux-qQ@mail.gmail.com>
Message-ID: <712691085.1137.1551729467392.JavaMail.zimbra@efficios.com>

----- On Mar 4, 2019, at 1:53 PM, Souptick Joarder jrdr.linux at gmail.com wrote:

> On Tue, Mar 5, 2019 at 12:20 AM Peter Zijlstra <peterz at infradead.org> wrote:
>>
>> On Tue, Mar 05, 2019 at 12:08:27AM +0530, Souptick Joarder wrote:
>> > Remove duplicate header which is included twice
>> >
>> > Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
>> > Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
>>
>> That SoB chain is invalid.
> 
> I didn't get why it is invalid ?

I think it's about having the author of the patch (From) as first
Signed-off-by, and then apply following Signed-off-by by maintainers
who pick up the patch. (That's what I am used to see)

What is the intent behind the second Signed-off-by by Sabyasachi Gupta ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
