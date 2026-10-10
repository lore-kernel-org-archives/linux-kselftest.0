Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FA73F44D0;
	Sat, 10 Oct 2026 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627668; cv=none; b=O4iQjIbK1L9Sdy4daSGpx3prLC92+AaBf0MQZ64A0W3U/6ixH0x/nIvUaXWBa3RxAw7Pus7hnq9oCEf2mdzuJSsn9UYWkujTqO5aTRWmWajcWLXz8Igt47B0JiXkZGJIcyJdkpFyl+0RS9XC4mmAAguAlK+dOjKKzamurgIW1Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627668; c=relaxed/simple;
	bh=py9BAf6hSi5FsJWuD3PvunUH/hUZZ0kXADuShJdlHN4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jyOJq9vm9S/UWs7xZW4S48AJCwJtbCb8ibBUhZumvHT7gBVKnZe1D1qTyAMN4rQ6wL+xDwazb6UvSD2MosEOeLQqZtkQT2MmAdBo8OY78H/aGqKzHJwG+xRl4k/OWOsclXq8lAc1XDGgLfa7lwDAtJVAx6NDIODb4PqlwRBJrwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3h1IGqD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3h1IGqD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA33F1F000FF;
	Sat, 10 Oct 2026 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791627666;
	bh=4DbxLlwASm2LZg8TuN1a3snKjS+5cBirKd5WHjZJino=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z3h1IGqD97QPUuDotHlxYZqTb+JgYd3p7+34Vw1uThM5B1QPSw4fCwr+ZWU6VcnmY
	 QSbqqVITR7qg8ZqqDYvLf/qGZSViuKfOrPfGL6o+sX9zApHbqdpWrqexzrheRBQNI0
	 /CEVCcczB5YuwAKSQm2lOHhLtHooBVLmQ0fVodJ1AAEFAj3XGO4VuX7ZzwNBx+Es/8
	 ipHFfDVCUiFw0N6X2XLOItZeGRPktPLUkZKXUb4ENNGAI90PDSZZuf2ybOsm+pfg/1
	 6n1c9bVjyZfCNcxw7eJySsf8U6w6CuIuzE1XEtk3B11JlXeD/mUJm5ycC6y9brrlMU
	 2ra8xF0zBPCQA==
Subject: Re: [PATCH net-next v2 5/5] selftests: seg6: add End.X PSP selftest
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, liuhangbin@kylinos.cn
Date: Sat, 10 Oct 2026 10:21:05 +0000
Message-ID: <179162766537.434549.5701666016384409279@kernel.org>
In-Reply-To: <20261009-srv6_flavors_endx-v2-5-56ac7f838f41@kylinos.cn>
References: <20261009-srv6_flavors_endx-v2-5-56ac7f838f41@kylinos.cn>
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

- [Medium] The End.X PSP test in
  tools/testing/selftests/net/srv6_end_flavors_test.sh does not check…
- [Low] The patch adds an `<id:op:act>` descriptor syntax and an End.X
  PSP scenario, but the script's documentation was not updated.

--

selftests: seg6: add End.X PSP selftest

This commit adds an End.X PSP test to srv6_end_flavors_test.sh. A new
helper, __get_srv6_rtcfg_act(), lets __setup_rt_policy() parse an
optional action field in the router description, e.g. "4:psp:End.X,4,2".

> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index a57e92541a046..4ba93ace86563 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> @@ -397,6 +397,36 @@ __get_srv6_rtcfg_op()
>  		xargs | sed 's/ /,/g'
>  }
>  
> +# Given the description of a router <id:op:act> as an input, the function
> +# returns the <act> token which represents the action (e.g. End, End.X,
> +# End.T behavior with or without route table, out interface) configured
> +# for the node.
> +#
> +# Support End, End.X at present. When omit, return default End behavior.
> +# i.e. input: "1:psp:End.X,1,3"
> +#      output: "End.X nh6 fcf0:0:1:3::3 oif veth-rt-1-3"
> +__get_srv6_rtcfg_act()
> +{
> +	local element="$1"
> +	local net_prefix
> +	local acts
> +	local out
> +
> +	acts="$(echo "${element}" | cut -d':' -f3)"
> +	act="$(echo "${acts}" | cut -d',' -f1)"
> +	act="${act:-"End"}"
> +
> +	rt="$(echo "${acts}" | cut -d',' -f2)"
> +	neigh="$(echo "${acts}" | cut -d',' -f3)"
> +
> +	if [ "$act" == "End" ]; then
> +		echo "End"
> +	elif [ "$act" == "End.X" ]; then
> +		net_prefix="$(get_network_prefix "${rt}" "${neigh}")"
> +		echo "End.X nh6 ${net_prefix}::${neigh} oif veth-rt-${rt}-${neigh}"
> +	fi
> +}

[Severity: Low]
What should happen when act is something other than End or End.X? The
comment above mentions End.T, but there is no else branch. For End.T, a
typo, or a case mismatch, the function prints an empty string, and
__setup_rt_policy() builds:

    encap seg6local action  flavors psp

Under set -e that shows up as an environment setup SKIP, not as a clear
error in the test description.

A few smaller points in the same helper:

act, rt and neigh are not declared local, but the unused out is.

The End.X form repeats the node id ("4:psp:End.X,4,2") and never checks
that the two ids match.

Some existing comments in the file also look stale after this change:

The file header still says "Currently in this selftest we consider only
the PSP flavor for the SRv6 End behavior."

The Local SID table still says "fcff:x::ef1 is associated with the SRv6
End behavior with PSP flavor". In the new test, fcff:3::ef1 and
fcff:4::ef1 are End.X PSP.

The $3 description for __setup_rt_policy() still talks only about
<nodeid:op> elements and does not mention the new act field.

[ ... ]

> @@ -819,6 +875,22 @@ host_srv6_end_flv_psp_tests()
>  	cleanup_end_flv_psp
>  }
>  
> +host_srv6_endx_flv_psp_tests()
> +{
> +	set -e
> +	SETUP_ERR=1
> +	setup_endx_flv_psp
> +	SETUP_ERR=0
> +	set +e

[Severity: Medium]
Does this need a kernel support check for End.X with the PSP flavor?
The only kernel probe is "test_kernel_supp_or_ksft_skip psp", and it only
installs "action End flavors psp". It never tries End.X, End.X with
flavors, or End.X with oif.

Before the series commit "seg6: add RFC8986 flavor support for End.X",
net/ipv6/seg6_local.c had:

    #define SEG6_LOCAL_END_X_FLV_SUPP_OPS	SEG6_F_LOCAL_FLV_NEXT_CSID

On those kernels parse_nla_flavors() rejects "flavors psp" on End.X with
-EOPNOTSUPP.

When that happens, the End.X route add from setup_endx_flv_psp() fails
under set -e and the EXIT trap runs cleanup(). The earlier test groups
passed, so ret is still ksft_skip, and cleanup() takes this path:

	if [ "${SETUP_ERR}" -ne 0 ] && [ "$ret" -ne "$ksft_fail" ]; then
		echo "SKIP: Setting up the testing environment failed"
		exit "${ksft_skip}"
	fi

Would this turn a previous PASS on older or stable kernels into a SKIP
for the whole script? print_log_test_results() never runs, so the End
PSP results that already passed are dropped.

On a kernel that is supposed to support End.X PSP, a regression that
breaks this route install would also be reported as SKIP rather than
FAIL.

Could End.X PSP support be checked up front, so that only this test
group is skipped when the kernel lacks it?

> +
> +	log_section "SRv6 connectivity test hosts (h1 <-> h2, End.X flavor PSP)"
> +
> +	check_and_log_hs_connectivity 1 2
> +	check_and_log_hs_connectivity 2 1
> +
> +	cleanup_endx_flv_psp
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009-srv6_flavors_endx-v2-0-56ac7f838f41%40kylinos.cn
