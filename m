Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27664766A5;
	Fri, 25 Sep 2026 22:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790376436; cv=none; b=X8qzs0aWSbdoaw7ZPCQo7KMeRtwcCb2B0ne3RJJw1HEEZ8MFj2teusQHV4p2BY0iuTvT8UYm6E3P2saIbI51OQx59MDgxPvq04f8kZ9r4RRH0ZKJcrzYSeSxL8fJ2hR9y3QaqnT3K6nmJ473v5z3PSACQrQRL43fAZ9mQWwx3vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790376436; c=relaxed/simple;
	bh=JqEcmoDDWblFAh0Nxq2yq/H40ZTIt44qB8BOo44Q6H8=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G+rBLz/ASqZLqjB1rPdB+A+fB7t+csE4xJmEosAw0ATCFLWuomlJ6SjgFa5Z46eVkmej+JCcXwPVo39okJYGQhTwd+en5224obIq259BssEzmVcMGn3qiOfJUBUUFdQ2C84+/f8xQQJT8EWq/fxB2+L1lZHp3Ua0S6X99sn3FzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOoorRDw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOoorRDw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982911F000FF;
	Fri, 25 Sep 2026 22:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790376435;
	bh=HG1xmjc9muedxWRreV/dfHrFYuUNJrN4Sktg41zjz+0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QOoorRDwiu0o6dE7nQTAlNfujFNM+C7Cjwef9qOnpB3I7zwF70uwIY53WaxgX8Z1X
	 qNCuv1bCv7DgbqTSg2Rew1+3bVYvCLtxu6QcE43hyMNfa/C+HM3MTNqlEo+8KdnjU4
	 7odbBOf/wXm7Lt26NTFKYAYTF24g+t+FKDkrKhU118I5gIYCdfc0BCd6MvJzfQv9LE
	 zsxGkwC3J70C/tni9Vj6lfC0pX2EpVoBHXy4CromeL8PphvekON1L2PZgRQWj9LOHi
	 K7RK65hjnEra0Dd/MEli90/bFZJE5ecMhPVdPXJouKO8qKwWLLKTtdQ+PPjVzrBL/g
	 zSmR/4v+wx97w==
Subject:
 Re: [PATCH net v2 2/2] selftests: net: check timestamp echo after an old ACK
From: netdev-bot+sashiko@kernel.org
To: jeffjo@openai.com
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 25 Sep 2026 22:47:14 +0000
Message-ID: <179037643415.2160803.14897657788666510697@kernel.org>
In-Reply-To: <20260924224456.55690-6-jeffjo@openai.com>
References: <20260924224456.55690-6-jeffjo@openai.com>
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
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new selftest
  tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt checks for…

--

selftests: net: check timestamp echo after an old ACK

This adds a packetdrill regression test for a gap-filling segment that
carries an old ACK. Two peer data segments arrive out of order. The test
then requires the ACK that closes the gap to echo the delayed segment's
timestamp (301000) and not the stale saved value (1000).

Link: https://github.com/google/packetdrill/commit/83f72d3f9085d0e26eb4d206fe4d7cfab5b6d872

> diff --git a/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
> new file mode 100644
> index 0000000000000..f072e5e4c4494
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
> @@ -0,0 +1,22 @@

[ ... ]

> +0.300 write(4, ..., 17) = 17
> ++0 > P. 1:18(17) ack 1 <nop,nop,TS val 300 ecr 1000>
> +0.310 < P. 18:35(17) ack 18 win 20000 <nop,nop,TS val 301001 ecr 300>
> ++0 > . 18:18(0) ack 1 <nop,nop,TS val 310 ecr 1000,nop,nop,sack 18:35>
> +0.320 < P. 1:18(17) ack 1 win 20000 <nop,nop,TS val 301000 ecr 100>
> ++0 > . 18:18(0) ack 35 <nop,nop,TS val 320 ecr 301000>
                                                  ^^^^^^^^^^^

[Severity: Medium]
Can this test report PASS on a kernel that doesn't have the fix?

The commit message says packetdrill versions older than 83f72d3f9085 do
not check the outgoing TSecr:

  older tools incorrectly pass on an unfixed kernel

This ecr 301000 check is the only line in the script that depends on the
fix. The seq, ack and SACK checks give the same result with or without
it, and so does the read() of 34 bytes below.

The runner only checks that some packetdrill is in PATH. It then reports
PASS whenever packetdrill exits 0:

tools/testing/selftests/net/packetdrill/ksft_runner.sh:
    if [ -z "$(which packetdrill)" ]; then
    	ktap_skip_all "packetdrill not found in PATH"
    	exit "$KSFT_SKIP"
    fi
    ...
    	unshare -n packetdrill ${ip_args[$ip_version]} ${optargs[@]} $script > /dev/null \
    		&& ktap_test_pass $ip_version || $failfunc $ip_version

On a kernel without the fix, tcp_ack() sends the gap filler down the
old_ack path, since ack 1 is before snd_una 18. That kernel does not have
this update:

net/ipv4/tcp_input.c:tcp_ack() {
    ...
old_ack:
	...
	if (flag & FLAG_UPDATE_TS_RECENT)
		tcp_replace_ts_recent(tp, TCP_SKB_CB(skb)->seq);
    ...
}

As a result, ts_recent stays at 1000. With an older packetdrill, such as
a distro package, wouldn't ipv4, ipv6 and ipv4-mapped-ipv6 all still pass?

Could the script add a check that doesn't rely on packetdrill's TSecr
handling? For example, after the gap-closing ACK, inject:

  < P. 35:36(1) ack 18 win 20000 <nop,nop,TS val 2000 ecr 320>

With the fix, ts_recent is 301000, so the PAWS check in
tcp_validate_incoming() drops the segment. The segment carries data, so
tcp_oow_rate_limited() does not suppress the dup-ACK, and the reply is
ack 35.

Without the fix, ts_recent is 1000. The segment is accepted and the reply
is ack 36. That difference would show up whichever packetdrill version is
used.

> ++0 read(4, ..., 34) = 34

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924224456.55690-4-jeffjo%40openai.com
