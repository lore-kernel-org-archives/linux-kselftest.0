From: tom.gall@linaro.org (Tom Gall)
Date: Mon, 20 Nov 2017 10:48:58 -0600
Subject: [Linux-kselftest-mirror] [LTP] Towards 4.14 LTS
In-Reply-To: <20171120161029.GA2188@rei>
References: <5E1947BC-9D22-42EB-BA29-96EA15A9C817@linaro.org>
 <20171120161029.GA2188@rei>
Message-ID: <AD4F87EA-602A-402D-8E72-4DFB52585A5D@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171120164858.-fqccawrMa2CcqCp9e7Aycjsvi80e_PrVA4WwXfNoQw@z>



> On Nov 20, 2017,@10:10 AM, Cyril Hrubis <chrubis@suse.cz> wrote:
> 
> Hi!
>> So why didn???t we report these? As mentioned we???ve been tossing out dodgy
>> test cases to get to a clean baseline. We don???t need or want noise. 
>> 
>> For LTS, I want the system when it detects a failure to enable a quick 
>> bisect involving the affected test bucket. Given the nature of kernel 
>> bugs tho, there is that class of bug which only happens occasionally.
> 
> From my experience debugging kernel bugs requires an actuall human
> interaction and there is only certain level of automation that can be
> achieved. Don't take me wrong, automatic bisection and other bells and
> whistles are a nice to have, but at the end of the day you usually need
> someone to reproduce/look at the problem, possibly check the source
> code, report a bug, etc. Hence it does not make much sense to have an
> automated system without dedicated engineers assigned to review the test
> results.

You are entirely right automation only gets so far. We have a few lines
of defense that probably are worth a mention.

1) infra - sometimes results/runs need to be re-run for whatever reason.
2) triage - Crappy test case or something that is real?
3) kernel - bisecting etc

We don’t have huge dedicated teams for each category but likewise each 
has a team.

> -- 
> Cyril Hrubis
> chrubis at suse.cz

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
