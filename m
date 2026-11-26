Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710375;
	b=evE0HfQq8QTsOzG18j85m9oX/e95qv8WY/695DF0WgRVu+9STkiBoGYIbNSzDC43kEFe
	 8aVfYVLEeJcdndkr0QMLFwZ2H2ypBkeLBH+a48B49n3jCsJr8ylIfwZ7KY3VrvW4TzJqi
	 zkWJncdtmp39VRyCH4o27Io0wLvgSMopzstFmF0yRv8BrQMIPO+4JA5/cuTRGLXPT2sVH
	 OgMZsqhpbvmYf3rZFV6ItPp4VVAsbz6LYKEpVxceglStEG6Mdh+HWD4VAya79KOcCV2YV
	 s2Sg25xjsWRP9dBqpqHSLW5nVXMm3gCs/O8gBUKDRTljcG4rHRmHxM7+1tqljtfSD2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710375;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TbxJ3LbvU8Nhy28uNO/Ztu+jASIooU9yLHxeJDHUje0=;
	b=475a79s0ofnPw3fX1unyc8Qd+PKLYmsicvzF1YNbi2LLpv73S4aZfeqBzy54z1wjhdK9
	 1/+Yj8Fjc/oH95769XpFcE/G7slUz0V3uIEElq0jbB9a9yFP348tpdawBeem8I0bMqf6o
	 I8HimKwnu3+OLcONlv4wsK/u7+bpoPiHqeR9sZjv7ppK4YJ5yF+JqAP8TCvQlHfS0LhG4
	 O6PwiUyr8lqoN3jM4AeSkpy/xnnKC875qj+grZXqgK8rvhYyf7sN4hrztLx02464uaQyl
	 koLtQ/rFCqjOmGrtdQ/jM54iFOCchPenjpwW7ink0DS3mkvTx8yF4qWe81AUDnfEchQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=poKfav3i;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD871606A31E;
	Thu, 26 Nov 2026 16:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD871606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=poKfav3i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TbxJ3LbvU8Nhy28uNO/Ztu+jASIooU9yLHxeJDHUje0=;
  b=poKfav3iC0rNecOR63YPzrbAaWLqYqiPL59gtzwe3JwsFn6LSHI8MK4L
   vOiVEhbg5/oXjAhhf9ON/RNQSzp65DWlU3T25Hn913X5pu/WsFyhHICD/
   RKLBjvUGrp3RGi+Fuj0l8OCFGnpxsAtIJCM1LzdCDcGPEy7tlGWlzUOO5
   8=;
X-CSE-ConnectionGUID: /PIaF0J+SPWSQru3Asdtgw==
X-CSE-MsgGUID: yOLGbBo2RKKP0Mldw/0rKw==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=yifei.sun@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,235,1787004000"; 
   d="scan'208";a="163990378"
Received: from datamove-nixosbtw.imag.fr (HELO framework.tail650e82.ts.net) ([129.88.52.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 17:25:58 +0100
From: Yifei Sun <yifei.sun@inria.fr>
To: netdev@vger.kernel.org
Cc: Yifei Sun <yifei.sun@inria.fr>,
	idosch@nvidia.com,
	dsahern@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	razor@blackwall.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 1/2] ipv4: keep scanning the leaf when a nexthop object is unusable
Date: Thu, 26 Nov 2026 17:25:37 +0100
Message-ID: <20261126162538.2509994-1-yifei.sun@inria.fr>
X-Mailer: git-send-email 2.56.1
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

  # ip nexthop add id 12 via 172.16.1.2 dev veth1
  # ip route add 10.0.0.0/24 nhid 12
  # ip route add 10.0.0.0/16 via 172.16.2.2 dev veth3
  # ip route get fibmatch 10.0.0.1 oif veth3
  RTNETLINK answers: No route to host

When the /24's nexthop object has no path on veth3, fib_table_lookup()
backtracks past the /16 in the same leaf. A socket bound to veth3 then
ARPs for the destination instead of the gateway. Fix this by trying the
next alias in the same leaf. The lookup already does this when no
inline nexthop is usable.

Fixes: af7888ad9edb ("ipv4: Refactor nhc evaluation in fib_table_lookup")
Signed-off-by: Yifei Sun <yifei.sun@inria.fr>
---
Encountered this while work on a unrelated IPv4 SADR patch (not sure if
this is even needed...)

In QEMU with lockdep on 5e2976e52671, the selftest and device-bound
ping and UDP failed before the fix and passed after it.

v2: Reworded.
v1: https://lore.kernel.org/netdev/20261121182031.36626-1-yifei.sun@inria.fr/

 net/ipv4/fib_trie.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/ipv4/fib_trie.c b/net/ipv4/fib_trie.c
index 394df1de1281..2a670e9b0417 100644
--- a/net/ipv4/fib_trie.c
+++ b/net/ipv4/fib_trie.c
@@ -1591,7 +1591,7 @@ int fib_table_lookup(struct fib_table *tb, const struct flowi4 *flp,
 						     &nhsel);
 			if (nhc)
 				goto set_result;
-			goto miss;
+			continue;
 		}
 
 		for (nhsel = 0; nhsel < fib_info_num_path(fi); nhsel++) {
@@ -1622,7 +1622,6 @@ int fib_table_lookup(struct fib_table *tb, const struct flowi4 *flp,
 			return err;
 		}
 	}
-miss:
 #ifdef CONFIG_IP_FIB_TRIE_STATS
 	this_cpu_inc(stats->semantic_match_miss);
 #endif

base-commit: ae8e5ef9fa9eeaf4ee0a9a9bde0fc63023d9b154
-- 
2.56.1

