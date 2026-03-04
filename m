Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC0E3537FB
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 11:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624319; cv=none; b=sQeLe51DPkdyaC8wuLfIBg5kNf8+5+X6ZQGReM9HaYBiUQvnutV95SyZBy2fa9j9qdLR+rC9+qr/DwQR9STaS8vVffe3w23K7W54tb/kN93NAbaz/+h0BeYo6MvL28Z7srcACrtEJHg6GV9PHJx+p3/SfEW7pH7rc6FDUToUVVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624319; c=relaxed/simple;
	bh=AB+Jg90G24Pdqj7NqOc+YfuU/oyLVcby75ANquMxx+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7vhH3NfUPSxVHG7uis5P46gMLNYIhBqVk3jTJAWZI6KZv/pam50Ev/tUTkZtdDiES/nzyLGVaR9cHNrUJ/scL3ML+6bwwkzZ/HqrD0WFkJU4ZEq1mxyw+rRyAEF+BAzKnIvoHOu0rCH8cxwtMJbjjI5OQiUpxdDk4BHIyZGQ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N+du+Ixo; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N+du+Ixo"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772624315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OAipDTQmbkNskaP08ReNQMxD+aDuMbpRguSE+JWOYdY=;
	b=N+du+IxozO7ti+hQp/5K+dJP+P1n6cXZoi5g0DzBbc9OHJaloZLV9g92+2pGGVEVA+mOiK
	SCV23BxzKwt1YBufpAu7QVWziW4MVHSbgoKTxRCBOWJIoLYHeCtkEZfgB6UC8cUU6REtsl
	XSNHAJtk2dkPMmY+RLBgO0lPoqyvXo0=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: jiayuan.chen@linux.dev,
	jiayuan.chen@shopee.com,
	syzbot+334190e097a98a1b81bb@syzkaller.appspotmail.com,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v4 1/2] net: ipv6: fix panic when IPv4 route references loopback IPv6 nexthop
Date: Wed,  4 Mar 2026 19:38:13 +0800
Message-ID: <20260304113817.294966-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260304113817.294966-1-jiayuan.chen@linux.dev>
References: <20260304113817.294966-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Jiayuan Chen <jiayuan.chen@shopee.com>

When a standalone IPv6 nexthop object is created with a loopback device
(e.g., "ip -6 nexthop add id 100 dev lo"), fib6_nh_init() misclassifies
it as a reject route. This is because nexthop objects have no destination
prefix (fc_dst=::), causing fib6_is_reject() to match any loopback
nexthop. The reject path skips fib_nh_common_init(), leaving
nhc_pcpu_rth_output unallocated. If an IPv4 route later references this
nexthop, __mkroute_output() dereferences NULL nhc_pcpu_rth_output and
panics.

Simplify the check in fib6_nh_init() to only match explicit reject
routes (RTF_REJECT) instead of using fib6_is_reject(). The loopback
promotion heuristic in fib6_is_reject() is handled separately by
ip6_route_info_create_nh(). After this change, the three cases behave
as follows:

1. Explicit reject route ("ip -6 route add unreachable 2001:db8::/64"):
   RTF_REJECT is set, enters reject path, skips fib_nh_common_init().
   No behavior change.

2. Implicit loopback reject route ("ip -6 route add 2001:db8::/32 dev lo"):
   RTF_REJECT is not set, takes normal path, fib_nh_common_init() is
   called. ip6_route_info_create_nh() still promotes it to reject
   afterward. nhc_pcpu_rth_output is allocated but unused, which is
   harmless.

3. Standalone nexthop object ("ip -6 nexthop add id 100 dev lo"):
   RTF_REJECT is not set, takes normal path, fib_nh_common_init() is
   called. nhc_pcpu_rth_output is properly allocated, fixing the crash
   when IPv4 routes reference this nexthop.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Fixes: 493ced1ac47c ("ipv4: Allow routes to use nexthop objects")
Reported-by: syzbot+334190e097a98a1b81bb@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/698f8482.a70a0220.2c38d7.00ca.GAE@google.com/T/
Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
---
 net/ipv6/route.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index c0350d97307e..08b4a324987e 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -3582,7 +3582,6 @@ int fib6_nh_init(struct net *net, struct fib6_nh *fib6_nh,
 	netdevice_tracker *dev_tracker = &fib6_nh->fib_nh_dev_tracker;
 	struct net_device *dev = NULL;
 	struct inet6_dev *idev = NULL;
-	int addr_type;
 	int err;
 
 	fib6_nh->fib_nh_family = AF_INET6;
@@ -3624,11 +3623,10 @@ int fib6_nh_init(struct net *net, struct fib6_nh *fib6_nh,
 
 	fib6_nh->fib_nh_weight = 1;
 
-	/* We cannot add true routes via loopback here,
-	 * they would result in kernel looping; promote them to reject routes
+	/* Reset the nexthop device to the loopback device in case of reject
+	 * routes.
 	 */
-	addr_type = ipv6_addr_type(&cfg->fc_dst);
-	if (fib6_is_reject(cfg->fc_flags, dev, addr_type)) {
+	if (cfg->fc_flags & RTF_REJECT) {
 		/* hold loopback dev/idev if we haven't done so. */
 		if (dev != net->loopback_dev) {
 			if (dev) {
-- 
2.43.0

