Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63BC3EC82B;
	Thu, 24 Sep 2026 21:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283644; cv=none; b=Q1Cj1+mZ8I3ibp0gRV+unVN4ywV4Oh+Ov2cbKEFsU7EoSwbI6SgeDH7YkaAU8Vl8AfqOxzBe6v9FfxRqG/Mg/JZxLRV4SjX4zArcyIWn8auf5fPuZ3Aa3IKmsBshmo1WXpsb7c/PJVYCyYwF0yv0L1mT0VN74zhWGCe7cV2MCSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283644; c=relaxed/simple;
	bh=i8070O7XztGS7j/b872Lao+v2gS2ei8JpD5VuekwO5s=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S9xD3/BbYCuFi8mkiKMSLlUdPoQ1ZJPJdJKfd/6ub10ud5/KVd0iYoiA1+QhQ774ksO2x850JLM3oeOj2y5rUHsWo6EFGKJcW9IhEQ0ETQ723r1lF7zfqXt4Gs8m4gZNNwJ3XffnY/lJMsso2dzX4e+4mi219yp5mar+D5Fd/rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3a03UAz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3a03UAz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FF41F00893;
	Thu, 24 Sep 2026 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790283642;
	bh=cRqwqrfyKpbqsyM6+nhQOH24b5t2JHrFyoiMbEwUJuA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=B3a03UAzoRSwbBr3NlHhCZk9JvTrbjhHxn1mabVZFMgT/yuu5P44QAxtQYVg1TfMT
	 d29bvSwrpHVJQPB19WUMYcOXzG+RNpy0JjBOANyApx80v6RMtnIoIcw/b7k+4fu4+b
	 0ietmxQRD8Mr50oLpqE8gD6a0c1fIqg6WUBQ42JSEZMf32jvy8AO45L47Ym+hGegpD
	 F0SG3VcCZKj98qiUfPsxVAZVxGFjSrb6gq/8WIEtBf0Xw3OvBP4Pj1EKSltFLlEiqZ
	 x8XfChfUb9OaDW/cx1ZO28uBUjghDWWGRG2P590Su6OkleEMjTqB0cxaXoCl48cq5e
	 1w6AK+SAR9Tug==
Subject: Re: [PATCH net-next v8 2/3] selftests: tc-testing: add fq_pie
 per-flow class stats test
From: netdev-bot+sashiko@kernel.org
To: hemendranaik@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Date: Thu, 24 Sep 2026 21:00:41 +0000
Message-ID: <179028364138.2160803.8521628163584007831@kernel.org>
In-Reply-To: <20260922205924.32173-3-hemendranaik@gmail.com>
References: <20260922205924.32173-3-hemendranaik@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Test 83c0 in tools/testing/selftests/tc-testing/tc-
  tests/qdiscs/fq_pie.json depends on an iproute2 change that has not…
- [Low] Test 83c0 relies on a ping step, `ping -c 50 -i 0.001 -W 0.01 -s
  56 10.10.11.11 -I $DUMMY > /dev/null 2>&1 || true`, to put packets…

--

selftests: tc-testing: add fq_pie per-flow class stats test

This adds tc-testing case 83c0. It builds a tbf + fq_pie hierarchy on
$DUMMY, pushes traffic through it with ping, and checks the output of
"tc -s class show" for an fq_pie class. The commit message says the
per-flow counters are printed by a companion iproute2 change.

> diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> index 229fe1bf4a906..15b2667285eb4 100644
> --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json

[ ... ]

> +        "setup": [
> +            "$IP link set dev $DUMMY up || true",
> +            "$IP addr add 10.10.11.10/24 dev $DUMMY || true",
> +            "$TC qdisc add dev $DUMMY root handle 1: tbf rate 8bit burst 100b latency 100ms",
> +            "$TC qdisc add dev $DUMMY parent 1:1 handle 2: fq_pie limit 100 flows 1",
> +            "ping -c 50 -i 0.001 -W 0.01 -s 56 10.10.11.11 -I $DUMMY > /dev/null 2>&1 || true"

[Severity: Low]
This is a robustness point, not a bug. fq_pie_walk() in
net/sched/sch_fq_pie.c only dumps flows that have a non-empty flowchain:

    if (list_empty(&q->flows[i].flowchain)) {
        arg->count++;
        continue;
    }

That makes this ping the only thing that gets class 2:1 into the output.

In the standard tdc setup this works. nsPlugin runs the command inside
the namespace, dummy is NOARP, and the 98-byte frame fits under tbf's
max_size of 100.

If ping is missing, or doesn't accept -i 0.001 / -W 0.01, the "|| true"
and the redirect hide the error. The test then fails as a regex mismatch
in the verify stage, not as a setup error.

Should this step be allowed to fail visibly? The same pattern is already
used elsewhere in tc-testing (infra/qdiscs.json), so it may be fine as is.

> +        ],
> +        "cmdUnderTest": "$TC -s class show dev $DUMMY",
> +        "expExitCode": "0",
> +        "verifyCmd": "$TC -s class show dev $DUMMY",
> +        "matchPattern": "class fq_pie 2:[0-9]+ .*prob .*delay .*deficit",

[Severity: Medium]
Will this test fail with any iproute2 release available today?

The kernel side, fq_pie_dump_class_stats(), only sends a binary struct
tc_fq_pie_xstats with type TCA_FQ_PIE_XSTATS_CLASS:

    xstats.type = TCA_FQ_PIE_XSTATS_CLASS;
    ...
    return gnet_stats_copy_app(d, &xstats, sizeof(xstats));

The words "prob", "delay" and "deficit" only appear if tc formats that
struct. According to the commit message, only the pending iproute2 patch
does that.

With a stock tc, re.findall() in run_one_test() in tdc.py finds 0
matches against a matchCount of 1. tdc then marks the test as failed,
even on a kernel where the fq_pie class stats work correctly.

tdc already has a way to skip in this case: the dependsOn key handled in
run_one_test(). Other tests use it to gate on newer iproute2 features.
For example, in actions/mirred.json:

    "dependsOn": "$TC actions add action mirred help 2>&1 | grep -q blockid",

Could 83c0 get a similar dependsOn probe, so that it skips instead of
failing when the tc in use can't print the per-flow stats?

The commit message also describes the test more narrowly than it
behaves:

    verify that 'tc -s class show' reports an fq_pie class.

The pattern needs the per-flow counters too, not just an fq_pie class.
Could the description say that the test depends on the iproute2 change?

> +        "matchCount": "1",
> +        "teardown": [
> +            "$TC qdisc del dev $DUMMY handle 1: root",
> +            "$IP addr del 10.10.11.10/24 dev $DUMMY || true"
> +        ]
>      }
>  ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922205924.32173-1-hemendranaik%40gmail.com
