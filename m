Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285272;
	b=HRPw1ShpAdcnHcip+QeEFicbRy8MboRPv62AaoLa76PfpNy8iKKgYtYkvf3MWb43echl
	 qm5PjhtvbstSgPnHXIKhF9HvQx9qTxgjURfKL1q909oozFI8CEg5otIuSjDlk3+La8SmS
	 PELs0a+/xZEo/CbcsJ3Po6i9I/VI+W8t4TYvo24srMkDpECuZtqjLM0Tcx4xx3+e6ZLmc
	 2J9JYmZB6N7nhlcDoyNO60WmFXkJzl2Lny1U47P9DqUXFmQ9Z3v4+gkxCZ3ofkVUg6KwA
	 CNDDsQkY31gVlj8YqERcpMtKLDK0NpjRSusJIhrbeyjwtSZl8SifG7G67PqBG64vKRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285272;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BiTHRKW3n1NEjNfmnAFRnK5r5gKkPivxMejwt+0oWMk=;
	b=QB2ylhCd1NIkZXpuLkzJ05wckdscjkznqaQuGF06+uSAx9QmYJlf7sZL4gqslJwTfhfH
	 gnbT0wiW7rJL+uOnqQp1QdFU302oH+UFRsGcx6Vx7/DddDg+5EwXjUleW8rUshK/1/HBm
	 uo8vnVpJXMH8J6TbUorVdxydRhGEcVflPsKBL6MwRG7WNB6tgyCsTnpndJeUL8mLLVQAn
	 DG4XV3CPjawVJ4cWQZSHSLrnPdP9W/kzWIfY3vUhVFasFdqQc3SJRbCNbfXPsXMOI9aUt
	 5bmNxKFs5RVSyvRkC2lZeudBy0Ixgw48CPFGP+a6c3JAeBO/pKGO/pWFxf3N9DwbzZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b="HSPYYjR/";
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32B0606A320;
	Sat, 21 Nov 2026 18:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32B0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=HSPYYjR/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BiTHRKW3n1NEjNfmnAFRnK5r5gKkPivxMejwt+0oWMk=;
  b=HSPYYjR/Zr29tCwa2+h9g0/n5xh3obrl7x1wprN/glMjEUC5DySZRYVX
   h+KB43PxIMO+BHb5sjYGUpJQ9369GZmDzzEgIAJit+dek0Obn019u7U0q
   zXFF/O1PifgfgSw0olbbkz216sXWXOa4yvhXbipvRcnWWYYWSPRicPIgB
   c=;
X-CSE-ConnectionGUID: COjrWgzxS2qBVH8SBH+IoA==
X-CSE-MsgGUID: 9+G7ILc6Tze+/79Je3eaeg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=yifei.sun@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,225,1787004000"; 
   d="scan'208";a="306681183"
Received: from 193.186.140.88.rev.sfr.net (HELO macbook.tail650e82.ts.net) ([88.140.186.193])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 19:21:02 +0100
From: Yifei Sun <yifei.sun@inria.fr>
To: netdev@vger.kernel.org
Cc: Yifei Sun <yifei.sun@inria.fr>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 1/2] ipv4: keep scanning the leaf when a nexthop object is unusable
Date: Sat, 21 Nov 2026 19:20:16 +0100
Message-ID: <20261121182031.36626-1-yifei.sun@inria.fr>
X-Mailer: git-send-email 2.56.0
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

With veth1 on 172.16.1.0/24 and veth3 on 172.16.2.0/24:

```console
$ ip nexthop add id 12 via 172.16.1.2 dev veth1
$ ip route add 10.0.0.0/24 nhid 12
$ ip route add 10.0.0.0/16 via 172.16.2.2 dev veth3
$ ip route get fibmatch 10.0.0.1 oif veth3
RTNETLINK answers: No route to host
```

When the /24's nexthop object has no path on veth3, fib_table_lookup()
backtracks past the /16 in the same leaf. A socket bound to veth3 then
ARPs for the destination instead of the gateway. Try the next alias,
as for inline nexthops.

Encountered this while work on a unrelated IPv4 SADR patch (not sure if
this is even needed...)

In QEMU with lockdep on 5e2976e52671, the selftest and device-bound
ping and UDP failed before the fix and passed after it.

Fixes: af7888ad9edb ("ipv4: Refactor nhc evaluation in fib_table_lookup")
Signed-off-by: Yifei Sun <yifei.sun@inria.fr>
---
 net/ipv4/fib_trie.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/ipv4/fib_trie.c b/net/ipv4/fib_trie.c
index 394df1de1281..2a670e9b0417 100644
--- a/net/ipv4/fib_trie.c
+++ b/net/ipv4/fib_trie.c
@@ -1591,7 +1591,7 @@ out_reject:
 						     &nhsel);
 			if (nhc)
 				goto set_result;
-			goto miss;
+			continue;
 		}
 
 		for (nhsel = 0; nhsel < fib_info_num_path(fi); nhsel++) {
@@ -1622,7 +1622,6 @@ set_result:
 			return err;
 		}
 	}
-miss:
 #ifdef CONFIG_IP_FIB_TRIE_STATS
 	this_cpu_inc(stats->semantic_match_miss);
 #endif

base-commit: d5b89d55a322b632e2b465b392a4c1d9d338db9c
