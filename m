Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF24646A5E8;
	Fri,  4 Sep 2026 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514974; cv=none; b=HgznE21wj3hiJuxAUqwkKeME2WjxhWoiUvbMajsegMjPAX4HYFzRTLTQCX7/IVgBock+J7bvdr/LaV1B+gMUSpXlg6ueM9vbZ9MnrDkoJpMYYqBc0JBsW3ehitXbD7YNhYmrjjsKzoOkp4WGMb8rydQ7LfWDLRCJmzsNA1AnBPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514974; c=relaxed/simple;
	bh=8UB3DGUAWa8G8aKULbbMwzmo8RE1+hzcML6ylyLcuZ0=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cjGd/ZqSJ3JJr9RKzlGVMOS7bR028SEPCGGwD9e0vP2T3WlFeStiGFx/Thrrd/wVQnUoai07J8NPtXaBFsUtiWaK8F5VWMmiJwB0HTgU37b6pN/zWyQ5skSrF1NBRHqu6eCRj6DjI8JVojnZTDRRVa1X1irgh6iQwzeRkIat0H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEHWxEVT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEHWxEVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD821F00A3D;
	Fri,  4 Sep 2026 09:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788514972;
	bh=WuhtBDK33bkewI7uu9kj2cJVOVW+iYoWJjeHaxsUVrA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VEHWxEVTPwkcB6ZDwFjQDjgXnb2WbzpcsSsg61VQvelrCcTbDmmbI/IFHhEQqSTxt
	 mfcKUyZrpwW27haRJdUL8fA8rSkte873lZVGNrIFDFxzVxrRZvzrSNtMys6ByndOlq
	 hTsgSb6syp8Z9Q0RcN/9WASvl7MYZZNWy31aXnNWQNUW7uoRBa8lbFxBAjjaaPHUH9
	 ICxWhaiWEjkL7SFMiLvzkdX2uHzoOu54f3NzTPNTJH5KCK6yrP6leTioNJTWOs4Ge6
	 iZLpXgYTSD+x85QTjI3/K63tER01cm6F/ALSEcbxTvtxvuAwalPpFjFo64oLnsvUQX
	 iOGGl2pi1Omww==
Subject: Re: [PATCH net v3 9/9] selftests: tc-testing: update ETS test 41f5
 for clamped quanta
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 victor@mojatatu.com, vega@nebusec.ai, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, toke@redhat.com
Date: Fri, 04 Sep 2026 09:42:51 +0000
Message-ID: <178851497140.4131868.17681128693200676725@kernel.org>
In-Reply-To: <QDISC-0CFC.v3.20260901204856@mojatatu.com.10>
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.10>
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
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 0 (1)

- [Medium] Incomplete selftest update / undisclosed behavioural change:
  the accompanying commit 0bbbcd21591a ("net/sched: ets: clamp quantum…

Pre-existing issues:
- [Low] Concern that test 41f5 ("ETS offload with out-of-range quanta
  clamped") only checks the software qdisc dump via `tc qdisc show` and…

--

selftests: tc-testing: update ETS test 41f5 for clamped quanta

This updates tdc test 41f5 in qdiscs/ets.json so that its name and match
pattern reflect the new quantum clamping to [256, 1 << 20] introduced by
"net/sched: ets: clamp quantum in parse and fallback paths".  The test
still passes "quanta 4294967294 1 1" but now expects "quanta 1048576 256
256" in the qdisc dump.

> diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
> index ee09e6d6fdf3c..d2eab61c099a8 100644
> --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
> +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
> @@ -987,7 +987,7 @@
>      },
>      {
>          "id": "41f5",
> -        "name": "ETS offload where the sum of quanta wraps u32",
> +        "name": "ETS offload with out-of-range quanta clamped",
>          "category": [
>              "qdisc",
>              "ets"
> @@ -1002,7 +1002,7 @@
>          "cmdUnderTest": "$TC qdisc add dev $ETH root ets quanta 4294967294 1 1",
>          "expExitCode": "0",
>          "verifyCmd": "$TC qdisc show dev $ETH",
> -        "matchPattern": "qdisc ets .*bands 3 quanta 4294967294 1 1",
> +        "matchPattern": "qdisc ets .*bands 3 quanta 1048576 256 256",
>          "matchCount": "1",

[Severity: Low]
This isn't a bug introduced by this patch, but a note on what the renamed
test now covers.

The verification is only "$TC qdisc show dev $ETH", which reports the
software qdisc quanta.  The quanta actually handed to the driver are
filled in separately by ets_offload_change() in net/sched/sch_ets.c:

	qopt.replace_params.quanta[i] = quantum;
	qopt.replace_params.weights[i] = weight;

and netdevsim's nsim_setup_tc_ets() in drivers/net/netdevsim/tc.c does
nothing with them:

	case TC_ETS_REPLACE:
	case TC_ETS_DESTROY:
		break;

so nothing tdc can observe reflects the offload request itself.  That is
pre-existing and matches the idiom used by the other cases in this file.

Separately, since each quantum is now capped at 1 << 20 and there are at
most 16 bands, is the u32 sum-wrap condition the test was originally
written for still reachable at all?  If not, the rename retires that
coverage without a replacement.

[Severity: Medium]
Should the two neighbouring tests in this same file be updated in the
same patch?

The kernel-side commit in this series also removed the explicit
zero-quantum rejection from ets_quantum_parse(), which now reads:

net/sched/sch_ets.c:ets_quantum_parse() {
	*quantum = clamp_t(u32, nla_get_u32(attr), 256, 1 << 20);
	return 0;
}

The previous "ETS quantum cannot be zero" -EINVAL and extack are gone,
and nothing else in the path rejects 0: ets_quanta_policy declares
TCA_ETS_QUANTA_BAND as a bare NLA_U32 with no range, and
ets_qdisc_quanta_parse() only runs __nla_validate_nested() plus the band
count check before calling ets_quantum_parse().  A band quantum of 0 is
therefore clamped to 256 and the qdisc is created.

Tests e51a "Zero element in quanta" and e7f2 "Sole zero element in
quanta" still encode the old behaviour, for example e51a:

        "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root ets quanta 1000 0 800 700",
        "expExitCode": "1",
        "verifyCmd": "$TC qdisc show dev $DUMMY",
        "matchPattern": "qdisc ets",
        "matchCount": "0"

If tc forwards the literal 0 to the kernel, which is what 41f5 suggests
given that it passes 4294967294 and 1 through unmodified, then the add
now returns 0 instead of 1 and "tc qdisc show" prints "qdisc ets", so
both tests fail.  If tc filters the 0 locally the tests keep passing but
no longer exercise any kernel check, and nothing covers the new
accept-and-clamp semantics.

Either way, could the removal of the zero-quantum -EINVAL and its extack
be mentioned in the changelog?  Neither this commit message nor the
kernel one notes that the netlink error contract for
TCA_ETS_QUANTA_BAND == 0 changed, and sch_drr.c deliberately kept its
explicit zero reject.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-0CFC.v3.20260901204856%40mojatatu.com
