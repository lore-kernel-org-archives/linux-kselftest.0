Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F784503EB;
	Mon, 21 Sep 2026 20:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023457; cv=none; b=BygQmGDi/L7qICNW53DNcmfsi39OIJDbG8iH6JogWcn40Yx2vSjieutwUzvZy3dZIjtsLLfwgDIb2v2cP4pV7NwNwXpA2hv903KgmVdI2N9nxc4nsaGTXihjsTiTKigl4LL3E4340OJ+RAbo5WMn2z6atjGtWpS2h85HkK0h57g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023457; c=relaxed/simple;
	bh=HEo+Lcv75KIs4rA/NDwUKYr9VPacFbG3F8xAMXmGR9M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cLoLQlupRTRgGCG0TowRr2MKCsT/Fz7NOe5yYjKkMeGVZdQ/bptL3/5/Br2UTKZkJV9Y/YrXkRcpqQe5/K5nEKTEiUIdCwYtJlaRaCXdGIMAvPBQADghlR6IPzhxVmr93bfIOEGJ27LZvt8yXZIvjh/ew0tYg0t1ha+5FGsAsYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=IQfRiSxB; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="IQfRiSxB"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id D70912067A;
	Mon, 21 Sep 2026 22:44:11 +0200 (CEST)
X-Virus-Scanned: by secunet
X-Amavis-Alert: BAD HEADER SECTION, Improper use of control character (char 0D
 hex): Subject: ...exact mark/mask match for control-plane [...]
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WX-B62JvpzLq; Mon, 21 Sep 2026 22:44:11 +0200 (CEST)
Received: from EXCH-02.secunet.de (rl2.secunet.de [10.32.0.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id F2469201CC;
	Mon, 21 Sep 2026 22:44:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com F2469201CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1790023451;
	bh=Lgo7aP4gB1qvCNznUU83/hkY0FDuJeUCL/p6FBp+QuE=;
	h=From:To:CC:Subject:Date:From;
	b=IQfRiSxBdnyJyn27OINdld9BsWVSfDrSBNuspMNYiMtznmaP9DU4eFTaKxVVYRo58
	 uLJd2g1SIwbScNPASzD1CtQTCOhC4oh2QsJKoDV8pXElY0K90OuOUgL6sra9lHVnZo
	 aPwuXGYkFXEtb6h4nIZJuBsxy0nvtBE8mIHvkxfHTpV0IOHHh/GXM1e5BSIdOrKYVr
	 LqVkIk1ICpl8enmFsP7dIDkgpONhmG47Sgb24xk1Ix8u7QoIodSix7a5aJfxbzup7z
	 3F59osW3Lk8GLSyT/t/AAt+5dIQOUmwzbrg92Z9Po9WEp7EEqDNZaxMhVd1m6PGNMl
	 Yh+xLHcvb3bqQ==
Received: from moon.secunet.de (172.18.149.1) by EXCH-02.secunet.de
 (10.32.0.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 21 Sep
 2026 22:44:09 +0200
From: Antony Antony <antony.antony@secunet.com>
To: Antony Antony <antony.antony@secunet.com>, Steffen Klassert
	<steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Jamal Hadi Salim
	<hadi@cyberus.ca>, Shuah Khan <shuah@kernel.org>
CC: Sabrina Dubroca <sd@queasysnail.net>, <netdev@vger.kernel.org>, Yan Yan
	<evitayan@google.com>, Tobias Brunner <tobias@strongswan.org>, Florian
 Westphal <fw@strlen.de>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH ipsec v3 0/6] xfrm: state: exact mark/mask match for control-plane SA lookups
Date: Mon, 21 Sep 2026 22:43:59 +0200
Message-ID: <migrate-state-fixes-v3-0-836125bb53dd@secunet.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: migrate-state-fixes-063ee0342611
X-Mailer: b4 0.16-dev
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EXCH-04.secunet.de (10.32.0.184) To EXCH-02.secunet.de
 (10.32.0.172)

While looking into a XFRM_MSG_MIGRATE_STATE issue reported by Sashiko,
we found the underlying problem generalizes: xfrm allows multiple SAs
to coexist for the same (SPI, daddr, proto) differing only in mark,
and every netlink method that resolves "which SA" - xfrm get_sa(),
del_sa(), update, get_ae, new_ae, expire, migrate - uses the same
wildcard mark match the data path needs. A broader-mask SA can
silently shadow a more specific one:

  # ip xfrm state add ... spi 0x1000 mark 1 mask 1 (SA_target)
  # ip xfrm state add ... spi 0x1000 mark 0 mask 0
    (SA_decoy, catch-all, added after -> bucket head)
  # ip xfrm state delete dst ... proto esp spi 0x1000 mark 1 mask 1
    -> deletes SA_decoy; SA_target survives, untouched

xfrm policy had the same bug, fixed in commit 4f47e8ab6ab7
("xfrm: policy: match with both mark and mask on user interfaces").

Netlink lookups use an exact mark/mask match except for UPDSA; the
wildcard match stays for the data path and state_add only.
This series applies that fix across every affected method,
not just XFRM_MSG_MIGRATE_STATE.

This series is not fixing likely isusses PF_KEY. As it
is no more receiving non critical fixes.

---
v2->v3: mark match use only values and no mask in exact lookup, fix typo

- Link to v2: https://lore.kernel.org/all/migrate-state-fixes-v2-0-c3e2767f0d96@secunet.com/
v1->v2: few more wildcard mark check reported by sashiko and Yan
      - keep wildcard match in xfrm_state_update() (UPDSA)

- Link to v1: https://patch.msgid.link/migrate-state-fixes-v0-8-a69e8637ba3b@secunet.com

---
Antony Antony (6):
      xfrm: state: exact mark/mask match for SPI-keyed control-plane SA lookups
      xfrm: fix use-after-free of migrated state in xfrm_do_migrate_state()
      xfrm: fix hw offload state leak on xfrm_do_migrate_state() error path
      xfrm: include mark in MIGRATE_STATE SA collision check
      xfrm: pass extack through to xfrm_init_replay() from xfrm_init_state()
      docs: xfrm: include mark in XFRM_MSG_MIGRATE_STATE EEXIST tuple

 .../networking/xfrm/xfrm_migrate_state.rst         | 23 +++--
 include/net/xfrm.h                                 |  7 ++
 net/xfrm/xfrm_state.c                              | 98 ++++++++++++++++++----
 net/xfrm/xfrm_user.c                               | 51 ++++++-----
 4 files changed, 134 insertions(+), 45 deletions(-)
---
base-commit: c9151088f1674fd29ff26a20f5fc687acf53a2f0
change-id: migrate-state-fixes-063ee0342611

Best regards,
--  
Antony Antony <antony.antony@secunet.com>

