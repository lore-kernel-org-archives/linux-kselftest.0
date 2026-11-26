Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660274;
	b=Hv11HKWohMDAzW0ArEOlz39mNIJSun7H4ZRNqeMzl0BjPq4u9Kka7XXTkI017JU35Bt8
	 rOUVyeZjbT4Rm4PSN5/1ZZUg4IRe2r2jXt3o+PMbkmvWwwJ1P8qnMFtF0sOHRoTzmyR9n
	 TJrRaitwGaNIJPl9dDjqoXwczXYdrsmchjzaCdxCrL19v6O43inMtnG/vGhhA3WGvX0Ro
	 hg2rERHHmFaRoO6tX4TnkUpasrawWMv5WLoauXsHaIfhrEE75IHMv+Vf+yGHZ2lP1RUs6
	 NjN1ScUMOyKqsjveHH5MDrlJE/qMx9PYm0bpEEckVz2XWSzcFFTKGpn5sEkrQ1c1ODA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660274;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=PlLPJEnikDumUId5OPUoeA0R2LExnIMK5NTAdtsyIQs=;
	b=T9KrEQ5PUJF+xFDT3Kq6ilRKxneTxM675EQmnPKE1qEkiYIl4JW/jPDcB/NhZVNu9ZbO
	 TLGm3pjeof/yqRRUFA7JJRHRsPkCz2GlVCMuUvievrTR1AuFgE9SiNqy9kWqIc2uZiKGp
	 AIuKKXn0FHaKqSveUlRCcNGMrUSP4O7a505Y3LueAT54ukpMmsYhke35GmU3v1EHft3/i
	 dGCT5Y9+AhJi9r36fq23W89Q8+XJ4h4GyjFh8wBhM1nda8Zff+3/ktRXzZOepLKsRGf18
	 GocS07F/9RnSJvpTtK5DWa1iA4KWfrIkCx5D/YgUkBJneb57mLeZiFiHG7PWiNZrukw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="k/KZ99we";
	arc=none smtp.remote-ip=91.218.175.42
Received: from mta0.migadu.com (out-42.mta0.migadu.com [91.218.175.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4069D60A260C
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 02:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4069D60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k/KZ99we
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=InHibhT9bQrLYoZnMNQjZvZLY7yEnp1XSGdpTAyLP2I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795660271; v=1; x=1796265071;
 b=k/KZ99weVIBdY/KZE8pk4QE85uoZxFZ1DojPCT4IKGvXVWGdUx4aOMU98f+itvb3cyjY0t5s
 k+aoCiSQggTAjFcsQy33DJvFlRsIRrxa/Rf4tTMt6dx1MCwPmDf5+ak/KON9YlNb0OYH4nqjYpf
 c3NDbyqBYAtSrpguiwleRrt8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 2ca089d9032a043c;
	Thu, 26 Nov 2026 02:31:10 +0000
X-Mizu-Trace-ID: 2ca089d9032a043c
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 26 Nov 2026 10:30:55 +0800
Subject: [PATCH net 1/3] Revert "bonding: do not set usable_slaves for
 broadcast mode"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-bond_broadcast_updelay-v1-1-188e5538d6ca@kylinos.cn>
References: <20261126-bond_broadcast_updelay-v1-0-188e5538d6ca@kylinos.cn>
In-Reply-To: <20261126-bond_broadcast_updelay-v1-0-188e5538d6ca@kylinos.cn>
To: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Tonghao Zhang <tonghao@bamaicloud.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: "jiangjiehua (A)" <jiangjiehua1@huawei.com>, 
 Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

This reverts commit 45fc134bcfadde456639c1b1e206e6918d69a553.

Commit 45fc134bcfad ("bonding: do not set usable_slaves for broadcast mode")
assumes the bond updelay always applies. However, per commit f8a65ab2f3ff
("bonding: fix link recovery in mode 2 when updelay is nonzero") and
section 13.1 paragraph 4 of the bonding documentation, when a slave is
enslaved and there are no active slaves, the slave should become usable
immediately once its link comes up, updelay should be ignored.

Before this revert: with no active interfaces, the only slave still waited
out the 1000 ms updelay before being brought into use.

  [  154.846629] bond0: (slave veth0): link status definitely down, disabling slave
  [  154.849879] bond0: now running without any active interface!
  [  159.544736] bond0: (slave veth0): link status up, enabling it in 1000 ms
  [  160.586299] bond0: (slave veth0): link status definitely up, 10000 Mbps full duplex
  [  160.603278] bond0: active interface up!

After this revert: the first slave can be used immediately on link up.
Subsequent slave veth2 still honor the 1000 ms updelay.

  [   94.106425] bond0: (slave veth0): link status definitely down, disabling slave
  [   94.109130] bond0: now running without any active interface!
  [   98.272494] bond0: (slave veth0): link status up, enabling it in 0 ms
  [   98.273279] bond0: (slave veth0): link status definitely up, 10000 Mbps full duplex
  [   98.275056] bond0: active interface up!
  [  110.855705] bond0: (slave veth2): Enslaving as an active interface with an up link
  [  111.904688] bond0: (slave veth2): link status definitely up, 10000 Mbps full duplex
  [  114.608488] bond0: (slave veth2): link status definitely down, disabling slave
  [  117.624491] bond0: (slave veth2): link status up, enabling it in 1000 ms
  [  118.664636] bond0: (slave veth2): link status definitely up, 10000 Mbps full duplex

The stale-empty side of the problem that motivated 45fc134bcfad is
addressed by the follow-up patch in this series, "bonding: update
slave array on link change for broadcast mode", which rebuilds the
array on link transitions, together they keep ignore_updelay correct
in both directions.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 drivers/net/bonding/bond_main.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 042d7c75548f..d6675e87d06b 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -5140,18 +5140,13 @@ static void bond_set_slave_arr(struct bonding *bond,
 {
 	struct bond_up_slave *usable, *all;
 
-	all = rtnl_dereference(bond->all_slaves);
-	rcu_assign_pointer(bond->all_slaves, all_slaves);
-	kfree_rcu(all, rcu);
-
-	if (BOND_MODE(bond) == BOND_MODE_BROADCAST) {
-		kfree_rcu(usable_slaves, rcu);
-		return;
-	}
-
 	usable = rtnl_dereference(bond->usable_slaves);
 	rcu_assign_pointer(bond->usable_slaves, usable_slaves);
 	kfree_rcu(usable, rcu);
+
+	all = rtnl_dereference(bond->all_slaves);
+	rcu_assign_pointer(bond->all_slaves, all_slaves);
+	kfree_rcu(all, rcu);
 }
 
 static void bond_reset_slave_arr(struct bonding *bond)

-- 
2.56.0

