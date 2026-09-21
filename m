Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180CC466B03;
	Mon, 21 Sep 2026 20:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023720; cv=none; b=sA7dDY58ZI7+352oAsq/EwZMlQz5qIF1dr/xcXGBby7IXf+2VsH6EFYx8/zi8bB86FpoAuo1eVS8XozQ7P6LQKfVlDsJwu1oRyBPMjOIeLLYwqKYWEO5wIrTQ6mJqvSd3DOmBLiCpiZykQS4UI5hqhmnxUfEvxXbxy0jlMR+Xho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023720; c=relaxed/simple;
	bh=SZ68U2pHvzoh4mgAqvi/cFtzsqDHGsxht2QZlrU72uQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T0id2VlxCmUddrHVxyqqJfR0rDCgJ6XvTDoaV7zbdfJS392abVkmfNCq2PqsIqm+7SrB8pykkq3VErR0kwG4dCqJERTE2VR+DBxjj1isWn1ORvEXelkVFkzi6xZLys+Kn70BCmZBTfdcRGvVGZ6NtJuc7Tm2DHowwc/4xp1jCm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=HYCuVBhW; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="HYCuVBhW"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 878CA2067A;
	Mon, 21 Sep 2026 22:48:37 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENvY-GB-Eb6v; Mon, 21 Sep 2026 22:48:37 +0200 (CEST)
Received: from EXCH-02.secunet.de (rl2.secunet.de [10.32.0.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id E9AB2201CC;
	Mon, 21 Sep 2026 22:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com E9AB2201CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1790023716;
	bh=yiSVaxv6xbbcHUAJ59C228Y1I2uaZGNKrSxi/aFqWFI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=HYCuVBhWrhACm66GDYLe+GtKtKNfZof9JHJLIfyKUdabv8LU8UH8CKgRvlAcmLFgD
	 Q8hDyhogoWnyMYqIHTRY9hJbjjdxVlvxI+ZpdZFWShgUnniqPNid6Z71tr89bX/Uif
	 ECVrMMsPA3cc9orZuVfGgnHEyHxf3Smxr6ux/xap5dRdUV9R77Z9qc4ur0AgEx9zl1
	 +GvpC0EIwPNVrS+UiV8bPTUNKlP/xcAf6ATQHl2d3nHo9f4Pm0/zXw9gwCyNfm8fyv
	 Hwp/JyEivkHeKHgFg9hGVADruO0bBwTTufAbsZYX89Nu60NMKYdE76o2ipdfZ51EUt
	 Q7V2G3QkGo4Qw==
Received: from moon.secunet.de (172.18.149.1) by EXCH-02.secunet.de
 (10.32.0.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 21 Sep
 2026 22:48:36 +0200
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
	<linux-doc@vger.kernel.org>
Subject: [PATCH ipsec v3 6/6] docs: xfrm: include mark in XFRM_MSG_MIGRATE_STATE EEXIST tuple
Date: Mon, 21 Sep 2026 22:48:27 +0200
Message-ID: <migrate-state-fixes-v3-6-836125bb53dd@secunet.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <migrate-state-fixes-v3-0-836125bb53dd@secunet.com>
References: <migrate-state-fixes-v3-0-836125bb53dd@secunet.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16-dev
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EXCH-01.secunet.de (10.32.0.171) To EXCH-02.secunet.de
 (10.32.0.172)

Document mark as part of the EEXIST tuple and update the SA lookup
description to match.

Fixes: c13c0cc6f52e ("xfrm: add documentation for XFRM_MSG_MIGRATE_STATE")
Signed-off-by: Antony Antony <antony.antony@secunet.com>
---
 .../networking/xfrm/xfrm_migrate_state.rst         | 23 ++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/Documentation/networking/xfrm/xfrm_migrate_state.rst b/Documentation/networking/xfrm/xfrm_migrate_state.rst
index 9d53cb22b007..0412a3c0ecf7 100644
--- a/Documentation/networking/xfrm/xfrm_migrate_state.rst
+++ b/Documentation/networking/xfrm/xfrm_migrate_state.rst
@@ -27,15 +27,18 @@ SA Identification
 =================
 
 The struct is defined in ``include/uapi/linux/xfrm.h``. The SA is looked
-up using ``xfrm_state_lookup()`` with ``id.spi``,
-``id.daddr``, ``id.proto``, ``id.family``, and
-``old_mark.v & old_mark.m`` as the mark key::
+up using ``xfrm_state_lookup_exact()`` with ``id.spi``, ``id.daddr``,
+``id.proto``, ``id.family``, and an exact match against ``old_mark.v``
+and ``old_mark.m``. Unlike the data path, which uses a masked
+comparison, this requires the SA's mark and mask to equal ``old_mark``
+exactly, so a broad-mask SA is never matched when a more specific one
+was intended. If no such SA exists, ``-ESRCH`` is returned.::
 
     struct xfrm_user_migrate_state {
         struct xfrm_usersa_id  id;       /* spi, daddr, proto, family */
         xfrm_address_t         new_daddr;
         xfrm_address_t         new_saddr;
-        struct xfrm_mark       old_mark; /* SA lookup: key = v & m */
+        struct xfrm_mark       old_mark; /* SA lookup key (exact v/m match) */
         struct xfrm_selector   new_sel;  /* new selector (see Flags) */
         __u32                  new_reqid;
         __u32                  flags;    /* XFRM_MIGRATE_STATE_* */
@@ -72,8 +75,8 @@ inherits the value from the existing SA (omit-to-inherit).
      - Description
    * - ``XFRMA_MARK``
      - Mark on the migrated SA (``struct xfrm_mark``). Absent inherits
-       ``old_mark``. To use no mark on the new SA, send ``XFRMA_MARK``
-       with ``{0, 0}``.
+       the mark of the existing SA. To use no mark on the new SA, send
+       ``XFRMA_MARK`` with ``{0, 0}``.
    * - ``XFRMA_ENCAP``
      - UDP encapsulation template; only ``UDP_ENCAP_ESPINUDP`` is supported.
        Set ``encap_type=0`` to remove encap.
@@ -259,8 +262,12 @@ Attributes in the notification
 Error Handling
 ==============
 
-If the target SA tuple (new daddr, SPI, proto, new family) is already
-occupied, the operation returns ``-EEXIST`` before the migration begins.
+If the target SA tuple (new daddr, SPI, proto, new family, mark) is
+already occupied, the operation returns ``-EEXIST`` before the migration
+begins. "Occupied" includes wildcard shadowing: an existing SA with a
+broader mask (e.g. mark 0/0) claims every mark value, so it blocks
+migrating to any more specific mark at the same tuple, not just an
+exact mark/mask duplicate.
 The old SA remains intact and the operation is safe to retry after
 resolving the conflict.
 

-- 
2.47.3

