Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832193;
	b=N0Bv2bSopUM7dIsHY2mLZg1tGPPdOqv8bNDFDS2WC0z2vT7XlrvlTos0dyErqWoGgOJV
	 XkWatVgY1iNcYe0Otdytdxxsx+80dLCq2JoaEIRJ34nys9UosexyNKluFk/jBWUylC7Xr
	 sJT6UwsVoGtfhMHNCWehsjh0QkDriHY+K47urHKW75R5zdfG87PZuHaYI8yFfHXuHdX4E
	 O+Svcoffl21XdociSKBlT6q9tA8vXlYztyoVnRjAyQU7ljEQiriBofl8uGvTohMSxxe9N
	 3cXYTNTf3L+IcW/VLrM75KGVgJJEuzQlmAeL+aI6pH0vGrC0MKpztM6dthqB28TCotA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832193;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=a8k2bclEmTtdQS8mWo/Qx23aRfnorAtJ6YsqEJUvo3c=;
	b=2vGcPD8rzwLvZ1f0H4xS0DDdYOTHvlbiQ+XQPpSW0O9H77kdKI2rVs1MR0r3pDgcQJwT
	 Y3IEsWxquxpRyQQx82XM9HKwUkPnn3KS7ukPG4PHHcs/aU0ukxBSoyLjfjJZuN+t2We5+
	 2Ar0h54Y315n/Y/6OmZF8sG95QF558vzuCZk6C2yuqbMgTAdMtxW+y7MKE00S6fRmgt6m
	 qdPDC4Fgm7rrcyJxTGY776xDFlpUGshzizh6iATeDZaGQ2j4TRXxt51DSo2+tWx04ISxN
	 12fuugPHO+b14qxLjXUsv1sH+eyGAohgdaRjoODJ1GBtLaluc0Jd+qTRLbPwmcEs00A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cuxKQEHJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303A8606A31C;
	Mon, 16 Nov 2026 12:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cuxKQEHJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136401F000C4;
	Mon, 16 Nov 2026 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832192;
	bh=a8k2bclEmTtdQS8mWo/Qx23aRfnorAtJ6YsqEJUvo3c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cuxKQEHJf9iH/9WWdbZB4zG+iTs9detr4t8JVow7S6YDFiTSbHhurPgl7aBxjjUgD
	 qPtLHoxeLEdVShojdMRfGg24oL945ZtDxMQIMG+usuVXPO0Od3SmPQ4KyGJRHwUhk9
	 IG9mZRcvzGAw7SkVz7LJVOhwcsh399ryZSsJ7v2u0ATmM4XCMAcCAX5QLT60wujGmi
	 v/crVsE6uM5chxf3lKjV7ADUlDKi0nHTrZHV/0KA9NzparXNw5oGVPtTGLyRzgsITI
	 pGUdziHulpjnYSndGTwv6ND/r0HmH8hFlK0SewqNyPm5YQE7Mpklgs3J0QeQZq+6rq
	 MMvnrVNEdfBZw==
Subject: Re: [PATCH net-next v3 4/5] selftest: seg6: explicit cleanup for SRv6
 End PSP test
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: andrea.mayer@uniroma2.it, andrea@common-net.org, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, liuhangbin@kylinos.cn
Date: Mon, 16 Nov 2026 12:29:51 +0000
Message-ID: <179483219155.3136.11489476668944585319@kernel.org>
In-Reply-To: <20261112-srv6_flavors_endx-v3-4-c9177bbbd965@kylinos.cn>
References: <20261112-srv6_flavors_endx-v3-4-c9177bbbd965@kylinos.cn>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In tools/testing/selftests/net/srv6_end_flavors_test.sh, the
  PSP defer scope does not remove everything the PSP block sets up.
- [Low] The commit message says the patch uses "defer and
  defer_scopes_cleanup", but srv6_end_flavors_test.sh never calls…

--

selftest: seg6: explicit cleanup for SRv6 End PSP test

This commit adds defer calls to setup_rt_endpoint(), setup_rt_host_proxy()
and __setup_rt_policy() in srv6_end_flavors_test.sh. It also wraps the End
PSP setup and tests in a defer_scope_push/defer_scope_pop pair, so the
PSP-specific configuration is removed when that scope ends instead of at
namespace teardown.

> Use defer and defer_scopes_cleanup to remove the PSP specified
> configurations. i.e.

[Severity: Low]
Is this description accurate? The script never calls defer_scopes_cleanup.

The patch uses defer_scope_push and defer_scope_pop in the main script
body. The EXIT handler is unchanged:

trap cleanup EXIT

and cleanup() only deletes the namespaces. net/lib.sh does not install a
trap that runs pending defers either. If setup_end_flv_psp fails under
set -e before defer_scope_pop, the queued jobs are simply dropped.

This doesn't leak anything today, because every deferred command is an
ip -netns command and cleanup() deletes those namespaces anyway.

Could the commit message refer to defer_scope_push/defer_scope_pop instead?

> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 0ed5bfe99029b..374b43661c285 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh

[ ... ]

> @@ -1460,11 +1470,13 @@ set +e
>  router_tests
>  host2gateway_tests
>  
> +defer_scope_push
>  set -e
>  setup_end_flv_psp
>  set +e
>  host_srv6_end_flv_psp_tests
>  host_srv6_end_flv_next_csid_psp_tests
>  host_srv6_end_flv_consumed_srh_tests
> +defer_scope_pop

[Severity: Medium]
Does this scope pop leave the cafe::1:e9 and cafe::2:e9 addresses and
routes in place?

Inside this scope, setup_end_flv_psp() calls setup_hs_lo_addr() for both
hosts:

	setup_hs_lo_addr 1 1 "${END_CSID_PSP_FUNC}"
	setup_hs_lo_addr 2 2 "${END_CSID_PSP_FUNC}"

setup_hs_lo_addr() did not get any defer calls:

	ip -netns "${hsname}" addr add "${addr}/128" dev lo nodad

	ip -netns "${rtname}" -6 route \
		add "${addr}" \
		via "${IPv6_HS_NETWORK}::${hs}" dev "${RT2HS_DEVNAME}"

So after defer_scope_pop, hs-1 and hs-2 still have cafe::<hs>:e9/128 on lo,
and rt-1 and rt-2 still have their routes to those addresses. The commit
message lists the cafe::1:e9 and cafe::2:e9 routes as state this patch
removes.

A later block that calls setup_hs_lo_addr with the same suffix under set -e
would fail with EEXIST and be reported as a setup skip. Nothing fails yet:
the End.X block added later in the series ("selftests: seg6: add PSP
flavor testing for SRv6 End.X") uses a different suffix (a9). But
setup_hs_lo_addr() is still not deferred at the end of the series.

Would adding something like this to setup_hs_lo_addr() fix it?

	defer ip -netns "${hsname}" addr del "${addr}/128" dev lo
	defer ip -netns "${rtname}" -6 route del "${addr}"

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-srv6_flavors_endx-v3-0-c9177bbbd965%40kylinos.cn
