Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA6821B192;
	Sun, 27 Sep 2026 01:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790474359; cv=none; b=ZTClAK0cgEOYSahDMGjyLYIwt2I3piRCQPxHffeprSS91V94uK9ovga9SL2Z2HQCEBL+/ko54TIliqyGHzwxKVdoQl7li8jFc5DIRFFF4i+jyEbbRZP6SlFg4qSaITtO8ulxZ2eE6bAEBBwibCjDQORl+a0LfeF/P+FK1ofxV7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790474359; c=relaxed/simple;
	bh=Cj1yxOQ7NmiOhB54Fj2kvY8sqe96D//wtEYKIYBNRx8=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=osiKOwAD/npOO9fV3J5p3m9EhsrCx6ncgmrcuGVPI2PDsDrubw+aYklIII8Yuv8P+Bfx+JazlXUg+WtVjqJDoXbzTcxMJQQUCcOw2X3Qz6VLiyz3GwJyAvvd7KTMU9j3yz4knSC9+SSzzJs3SM4iMuOSo15cP196sxLrTqPe8zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfeeVtO7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfeeVtO7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755731F000FF;
	Sun, 27 Sep 2026 01:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790474357;
	bh=3mmxZtkXz6CMoG9+1fr08yaqLx0uIg8QGWPSaxHFEmQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mfeeVtO745hvKy5JDKZe0mq5Xp+dIMbWv6FY2A0tsEQd31GtzIjTpocTbRTlg2fHN
	 uEu0FUH78rCbqLm5qsmHL5CtJgpECrjNHHrVzrRkhrIjHRdFNcUzaFQlAPcmuxJSVd
	 SQGHNt5qK2LuU06CvmLaHbaVeeLZwb5DOV1furGgtmT5mJHlJMIe9zXwm1HhdSNJDq
	 PsRyXGw34SMszmma88JhTfs5SDYSFpK0SthmaqCtuxHBTI/uFtmEftGvMUWJGZNGum
	 U5WQ+83ZswSKqmhJRoPSC4OGwXi16+kNULIi0ppuzr5YJPlvHY2NYUlmLJ09cxvCyH
	 cCvcBryhCpAnQ==
Subject: Re: [PATCH net-next v4 2/2] selftests: net: test untracked NA
 recovery of FAILED neighbors
From: netdev-bot+sashiko@kernel.org
To: lfqlee314@gmail.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 rdunlap@infradead.org, netdev@vger.kernel.org, aajith@arista.com,
 roopa@nvidia.com, jhpark1013@gmail.com, corbet@lwn.net,
 skhan@linuxfoundation.org, shuah@kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 27 Sep 2026 01:59:16 +0000
Message-ID: <179047435603.2160803.13373341999390974606@kernel.org>
In-Reply-To:
 <ce40008682ed26ab039168a5fcb515eff8d30c3a.1790127207.git.lfqlee314@gmail.com>
References:
 <ce40008682ed26ab039168a5fcb515eff8d30c3a.1790127207.git.lfqlee314@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The Fixes:-tagged bug fix is bundled with new tests that
  depend on a new feature.
- [Low] The commit message says the test verifies that "disabling each
  gate keeps the entry in FAILED without a link-layer address".

Pre-existing issues:
- [Low] Some script exit paths skip cleanup().

--

selftests: net: test untracked NA recovery of FAILED neighbors

This adds cases to ndisc_unsolicited_na_test.sh that seed a NUD_FAILED
neighbor. Each case checks whether an unsolicited NA moves the entry to
STALE, based on drop_unsolicited_na, accept_untracked_na and forwarding.

It also runs tcpdump in the background and waits for it to exit. It keeps
the return code in test_unsolicited_na_combination() so existing cases stop
reporting false success.

Link: https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com

> diff --git a/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh b/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
> index 5db69dad0cfc0..ba9e670b51498 100755
> --- a/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
> +++ b/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh

[ ... ]

> @@ -102,24 +115,39 @@ setup()
>  }
>  
>  start_tcpdump() {
> -	set -e
> -	tcpdump_stdout=`mktemp`
> -	tcpdump_stderr=`mktemp`
> +	tcpdump_stdout=$(mktemp) || return 1
> +	tcpdump_stderr=$(mktemp) || return 1
>  	${IP_ROUTER_EXEC} timeout 15s \
>                  tcpdump --immediate-mode -tpni ${ROUTER_INTF} -c 1 \
>                  "icmp6 && icmp6[0] == 136 && src ${HOST_ADDR}" \
> -                > ${tcpdump_stdout} 2> /dev/null
> -	set +e
> +                > "${tcpdump_stdout}" 2> "${tcpdump_stderr}" &
> +	tcpdump_pid=$!

[Severity: Low]
This is a pre-existing issue, but some exit paths in this script never reach
cleanup(). log_test() does this when the user quits under PAUSE_ON_FAIL or
PAUSE:

	[ "$a" = "q" ] && exit 1

Also, setup() runs under set -e after setup_ns() has created the namespaces.

Neither the script nor lib.sh installs an EXIT trap. On those paths the
namespaces, the veth pair and the mktemp files are left behind.

This patch adds one new case. tcpdump now runs in the background here. If
start_tcpdump() or host_link_up() fails and the user answers 'q' in
log_test(), is the tcpdump process orphaned? It still stops by itself
because of timeout 15s.

[ ... ]

> @@ -129,58 +157,145 @@ cleanup()

[ ... ]

> +	if [ -n "${expected_state}" ]; then
> +		neigh_show_output=$(${IP_ROUTER} neigh show \
> +			to "${HOST_ADDR}" dev "${ROUTER_INTF}")
> +		if [[ " ${neigh_show_output} " != \
> +				*" ${expected_state} "* ]]; then
> +			return 1
> +		fi
> +		if [ -n "${expected_lladdr}" ] &&
> +				[[ " ${neigh_show_output} " != \
> +				*" lladdr ${expected_lladdr} "* ]]; then
> +			return 1
> +		fi
> +		if [[ "${expected_state}" == "FAILED" &&
> +		      "${neigh_show_output}" == *"lladdr"* ]]; then
> +			return 1
> +		fi

[Severity: Low]
The commit message says:

    Verify that disabling each gate keeps the entry in FAILED without a
    link-layer address.

Can this lladdr check in verify_ndisc() ever trigger? __neigh_fill_info()
only emits NDA_LLADDR for NUD_VALID states:

net/core/neighbour.c:__neigh_fill_info() {
    ...
	ndm->ndm_state	 = neigh->nud_state;
	if (neigh->nud_state & NUD_VALID) {
		char haddr[MAX_ADDR_LEN];

		neigh_ha_snapshot(haddr, neigh, neigh->dev);
		if (nla_put(skb, NDA_LLADDR, neigh->dev->addr_len, haddr) < 0)
			goto nla_put_failure;
	}
    ...
}

NUD_VALID does not include NUD_FAILED, so ip neigh show never prints lladdr
for a FAILED entry. Once the FAILED state match above succeeds, this check
is always false. That means the "without a link-layer address" part is not
actually tested.

[ ... ]

>  test_unsolicited_na_combination() {
> -	test_unsolicited_na_common $1 $2 $3
> +	local initial_state=${4:-absent}
> +	local same_subnet=${5:-1}
> +	local rc
> +
> +	test_unsolicited_na_common "$1" "$2" "$3" "${initial_state}" \
> +		"${same_subnet}"
> +	rc=$?
>  	test_msg=("test_unsolicited_na: "
>  		"drop_unsolicited_na=$1 "
>  		"accept_untracked_na=$2 "
>  		"forwarding=$3")
> -	log_test $? 0 "${test_msg[*]}"

[ ... ]

> @@ -193,6 +308,16 @@ test_unsolicited_na_combinations() {
>  	test_unsolicited_na_combination 1 0 1
>  	test_unsolicited_na_combination 1 1 0
>  	test_unsolicited_na_combination 1 1 1
> +
> +	# Expect FAILED entry to become STALE
> +	test_unsolicited_na_combination 0 1 1 failed
> +	test_unsolicited_na_combination 0 2 1 failed 1

[Severity: Medium]
This commit carries a Fixes: tag for f9a2fb73318e. The only change that
fixes that commit seems to be the rc=$? move in
test_unsolicited_na_combination(), which now runs before the test_msg=(...)
assignment.

These two new cases expect a seeded NUD_FAILED entry to become STALE with
lladdr 02:00:00:00:00:02 and to keep extern_learn. That behaviour comes from
the preceding series commit "ipv6: update NUD_FAILED neighbors from NA
messages", which has no Fixes: or stable tag.

Without that commit, ndisc_recv_na() still skips FAILED entries:

net/ipv6/ndisc.c:ndisc_recv_na() {
    ...
	if (neigh && !IS_ERR(neigh)) {
		u8 old_flags = neigh->flags;

		if (READ_ONCE(neigh->nud_state) & NUD_FAILED)
			goto out;
    ...
}

Suppose a stable tree takes this patch because of the Fixes: tag, but not
the feature commit. With rc now preserved, won't these two cases report
FAIL?

Could the rc fix go in its own patch with the Fixes: tag, and the
FAILED-recovery tests in a separate patch without it? If they stay
together, could the commit message at least state the dependency?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1790127207.git.lfqlee314%40gmail.com
