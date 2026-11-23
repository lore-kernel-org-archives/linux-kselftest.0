Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443849;
	b=m7x5NsqsrdJxgrPEW7OnxPQdtwEPnsRE1VbYL014kbNLJBd1bDqhdJE2Lypl2usCWpDQ
	 U6vbzYAvpnthk04i7PSH+996O+06uemj+QW3hqbNc9Mr4vjiyS4dhDrwNXcCd+/mzkTO7
	 b0C62hYua/pwrAuW/17UeTFUO5jReDbUC18XDpMD2oXMrv7woNAZZQhO9/jMQB/Bz5vh1
	 eu6j7O4IBSuuZIOOGlhqKpGqM7n5QkkT71ys9xCCfpxeCorolkSQ+K01iXGVzrRcZDy7B
	 i2fkG1KPvS0GzW5qBRze5sb9h1v0tbXaa2BYwpuJlnbiot7+8fRTmHykOk+UNTylC2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443849;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=55kelfXzKDdaZz5Yme2X9/SukHmv1LHP0kyLgVcPt0A=;
	b=0HZUpHDfRa7ZQrsH/dO1/eQeOiSkR7FGTX0SfZ6R+o0h9x3zVLzlmgTP7drpqZXTiMmy
	 DCaI+PzTUqRNUxdbjcEH9IkbBWDUZclbXHPfaiyg1fwyQ0o3GPMqjN0nSCvpA0HFN4EA9
	 CbmKjAEmfQWi5A4kdTAIwfkEv+775mpT8AiilLL1kJagMLCEr8BD5q+MeJdPFIL5V7Nur
	 HyVq5kzd06AzVzHTpPCZVqwBVjH9oJ/zmlVYRyRij1YXgZTiHvjHhVPH3Wi9yeCKdHSIe
	 Zvek4HLOivEIyH+ix/eSVH4FOJ9RHZTlNfT3DZnRkfqXXQUjFUwXzpXWX1BdWoLhLCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DxONPpg0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6DB606A335;
	Mon, 23 Nov 2026 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DxONPpg0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09711F000D2;
	Mon, 23 Nov 2026 14:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795443848;
	bh=55kelfXzKDdaZz5Yme2X9/SukHmv1LHP0kyLgVcPt0A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DxONPpg0Zk64Kgo9Df/o+DPVq/UxmAuWm3vA74iqiBhKYj9rkRt1bCFmSlwZKD0SW
	 YL0Uu33WPeMHfdnj8qaliZJJitoEztJecKJ7MSdjnPy5TSfANsCGSWsHKaRgXkw5IJ
	 /dgfu1FrHGfphWpfQC/3hc0j5rCxSCvjcp1uYE0mhI+f5knEXq6+5MV9IdPeTRgBE/
	 +qsr8I15DSJwwjj2BusrGOJkkch35Bia59viiofWJRpQ0/zssVspVTGmMvscijPuSW
	 T7g/8YssSlqqHN0k8piRlVYmuPFumb0ATVJd/XDgPdm4eOj9pUEoiCC+QDxGIWTmE7
	 hXSSE6WtkmOaA==
Subject: Re: [PATCH net-next v4 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: andrea.mayer@uniroma2.it, andrea@common-net.org, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, liuhangbin@kylinos.cn
Date: Mon, 23 Nov 2026 14:24:07 +0000
Message-ID: <179544384743.3135.16053596947905097199@kernel.org>
In-Reply-To: <20261119-srv6_flavors_endx-v4-5-284cdb484eee@kylinos.cn>
References: <20261119-srv6_flavors_endx-v4-5-284cdb484eee@kylinos.cn>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] test_kernel_supp_or_ksft_skip() in
  tools/testing/selftests/net/srv6_end_flavors_test.sh is now also used…
- [Low] The commit message does not describe several changes accurately.
- [Low] The comment above __get_srv6_rtcfg_id() gives the example element
  "1>2,2>3:psp:End.".

--

selftests: seg6: add PSP flavor testing for SRv6 End.X

This commit adds an End.X scenario to srv6_end_flavors_test.sh. The new
scenario reuses the End PSP and NEXT-C-SID,PSP policies, with every SID
bound through an adjacency. It teaches the policy helpers to parse
<nodeid:op:act> elements, adds a consumed-SRH test for End.X, and checks
kernel support for End.X PSP before running the new tests.

> Add the packet path to each test section so the route taken by the
> traffic is clear.

[Severity: Low]

Is this description accurate? The Path: lines only go into the header
comment block that documents the policies. The TEST SECTION output that
log_section() prints at runtime does not show any path.

The commit message also leaves out two changes to existing End code.
First, the existing End section titles are renamed:

host_srv6_end_flv_psp_tests():
    log_section "SRv6 connectivity test hosts (h1 <-> h2, ${act} PSP flavor)"

host_srv6_end_flv_next_csid_psp_tests():
    log_section "SRv6 connectivity test hosts (h1 <-> h2, ${act} NEXT-C-SID,PSP)"

host_srv6_end_flv_consumed_srh_tests():
    "SRv6 connectivity test hosts (h1 <-> h2, End PSP with a consumed SRH)"

Second, LCNODE_FMT ("%x0") is removed, so build_csid() now prints the node
ID with %s instead of %x:

    printf "%s%s%s" "${node}" "${adj}" "${func}"

For router IDs 1-4 the output is the same.

Could the commit message mention these changes?

> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 9d6b7de648da3..d7fdc4e19da9e 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh

[ ... ]

> @@ -535,10 +570,12 @@ get_network_prefix()
>  	echo "${IPv6_RT_NETWORK}:${p}:${q}"
>  }
>  
> -# Given the description of a router <id:op> as an input, the function returns
> -# the <id> token which represents the ID of the router.
> -# i.e. input: "12:psp"
> -#      output: "12"
> +# Given the description of a router <id:op:act> as an input, the function
> +# returns its <id> field with the <op> and <act> fields dropped.
> +# i.e. input: "12:psp", output: "12"
> +#      input: "1,2:psp", output: "1,2"
> +#      input: "1>2:psp", output: "1>2"
> +#      input: "1>2,2>3:psp:End.", output: "1>2,2>3"

[Severity: Low]

This isn't a bug, but should "End." be "End.X" here? __setup_rt_policy()
in this same patch would reject the documented element:

	if [[ "${n}" == *">"* && "${n}" != *"End.X"* ]] || \
		[[ "${n}" != *">"* && "${n}" == *"End.X"* ]]; then
		echo "Incorrect operation format: ${n}" && false
	fi

Neither __get_func() nor __get_srv6_act_cfg() has a case for "End." either.

[ ... ]

> @@ -1336,12 +1549,19 @@ test_iproute2_supp_or_ksft_skip()
>  	fi
>  }
>  
> +# exit directly if End action not supported, otherwise return 1
>  test_kernel_supp_or_ksft_skip()
>  {
> -	local flavor="$1"
> +	local action="$1"
> +	local flavor="$2"
>  	local test_netns
> +	local policy=()
>  
>  	test_netns="kflv-$(mktemp -u XXXXXXXX)"
> +	policy=(action "${action}" flavors "${flavor}")
> +	if [ "$action" == "End.X" ]; then
> +		policy+=(nh6 "${IPv6_TESTS_NH6}")
> +	fi
>  
>  	if ! ip netns add "${test_netns}"; then
>  		echo "SKIP: Cannot set up netns to test kernel support for flavors"
> @@ -1366,10 +1586,15 @@ test_kernel_supp_or_ksft_skip()
>  
>  	if ! ip -netns "${test_netns}" -6 route \
>  		add "${IPv6_TESTS_ADDR}" encap seg6local \
> -		action End flavors "${flavor}" dev "${DUMMY_DEVNAME}"; then
> -		echo "SKIP: ${flavor} flavor not supported in kernel"
> +		"${policy[@]}" dev "${DUMMY_DEVNAME}"; then
> +		echo "SKIP: ${action} flavor ${flavor} not supported in kernel"
>  
>  		ip netns del "${test_netns}"
> +
> +		if [ "$action" != "End" ]; then
> +			return 1
> +		fi
> +
>  		exit "${ksft_skip}"
>  	fi
>  

[Severity: Medium]

This function is now also called as a soft probe at the end of the
script:

test_end_flv

if test_kernel_supp_or_ksft_skip End.X psp; then
	test_endx_flv
fi

print_log_test_results

This call runs after trap cleanup EXIT is installed. By then router_tests,
host2gateway_tests and test_end_flv have already logged results.

Only the seg6local route add branch returns 1 for End.X. The ip netns
add, dummy link add and link set up failure branches still call
exit "${ksft_skip}" for every action. Calling the function from an if
condition does not stop that exit.

If one of those steps fails here, are the earlier results lost? The exit
runs cleanup(). SETUP_ERR is already 0 after setup_end_flv_psp(), so
cleanup() reaches:

	exit "${ret}"

print_log_test_results() has not run yet. If all End tests passed, ret
still holds its initial ${ksft_skip} value, so the run exits as SKIP with
no summary. If some tests failed, it exits 1, also with no summary.

The intended return 1 path (a kernel with End.X but without End.X PSP)
only echoes a SKIP line. log_test_skipped is not called, so nskip stays 0.
Does the final "Tests skipped" summary then leave out the dropped End.X
tests?

On success, the function returns the status of ip netns del. Would a
failing delete also skip test_endx_flv without any message?

The new header comment, "exit directly if End action not supported,
otherwise return 1", also doesn't describe the netns and dummy device
failure paths, which exit for every action.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-srv6_flavors_endx-v4-0-284cdb484eee%40kylinos.cn
