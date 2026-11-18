Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010985;
	b=F6r8UjtSUqrCn0E4Hw1ahA3hrHqDWSKjT9ekzUmQ0ytEcVb83HpPmE1yV8aLMKUyEs0h
	 IwcSdZDSWm1+kv3EZCiWGNuJmyeYoMFZWSO2Hw3/0U4BNBZQZzQ6sw9kes8GBjrhj585L
	 5Ki3GOZFSdCM9xjcVF/f2e04dsFIFs4zQ5+lv6hTg7xFYxmmHusKDrVD61v6Mda/4FFQz
	 WXY0NCHWXkcHBfThhAaA+a05Ejw9TxOLv4IF+Sa+ctifRhIRQtILx/nymzi+X1YaWjOuT
	 L8P2nRjfC+Fw3rLta3kTJMu61q8SwudXE8ySLb1dpn7qBhTOtd8SYviR7trGw6NBEUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
	b=ISi5udQ+NMQi567+LuiqI7G46jN/aDSY16flL8GXBFptWHFZ76QCaSNsrwD34H4J8Qcu
	 jkvTF6rVch1a+Ghv7OcHcYMAieZVw9z7cPmVQ3GJrZ7OSXa7yWHc0XGGegDfonA1qRq9T
	 7W0LFLSTThRboK0dTwKsxqY6BluKlPrBnV39v6856yfaEZoPivqp3OpEmi96mIMgFrRQs
	 dzXReeA/UnURARppaXTQ2Gb4WkFLYbipDFGHIeprn2E8J1DWsMbbAexLeD0SCVNdWy9OT
	 Y2lElg1wTnT0zGBTNad5zeFDCab/WumjYHOOWhW6XYsgkkzDmQ8xztXJbfYg0Ew1cZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFFEWmQg;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A97606A338
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 14:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98A97606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFFEWmQg
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-86288992de5so689828a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 06:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795010982; x=1795615782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
        b=sFFEWmQg7vNncfij1+tYVntU7ZjPo939n/lJjHpag/VXJRS5tBG7d8b4tAJJp08jTb
         sh8dYBYB2qEXxquBGgNARaSIrh4qDIYt//KoeIZd9rtWBc0jRPG04n4ZJ82nZ3ysHvgO
         /t7EWdSPRYUU2mz28gcHoXIPwVq+1ZEGj/fwH3Ke7aVeIVj9Gw/x33Ng/pVigk83WoaZ
         JWioVHcEds7pr6A3hGszhC2qrbRMO8tCCODs2vo+5jrBKDK7gEh7c77N0CqDkoI7gBXQ
         97hc53aWENm4x/9aZJwCjTIum5+1CxLPJVi/Qg3H80lg5AQWtLhrOjL6dwILGkHjDiVK
         tsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010982; x=1795615782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
        b=J1p2AyMimzvU+ajOkl5u5RwPNrq8oYMeP1D8O8k8D1ZHkf590voFFe2B67u5OqWXX7
         cHNPDT0AACCGa9sH+c/wcdffNjj370w4P+GbG6Q4BYMpCcI3Vo6nrVF6YJQCBlT8j4lw
         bpWOOJuRXZs0pyeVM9VWxfyt7SobBgUbxJY4F2Np6AzXmgr7bp8kJhJ87QrOmgcGxPOL
         jROhVdP4u7wzOMt5E+RKC0KjOMBZuSb0GBVOUAiRkRZS79ByTkA3NOamBGnvtB5nO//N
         XL0+g60Pma/Dv4UmEJ6Xvoyl/0pvd4yJgWLmG+vBusLynosiIQOjs6KOkMVxujOtqBPs
         0P9g==
X-Forwarded-Encrypted: i=1; AL+hErG232jpvys7z8GYm+tQXxwAE0WaEbS1VF6gZoYnF1m3Qe51H8DFvPFfOLvvtU3mwVT401OwkNTGUbro3cxbTGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r8NPiFMS0XgOOVDY9YvFAY163EF9HlT1V/j/4UL3rT8Kukvzr
	YGckJjMjgN1pgIhgZa4JVEG4atyms+mwexmRVW7yVkLIg5O/GrCTjV5Q
X-Gm-Gg: AYBFou30siYWi4vBCkgjSEHo+bchWdsV2UwbNG0UBrkAFsxkmtm8AszRjmFiCLTZhDz
	Yzd4HMJfeKrPzulxsa39eVfv5xU/eOW8A0OSK8m7Zj3GR2MxBCWjLMkrEKgZujx77eLvbYKm3/I
	SiMxjymRgr81cq3LVzn1Y5Cg3zgGGRgQsxzMrtJVHresoMOUn5Xr6AWUjxHa8F1zWuHOfQ7A0aD
	1WxXjaJatkGB1XxQd45G43kjLDinbIKBYeG5jtF4GFW/kACRa6rCbMwprioQbSGmwEmzjUyPhZB
	PW3mFn9RCbB4XWiNISeaRpDlr1IvkzyqktCDDLb8Q/iP13IMlMDKoszi5+KreL3z04Er/oFbq/y
	2NCcsAUww/tlfbV0sJQ+3u+iajOUYBMtsYuIAGyUzJJGAAV0mRFQVE3rPizDgYOI4JEDfcYC12I
	eaoQe2WuVKDtupO3PU32iYPZKSE9hyFz0W7m41qAhn2UZ2mj++nxRse04Pqjf1pkDtxku5PthbJ
	VYdhAi13GgZL6tYmUqYPI4JigLN+hT5x059Zb90Mz4MpifKhZrc1ZII+g2OM1Fqb0df1Z2kO+gK
	RdM4Dc6h7q4ghOaWrX857VimTcMpPGBlaXThf9Ooj7PcNsQW
X-Received: by 2002:a05:6830:b13:b0:862:a6c5:8f12 with SMTP id 46e09a7af769-862ddc4b53amr4063814a34.11.1795010982542;
        Wed, 18 Nov 2026 06:09:42 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:41::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f0239a3fsm2126877a34.20.2026.11.18.06.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:09:42 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 18 Nov 2026 06:08:04 -0800
Subject: [PATCH net-next v5 2/6] psp: support tx rekey operation
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
Message-Id: <20261118-psp-v5-2-b9ec840e0296@gmail.com>
References: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
In-Reply-To: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Daniel Zahka <daniel.zahka@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

The tx rekey operation creates a new psp_assoc with the same rx state,
but with new tx state. The new association is spliced into the socket
with RCU to be used immediately in the tx path.

Drivers that use on-device tx key storage need additional logic to delay
key deletion until after any in-flight users of the key have been
drained, so return -EOPNOTSUPP for now.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v3:
- move the replaced assoc to psd->stale_assocs, so a rotation
  racing with its free doesn't count the socket twice in stale-events
- document that the previous rx SPI also stops being accepted once
  its device key is rotated out
- drop the claim that the peer accepts both the old and new SPI
  after a tx rekey
- document tx rekey in the tx-assoc op doc in psp.yaml

v2:
- place new assoc on pas->assocs list instead of psd->active assocs
  list
- reject tx rekey on SADB devices until deferred tx key deletion
  lands
---
 Documentation/netlink/specs/psp.yaml |  4 ++-
 Documentation/networking/psp.rst     |  5 +++-
 net/psp/psp_sock.c                   | 57 ++++++++++++++++++++++++++++++++----
 3 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
index d5713f5d1af7..f6af1a510d17 100644
--- a/Documentation/netlink/specs/psp.yaml
+++ b/Documentation/netlink/specs/psp.yaml
@@ -283,7 +283,9 @@ operations:
         post: psp-device-unlock
     -
       name: tx-assoc
-      doc: Add a PSP Tx association.
+      doc: |
+        Add a PSP Tx association.
+        If the socket already has a Tx association, rekey its Tx direction.
       attribute-set: assoc
       do:
         request:
diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
index fab797506b0a..43f222b38d3d 100644
--- a/Documentation/networking/psp.rst
+++ b/Documentation/networking/psp.rst
@@ -145,7 +145,8 @@ Rekeying
 
 A connection which has completed the exchange described above and is
 in the "PSP Full" state can be rekeyed in place without being torn
-down, using the same netlink calls as in connection setup.
+down. The Tx and Rx directions are rekeyed separately using the same
+netlink calls as in connection setup.
 
 ``rx-assoc`` allocates a new Rx key and SPI, which should be passed
 to the peer exactly as during the initial exchange. The SPI which was
@@ -154,6 +155,8 @@ next Rx rekey, or until the device key it was derived from has been
 rotated out, so packets the peer sent before it learned the new SPI
 are still received.
 
+``tx-assoc`` installs a new Tx key, which takes effect immediately.
+
 A rekey is rejected with ``-EINVAL`` if it would change the PSP device
 or the PSP version of the association. It is rejected with ``-EBUSY``
 if the socket has not completed its initial exchange in both
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index c1e38845f08c..d497f41c483e 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -280,6 +280,53 @@ psp_sock_set_tx_key(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
 	return err;
 }
 
+static int
+psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
+		  struct psp_key_parsed *key, struct netlink_ext_ack *extack)
+{
+	struct psp_assoc *new;
+	int err;
+
+	if (psp_dev_has_sadb(psd)) {
+		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
+		return -EOPNOTSUPP;
+	}
+	if (!pas->peer_tx) {
+		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
+		return -EBUSY;
+	}
+
+	new = kzalloc_flex(*new, drv_data, psd->caps->assoc_drv_spc,
+			   GFP_KERNEL_ACCOUNT);
+	if (!new)
+		return -ENOMEM;
+
+	new->psd             = pas->psd;
+	new->dev_id          = pas->dev_id;
+	new->generation      = pas->generation;
+	new->version         = pas->version;
+	new->peer_tx         = 1;
+	new->prev_spi        = pas->prev_spi;
+	new->prev_generation = pas->prev_generation;
+	refcount_set(&new->refcnt, 1);
+	memcpy(&new->rx, &pas->rx, sizeof(new->rx));
+
+	err = psp_assoc_set_tx(psd, new, key, extack);
+	if (err) {
+		kfree(new);
+		return err;
+	}
+
+	psp_dev_get(new->psd);
+	list_add(&new->assocs_list, &pas->assocs_list);
+	list_move(&pas->assocs_list, &psd->stale_assocs);
+
+	rcu_assign_pointer(sk->psp_assoc, new);
+	psp_assoc_put(pas);
+
+	return 0;
+}
+
 int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 			  u32 version, struct psp_key_parsed *key,
 			  struct netlink_ext_ack *extack)
@@ -312,13 +359,11 @@ int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 		err = -EINVAL;
 		goto exit_unlock;
 	}
-	if (pas->tx.spi) {
-		NL_SET_ERR_MSG(extack, "Tx key already set");
-		err = -EBUSY;
-		goto exit_unlock;
-	}
+	if (pas->tx.spi)
+		err = psp_sock_tx_rekey(sk, psd, pas, key, extack);
+	else
+		err = psp_sock_set_tx_key(sk, psd, pas, key, extack);
 
-	err = psp_sock_set_tx_key(sk, psd, pas, key, extack);
 exit_unlock:
 	release_sock(sk);
 	return err;

-- 
2.52.1

