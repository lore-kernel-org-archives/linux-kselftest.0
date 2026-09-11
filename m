Received: from mta0.migadu.com (out-52.mta0.migadu.com [91.218.175.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23C71A9F83
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 03:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097531; cv=none; b=UUU99TACqoPRvsBqKycy1a9aE3U5jlMjppu/rH2cx4U8cgMUBP/yC56JbpCN62b9ZBa6iKZkFXG/cEjVoIDMhVg5PeK3at4jC/oomPC9SBZuCaF9aP+kVZEHx+lbF7oq+7XoYdAJrynxAO+md9bxdQ0cn5h6nWSJRTaKxgKN2ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097531; c=relaxed/simple;
	bh=DR0+fgEQrwNl6R1crdAoG7L+5iDGJklBvZ41CTFEp/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fc1n6E5YF7SxzG1yxNLPmKTUpyevcJNsAncCxoiUlwktgGRtQNMVnncE36M7tMdCR23AreaPC24QxEDe19qQdvCDYww1l/5TzF9uKHakx8yWQCeDRPXVmEOJTHFVsobKYonrG6gYMjaX2OFz0dmObWgWifkZLC1hTxD3xSBh46I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qoA1uG67; arc=none smtp.client-ip=91.218.175.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qoA1uG67"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DR0+fgEQrwNl6R1crdAoG7L+5iDGJklBvZ41CTFEp/M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789097525; v=1; x=1789702325;
 b=qoA1uG67tuH2V/YUydQlxDCPR9zjIj3a/LGNlNDgWWXwUQZT7fixtigFYebPcSgJs4GwCTw+
 DvA4lUBbhigolD5OUj5/QZ32t342GpUUJYCSYT6nimdlhbzaWhqa/fhqxYv5yxtWojSrg583ATb
 hZRDAZyONUTYEWnzDUxgcyBc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 03ed5f65af5ab86f;
	Fri, 11 Sep 2026 03:32:05 +0000
X-Mizu-Trace-ID: 03ed5f65af5ab86f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 11 Sep 2026 11:31:55 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next v2] selftests: net: move log_test to lib file
 and remove duplicate code
Message-ID: <aqN2K7rAm-S6QI86@fedora>
References: <20260831-self_log_test-v2-1-eda2e8490cf9@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-self_log_test-v2-1-eda2e8490cf9@kylinos.cn>

On Mon, Aug 31, 2026 at 05:21:28PM +0800, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> Many test scripts under tools/testing/selftests/net/ each define their own
> log_test() function with near-identical logic for comparing a return
> code against an expected value and printing OK/FAIL. Add a shared
> log_test_expected() to lib.sh and replace each local definition with a
> thin wrapper that delegates to it.
> 
> The function is named log_test_expected() rather than log_test() because
> lib.sh already exports log_test() with a different signature used by
> the forwarding tests.
> 
> Two tests required special handling:
> 
> - icmp_redirect.sh passed a fourth "xfail" argument to log_test(). The
>   underlying issue has been fixed and the argument is always absent now,
>   so it is simply dropped.
> 
> - fib_nexthops.sh checked for ksft_skip (exit code 4) inside log_test(),
>   but no test in the file produces that code. The check is removed,
>   callers that need to report a skip should use log_test_skip() instead.
>   Two callers compared against exit code 2 are left as-is since code 2
>   correctly counts as a failure in the previous log_test().
> 
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
> Changes in v2:
> - Remove skip/xfail checking in lib.sh, as any command can exits with 2 or 4 (sashiko)
> - Remove nskip counter in fib_nexthops.sh
> - Link to v1: https://lore.kernel.org/r/20260813-self_log_test-v1-1-f88b1107842e@kylinos.cn
> ---
>  tools/testing/selftests/net/drop_monitor_tests.sh  | 13 +------
>  tools/testing/selftests/net/fcnal-test.sh          | 29 +-------------
>  tools/testing/selftests/net/fdb_flush.sh           | 35 +----------------
>  tools/testing/selftests/net/fib-onlink-tests.sh    | 18 +--------
>  .../selftests/net/fib_nexthop_multiprefix.sh       | 21 +----------
>  tools/testing/selftests/net/fib_nexthop_nongw.sh   | 21 +----------
>  tools/testing/selftests/net/fib_nexthops.sh        | 44 ++--------------------
>  tools/testing/selftests/net/fib_rule_tests.sh      | 19 +---------
>  tools/testing/selftests/net/fib_tests.sh           | 26 +------------
>  tools/testing/selftests/net/gre_gso.sh             | 26 +------------
>  tools/testing/selftests/net/icmp_redirect.sh       | 28 ++------------
>  tools/testing/selftests/net/l2tp.sh                | 19 +---------
>  tools/testing/selftests/net/lib.sh                 | 31 +++++++++++++++
>  .../selftests/net/ndisc_unsolicited_na_test.sh     | 26 +------------
>  .../selftests/net/srv6_encap_lookup_l3vpn_test.sh  | 19 +---------
>  .../selftests/net/srv6_end_dt46_l3vpn_test.sh      | 19 +---------
>  .../selftests/net/srv6_end_dt4_l3vpn_test.sh       | 19 +---------
>  .../selftests/net/srv6_end_dt6_l3vpn_test.sh       | 19 +---------
>  .../selftests/net/srv6_end_dx4_netfilter_test.sh   | 23 ++---------
>  .../selftests/net/srv6_end_dx6_netfilter_test.sh   | 23 ++---------
>  .../testing/selftests/net/srv6_end_flavors_test.sh | 23 ++---------
>  .../selftests/net/srv6_end_next_csid_l3vpn_test.sh | 19 +---------
>  .../net/srv6_end_x_next_csid_l3vpn_test.sh         | 19 +---------
>  .../selftests/net/srv6_hencap_red_l3vpn_test.sh    | 19 +---------
>  .../selftests/net/srv6_hl2encap_red_l2vpn_test.sh  | 19 +---------
>  .../selftests/net/test_bridge_backup_port.sh       | 32 +---------------
>  .../selftests/net/test_bridge_neigh_suppress.sh    | 33 +---------------
>  tools/testing/selftests/net/test_vxlan_mdb.sh      | 32 +---------------
>  .../selftests/net/test_vxlan_nolocalbypass.sh      | 32 +---------------
>  .../selftests/net/test_vxlan_vnifiltering.sh       | 26 +------------
>  tools/testing/selftests/net/vrf-xfrm-tests.sh      | 19 +---------
>  tools/testing/selftests/net/vrf_route_leaking.sh   | 19 +---------
>  .../testing/selftests/net/vrf_strict_mode_test.sh  | 19 +---------
>  33 files changed, 73 insertions(+), 716 deletions(-)

Hi everyone,

This patch is a bit too long for review, and maybe cause conflicts for
stable backports. I plan to split it into small frags. But there are 2
ways to split it.

1. Split based on the test name. e.g. srv6 part, fib part, test_* part, and
   others.
2. Split based on the changes. e.g. group the tests that using exactly same
   log_test functions into one patch.

Does anyone has any suggestion?

Thanks
Hangbin
