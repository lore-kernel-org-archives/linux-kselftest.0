Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866918;
	b=5VQlLOmNJYIoIbAh3kXzXMhp0zrDpVE5xShFtTYvILhqNwBoegkjBBdLKNO+6giXejUY
	 XN+9sikxxQhU9QrQGa1CiNjJ6vQwzlsBJENtLCqGW3fe/Lx/885RGmrgkUvHOo8QHB30+
	 vLzC00K0blhtoDdng3HVhLDyVvZawa/0ajn6MLJQlxfTUlHiudwPycZht8lrPyQwdbnrT
	 B4iwB99xwd6Fa782250guKoxbTQIFc3I7zPG5ReokezDSMOT0pjAoDkvtRkW1QoNkIBdM
	 LAQk3mfDmpfWzIPoVcFmxgOFxACoPTPX+gkt2piBV0UojF7hhTehqta7G7IrB0EMuLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866918;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mJGxukNRI8guOCGYuzV7f+FvQEmBPeT2/NYqHIeuCJg=;
	b=Z0LfqKUP7H5+N78oOoxBDJZIFi6pQaXAmvWDlVzfo9gcunFEnALGXRYcaWNxQ0dgbRB2
	 pIizK0cIJnh7IAF7frkMHoipnHxhexZKnSP3e/drHzG4D6Mr4KTyXzZoHnEOhsPeNrJ4P
	 Ee+k5ZTcW6dPEDAQNQLCfKSjiUYgJ20G62OB36JcW69b3+CmIk77pYauKGydW7ORZ5yYA
	 FmCCpCXS9W4uZF4QF2au38tsNYpUlhHFENsJhQ2rw86eOnihrMTS4lD5PEqdK9NUlv+/I
	 nEeRV69CFIpLhSQnnwFv9Y81v6UaeGKYVvBPi/m+sAR5MFnNXz7Ym0YSdH+TD0Y/FqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NfXOz1bj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C3660A2621;
	Mon, 16 Nov 2026 22:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NfXOz1bj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D191F000C6;
	Mon, 16 Nov 2026 22:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794866918;
	bh=mJGxukNRI8guOCGYuzV7f+FvQEmBPeT2/NYqHIeuCJg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NfXOz1bjnqQSic7caaDvifzS7e6EoeeDqYbBHCqBxf1odgHUmampewXS3miJugkWs
	 q3WIh6032Q8hXhTeTAOczJwAwJfuoEEah1rLLjST68py2Hfu0YloCFIq31+H3kG5Bl
	 YsMu5imNqWR0st9EuhnoXYXMSrk3BkOWw4eFtlDu7DY1J6O8VZ4JNWYI5LM3TXe5qK
	 ybo42DBAkOnRL1HFbsgrf7ZGMd/rf3kWcWVOX5UtGKZVnojc+E7/fLCpQIACgL526h
	 S3tdgTO6skVx0F/+bc4JUeS5362Nhm28eiwfLsoi+Bex4E3OcZ8dvTVOb+MYDSs1/t
	 tkX61uyi8vUeQ==
Subject:
 Re: [PATCH net-next v4 3/4] selftests: net: test restricted on-link fallback
From: netdev-bot+sashiko@kernel.org
To: liamsmith827@grapheneos.org
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liamsmith827@proton.me
Date: Mon, 16 Nov 2026 22:08:36 +0000
Message-ID: <179486691687.3136.3928075477419379524@kernel.org>
In-Reply-To: <20261115215640.18728-4-liamsmith827@grapheneos.org>
References: <20261115215640.18728-4-liamsmith827@grapheneos.org>
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

- [Medium] In ipv4_ping_novrf() (tools/testing/selftests/net/fcnal-
  test.sh, lines 659-662), the new case "ping out, blocked by…
- [Low] Even with the missing ping added, the unreachable-rule case in
  ipv4_ping_novrf() (fcnal-test.sh lines 659-662) has no device bind…

--

selftests: net: test restricted on-link fallback

This patch updates the IPv4 cases in fcnal-test.sh to match the new
on-link fallback behaviour. The fallback is no longer taken when the FIB
lookup hits an unreachable, blackhole or prohibit route or rule. It
changes the expected return codes, adds a route miss variant and an
unreachable rule case, and enables the device bind cases that were
previously commented out.

> diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
> index a50609535fedc..9722d7dcad085 100755
> --- a/tools/testing/selftests/net/fcnal-test.sh
> +++ b/tools/testing/selftests/net/fcnal-test.sh

[ ... ]

> @@ -643,10 +656,14 @@ ipv4_ping_novrf()
>  	run_cmd ping -c1 -w1 ${a}
>  	log_test_addr ${a} $? 2 "ping out, blocked by rule"
>  
> -	# NOTE: ipv4 actually allows the lookup to fail and yet still create
> -	# a viable rtable if the oif (e.g., bind to device) is set, so this
> -	# case succeeds despite the rule
> -	# run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
> +	log_start
> +	setup_cmd ip rule add pref 49 to ${NSB_LO_IP} unreachable
> +	log_test_addr ${a} $? 2 "ping out, blocked by unreachable rule"

[Severity: Medium]
Is a ping missing here? Nothing runs between the rule add and
log_test_addr, so $? is the exit status of setup_cmd.

setup_cmd() exits the whole script if the command fails:

setup_cmd()
{
	...
	run_cmd ${cmd}
	rc=$?
	if [ $rc -ne 0 ]; then
		...
		exit $rc
	fi
}

So when it returns here, $? is always 0. log_test_addr() then compares
0 against the expected value of 2. That means this case reports FAIL on
every run, and no packet is ever sent while the pref 49 unreachable rule
is installed.

The commit message says this case will "demonstrate ping fails as
expected with an unreachable rule" and that it "ensures
FIB_LOOKUP_REPORT_MISS does not break this behavior". As written, the
case checks neither.

Would adding run_cmd ping -c1 -w1 ${a} before log_test_addr fix this?
At this point a is still ${NSB_LO_IP}.

> +	setup_cmd ip rule del pref 49 to ${NSB_LO_IP} unreachable
> +
> +	log_start
> +	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
> +	log_test_addr ${a} $? 2 "ping out, device bind, blocked by rule"

[Severity: Low]
Even with the ping added, can the unreachable rule case catch a
FIB_LOOKUP_REPORT_MISS regression without a device bind?

In ip_route_output_key_hash_rcu(), the on-link fallback is only taken
when oif is set and err == -ESRCH. In every other case a miss is mapped
back:

	err = err == -ESRCH ? -ENETUNREACH : err;

fib4_rule_action() returns -ENETUNREACH for FR_ACT_UNREACHABLE. With oif
unset, two cases give the same ping exit code of 2:

  - the unreachable rule is correctly reported as -ENETUNREACH
  - the rule is wrongly reported as a miss (-ESRCH), which is then
    remapped to -ENETUNREACH

So a non-bound ping cannot tell them apart.

The device bind case that follows runs after the pref 49 rule has been
deleted. It hits the pref 50 prohibit rule (-EACCES), which never goes
through the -ESRCH vs -ENETUNREACH distinction.

Should there also be a run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a} case,
expecting 2, while the pref 49 unreachable rule is still installed?

>  
>  	a=${NSA_LO_IP}
>  	log_start

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115215640.18728-1-liamsmith827%40grapheneos.org
