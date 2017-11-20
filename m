From: chrubis at suse.cz (Cyril Hrubis)
Date: Mon, 20 Nov 2017 17:10:29 +0100
Subject: [Linux-kselftest-mirror] [LTP] Towards 4.14 LTS
In-Reply-To: <5E1947BC-9D22-42EB-BA29-96EA15A9C817@linaro.org>
References: <5E1947BC-9D22-42EB-BA29-96EA15A9C817@linaro.org>
Message-ID: <20171120161029.GA2188@rei>

Hi!
> So why didn???t we report these? As mentioned we???ve been tossing out dodgy
> test cases to get to a clean baseline. We don???t need or want noise. 
> 
> For LTS, I want the system when it detects a failure to enable a quick 
> bisect involving the affected test bucket. Given the nature of kernel 
> bugs tho, there is that class of bug which only happens occasionally.

>From my experience debugging kernel bugs requires an actuall human
interaction and there is only certain level of automation that can be
achieved. Don't take me wrong, automatic bisection and other bells and
whistles are a nice to have, but at the end of the day you usually need
someone to reproduce/look at the problem, possibly check the source
code, report a bug, etc. Hence it does not make much sense to have an
automated system without dedicated engineers assigned to review the test
results.

-- 
Cyril Hrubis
chrubis at suse.cz
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
