Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552873C1967;
	Mon, 21 Sep 2026 20:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023413; cv=none; b=b6d0KRSPAOR0awuTtCq7F0S3mVIzBS/ydWbpn+xLMupkkABTlzKV1Un+Au1MYypYmadP6HHtWmmU6XsYcn49COAboWk7Lo3P72fGt79C2in7looKs7T3rXcehNmLToaboa5KmsVvgOhN5nyqd0Np1xH6z7FSN1zKhO94CKcbXyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023413; c=relaxed/simple;
	bh=PtDJQ4qTzhL2hl0tUBqghTborQg+00b80OGFua8w2uo=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LD6D/T0BEPGMKODHAOIrGKu9WqYnsTTjQgfooVaZtsJDHaqW90gRRubLZLLjnoDSCatRaEkg+2CVyhGEN2xV6yim5cP3oTsxFoVopTE6R1kLD1V+aj7Ek/42fM15efxwOMXobi16VoeyoRQB7O58pg5HBiLHmNIBAWPnaBDiIek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLUqLVKM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLUqLVKM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E49C1F00893;
	Mon, 21 Sep 2026 20:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790023410;
	bh=vThV3B5RW3xuq/XRwp9LBocCqV9eQUHRyH4p1ym1KMc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PLUqLVKMdOgb+vhAbxpJo4JhdmlFbtCN3oZ3rNDQ7aACQToXqtTypWH5WLAqLi5U8
	 OIa3Fr+a2Sb88wp6R+AP9hfpwi+iPuKEcILx7S5xYWVhmawJNY2zRGatyv2kbMxqay
	 71byO96j3/P6CSJ2daTcQG1UC/pqrrLNqvDfDpuZMaanPMOh6KL3QeQu4j88YzJ8/c
	 AxTla5veD5E7LKDAsGlFu3psk5s1fLLHH7OA+EFceAa8igS6evfgEqwxqwNRmTW4CJ
	 uuuDpoVB/jqt7b+EcI8t7ZfAUjuGM2aNh0Wxe1T9I4BE4kxvcZBCm7NP1rOu1etGp0
	 u2tPTUHcbEgeQ==
Subject: Re: [PATCH net-next v6 2/3] selftests: tc-testing: add fq_pie
 per-flow class stats test
From: netdev-bot+sashiko@kernel.org
To: hemendranaik@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Date: Mon, 21 Sep 2026 20:43:28 +0000
Message-ID: <179002340887.2160803.8030592378545876774@kernel.org>
In-Reply-To: <20260917204225.275251-3-hemendranaik@gmail.com>
References: <20260917204225.275251-3-hemendranaik@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] New tdc case 83c0 in tools/testing/selftests/tc-testing/tc-
  tests/qdiscs/fq_pie.json asserts `matchPattern` = "class fq_pie…
- [Medium] Case 83c0's assertion depends on fq_pie having a backlogged
  flow at the exact instant the dump runs, because fq_pie_walk()…
- [Low] Case 83c0 claims to cover the new per-flow fq_pie statistics but
  only checks that the literal label words "prob", "delay" and "deficit"…

--

Verified against the tree. Report follows.

selftests: tc-testing: add fq_pie per-flow class stats test

This adds tdc case 83c0, which builds a TBF plus fq_pie hierarchy on
$DUMMY, drives traffic through it with ping, and then greps the output of
'tc -s class show' for an fq_pie class line carrying per-flow counters.

> diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> index 229fe1bf4a906..15b2667285eb4 100644
> --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json
> +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq_pie.json

[ ... ]

> @@ -40,5 +40,32 @@
> +        "setup": [
> +            "$IP link set dev $DUMMY up || true",
> +            "$IP addr add 10.10.11.10/24 dev $DUMMY || true",
> +            "$TC qdisc add dev $DUMMY root handle 1: tbf rate 8bit burst 100b latency 100ms",
> +            "$TC qdisc add dev $DUMMY parent 1:1 handle 2: fq_pie limit 100 flows 1",
> +            "ping -c 50 -i 0.001 -W 0.01 -s 56 10.10.11.11 -I $DUMMY > /dev/null 2>&1 || true"
> +        ],

[Severity: Medium]
Can this case fail intermittently depending on the host environment?  The
assertion needs a backlogged flow at the instant the dump runs, because
fq_pie_walk() in net/sched/sch_fq_pie.c skips every flow whose flowchain is
empty:

	for (i = 0; i < q->flows_cnt; i++) {
		if (list_empty(&q->flows[i].flowchain)) {
			arg->count++;
			continue;
		}
		if (!tc_qdisc_stats_dump(sch, i + 1, arg))
			break;
	}

The only step that creates that backlog is the ping line, and its exit
status is discarded with '|| true'.  If ping is not installed, or the
installed iputils rejects the fractional -i 0.001 / -W 0.01 arguments, the
fq_pie queue stays empty and 'tc -s class show' prints no fq_pie class at
all.  tdc.py then takes this branch:

	elif int(tidx["matchCount"]) != 0:
	    res.set_result(ResultState.fail)
	    res.set_failmsg('No output generated by verify command.')

which reports 'No output generated by verify command' rather than pointing
at the missing traffic precondition.

There is also a timing aspect in the passing case: TBF is configured with
'rate 8bit burst 100b', so the bucket starts full and the first frame (an
~42-byte ARP request or a ~98-byte ICMP echo) is dequeued right away.  A run
where only one frame gets enqueued leaves the flow list empty at dump time
even though ping itself "succeeded".  Would it be better to check the ping
result, or to enqueue traffic in a way that does not depend on neighbour
solicitation timing?

[Severity: Low]
This isn't a bug, but with 'flows 1' there is exactly one flow, so the
class-id to flow-index contract between fq_pie_walk() and
fq_pie_dump_class_stats() is not really exercised:

net/sched/sch_fq_pie.c:fq_pie_walk() {
	...
		if (!tc_qdisc_stats_dump(sch, i + 1, arg))
	...
}

net/sched/sch_fq_pie.c:fq_pie_dump_class_stats() {
	u32 idx = cl - 1;
	...
}

A kernel that attributed statistics to the wrong flow would still satisfy
the pattern.  Two of the five fields in struct tc_fq_pie_cl_stats,
avg_dq_rate and dq_rate_estimating, are not referenced by the test at all,
and none of the unit conversions (probability scaling, PSCHED ticks to
microseconds, byte credits, avg_dq_rate scaling) are checked.  Would using
more than one flow plus matchJSON on 'tc -s -j class show' with numeric
assertions cover the kernel side more directly?

> +        "cmdUnderTest": "$TC -s class show dev $DUMMY",
> +        "expExitCode": "0",
> +        "verifyCmd": "$TC -s class show dev $DUMMY",
> +        "matchPattern": "class fq_pie 2:[0-9]+ .*prob .*delay .*deficit",
> +        "matchCount": "1",

[Severity: High]
Can this case ever pass with a released iproute2?  The kernel exports the
per-flow counters only as a binary TCA_STATS_APP payload:

net/sched/sch_fq_pie.c:fq_pie_dump_class_stats() {
	...
	if (idx < q->flows_cnt)
		return gnet_stats_copy_app(d, &xstats, sizeof(xstats));
	...
}

Turning that blob into the literal tokens "prob", "delay" and "deficit"
requires the companion iproute2 change mentioned in the commit message,
"tc: fq_pie: add support for printing per-flow PIE statistics", which is not
merged.  Shipped tc prints only the qdisc-level names (pkts_in, overlimit,
dropped, ecn_mark and friends), so re.findall() returns zero hits and
tdc.py fails the case:

	if len(match_index) != int(tidx["matchCount"]):
	    res.set_result(ResultState.fail)
	    res.set_failmsg('Could not match regex pattern. Verify command output:\n{}'.format(procout))

So the test appears to land in the tree permanently red on every tc-testing
run.  tdc has a probe mechanism for exactly this situation:

	if 'dependsOn' in tidx:
	    ...
	    if (p.returncode != 0):
	        res.set_result(ResultState.skip)
	        res.set_errormsg('probe command: test skipped.')

Would it make sense to add a 'dependsOn' probe so the case skips when the
userspace support is absent, or to assert only what current tc prints?

A related question: the pattern hard-codes the exact label text and ordering
of the not-yet-reviewed userspace formatter.  If the iproute2 side lands with
different wording or field order (say "drop_prob", or JSON-only output), does
this kernel selftest then break while the kernel itself is unchanged?

The commit message says the counters "are printed only after the companion
iproute2 change", but the case has no fallback pattern and no skip
condition, so that dependency reads as an aside rather than as the reason the
test cannot pass today.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917204225.275251-1-hemendranaik%40gmail.com
