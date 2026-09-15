Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B8B2FD7B1;
	Tue, 15 Sep 2026 23:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789515798; cv=none; b=axkTsD2SvL1AuFYM8g4RSnUfRNm1WerstuLrItlCr0+khgV7OzhTJaXZJ6j8xu/kSiLGwqGiv5rgANPMvo6uHSBmulUIVK2UhUn/Vuy+arSJU9YGwv1mI2WiTBudXBz6FH6ucgShvjkLzAlDBcIcxQf1khZUmGP7S1zWDxHq0fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789515798; c=relaxed/simple;
	bh=1afPWC+Vrqb8lFXFCJEtxuaZPtaffk0f05tHGylIm78=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BKU3wwnGCmahboex5NZVhlm5+AVJXKgwMkSEmWUlkOED/zkc3adr5Bts037CLnVdKtKR8VVd4yaQOsPpWs8JZbAp+RRSzWXocRxzwdwMZrzf5aw+2Exz6E3wX8wVEGwrN+msFO1ETe9lHhZ7rymMBJlTuSpHvNWedgy3q9ohDr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkwyPqP8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkwyPqP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004BF1F000FF;
	Tue, 15 Sep 2026 23:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789515796;
	bh=9QTBdbP/4U3eaRgctLBlsLdBg0wW3Ukr2dCO7MJGCBc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RkwyPqP8RpeZ28eex0nwHofLrpUZ5FT9IA/5Gb5yC4WpuUIYIDn42nuAqgGWIBWrF
	 /had6yyGjx3PUX0CaljKHY5u5Nt3WucdE7P40WfFHLy+0Ks3LnrxHySgYz6JAvzbVi
	 7fFg1rmCQEUGOJRdluwzIS/Hs/AqAyfvWiHsjG5+9uuvzR1f9SGaRhZJxBdK67LAoz
	 JCz5FNmhTd0rJiOzfp7AEGDGI950q67CiOpQuBk0uCrMCdUTBldIfYrdUe1/AYavSg
	 2naIhGOdK+iZB7ziF9bJCFOE481hIS9cfr/qv9/0Lo3Ex0zlykHB1MxRcHCOI4h/rv
	 XF6MG8VALgENg==
Subject: Re: [PATCH net 2/2] selftests: net: add RPL SRH loop test
From: netdev-bot+sashiko@kernel.org
To: markdamirkan@gmail.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 alex.aring@gmail.com, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 15 Sep 2026 23:43:15 +0000
Message-ID: <178951579554.22033.5001333303876038052@kernel.org>
In-Reply-To: <20260911-sympwn-rpl-send-v1-2-1753993bb584@gmail.com>
References: <20260911-sympwn-rpl-send-v1-2-1753993bb584@gmail.com>
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

- [Medium] In tools/testing/selftests/net/rpl_srh_loop.sh the two `ip -6
  address add` commands (lines 16-17) that install the local addresses…

--

selftests: net: add RPL SRH loop test

This adds a new shell test that installs two local addresses in a network
namespace and then adds RPL encap routes to check that adjacent local
segments are accepted while a non-local segment between two local ones is
rejected. The script is registered in TEST_PROGS in the net selftests
Makefile.

> diff --git a/tools/testing/selftests/net/rpl_srh_loop.sh b/tools/testing/selftests/net/rpl_srh_loop.sh
> new file mode 100755
> index 0000000000000..a2e9991d789d6
> --- /dev/null
> +++ b/tools/testing/selftests/net/rpl_srh_loop.sh
> @@ -0,0 +1,38 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +source lib.sh
> +
> +cleanup()
> +{
> +	cleanup_ns "$NS"
> +}
> +
> +trap cleanup EXIT
> +
> +require_command ip
> +setup_ns NS || exit $?
> +
> +ip -n "$NS" -6 address add 2001:db8:1::1/128 dev lo nodad
> +ip -n "$NS" -6 address add 2001:db8:3::1/128 dev lo nodad

[Severity: Medium]
Should these two address adds be checked?  The script has no set -e, no
|| exit and no check_err on them, and everything the test asserts depends
on both addresses being present.

If either add fails, does the rest of the script still notice?  The
support probe below uses a single segment:

  ip -n "$NS" -6 route add 2001:db8:10::/64 \
	encap rpl segs 2001:db8:4::1 dev lo 2>/dev/null

and in ipv6_chk_rpl_srh_loop() (net/ipv6/addrconf.c) a single iteration
can never reach the failure branch, because found starts at 0:

	if (hash_found) {
		if (found && separated) {
			ret = 1;
			break;
		}

		separated = false;
		found++;
	} else {
		separated = true;
	}

So the probe returns 0 whether or not any local address was installed.

> +
> +if ! ip -n "$NS" -6 route add 2001:db8:10::/64 \
> +	encap rpl segs 2001:db8:4::1 dev lo 2>/dev/null; then
> +	echo "SKIP: RPL lightweight tunnel support not available"
> +	exit $ksft_skip
> +fi
> +
> +RET=0
> +ip -n "$NS" -6 route add 2001:db8:11::/64 \
> +	encap rpl segs 2001:db8:1::1,2001:db8:3::1 dev lo
> +check_err $? "Adjacent local addresses were rejected"
> +log_test "RPL accepts adjacent local addresses"

[Severity: Medium]
Can this subtest pass without exercising the path it describes?  If
2001:db8:1::1 and 2001:db8:3::1 were never installed, both iterations of
ipv6_chk_rpl_srh_loop() take the else branch (separated = true), ret stays
0, the route add succeeds and check_err 0 reports OK.

The same OK result is produced in both the "addresses present" and
"addresses absent" cases, so is there a way for this subtest to
distinguish them?

> +
> +RET=0
> +ip -n "$NS" -6 route add 2001:db8:12::/64 \
> +	encap rpl segs 2001:db8:1::1,2001:db8:2::1,2001:db8:3::1 dev lo \
> +	2>/dev/null
> +check_fail $? "Separated local addresses were accepted"
> +log_test "RPL rejects separated local addresses"

[Severity: Medium]
Does this turn a setup problem into a reported kernel failure?  With no
local addresses installed, none of the three segments hash-match, ret
stays 0 in ipv6_chk_rpl_srh_loop(), the route add succeeds, and then:

  check_fail 0
    -> check_err $((!0))
      -> ret_set_ksft_status $ksft_fail "Separated local addresses were accepted"

log_test folds that into EXIT_STATUS and the script exits 1, so a
namespace where the address adds did not take effect is reported as a
failing kernel test rather than a skip or a setup error.

Since stderr of this route add is discarded with 2>/dev/null and the
address adds are unchecked, is there anything printed that would point at
the real cause?  A partial failure, where only one of the two addresses is
installed, gives the same inverted result.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260911-sympwn-rpl-send-v1-0-1753993bb584%40gmail.com
