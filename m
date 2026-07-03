Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4F4233939;
	Fri,  3 Jul 2026 17:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098571; cv=none; b=VQ0nMRZVbdK1R0AU/AOoTex8woeTGGhcw5GcXdwNxtgtkJp8RLbL/bBvh9Nlt15jNMI/NvKYPWAQpmtEAkwoo3UFgXFcs6eqewKFRo/oLpt/zYw/GUoV/cwMRjweRv4HUVptVCWNxuNEy+7HTJni1bvC8U6rkccuCMBNJYZPk68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098571; c=relaxed/simple;
	bh=Tx3uRpemsitIxjfP5pQUSxiDpjnD442Pkjg/xS/Hyb0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tvk7gUksedpTJNdIrVEpGl5i5PkT+FKLc6/d462L0qrgNMFUpLwrCRvaKCDwzIaVeKC/PaTmbNnhxgNJoQolDILus0t/eiLiif4VDAbwDRsnEmnrhaatK4l9wPTT7jhV8PijDOGhGmWS62T0fbOyXYmbSd4+ndjVVT+8hx4DWMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=Hh9gBKB1; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="Hh9gBKB1"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id C1F8C20758;
	Fri,  3 Jul 2026 19:09:28 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DTdLDSgXdy9q; Fri,  3 Jul 2026 19:09:28 +0200 (CEST)
Received: from EXCH-02.secunet.de (rl2.secunet.de [10.32.0.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 296BB20612;
	Fri,  3 Jul 2026 19:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 296BB20612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1783098568;
	bh=d1mKac98hSvJt1X++COIe0eebE6Eji+lJ/iqhJWOsV0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=Hh9gBKB1l7BZOmQ/9w5+qK1fNRx5zuQBdlWcSM4GXbEEP+I5u7fjqu7nl+gAs7cga
	 qvi8JZhT5f7FBnjMLl8ZMoFyNzbqrdlB7K+VubbEJyzNyZw3SppjZhstJndEST7Wse
	 26vOMqgwZzwHMRDC+koIvWZ/7vaUJIzD0S0+Co/L3HNZ/AmHYQgETVRZNKcefSlb6z
	 tDe5A/MFWnObCDFzT/SjuJmMSvCTL6adCifXDtnowinR3N0ZTTHvcKW4/1dUWos2jz
	 FAEYQ4BpafbVOzLA/mgsADHJSVKKMY0du2M/MLHaKyUMMEN2rwDiC64hEiAqboJQML
	 Ej7yqlNHD8gBA==
Received: from moon.secunet.de (172.18.149.1) by EXCH-02.secunet.de
 (10.32.0.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 3 Jul
 2026 19:09:27 +0200
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
Subject: [PATCH ipsec 8/8] docs: xfrm: include mark in XFRM_MSG_MIGRATE_STATE EEXIST tuple
Date: Fri, 3 Jul 2026 19:09:16 +0200
Message-ID: <migrate-state-fixes-v0-8-a69e8637ba3b@secunet.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <migrate-state-fixes-v0-0-a69e8637ba3b@secunet.com>
References: <migrate-state-fixes-v0-0-a69e8637ba3b@secunet.com>
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
 Documentation/networking/xfrm/xfrm_migrate_state.rst | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/networking/xfrm/xfrm_migrate_state.rst b/Documentation/networking/xfrm/xfrm_migrate_state.rst
index 9d53cb22b007..905e3f0c4ee0 100644
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
@@ -259,8 +262,9 @@ Attributes in the notification
 Error Handling
 ==============
 
-If the target SA tuple (new daddr, SPI, proto, new family) is already
-occupied, the operation returns ``-EEXIST`` before the migration begins.
+If the target SA tuple (new daddr, SPI, proto, new family, mark) is
+already occupied, the operation returns ``-EEXIST`` before the migration
+begins.
 The old SA remains intact and the operation is safe to retry after
 resolving the conflict.
 

-- 
2.47.3

