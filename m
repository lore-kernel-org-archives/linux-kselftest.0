Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930DC4D2ED6;
	Thu,  6 Aug 2026 19:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044184; cv=none; b=DcUkvLdcyuRaFPf/Tzs4p1/atC2Q0mgDLjZOJI/YIIl4KjTjb0RAVnhLyAyJSSspILKR37GqJ71uFuwhLn8E0V20AF4kO06iTA16q0ZvbpnOsXFKsPhuJlbNlFWJVit6262QVhkFsNoK3/Z+F+2FEWkTP9G+16KA6xe5ks9XSl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044184; c=relaxed/simple;
	bh=dgVCcJ0IoVh7IUG6R8EfnNn5HfJyaFFlEKpy7MJt0X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KIvDK6kzgh5qGt8zf1e9gXD9DjMfSOy/Egl+MtgWt4GUeDlFzIiZlANzvVYS2s0oe1M03mwwisu41aUZMojt/JZmdmgh+gP2dfr1s/ue9RLkOkSNAim9xKj2w1cVs4655PE7fl62pYMikt1qno0Epy1Rivve/WUULRBGkYJBOX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrQUn9lf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrQUn9lf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FED91F000E9;
	Thu,  6 Aug 2026 19:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786044171;
	bh=/8h4RZgdt8B1TzYsUo1cnmY62TJHgUv8BiEr0Jz7sAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SrQUn9lfbzM3okLWWWWMMiscjuQXMhkf5/QleRBIT3nNFQnPRn15+8GJ0w1i2jO9B
	 wuH+HEV/5Vjvh4oM5QhhjX1206TvrEF+WjDEuhtwfb3rU5RCDHGxDztGcyFplD+hx5
	 6IEQGk5qXPhAqntZBOif5QHIXYCk6raLXtkzU+jvuZlFflpmdiKbb1a+zu6fHIqG2j
	 Dp3uVhYmxzW+/5+CxrlM6Pw3ki0z9tYbndj3UXQop0ZdK7viB3v436Ae+yTCvlned6
	 MOaLPGRmvNrcwC3kJlEiMCE1qBOE98s2uAI00oITC1HCGQkPZRSaKTFFPsWGn8MOiL
	 pFlYApTuQcX2Q==
From: Jakub Kicinski <kuba@kernel.org>
To: marcelomspessoto@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/4] selftests: net: test IPV6_FL_A_RENEW
Date: Thu,  6 Aug 2026 12:22:46 -0700
Message-ID: <20260806192246.3335605-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804025910.50145-2-marcelomspessoto@gmail.com>
References: <20260804025910.50145-2-marcelomspessoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
selftests: net: test IPV6_FL_A_RENEW

This adds selftest coverage for the IPV6_FL_A_RENEW flow label action: a
new flowlabel_renew() helper, an expect_fail_errno() assertion macro, and
tests that renew fails with ESRCH for a nonexistent label and succeeds for
an existing one. A long-running case verifies that renewing extends the
linger period so a new label cannot be created after the original linger
time.

A couple of questions below.

> diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> index af95b48acea90..01fab414895c5 100644
> --- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> +++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
> @@ -27,6 +27,7 @@
>  
>  /* from net/ipv6/ip6_flowlabel.c */
>  #define FL_MIN_LINGER		6
> +#define FL_MAX_LINGER	150

[Severity: Low]
Is FL_MAX_LINGER used anywhere?  Grepping the file, the identifier appears
only on this definition line, both in this commit and at the end of the
series.  The only linger values the test passes are
2 * (FL_MIN_LINGER * 2 + 1) and the implicit 0.

The kernel path this constant mirrors is the one RENEW error case the new
tests do not exercise:

net/ipv6/ip6_flowlabel.c:check_linger() {
	if (ttl > FL_MAX_LINGER && !capable(CAP_NET_ADMIN))
		return 0;
	...
}

and fl6_renew() turns that 0 into -EPERM.  Since the selftest is driven
through in_netns.sh as root, an over-max linger value would not reach that
branch anyway.

Would it make sense to either drop the define, or add an unprivileged
over-max linger case that expects EPERM?  As it stands an unreferenced
object-like macro produces no warning, so it suggests coverage that is not
there.

Also, this isn't a bug, but the new line uses a single tab while the
adjacent #define FL_MIN_LINGER uses two, so the values no longer line up.

[ ... ]

> @@ -71,6 +84,17 @@ static int flowlabel_put(int fd, uint32_t label)
>  	return setsockopt(fd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &req, sizeof(req));
>  }
>  
> +static int flowlabel_renew(int fd, uint32_t label, uint16_t linger)
> +{
> +	struct in6_flowlabel_req req = {
> +		.flr_action = IPV6_FL_A_RENEW,
> +		.flr_label = htonl(label),
> +		.flr_linger = linger,
> +	};
> +
> +	return setsockopt(fd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &req, sizeof(req));
> +}

[Severity: Low]
Should flr_share be set explicitly here?  Leaving it out zeroes it, and 0
is IPV6_FL_S_NONE, which selects a second renew path in the kernel:

net/ipv6/ip6_flowlabel.c:ipv6_flowlabel_renew() {
	rcu_read_lock();
	for_each_sk_fl_rcu(sk, sfl) {
		if (sfl->fl->label == freq->flr_label) {
			err = fl6_renew(sfl->fl, freq->flr_linger,
					freq->flr_expires);
	...
	if (freq->flr_share == IPV6_FL_S_NONE &&
	    ns_capable(net->user_ns, CAP_NET_ADMIN)) {
		struct ip6_flowlabel *fl = fl_lookup(net, freq->flr_label);

		if (fl) {
			err = fl6_renew(fl, freq->flr_linger,
					freq->flr_expires);
	...
	return -ESRCH;
}

The test runs as root via ipv6_flowlabel.sh -> in_netns.sh, so the
CAP_NET_ADMIN fallback is always available, and labels 5 and 6 are also
present in the per-netns hash because the same socket created them.

If the for_each_sk_fl_rcu() matching branch ever stopped matching, would
fl_lookup() not still find the label, so fl6_renew() returns 0 and both
the "renew succeeds" and the long-running EPERM linger-extension
assertions still pass?

Would setting flr_share to the label's share (IPV6_FL_S_EXCL for these
labels), or adding a case using a label the socket does not own, separate
the two branches?

Cross-instance finding from sashiko-gemini (2a95a5b15b2d5ec9fd64306a937e0876383a2116fb10cbee36476a293b84adb4):
[Severity: Medium]
The `expect_fail_errno` macro incorrectly formats the error message when the tested function unexpectedly succeeds, printing a stale `errno` value rather than clearly indicating unexpected success.
-- 
pw-bot: cr
