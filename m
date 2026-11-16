Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807174;
	b=28IkxmyqkL3LUHpySGwAAEi4w6mNpD54pIiHISI78LVjHen/kDWMMOvx3ODMSQYEDALz
	 xiAENZUQuo3X+GCtTqALxCEofX/1ziF8z65KpaXev5TfnaYCBGyuUn/v2VWf3AaoIz74k
	 JpdO0MSo8VFdlZhpW6F3orRUMJi4DvTtrDlDQdmOJkqC8NsskyMFgoFZnLBDGfo4z8sSv
	 KmEpobdEXHsm/khLDY50rSqOBEe1SU32UXZFQRzUHgd0aL0b0pb7huNuNFR/cr8BKcASu
	 1k9EXKaw9rzSTLD/A8gaGAOgUxEEAMzy6helKmMC0jxrcH3yAjANx4QW1TagUILgxvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807174;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=235IhKMChFexMr22e8JQ4l9QP0XQgT/y/XG+KObBuiI=;
	b=lAWGhjFOFEBzAEmj3pmfZ8kTib8dneljDDE08UZoGtJfY3kqKCPjGYAH5SmRBZHiqHmm
	 WVaumZ/imzl/axHBEgMdcdnbaE7a0BlKutR49cp7fCyXMAgmxLwRYxP6JDpl9OPnN/l4R
	 0H0EECn7NzD8jWI4CxLkcdbqlB1XU8aeDCNvaBJ0xHkvfopt+x4ziLuxurB5pLvFB4etR
	 hBjfDwttszjMCXr4EeuakmE8U8GOrP7rBqBJOIyxjgn1DmzJKwPw7ef27JDAhgxxQIzH7
	 1p1YlnwVlTJLDU8VT4e3MVIaR1NQgGameCMvYDWBxrG/KZNzYjgFipCllHRsJxfp6dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kVhYU/Q4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA64606A337;
	Mon, 16 Nov 2026 05:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kVhYU/Q4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3021F000C4;
	Mon, 16 Nov 2026 05:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794807174;
	bh=235IhKMChFexMr22e8JQ4l9QP0XQgT/y/XG+KObBuiI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kVhYU/Q4IvyrjNAdXcQ8S0i5vceWWAa1QsAr6YoVk8LYWDG3Py+YM6tOt9d8FBuPQ
	 /UzTilpaa4bDEnkbrzNeOxSk6MWSYMzwB4J5HvCSYUH6ANuvTd1FIrvkGuwGy77jo9
	 7sUjgtMEwiCYnmoA1D4n7tX0T3bRrADdPFHrrwyj/l9+ZpDeXTdCFV8cEvKfTRc9t8
	 jesz/BjmmfR9AOF9mKAe2gcgeeMNCEM5YKsSqVABDxAArfDIBW/xjk7CWgnZ53GnDD
	 15n9Tcp5BwoCpKIe+mB//EXb8NpbOXS11fPLEduOyPb16ex1+kGj5eNv2cCmU/AXAp
	 nqfDqQTs7ZbyA==
Subject: Re: [PATCH net-next v5 8/8] selftests: net: test the vxlan vnifilter
 request limit and dump replay
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@kernel.org,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, kuniyu@google.com, petrm@nvidia.com, aroulin@nvidia.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 05:32:53 +0000
Message-ID: <179480717303.3136.3539186076980782462@kernel.org>
In-Reply-To: <20261114221412.255825-9-alishmery18@gmail.com>
References: <20261114221412.255825-9-alishmery18@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] vxlan_vnifilter_refused_fdb_update()
  (tools/testing/selftests/net/test_vxlan_vnifiltering.sh:590) waits for…
- [Low] The FDB regex probes in vxlan_vnifilter_refused_fdb_update()
  (lines 582 and 592) are passed through run_cmd(), which runs…

--

selftests: net: test the vxlan vnifilter request limit and dump replay

This extends test_vxlan_vnifiltering.sh with cases for the vnifilter
request-size cap and the 24-bit VNI bounds. It also adds a dump/replay
round trip, rollback of failed VNI adds and a refused FDB update. New
helpers vni_listed(), vni_ranges() and fdb_listed() report a failed
"bridge ... show" separately from "absent".

> diff --git a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
> index 6fb5af013dacf..fb8401399b099 100755
> --- a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
> +++ b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh

[ ... ]

> +# Succeed if "bridge fdb show" lists, on device $1, an entry whose line
> +# matches the extended regex $2. A failed show returns 2, so a probe
> +# expecting the entry to be absent cannot pass on it.
> +fdb_listed()
> +{
> +	local out
> +
> +	out=$(bridge -netns $testns fdb show dev $1) || return 2
> +	grep -qE "$2" <<< "$out"
> +}

[ ... ]

> +vxlan_vnifilter_refused_fdb_update()
> +{
> +	local opts="external vnifilter local 172.16.0.1 dev veth-testns"
> +	local zero="^00:00:00:00:00:00 dst 172.16.0.2 .*src_vni 100 .*self"
> +	local mac=02:00:00:00:00:01
> +
> +	cleanup_vnifilter_api &>/dev/null
> +	setup_vnifilter_api
> +
> +	run_cmd "ip -netns $testns link add vxlan-age type vxlan $opts \
> +		 dstport 4789 ageing 1"
> +	log_test $? 0 "refused update: create a device with ageing 1"
> +	run_cmd "ip -netns $testns link set dev vxlan-age up"
> +	run_cmd "bridge -netns $testns vni add dev vxlan-age vni 100 \
> +		 remote 172.16.0.2"
> +	log_test $? 0 "refused update: add a VNI with a remote"
> +	run_cmd "fdb_listed vxlan-age '$zero permanent'"

[Severity: Low]
Will the single quotes around the regex survive run_cmd()? In this script
run_cmd() does:

	out=$(eval $cmd $stderr)

$cmd is not quoted there, so it is word-split and globbed before eval
re-parses it. At that point the single quotes are just literal characters
inside the words, and they don't protect anything.

That means words like .*src_vni and .*self get pathname expansion. Nothing
in the script or lib.sh sets noglob, nullglob or failglob.

If the working directory holds a dotfile whose name ends in "src_vni" or
"self", bash would replace that piece of the regex with the filename.
grep -E then gets a different pattern. In the usual case nothing matches
and the words pass through unchanged.

Could these two probes (here and the "still permanent" check below) call
fdb_listed directly instead of going through run_cmd's unquoted eval?

> +	log_test $? 0 "refused update: the VNI's default entry is permanent"
> +	run_cmd "bridge -netns $testns fdb replace 00:00:00:00:00:00 \
> +		 dev vxlan-age dst 172.16.0.3 src_vni 100 self dynamic"
> +	log_test $? 255 "refused update: cannot replace the default entry"
> +	run_cmd "bridge -netns $testns fdb add $mac dev vxlan-age \
> +		 dst 172.16.0.4 src_vni 100 self dynamic"
> +	log_test $? 0 "refused update: add a dynamic entry"
> +	slowwait 25 eval "! fdb_listed vxlan-age '^$mac '"

[Severity: Low]
Can a failed "bridge fdb show" make this wait end early? fdb_listed()
returns 2 when the show fails. Its comment says that is so an absence
probe cannot pass on it. The ! here turns any non-zero status into 0,
including 2, so slowwait would return success right away.

If that happens, "the dynamic entry is aged out" reports PASS. The final
"still permanent" check then runs before vxlan_cleanup() has done any
ageing pass, since FDB_AGE_INTERVAL is 10 seconds. The "survives ageing"
part of the case would not be exercised.

This is the only absence probe that uses fdb_listed(), so it is the one
place where the helper's guarantee doesn't hold.

An unfixed kernel should still be caught. Without "vxlan: leave FDB state
and flags unchanged when an update fails", the refused replace leaves
fdb->state as NUD_REACHABLE. vxlan_fdb_info() reports
ndm->ndm_state = fdb->state, so the final check fails anyway. The effect
is a spurious PASS line and a skipped ageing check, not a missed
regression.

Would it work to test for status 1 explicitly, for example
"fdb_listed ...; [ $? -eq 1 ]", instead of negating the result?

> +	log_test $? 0 "refused update: the dynamic entry is aged out"
> +	run_cmd "fdb_listed vxlan-age '$zero permanent'"
> +	log_test $? 0 "refused update: the default entry is still permanent"
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114221412.255825-1-alishmery18%40gmail.com
