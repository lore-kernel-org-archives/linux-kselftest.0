Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832194;
	b=uoWIVSPfxpe9bN+Fv2gDemdfWV+LcVbR02nZHXou21idzqJBeZRRMzRPgCg3T4Pf6DGw
	 15rXyzsoUx8bGBhZJptM3UdIAuDngym5m0hBv5Hyw3sE4kAinr0B5gKnHVdShkv0YJDa5
	 8avGeHs1mp76gzNUaiJK8prnsP+8lLhoHHgHgZ8Atr26BjeN3pFFmEtWthezy0bwwXLXg
	 ApL8YR8x9XtrMmN5rXV7CAwqecpvGwGWNMRHqsgEozVkxEglnILVl0tSJtw4AsAo86wEM
	 xX35gab1n390BXb71wL3+q14t5RZDqFKHUmSIVTejj3ZmRNwy5eGuZoUGa2PzSxlS9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832194;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UfZAhLZFTkL4ISw0mXsMZIe8+v3xd6kfRlMCcVN6hWk=;
	b=eeblb+Xrabcboe90u5p1SRbbVch7TgXxqLl44WfzU55YZ8q8eBw0Q0025bjRyZ4AMlKQ
	 rnYCdmrYATfmIjQX9Qrq0ziyzEe1iISPm1seXcpzTkTryjL7IaeobMJCp5xMydu9KxMD9
	 esTTfSJxFzf57iKGY0xl4OUKStMhvPxOVju8Qy4zZYlTKm2gxr3joQ2940qoIlvrus/SX
	 Piv5m5TfUfKnC+2v4+7AFoKAUuuG1tCz3MR+NbGdivZxuUrhbROEdr8pAPpISTRGGYU72
	 lTJ2IRKvLcT+DqJ4DvFu3AcBaVwPdIzatBuEeEJ8CN6b02k6HdKmnwMFTLD4dy0or0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwo0hIG8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6047B606A33A;
	Mon, 16 Nov 2026 12:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwo0hIG8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F8C1F000C4;
	Mon, 16 Nov 2026 12:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832194;
	bh=UfZAhLZFTkL4ISw0mXsMZIe8+v3xd6kfRlMCcVN6hWk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jwo0hIG87SVTFunMGFuD+ZhstkFrQak4xOVC2zH3oD4QZz4DJofdViPJLs6fh4RGV
	 P1aZ9S/VdDNBOfwnyPxnEZo0DUSqSJTDtmr6gmdSrlSV29ZevboCpPmV2YfnVV+Uc6
	 YnjOJLLseBse3yw2N9u0XYsJz+yoo3q6nCCqebF0BxFIhJCZ4rZNV0qN4ZdvoqP7YE
	 NGsUpwMHcTMfUlbvYf7OhcLiCMbbL4Q5w9PbIdPCvYCAvDFtFuM5o1ndlJm26snYrB
	 k32VaSaFQQF9D4YjPlp8OXyWV5kHnMKMdIha21P+GxYhCNwWSmH1ddnnS37l6QaMUB
	 vi4GXDTdYUoPw==
Subject: Re: [PATCH net-next v3 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: andrea.mayer@uniroma2.it, andrea@common-net.org, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, liuhangbin@kylinos.cn
Date: Mon, 16 Nov 2026 12:29:53 +0000
Message-ID: <179483219301.3136.3063075269604426765@kernel.org>
In-Reply-To: <20261112-srv6_flavors_endx-v3-5-c9177bbbd965@kylinos.cn>
References: <20261112-srv6_flavors_endx-v3-5-c9177bbbd965@kylinos.cn>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The script never checks whether the kernel supports End.X with
  PSP, so on kernels without that support the whole test reports SKIP…
- [Low] For non-C-SID End.X SIDs, get_rt_sid() drops the adjacency:
  `rt=$(echo "${rt}" | sed 's/>.*//')` at line 834.
- [Low] The new End.X scenario cannot tell End.X apart from End: every
  adjacency it configures is the same next hop the regular FIB/localsid…
- [Low] setup_hs_lo_addr() (line 1056) adds a /128 address on the host
  loopback (`ip -netns $hsname addr add $addr/128 dev lo nodad`, line…

--

selftests: seg6: add PSP flavor testing for SRv6 End.X

This adds an End.X scenario to srv6_end_flavors_test.sh. It applies the
same PSP and NEXT-C-SID+PSP policies as the End scenario, with each node
bound through an adjacency. The policy and endpoint helpers now parse
<nodeid:op:act> elements and encode the adjacency into the C-SIDs.

> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 374b43661c285..5b1b13586df03 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh

[ ... ]

> @@ -730,6 +831,7 @@ get_rt_sid()
>  		return
>  	fi
>  
> +	rt=$(echo "${rt}" | sed 's/>.*//')
>  	echo "${LOCATOR_SERVICE}:${rt}::${func}"
>  }

[Severity: Low]
In the non-C-SID case this drops the adjacency. That means "4>2:psp:End.X"
and, say, "4>3:psp:End.X" would both map to fcff:4::0af1, even though
setup_rt_endpoints() gets a different End.X nh6 for each one from
__get_act_cfg().

setup_rt_endpoint() returns early when the SID is already in table 90:

	if [ -n "$(ip -netns "${nsname}" -6 route show \
		table "${LOCALSID_TABLE_ID}" exact "${sid}")" ]; then
		return
	fi

Would a second End.X element on the same router, pointing at a different
neighbour, silently keep the first element's nh6?

The C-SID path keeps the adjacency (build_csid() turns 4>2 into 42a9), so
the two encodings are not consistent. The current policies do not collide
(rt-3 to rt-4, rt-4 to rt-2, rt-2 and rt-1 to the host), so this does not
show up today.

Some comments were also not updated for the new encoding. The header still
says:

  - p is a parameter of the behavior (4 bits), 0 for End, which has none;

The comment above build_csid() still says "followed by the parameter of
the behavior (4 bits, 0)", but the code now puts the neighbour ID in that
nibble. The Local SID table lists fcff:x::a and fcff:x::af1 with no
adjacency, and the policy walk-through sections do not describe the End.X
policies.

[ ... ]

> @@ -1049,6 +1164,29 @@ setup_end_flv_psp()
>  	SETUP_ERR=0
>  }
>  
> +setup_endx_flv_psp()
> +{
> +	SETUP_ERR=1
> +
> +	setup_hs_lo_addr 1 1 "${ENDX_CSID_PSP_FUNC}"
> +	setup_hs_lo_addr 2 2 "${ENDX_CSID_PSP_FUNC}"

[Severity: Low]
setup_hs_lo_addr() adds an address on the host loopback and a route on the
router, but it does not defer the removal of either:

	ip -netns "${hsname}" addr add "${addr}/128" dev lo nodad

	ip -netns "${rtname}" -6 route \
		add "${addr}" \
		via "${IPv6_HS_NETWORK}::${hs}" dev "${RT2HS_DEVNAME}"

The other per-scenario helpers (setup_rt_host_proxy(),
setup_rt_endpoint(), __setup_rt_policy()) all register a defer.

This is the first patch that adds a second scenario. So the cafe::1:e9 and
cafe::2:e9 addresses and routes from the End scope are still installed
while the End.X scope runs. The defer_scope_pop of the End.X scope also
leaves the a9 ones behind. Only the namespace teardown in cleanup()
removes them.

Should setup_hs_lo_addr() defer its own cleanup? The earlier "selftest:
seg6: explicit cleanup for SRv6 End PSP test" change set up the scoped
teardown so that state would not be left behind once more tests share this
script. A later scenario that reuses a suffix would hit "File exists"
under set -e.

> +
> +	setup_rt_host_proxy 1 2 "${ENDX_CSID_PSP_FUNC}"
> +	setup_rt_host_proxy 2 1 "${ENDX_CSID_PSP_FUNC}"
> +
> +
> +	# The same SRv6 policies with setup_end_flv_psp except using End.X
> +	setup_rt_policy_ipv6 2 1 "3>4:noflv:End.X 4>2:psp:End.X 2>h:psp:End.X"
> +	setup_rt_policy_ipv6 1 2 "1>h:psp:End.X"
> +
> +	setup_rt_policy_ipv6 "2:${ENDX_CSID_PSP_FUNC}" 1 \
> +		"3>4:next-csid,psp:End.X 4>2,2>h:next-csid,psp:End.X"
> +	setup_rt_policy_ipv6 "1:${ENDX_CSID_PSP_FUNC}" 2 \
> +		"4>3,3>1,1>h:next-csid,psp:End.X"

[Severity: Low]
Can these tests tell End.X forwarding apart from End? Every adjacency here
is the same next hop that the normal lookup would pick for the next SID.

setup_rt_local_sids() installs fcff:<neigh>::/32 and fcbb:0:<neigh>000::/36
in table 90 via the direct link to each neighbour. __get_act_cfg() builds
nh6 <net_prefix>::<neigh> for that same neighbour, or nh6 cafe::<rt> for
the host, which is where the connected route goes anyway.

For example, the next SID after rt-3>4 is fcff:4::0af1 or fcbb:0:42a9::,
and table 90 already resolves both via fcf0:0:3:4::4.

Suppose input_action_end_x() with flavors did a DA lookup via
input_action_end_finish() instead of calling input_action_end_x_finish(),
or ignored nh6. Would every ping in host_srv6_end_flv_psp_tests "End.X"
and host_srv6_end_flv_next_csid_psp_tests "End.X" still pass?

The note below the commit message says End.X resolves the destination via
the next hop directly instead of re-looking it up in table 90, but no test
currently depends on that difference.

An adjacency whose nh6 differs from the FIB path, or a blackhole route for
the next SID in table 90, would make it observable.

[ ... ]

> @@ -1479,4 +1623,12 @@ host_srv6_end_flv_next_csid_psp_tests
>  host_srv6_end_flv_consumed_srh_tests
>  defer_scope_pop
>  
> +defer_scope_push
> +set -e
> +setup_endx_flv_psp
> +set +e
> +host_srv6_end_flv_psp_tests "End.X"
> +host_srv6_end_flv_next_csid_psp_tests "End.X"
> +defer_scope_pop
> +
>  print_log_test_results

[Severity: Medium]
What happens here on a kernel that supports PSP for End but not for End.X?

test_kernel_supp_or_ksft_skip() only probes End:

	if ! ip -netns "${test_netns}" -6 route \
		add "${IPv6_TESTS_ADDR}" encap seg6local \
		action End flavors "${flavor}" dev "${DUMMY_DEVNAME}"; then

End.X only accepts PSP once the companion change "seg6: add RFC8986 flavor
support for End.X" extends SEG6_LOCAL_END_X_FLV_SUPP_OPS beyond NEXT-C-SID.
Without that change, parse_nla_flavors() returns -EOPNOTSUPP.

On such a kernel the End scenario runs and passes, and then:

setup_endx_flv_psp()
  setup_rt_policy_ipv6()
    __setup_rt_policy()
      setup_rt_endpoints()
        setup_rt_endpoint()
          ip route add ... action End.X nh6 fcf0:0:2:4::2 flavors psp
            -> EOPNOTSUPP

Because of set -e the script exits. cleanup() then sees SETUP_ERR=1 while
ret is still ksft_skip:

	if [ "${SETUP_ERR}" -ne 0 ] && [ "$ret" -ne "$ksft_fail" ]; then
		echo "SKIP: Setting up the testing environment failed"
		exit "${ksft_skip}"
	fi

Doesn't that report the whole run as SKIP with a setup-failure message?
print_log_test_results() is never reached, so the End results that
already passed are lost.

The commit message says:

  There is no need to re-check the ip command capability as it already
  supports setting PSP flavor with End.X.

That covers iproute2 but not the kernel. Could a separate kernel probe for
End.X nh6 <addr> flavors psp be added? It could skip only the End.X
section (for example with log_test_skipped) and keep the End results.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-srv6_flavors_endx-v3-0-c9177bbbd965%40kylinos.cn
