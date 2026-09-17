Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3AF4A8438;
	Thu, 17 Sep 2026 09:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636923; cv=none; b=KqQ+i4qwAwkUox97V1ZhfZDOTvd8FAae73zKgLOVCq/CKdOX1Jym2kYLRcKOJ1vNZSXi68aCW7ZnIThXYWaw3EsPToadEf6/K+3y2vUKEQyHWUPK+wL78j4Rh02FgrCcXq/hXrm10mdqGY7zfr+cteJZj3yV73kMrmH5Ip8hKnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636923; c=relaxed/simple;
	bh=Nk0j+dgBYsStc9vpRTyL0WR/JxUM8VjdwJ3S9rVxXCQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q3IhY9+RzUVOrm5AI+0CkE+DoHMvke6cUleyfANRDkT6UsmVchcFYJ46/0mP5qjyVv2wIBt4eRbXCSndFR0O/RgpwcuzwEPYJLaUiO7UqgPwXQMk+q4eTCE329KXRryuCVHM0iKeDyfpVSqKj6yAjBH3AXfZnkgR1U/99MF+KSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXaNVEGT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXaNVEGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F281F000FF;
	Thu, 17 Sep 2026 09:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789636921;
	bh=8YWpnH8IbdMwhsJsF7hY+uJ8SswyuZ3cWpTMar8JdEo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dXaNVEGTLIx6WD1q9hQSFDlyEE4Tn4wfGD05ZJlzzA0s6imOBgLH3d9cuZo9qqxj7
	 uELo3otxvhjASRjT5cgjvNqfcAjixCbKfs4rAGo6p6uZ2ROPiOfbWGL+YHsBmwYlVv
	 7Lo5XZWzEEhbpnjVU8R4kp2n7o3iacTEWuzEHEfgy0RYlAcPpoVcP0RM/DoSSRUAjx
	 I3+HpMJJue4HhfpxqC+f1sE6FitE2ctJsdwuepeD6cFWMNuSJxyI3OLacdKQryA5Jl
	 rKE18NYmeO+1rSYu93U1oNXPYZo0NU2Og5ZC/PfOpNKwu9cltZ4/3KdCi2BCG6p97U
	 1LO5PEU8p7Cjw==
Subject: Re: [PATCH net v2] selftests/net: run tun tests in a dedicated
 network namespace
From: netdev-bot+sashiko@kernel.org
To: edoardo.canepa@canonical.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 xudu@redhat.com, po-hsu.lin@canonical.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 17 Sep 2026 09:22:00 +0000
Message-ID: <178963692060.22033.17689197531256265922@kernel.org>
In-Reply-To: <20260914211921.3786609-1-edoardo.canepa@canonical.com>
References: <20260914211921.3786609-1-edoardo.canepa@canonical.com>
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
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 1

- [Medium] The commit message's closing note ("Note that without the fix
  a failure is not self-contained: the fixture setup aborts before…
- [Low] The commit message uses `Assisted-by: Claude:claude-opus-5` while
  the v2 changelog claims "Use the Assisted-by: format documented in…

--

selftests/net: run tun tests in a dedicated network namespace

The tun and tun_vnet_udptnl fixtures now call unshare(CLONE_NEWNET) in
their setup so each forked test process gets a private network namespace,
which keeps systemd-udevd's RTM_SETLINK (MACAddressPolicy=persistent) from
flushing the NUD_PERMANENT neighbor entry the test installs.  If unshare()
fails the test is reported with SKIP() instead of aborting.

Closes: https://bugs.launchpad.net/bugs/2158217

Both observations below are about the commit message only, so the diff
hunks are snipped.

[ ... ]

>     Note that without the fix a failure is not self-contained: the fixture
>     setup aborts before FIXTURE_TEARDOWN runs, so the tap and geneve
>     devices are left behind in the init netns and every later run fails
>     right away in geneve_create().  Running in a private namespace also
>     removes that, since the namespace is torn down with the test process.

[Severity: Medium]
Does this paragraph describe the same failure the message quotes earlier?

The quoted diagnostics

  tun.c:947:send_gso_packet:Expected ret (0) == variant->data_size (1423)
  tun.c:948:send_gso_packet:Expected r_num_mss (0) == variant->r_num_mss (2)

map (with the nine lines this patch adds above them) to the two checks at
the end of TEST_F(tun_vnet_udptnl, send_gso_packet):

	ret = receive_gso_packet_from_tunnel(self, variant, &r_num_mss);
	EXPECT_EQ(ret, variant->data_size);
	EXPECT_EQ(r_num_mss, variant->r_num_mss);

That is after FIXTURE_SETUP(tun_vnet_udptnl) has completed, not an abort
during setup.  EXPECT_EQ only records KSFT_FAIL and continues, so the test
body returns normally and __TEST_F_IMPL in kselftest_harness.h has already
cleared no_teardown and then calls the teardown unconditionally:

			*_metadata->no_teardown = false; \
			fixture_name##_##test_name(_metadata, self, variant->data); \
			_metadata->teardown_fn(false, _metadata, self, variant->data); \

FIXTURE_TEARDOWN(tun_vnet_udptnl) then does run:

	ret = ip_link_del(param_dev_geneve_name);
	EXPECT_EQ(ret, 0);

	ret = tun_delete(self->ifname);
	EXPECT_EQ(ret, 0);

A harness timeout does not look like the mechanism either: udp_socket_open()
sets SO_RCVTIMEO to TIMEOUT_SEC (10 s) and receive_gso_packet_from_tun()
select()s with the same 10 s bound, both under TEST_TIMEOUT_DEFAULT (30 s).
The tap is also opened without IFF_PERSIST, so it goes away when the child
closes its fd.

Could the leftover geneve1 and tap devices that were observed have come from
a different abort or setup-failure path than the neighbor flush described
here?  Since the v2 measurement methodology ("with the tap and geneve devices
removed between iterations") is justified by this paragraph, it would help to
either identify that path or drop the claim.

>     Assisted-by: Claude:claude-opus-5

[Severity: Low]
This isn't a bug, but the v2 changelog says "Use the Assisted-by: format
documented in Documentation/process/coding-assistants.rst", and that
document specifies:

  Assisted-by: LLM [TOOL1] [TOOL2]

* ``[TOOL1] [TOOL2]`` are optional specialized analysis tools used
  (e.g., coccinelle, sparse, smatch, clang-tidy)

The literal LLM token is required and the optional trailing fields are
analysis tools rather than a vendor or model name, so the trailer as written
does not match either part.  Should this read "Assisted-by: LLM"?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914211921.3786609-1-edoardo.canepa%40canonical.com
