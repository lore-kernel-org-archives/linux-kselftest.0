Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424313;
	b=Y8h1WYDuxo4lfLcIw43t4vQPXLKUMNC/5DTa3SBUyMQcfATERKZdnNkfIiV3sFQZ25Xb
	 uQhKfM8bCwIV8pLLST63n53OyB5xxZJfiPcl4evxDa/KHbBwGiNclf56lbA6cWupNlZQ7
	 nKENvgeNxN0AzrM/ArWzmTdml+N+O7dLyHmxGIn9JkHpTY+Q9PFBHA4r3G4SQWFdA/Drr
	 zh8ZqJyVm8oPYkTaTYQ+Dd6y4I9sJF5OYBnOzuc2G51FekQ2fXEulybui6dHoyMLVWmmf
	 EWzQA0vGoiEJcE2rs0qNpLLwDuMAt0mrsFWG4nBPVJ6xTIVaS/UNGBJ55tVaAd3/pag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424313;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=BmFRczvoBtmOwTG/7oMajmLwqMVNgNaQBfQiryDbdac=;
	b=HckVgmcFUvyTLTZG8wI4gpOwMKfj81WNWI1SuoEo5xFrTOjEI78PcE++f96j8pA55dcY
	 AEu6ugB/dTrHhsgWKPvKPLil/8k1uRxVbGWR/DCkAzZyZW8+loC5NNheX+7siiwAS0BCW
	 inls5Ch1efEh+Eec4FwBX951NbbxuYiFFHfxW58E6UyHUm2Vb4O0fpXzDmAgdlBg2ET2Z
	 Lsqvo+v6Y7gggliqHN5vqpWksdmhdeYHNFwLFzRvzA+GsB6vdmxC2f5a7C3ZHNhDkg8o3
	 Z5Y0xCECPmp17mcm2KKcyrOnt24UVIPhyURd3PmhhgqMWBVNOkguSWLBGCCMkSECbFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXhqP7lw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D44606A337;
	Wed, 11 Nov 2026 19:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXhqP7lw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BAF1F00A08;
	Wed, 11 Nov 2026 19:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794424313;
	bh=BmFRczvoBtmOwTG/7oMajmLwqMVNgNaQBfQiryDbdac=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UXhqP7lwuutW/dZFcFQe4jzt9KSgg0Xm3Iawqi+5OofgNlnG9R7neP4ey7XzX2o9T
	 VyBI0sRs+vbbySD+iYcdPPnUfj3auz5a6B0HF8jgALxE/Hw4KBhY7sBNcpUAV3Mzry
	 N46ubKa9/fFTOOYPoh36Pw2ewt3y9FrstuKXnk9YXfHbLtWs2DQ7WIwWyMeN0uUwlK
	 Mo2NrtMCUFliZyXFboRROnWF9mDqFuuu0XiYt1QZzt3Yj2cT6x77nYpUT38E+US+sN
	 heMhgg9JUXY03OIFZXW7ztewKyyrSB/sNNZtT6fTiXQcdFGA9+4clUKeOMuCQcZUgC
	 Bzy9KAt/gb9Xg==
Subject: Re: [PATCH net-next v10 2/4] selftests: tc-testing: add fq_pie
 per-flow class stats test
From: netdev-bot+sashiko@kernel.org
To: hemendranaik@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, donald.hunter@gmail.com, ast@fiberby.net,
 toke@redhat.com, liuhangbin@kylinos.cn, j.koeppeler@tu-berlin.de,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 vishy0777@gmail.com, tahiliani@nitk.edu.in
Date: Wed, 11 Nov 2026 19:11:52 +0000
Message-ID: <179442431204.2199510.9626682252073795058@kernel.org>
In-Reply-To: <20261109071017.438478-3-hemendranaik@gmail.com>
References: <20261109071017.438478-3-hemendranaik@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Test 83c0 in tools/testing/selftests/tc-testing/tc-
  tests/qdiscs/fq_pie.json does not do what the commit message says, and…

--

selftests: tc-testing: add fq_pie per-flow class stats test

This adds tc-testing case 83c0. The test builds a TBF + fq_pie hierarchy
on $DUMMY and pushes ping traffic through it. It then checks that
'tc -s class show' reports an fq_pie class.

> Add tc-testing case 83c0: build a TBF + fq_pie hierarchy on $DUMMY, push
> traffic through it with ping, and verify that 'tc -s class show' reports
> an fq_pie class.
>
> The per-flow counters themselves (prob, delay, deficit) are printed with
> the companion iproute2 change, "tc: fq_pie: add support for printing
> per-flow PIE statistics"

> diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> index 229fe1bf4a906..15b2667285eb4 100644
> --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> @@ -40,5 +40,32 @@

[ ... ]

> +    },
> +    {
> +        "id": "83c0",
> +        "name": "FQ-PIE class stats accessible via tc class show",

[ ... ]

> +        "cmdUnderTest": "$TC -s class show dev $DUMMY",
> +        "expExitCode": "0",
> +        "verifyCmd": "$TC -s class show dev $DUMMY",
> +        "matchPattern": "class fq_pie 2:[0-9]+ .*prob .*delay .*deficit",
> +        "matchCount": "1",

[Severity: Medium]
Will this test fail, rather than skip, on any iproute2 that doesn't have
the companion patch?

The commit message says the test checks that an fq_pie class is reported.
The matchPattern, however, also needs the words prob, delay and deficit
after the class line, and only the out-of-tree iproute2 change prints
them.

On the kernel side, fq_pie_dump_class_stats() in net/sched/sch_fq_pie.c
only sends a binary blob:

net/sched/sch_fq_pie.c:fq_pie_dump_class_stats() {
    ...
	xstats.type = TCA_FQ_PIE_XSTATS_CLASS;
    ...
	return gnet_stats_copy_app(d, &xstats, sizeof(xstats));
}

Current iproute2 decodes fq_pie xstats with the qdisc layout (pkts_in,
overlimit, overmemory, dropped, ecn_mark, new_flow_count and so on). None
of those labels is prob, delay or deficit. The tbf class 1:1 is printed
before the fq_pie class, so nothing after "class fq_pie 2:1" can supply
those words either.

That means re.findall() gets 0 matches against a matchCount of 1, and
run_one_test() in tdc.py marks the test as failed:

tools/testing/selftests/tc-testing/tdc.py:run_one_test() {
    ...
	if len(match_index) != int(tidx["matchCount"]):
	    res.set_result(ResultState.fail)
    ...
}

tdc can already skip tests that depend on a userspace feature, through
the dependsOn key, which run_one_test() checks. mirred.json uses it, for
example:

    "dependsOn": "$TC actions add action mirred help 2>&1 | grep -q blockid",

Test 83c0 has no dependsOn probe. As a result, a correct kernel tested
with stock iproute2 would show a new tc-testing failure. The selftest
would also depend on an output format that only exists in an unmerged
userspace patch.

Would it make sense to either add a dependsOn probe for the new iproute2
output, or narrow the pattern to just the "class fq_pie 2:N" line as the
commit message describes? The commit message could then be updated to
say which approach the test uses.

> +        "teardown": [
> +            "$TC qdisc del dev $DUMMY handle 1: root",
> +            "$IP addr del 10.10.11.10/24 dev $DUMMY || true"
> +        ]
>      }
>  ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109071017.438478-1-hemendranaik%40gmail.com
