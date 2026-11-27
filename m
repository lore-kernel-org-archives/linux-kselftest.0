Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818356;
	b=1HW076wCJpRelGa5CLJyZyrCWe3QFUcuPeXyMUPgZLmn5lutnmaddulc8eY6y9Y+L7Gk
	 zRQa2iYvAEC2In/HlhyX1RGAIb9PP4LzIBMzijysBnd2fDSmt0JhuDb5tSp7sbSLSdFBj
	 ILEk2RcJX1t1anIIggxvJ9SFaOuQ0qTS3EluCfXGFpHBJWShNXswUyOyJTU0Ao5JU7Ip1
	 MqbF9+W/fBZWJW0Ejf5ByG/6UGVYhhBWfhNgWjjxWumJ2YORVoI+ndm1rJnqdn92U5y2K
	 4YEAfxOOovJ0oIvyTT47ldY83mcickRuxWuLzaFyTFV1QSidPEnbvQNGnvN+fXFQ9Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818356;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xJRmzNvq1O79iasY33Ckwg4qBT9YXe3i0Q0gMj2U+Y0=;
	b=D8Phji+z2JF70V+DYtdkT/73q/aI722F1YsgZaqRdbfF04xFRilYcJnYr6JrFoQ5p8fv
	 aEtvmePqJmZa3al9IWFltlJvZanJW6Ohwww6gprze9/MaM84OJFEFgtvfSVH+kczTN4wt
	 d3qJY3LiV7XBt2e7aU48Z5l27uvLDLVIay8/t1SB0+1G7SlesaPQkNkjt+T6xHSDc2XLN
	 xpqX1KZkEi1sRD0mdkHb+osBiF/5CYp8y+FDNVcf2Zx/mIipF78S7OUycQnjqBhMEE0n4
	 uYGe5DXkVE0shv5FJW4vY8ONiYVj6kf0oocTgS4onUuEq+IYd0W07YHQ9OIc15FAopQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJaBinNW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489DE606A326;
	Fri, 27 Nov 2026 22:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJaBinNW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB201F000C1;
	Fri, 27 Nov 2026 22:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795818355;
	bh=xJRmzNvq1O79iasY33Ckwg4qBT9YXe3i0Q0gMj2U+Y0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bJaBinNWkcj4mgWSBRNvCS2tKhK+mjiTKF8/RwIFfrUEoEZ9TPBx794qSrTZMYkc5
	 jK+9FYweOL3n/0mcVn9iwd/VqGiEH5vLpb5xlwr7QCPvrdMWjEKM+V4Ht0mLbCtcst
	 DjX1qDFxxUfOD5E0fGzf3HgV9E0jzovsvX15uOuFFu4OXHstxZO/rQXVZ8UusbFtlm
	 Mhw3rgTyISz1wVbpUnNo/pykEudYHEuU4HLurDv0K7pwv6hC+alot+VLM74PaFyi6n
	 LACjWqGLOiKH9gad8ggzRgfCM98iuCLF0nMhBc45Nnxg42so4zBOc+FCistgIH8wOM
	 0tbvreiVYG9zg==
Subject: Re: [PATCH net-next 5/5] selftests: net: add a scale test for LISP
From: netdev-bot+sashiko@kernel.org
To: vjardin@free.fr
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com,
 nicolas.dichtel@6wind.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 27 Nov 2026 22:25:54 +0000
Message-ID: <179581835452.3135.4676723835518066022@kernel.org>
In-Reply-To: <20261126-for-upstream-lisp-v1-v1-5-7382a4bcfd9b@free.fr>
References: <20261126-for-upstream-lisp-v1-v1-5-7382a4bcfd9b@free.fr>
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

- [Medium] The background loops in churn_test()
  (tools/testing/selftests/net/lisp_scale.sh) can be left running when…
- [Low] The sub-tests in tools/testing/selftests/net/lisp_scale.sh depend
  on each other through hard-coded state.

--

selftests: net: add a scale test for LISP

This adds lisp_scale.sh, a selftest that installs the mappings of many
remote sites on one LISP device of an xTR. Each site gets one nexthop and
four EID routes, and a second namespace stands in for all the sites. The
sub-tests cover counters, RLOC moves and replacements, withdrawals, churn
under traffic, and taking the device down and deleting it.

> diff --git a/tools/testing/selftests/net/lisp_scale.sh b/tools/testing/selftests/net/lisp_scale.sh
> new file mode 100755
> index 0000000000000..badba6491a42c
> --- /dev/null
> +++ b/tools/testing/selftests/net/lisp_scale.sh
> @@ -0,0 +1,532 @@

[ ... ]

> +churn_test()
> +{
> +	local loops=()
> +	local pids=()
> +	local rounds=0
> +	local site
> +	local out
> +	local pid
> +
> +	RET=0
> +
> +	out=$(mktemp -d)

[ ... ]

> +	for site in 5000 5001; do
> +		while :; do
> +			ip netns exec "$x1" ping -q -f -w 1 -I site \
> +				"$(site_eid4 "$site")"
> +			ip netns exec "$x1" ping -q -f -w 1 -I site \
> +				"$(site_eid6 "$site")"
> +		done > /dev/null 2>&1 &
> +		loops+=($!)
> +	done

[Severity: Medium]
If the script exits before churn_test() reaches its kill_process loop,
what stops these while : loops?

The loop subshells run in the init netns, and their PIDs are kept only in
the local loops array. The EXIT trap only runs this:

cleanup()
{
	cleanup_all_ns
}

cleanup_ns() in lib.sh kills only the processes listed by "ip netns pids"
for the namespace and then deletes it, so it never touches these subshells.

Suppose the script gets Ctrl-C while the churn loop is running. In a
non-interactive shell, background commands ignore SIGINT. A SIGTERM sent
only to the script PID has the same effect. In both cases x1 is deleted
and every "ip netns exec $x1" then fails at once.

Would the two loops then keep forking failing ip processes until someone
kills them by hand?

The kselftest runner timeout signals the whole process group, so this
mostly affects manual interruption and harnesses that signal only the
script PID.

The mktemp -d directory in $out would also be left behind, because
rm -rf "$out" only runs on the normal path.

Could the loop kill and the rm -rf be registered with the lib.sh defer
helpers? tests_run() already wraps each test in in_defer_scope.
Alternatively, the PIDs and $out could live in globals that cleanup()
handles, or the loops could stop at a deadline instead of using while :.

[ ... ]

> +	rm -rf "$out"
> +
> +	(( $(count_nexthops) == LISP_SITES - 1100 ))
> +	check_err $? "unexpected count of nexthops"

[Severity: Low]
Does churn_test() need to depend on what withdraw_test() did here?

The 1100 comes from withdraw_test() deleting the nexthops of sites
3000..3999 and then 4000..4099:

	sites_batch "" 4000 4100 'printf "nexthop del id %d\n", nh'

churn_test() deletes and re-adds sites 5000..5199, so it does not change
the total. This check just repeats the one at the end of withdraw_test().
move_test() also asserts count_nexthops == LISP_SITES, and most sub-tests
rely on the sites created by install_test().

tests_run() in lib.sh iterates ${TESTS:-$ALL_TESTS}, so a subset can be
run. With TESTS=churn_test, this check would fail, and sites 5500/5501
would not exist, even if the churn handling itself works.

withdraw_test() sends its deletions through ip -batch without -force. If
it fails partway, the same problem would be reported again here as an
unexpected count of nexthops.

Could this cross-test count be dropped, or compared against a count taken
at the start of churn_test()?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b%40free.fr
