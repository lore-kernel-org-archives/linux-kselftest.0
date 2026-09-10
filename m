Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ED02F9D85;
	Thu, 10 Sep 2026 00:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789001778; cv=none; b=K8Gx0RDN9O9aDAzKIwS5dZn7SWUdBNEbDGVEOc1jyhnw4ObHQCVWN3JO1fMFNkdcSPaSj8GEP1mt10PYVXkxAYot+bjV5wysYZ6RsYNJ8HOvLCKoD6IUshB2qtSIrMUGJMP5iswko2RrgTSBDzkIvHD+JXfjxWmpAPe/Qz6Eziw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789001778; c=relaxed/simple;
	bh=bv+0f6iTTtQIelkALLOIlx1yN7LS8VZ1OLIsIJ4bxSM=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C+HHa2T+FKVci5n/daxKmKrM24fO5da8piUQJv+bazyykLvFikWpzxfji2xbFJ5CQ83cPppKfJ4W/VuPenCsw1VuvykSTq5MIS0A+MpZNbwDLgdCz+37rgeYOeZyjJBcUp4Dj9Ywg0RRTAgnpPIDcNGjuxd9IvX7tRn2y4UrwGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOj1U5Bk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOj1U5Bk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7F91F000FF;
	Thu, 10 Sep 2026 00:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789001776;
	bh=ttM8ccXgfRL3uS2bDq0rE3U10dUBozRi3+Hzulmb90Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LOj1U5BkijVCWdNYMTB15xk9QuY4ZfBzrQ+A8grFmsFwZKbR13UBrxbc4hcba39sy
	 mS9wbd1vsEqCxTixGj40bNnT8m/QcBtHKKn2PuVkeKtjdtorCVZfMF+RW1d2icSjHR
	 snGCsjPLdsqYyxc9YkfdCBW+gvC4ZWDvRl40eqJHKF2KrNWo+b9KrEqj45DC9s/5WD
	 68EzUxJ7PGclwNsgHyBqknmJ8FWxu0CNE3bfTO416rtnu0wnUDKEvXD0qy5B7SchiJ
	 xX/dtZLcEy+d+MtK6K6ghpPh3JaKtQs0pou/l21D0+11prXGEFqQshPjjvtcV30/2m
	 IxcUlebtSZOkA==
Subject:
 Re: [PATCH net] selftests/net: run tun tests in a dedicated network namespace
From: netdev-bot+sashiko@kernel.org
To: edoardo.canepa@canonical.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 xudu@redhat.com, po-hsu.lin@canonical.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 10 Sep 2026 00:56:15 +0000
Message-ID: <178900177532.219967.8601375686974800395@kernel.org>
In-Reply-To: <20260905085318.3416670-1-edoardo.canepa@canonical.com>
References: <20260905085318.3416670-1-edoardo.canepa@canonical.com>
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
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] In the newly added main() in tools/testing/selftests/net/tun.c
  (lines 989-997), any failure of unshare(CLONE_NEWNET) is treated as a…

--

selftests/net: run tun tests in a dedicated network namespace

The patch replaces TEST_HARNESS_MAIN in tools/testing/selftests/net/tun.c
with a hand-written main() that calls unshare(CLONE_NEWNET) before running
the harness, so tap and geneve devices are created outside the init netns
that systemd-udevd watches.

Closes: https://bugs.launchpad.net/bugs/2158217

> diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
> index abe488bac50bb..7f118ba3ae0bb 100644
> --- a/tools/testing/selftests/net/tun.c
> +++ b/tools/testing/selftests/net/tun.c

[ ... ]

> @@ -985,4 +986,12 @@ XFAIL_ADD(tun_vnet_udptnl, 6in4_over_maxbytes, recv_gso_packet);
> XFAIL_ADD(tun_vnet_udptnl, 4in6_over_maxbytes, recv_gso_packet);
> XFAIL_ADD(tun_vnet_udptnl, 6in6_over_maxbytes, recv_gso_packet);
>
> -TEST_HARNESS_MAIN
> +int main(int argc, char **argv)
> +{
> +	if (unshare(CLONE_NEWNET) < 0) {
> +		perror("unshare(CLONE_NEWNET)");
> +		return 1;
> +	}
> +
> +	return test_harness_run(argc, argv);
> +}

[Severity: Medium]
Should an unshare() failure here be reported as FAIL for the whole binary?

Returning 1 from main() is KSFT_FAIL, and since test_harness_run() is never
reached, ksft_print_header() and ksft_set_plan() never run either, so the
binary emits no "TAP version 13" line, no "1..N" plan and no per-test result
lines at all.  Would a runner then be able to tell "network namespaces
unavailable" apart from a real tun/tap regression?

There appear to be two reachable ways to land in this path without any
actual tun/tap problem:

CONFIG_NET_NS=n, where the stub in include/net/net_namespace.h rejects the
flag outright:

  static inline struct net *copy_net_ns(u64 flags,
	struct user_namespace *user_ns, struct net *old_net)
  {
	if (flags & CLONE_NEWNET)
		return ERR_PTR(-EINVAL);
	return old_net;
  }

and running with CAP_NET_ADMIN but without CAP_SYS_ADMIN (for example a
container started with --cap-add=NET_ADMIN), where unshare(CLONE_NEWNET)
fails with EPERM.

In both cases the pre-existing tun fixture is aborted too, even though
FIXTURE_SETUP(tun) only does:

  self->fd = tun_alloc(self->ifname);
  ASSERT_GE(self->fd, 0);

which needs /dev/net/tun and CAP_NET_ADMIN, but no network namespace.  Was
losing that coverage intended?

Would returning KSFT_SKIP (4) fit the convention better here?  The precedent
named in the changelog, "This mirrors the approach used by
selftests/net/ipsec.c, which also unshares from main()", handles the same
failure differently in selftests/net/ipsec.c:main():

  if (init_namespaces())
	ksft_exit_skip("Failed to create namespaces\n");

Other harness call sites do the same, for example
selftests/arm64/gcs/gcs-locking.c:main():

  ksft_print_msg("GCS was enabled, test unsupported\n");
  return KSFT_SKIP;

and selftests/net/icmp_rfc4884.c keeps the unshare inside
FIXTURE_SETUP(rfc4884) so the failure stays attributable inside the TAP
stream:

  ret = unshare(CLONE_NEWNET);
  ASSERT_EQ(ret, 0) {
	TH_LOG("unshare(CLONE_NEWNET) failed: %s", strerror(errno));
  }

One more question on the changelog: the patch adds CAP_SYS_ADMIN in the
current user namespace and CONFIG_NET_NS as new prerequisites for the entire
binary.  Should that be mentioned in the commit message?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260905085318.3416670-1-edoardo.canepa%40canonical.com
