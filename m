From: elfring@users.sourceforge.net (SF Markus Elfring)
Date: Tue, 21 Nov 2017 20:30:14 +0100
Subject: [Linux-kselftest-mirror] selftests: Completion of error handling
In-Reply-To: <26965dfd-74e8-cf6f-7f55-56310834189d@kernel.org>
References: <988e4be0-4784-d9b7-879b-06ed405ae293@users.sourceforge.net>
 <26965dfd-74e8-cf6f-7f55-56310834189d@kernel.org>
Message-ID: <dc266850-52d0-8380-7ab1-087c07a709fb@users.sourceforge.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171121193014.3Ds8Cr32O8ou1tVQjaYwGs0Pc-ziRdo9XpPQ2KLcrfs@z>

>> Static source code analysis points out that the checking of return values from
>> some function calls is incomplete also in this software area.
>> How would you like to fix remaining open issues there?
>>
> 
> Without understanding the details on which failures,

Are you using any dedicated tools for this purpose already?


> it would be hard for me comment on how to handle them.

I inspected also another specific source file for example.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/tools/testing/selftests/timers/posix_timers.c?id=aa1fbe633d3034f9f838ff13387af04771e68e31#n81
https://elixir.free-electrons.com/linux/v4.14-rc8/source/tools/testing/selftests/timers/posix_timers.c#L78

This one contains some places (like in the function “check_itimer”)
where the error detection and corresponding exception handling is incomplete
so far.
Other source files can contain similar update candidates.

There are different design options available to improve the software
situation here.
Which development directions do you prefer?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
