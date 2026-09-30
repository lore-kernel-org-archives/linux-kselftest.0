Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AD33AC00;
	Wed, 30 Sep 2026 04:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790742896; cv=none; b=bqmLm5fTRPMHQIL5ENjfgiuBGnY2XudYlEMOKBubmUuXcxQ71q2G3WyudVG6QQ6TKASByhyp0JuuApWmFZcU2jmlyqKD2W3UEXGaJGzQd2wc9tKWOu6C++Ia/E080jKn7kJt36rKWH2AOvmKrPwSjrVj8KG/P/LSSiDkH1xBdOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790742896; c=relaxed/simple;
	bh=XdxdxADVShidga4QhSPxwJ05Jw3xCKDFpggKmrwrtRU=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k1gpkvG1HVMtwFslcS8fWoOWciAzszQ4HoB4s36BYZI87mftsmN6cOLZ6ZQGBxDIZlCMotC0nQHbY+BXCIHOSmUOMrTOkCLS1NKCSyguT7on329kPD11IDhYop1w7B9eiYiy2fT9KpQxn5Q7Hz51kjnE1d71fUJy4z7KnJkQ6Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2Nd+Wgz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2Nd+Wgz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61A71F000FF;
	Wed, 30 Sep 2026 04:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790742894;
	bh=gTBsAQPTAMa1TGcTgSuzBmojv4csRuCzr5FDsrx5s1A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I2Nd+WgzpsCc4bc/7vQpl/Gqb0V6bWsvuC3ph2+UxYOLtIiTSXZFAuSi1yqzdgSbD
	 oxBrpcb2AutogQ54xt4pARPJUenvSoZDEtI1t7eJ2buj0sT+2dmGbq5tURaS8+CvKS
	 R3lmpkd2dvP1disCaMnB4t511ckehU75lCoalsVbK7Qim5SVYGSYTzCRbfHt8zV+R5
	 ATSrgSyZLe/EGbvmJ10yQkvHsTAYYwpop4wQZ11nHU/2Q9m84ftkLu87NRtSGsJ/OC
	 A7KBVyDxtFPc1q15y08HT7x9INlUAFbNFvjAfSI08GspMka5rVTEv48ngaOOFZ7oic
	 tDGJoMCYHquQw==
Subject: Re: [PATCH net-next v9 2/3] selftests: tc-testing: add fq_pie
 per-flow class stats test
From: netdev-bot+sashiko@kernel.org
To: hemendranaik@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Date: Wed, 30 Sep 2026 04:34:53 +0000
Message-ID: <179074289334.434549.12917457588276815792@kernel.org>
In-Reply-To: <20260928043358.6866-3-hemendranaik@gmail.com>
References: <20260928043358.6866-3-hemendranaik@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
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
  tests/qdiscs/fq_pie.json needs an unreleased iproute2 to pass, and the…

--

selftests: tc-testing: add fq_pie per-flow class stats test

This commit adds tc-testing case 83c0. The test builds a TBF + fq_pie
hierarchy on $DUMMY, sends ping traffic through it, and checks the output
of tc -s class show. The commit message says a companion iproute2 change
prints the per-flow counters.

> diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> index 229fe1bf4a906..15b2667285eb4 100644
> --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> @@ -40,5 +40,32 @@
>          "matchPattern": "qdisc fq_pie 1: root refcnt [0-9]+ limit 1p",
>          "matchCount": "1",
>          "teardown": ["$TC qdisc del dev $DEV1 handle 1: root"]
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

With a released iproute2, will this test fail instead of being skipped?

The commit message says the test will:

  "verify that 'tc -s class show' reports an fq_pie class."

It also says prob, delay and deficit are printed by the companion iproute2
change "tc: fq_pie: add support for printing per-flow PIE statistics".
However, the matchPattern requires all three labels:

    class fq_pie 2:[0-9]+ .*prob .*delay .*deficit

That iproute2 change does not seem to be merged yet. Released tc prints
the fq_pie xstats as pkts_in, overlimit, overmemory, dropped, ecn_mark,
new_flow_count, new_flows_len, old_flows_len, memory_used and
memory_limit.

With that tc, fq_pie_dump_class_stats() still produces the
"class fq_pie 2:1" line. But run_one_test() in tdc.py does this:

    match_index = re.findall(match_pattern, procout)
    if len(match_index) != int(tidx["matchCount"]):
        res.set_result(ResultState.fail)

It finds 0 matches, so 83c0 is reported as FAIL. For CI using stock
iproute2, would this show up as a kernel regression even though the
kernel side works?

tdc.py already supports a dependsOn probe, which skips a test when the
command returns non-zero. Other tests use it to gate on newer iproute2
features. For example, mirred.json has:

    "dependsOn": "$TC actions add action mirred help 2>&1 | grep -q blockid",

Could 83c0 add a similar dependsOn check that detects the new tc output?
Also, could the commit message say that the test checks the prob, delay
and deficit fields as well as the fq_pie class line?

No later patch in the series seems to change this test.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928043358.6866-1-hemendranaik%40gmail.com
