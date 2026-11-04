Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.1.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802040;
	b=UADeOpiXaThHIlJTzI8nsWdaZMRnkbleZJdnPzCAjyic3x3JhGIw2Xj8yzxWOjakw+6/
	 OqKL8AmLrXKYeG0IhUaaPUYyGsBfzQ8mz0LS2jS66Jje0dQFvRCMr0UVIoJgNYqBSpMt2
	 sZ3VsPiDlBzfkK0/BhrDNtTnm2rvcE/n8d3L7692w4wa/o/QjzPk7IN9QHKKtveWFsJ4n
	 Dc76ginw7bTeEa+OrVk5q9wrGbB4k+3M37xNYfABg9rLha2YNOhyUjE3kPxdIztWL1yn8
	 zsni8n8HuateyYsCZP2e9wsmTk1eAAzChAWnbBjA7N8hUTiNKMju7PHbHfGCevQY9TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802040;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ZWkMkEz34qfqdG6bxgl7Nwtc60Bl3MSLZzaFL0LwxII=;
	b=WrRbMUoFgckB2iTIPiNUp+BPQe2k63xaVTutbPWF72bxM1SWpfc89JQ8CnaNubS9k1o3
	 KXCgPyDjznq2sk1x28i7brN3YD84vXbwQwdJUUN6rHa37GblkubmN0qAir1DjfhFtZhZG
	 94yp3K24+ak6epS8yArz/11VOe8rSGNXSFCQLf73JdrH1+ulzPBNRe0lpjQzyx6pQhiOW
	 HR7iOQh0LYWcIheZ/RGRiejNQptD40BjYkI7T+Yx5FjdVPr9eHyVJgriNHeKUJUIV1neW
	 hZSK/IOXxDPsXDUzFs9Vn6UXKACqMvJQIWvQOuAEy6Wm5inwc9qhfA9Z2WMoWFOMf8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=foWrZ8nl;
	arc=none smtp.remote-ip=44.246.1.125
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FA3606A31B;
	Wed,  4 Nov 2026 14:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2FA3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=foWrZ8nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1793802039; x=1825338039;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZWkMkEz34qfqdG6bxgl7Nwtc60Bl3MSLZzaFL0LwxII=;
  b=foWrZ8nl0al5BlrZOU2HmJIFpBblsCuL8SgqMKQCxZ5JkvkHPoFz8b/U
   OzzksiH9t9x91zflIAhh4/Pnd3DKleJFCbMX9N1VUKe9PvmQqHiPPaCQz
   oUrlNHzne07euO0TxzHvpgF182/P71ZjtQzFyzddFRS8Zh/F9ULwVL0Zr
   mpcxBr5O47AAKUx9Yh16xRHO+mJ94+NS0n0/CFZ5iddL2L/iMbAz+qbvb
   9vjr2iRAl1Ot9BiVmyKn70LHAfLNKiAx46/LEcuk4Z2Lq+i/lUZFPK7fJ
   eFDvVzPQNjEX5NbhQi338Bf0iim8cp04yM6fChRJxYOYUSqo0osMSEWFQ
   w==;
X-CSE-ConnectionGUID: OWBh+DL4RfSg7m1EbTIh9g==
X-CSE-MsgGUID: FZk83n8lTBOQRpczBs4aqg==
X-IronPort-AV: E=Sophos;i="6.27,195,1787011200"; 
   d="scan'208";a="33088013"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 14:20:37 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:16873]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.22.238:2525] with esmtp (Farcaster)
 id e36fee1b-2d14-4142-9d4f-578e8f0777f8; Wed, 4 Nov 2026 14:20:37 +0000 (UTC)
X-Farcaster-Flow-ID: e36fee1b-2d14-4142-9d4f-578e8f0777f8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 4 Nov 2026 14:20:36 +0000
Received: from dev-dsk-doebel-1a-7b355d76.us-east-1.amazon.com (10.169.119.5)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 4 Nov 2026 14:20:35 +0000
From: Bjoern Doebel <doebel@amazon.de>
To: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
	<shuah@kernel.org>
CC: Hangbin Liu <liuhangbin@gmail.com>, Liang Li <liali@redhat.com>,
	<netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Bjoern Doebel <doebel@amazon.de>
Subject: [PATCH net] selftests: bonding: feed link monitor to deflake prio_test
Date: Wed, 4 Nov 2026 14:20:18 +0000
Message-ID: <20261104142018.552135-1-doebel@amazon.de>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

With the bond idle between test steps, the arp/ns link monitor can
declare a healthy slave down (~300ms without RX/TX). If this hits a
failover step, the bond picks a different active slave than expected,
and primary_reselect=failure/better never reverts it:

  TEST: prio (active-backup ns_ip6_target primary_reselect 2) [FAIL]
      Current active slave is eth0 but not eth2

Reproducible when running tests under load (2-4 / 100 runs).

Fix by pinging a non-existent neighbor for the duration of the test to
keep traffic coming. 100 runs under the same load with the patch
applied: 0 failures.

Fixes: 42a8d4aaea84 ("selftests: bonding: add bonding prio option test")
Signed-off-by: Bjoern Doebel <doebel@amazon.de>
---
 .../selftests/drivers/net/bonding/bond_options.sh   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/bonding/bond_options.sh b/tools/testing/selftests/drivers/net/bonding/bond_options.sh
index 187b478d0ddf2..f599a2a8ef156 100755
--- a/tools/testing/selftests/drivers/net/bonding/bond_options.sh
+++ b/tools/testing/selftests/drivers/net/bonding/bond_options.sh
@@ -74,6 +74,16 @@ prio_test()
 
 	# create bond
 	bond_reset "${param}"
+
+	# Keep the arp/ns link monitor fed for the duration of the test:
+	# ping a non-existent neighbor, which generates steady broadcast
+	# ARP requests sourced from the bond's own address. These egress on
+	# the active slave and are flooded onto the backup slaves' links,
+	# where they validate as RX activity. Without traffic, idle slaves
+	# are declared down by the monitor between test steps and the
+	# failover checks below race with the monitor.
+	ip netns exec ${s_ns} ping -i 0.1 -W 1 192.0.2.99 &> /dev/null &
+	local ping_pid=$!
 	# set active_slave to primary eth1 specifically
 	ip -n ${s_ns} link set bond0 type bond active_slave eth1
 
@@ -157,6 +167,9 @@ prio_test()
 		check_active_slave "eth0"
 		bond_check_connection "change slave prio"
 	fi
+
+	kill $ping_pid 2>/dev/null
+	wait $ping_pid 2>/dev/null
 }
 
 prio_miimon()

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.50.1

