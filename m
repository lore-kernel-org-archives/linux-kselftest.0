From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Fri, 1 Jun 2018 21:17:24 -0400 (EDT)
Subject: [PATCH v8 5/8] tracepoint: Make rcuidle tracepoint callers use
 SRCU
In-Reply-To: <20180531175153.GA129415@joelaf.mtv.corp.google.com>
References: <20180530000500.257225-1-joel@joelfernandes.org>
 <20180530000500.257225-6-joel@joelfernandes.org>
 <214539705.3633.1527749441133.JavaMail.zimbra@efficios.com>
 <20180531175153.GA129415@joelaf.mtv.corp.google.com>
Message-ID: <1349580221.4426.1527902244184.JavaMail.zimbra@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180602011724.M_o-zuHwqHWfU8YBXwfGYya7W9nNw3ny2F-oJ4UIG0g@z>

----- On May 31, 2018,@1:51 PM, Joel Fernandes, Google joel@joelfernandes.org wrote:

>> I find it odd to have a "return" in a macro that consists of a
>> do { } while (0). I'm tempted to replace "return" by "break" here,
>> to break the macro do/while (0) loop.
> 
> "return;" is also used from "if (!(cond))" above so I prefer be consistent
> and just use return than break as done above, but please let me know if you
> still object.

It's fine by me,

Thanks!

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
