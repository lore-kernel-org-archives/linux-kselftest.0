Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E853A426684
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 15:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218417; cv=none; b=fl+Qw44zVIoi0bHt1PnhUlX/n7SuNJV0jmhPmxeC+Tbzj5FHMLnR4Ygmg9IotfxJuZFki7acNDiqAp8f7LDURtBuvDvNubECDPaUal0BKZnFNyk7KejvuAn56YLKbfqgLkfZIidEqXVvY3jYBotSdBHtSeKR2xyBZvqylc2fcto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218417; c=relaxed/simple;
	bh=dUNNNkgwiKs0jJ3gqltiLi3w3ZESyBFOHecX2yXYAvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZO3YJ8KGKyQ1daoZTBKjRutn5Yz8V7EGSGgapa2OwZLkNy3Zb4XJvioA2uW0lMnKGeEwVqWsvlc4jSeoT0WdC9Q50yRWhqnmMpZKnqzVmDpmuKeA+tbW3mkONxWIDnMhg0KezN+ePaP1SzfAr4oUdkZevN/p6VbRqFM6yXVwhJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dm9oZ6NW; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dm9oZ6NW"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-649e456e7a8so401004d50.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 07:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770218416; x=1770823216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXQzycVLoUHsvmViNXRoUwIsMbZHmx/4dfU4u4ceWho=;
        b=Dm9oZ6NWXV6avRJpS8iAefZlsrT5NdaEN0ZDwZfsa3U4wABIEUfYK7LvhRsUNxE5Eg
         WWz865/68d97mVY7oMxwPdGI8+i5izjY3UCIQZTDVmBf70oscqeYJnE+H2x38MMDq7QW
         d22i8RpenYqSYWv5nHXmDzHykpGoTmDJ9zH9+c5K61YDWv70xIlFgjrWLDFsPRsNbZen
         pD9Pl++mrpOyYkysdFxNe3BAY506U49/ZwnVZ41kVPUcMGkcj2SdO5ZLkAEP0/LS606e
         h7AQ3P2wcgV8agQmSaNUQEikIjFxMhd2VK5kGbyjSnEHm7BXg1+ahvm4DobnNCTUAa84
         LMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770218416; x=1770823216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IXQzycVLoUHsvmViNXRoUwIsMbZHmx/4dfU4u4ceWho=;
        b=vxcDxxpgewlDmWod5qYEIwAhj+FIZOZ8/kncH1pTFGdzxKfQCpsVhTAJXuO+FFJ600
         aJ3uyRpIBGQN+5c0dSQenlBtxvASrJaFtungEbeOoDaeVlsu4WLJ5eS1JekIY0dULfRK
         Evs/9qtxHmqgem/38/Zpd5cp+vCFMa+gkV8VWu9YMU5nXYatlp0reBJ23RXKi0pBGds3
         JEChT8+aow66weCSTYHnwN0mJCQeJ+qB7ofKTrfG9nQCWGUrXTkoRg1pviw7tzZKKGW6
         0B8u9hiI7SH18BHYSVKE8D7GcIO2egVx1QT33u+3gdk9Ghxdp8vT6/XpgVdWV+QfJI0r
         IeMA==
X-Forwarded-Encrypted: i=1; AJvYcCUOUO41+bpCBYYMobwWSxp7aZ/i4UlKvv71twzpvPQCDPuMMYQS+xZDTmNJdgQedAT7GIBWLAuIvOcBMCzvANU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZgz6vB6SWW0TlDlib5yllaKf+vvUM2NkibWmUgBpT0o3y4im0
	yRPNZuWIel/sLe035lkMb6BnymAv0AiX6d6z1hv5RUGruLirbsFY84tr
X-Gm-Gg: AZuq6aIB1oHBwDbP1keDtsNYitNMDDthidWPp72oz5qhBHcKWJFB5YYbnWPqO2fbIG6
	G8/eaVPqcjneB2l2xrXCw3dfNvYJXI909kwBwKH7TCbiOjs3dDIwfAY9TT0faeRY9r2InFslw4E
	J3vJwf809sZgmDXG9Pdj3GHWlSDGY/d3KuUNNtOL7xfwRX4pjlX8Gm7mGz0OeSK7muJQYnbGeG0
	omHeuam5/wtMwV2YeirrGYx/Tqq5uKURGUV2lF8MTRtVI87lU4Qgi06OqLJcJNWQ+OeKDz38g7G
	GJD7sv8E+yZoGka8/gGZ+MWo6I9szoUQ7+nYV1HERsJVlcOmmvhIcWWKXljXaCTb/jO0RqZEw8E
	srAgzSqOlVRC4Xa4V3j/K3CkMjnL1B/t1YrDJ+9nu5UpBb348BhdbbPAoKs5JeLcGsQ3Cc+SrVz
	qI4kHuCiY=
X-Received: by 2002:a05:690e:424a:b0:649:da44:78b2 with SMTP id 956f58d0204a3-649db4c4ecdmr1915176d50.90.1770218415725;
        Wed, 04 Feb 2026 07:20:15 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:b::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649dc5e0b65sm2592932d50.21.2026.02.04.07.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:20:14 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 04 Feb 2026 07:20:10 -0800
Subject: [PATCH net-next 6/9] psp: add core tracked stats for deferred key
 deletion
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-psp-v1-6-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
In-Reply-To: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>, Boris Pismenny <borisp@nvidia.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

It is useful to keep track of two stats related to deferred key
deletion:

- tx_key_cnt: the number of outstanding tx keys from the hw's
  perspective
- grace_periods: the number of grace periods that core has retired for
  this dev.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 Documentation/netlink/specs/psp.yaml | 14 ++++++++++++++
 include/net/psp/types.h              |  4 ++++
 include/uapi/linux/psp.h             |  2 ++
 net/psp/psp_main.c                   |  1 +
 net/psp/psp_nl.c                     |  3 +++
 net/psp/psp_sock.c                   |  9 ++++++++-
 6 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
index f3a57782d2cf..efaf3f61e37a 100644
--- a/Documentation/netlink/specs/psp.yaml
+++ b/Documentation/netlink/specs/psp.yaml
@@ -153,6 +153,18 @@ attribute-sets:
         doc: |
           Number of PSP packets for transmission with errors.
           Device statistic (from the PSP spec).
+      -
+        name: tx-key-cnt
+        type: sint
+        doc: |
+          Current number of TX keys installed on the device.
+          Kernel statistic.
+      -
+        name: grace-periods
+        type: uint
+        doc: |
+          Number of TX key deletion grace periods completed.
+          Kernel statistic.
 
 operations:
   list:
@@ -267,6 +279,8 @@ operations:
             - dev-id
             - key-rotations
             - stale-events
+            - tx-key-cnt
+            - grace-periods
         pre: psp-device-get-locked
         post: psp-device-unlock
       dump:
diff --git a/include/net/psp/types.h b/include/net/psp/types.h
index 280c7fdc713c..d790efd9d4bc 100644
--- a/include/net/psp/types.h
+++ b/include/net/psp/types.h
@@ -67,6 +67,8 @@ struct psp_dev_config {
  * @stats:	statistics maintained by the core
  * @stats.rotations:	See stats attr key-rotations
  * @stats.stales:	See stats attr stale-events
+ * @stats.tx_key_cnt:	See stats attr tx-key-cnt
+ * @stats.grace_periods:	See stats attr grace-periods
  *
  * @rcu:	RCU head for freeing the structure
  */
@@ -98,6 +100,8 @@ struct psp_dev {
 	struct {
 		unsigned long rotations;
 		unsigned long stales;
+		long tx_key_cnt;
+		unsigned long grace_periods;
 	} stats;
 
 	struct rcu_head rcu;
diff --git a/include/uapi/linux/psp.h b/include/uapi/linux/psp.h
index a3a336488dc3..208ab60e2c88 100644
--- a/include/uapi/linux/psp.h
+++ b/include/uapi/linux/psp.h
@@ -58,6 +58,8 @@ enum {
 	PSP_A_STATS_TX_PACKETS,
 	PSP_A_STATS_TX_BYTES,
 	PSP_A_STATS_TX_ERROR,
+	PSP_A_STATS_TX_KEY_CNT,
+	PSP_A_STATS_GRACE_PERIODS,
 
 	__PSP_A_STATS_MAX,
 	PSP_A_STATS_MAX = (__PSP_A_STATS_MAX - 1)
diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
index 2fb886edc384..4a7b2ffa718e 100644
--- a/net/psp/psp_main.c
+++ b/net/psp/psp_main.c
@@ -215,6 +215,7 @@ static void psp_tx_del_work_fn(struct work_struct *work)
 		}
 
 		psd->tx_grace_active = false;
+		psd->stats.grace_periods++;
 	}
 
 start_grace:
diff --git a/net/psp/psp_nl.c b/net/psp/psp_nl.c
index a540a1e77694..f0006d2e85c8 100644
--- a/net/psp/psp_nl.c
+++ b/net/psp/psp_nl.c
@@ -526,6 +526,9 @@ psp_nl_stats_fill(struct psp_dev *psd, struct sk_buff *rsp,
 	    nla_put_uint(rsp, PSP_A_STATS_KEY_ROTATIONS,
 			 psd->stats.rotations) ||
 	    nla_put_uint(rsp, PSP_A_STATS_STALE_EVENTS, psd->stats.stales) ||
+	    nla_put_sint(rsp, PSP_A_STATS_TX_KEY_CNT, psd->stats.tx_key_cnt) ||
+	    nla_put_uint(rsp, PSP_A_STATS_GRACE_PERIODS,
+			 psd->stats.grace_periods) ||
 	    nla_put_uint(rsp, PSP_A_STATS_RX_PACKETS, stats.rx_packets) ||
 	    nla_put_uint(rsp, PSP_A_STATS_RX_BYTES, stats.rx_bytes) ||
 	    nla_put_uint(rsp, PSP_A_STATS_RX_AUTH_FAIL, stats.rx_auth_fail) ||
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index d038da122ebb..bf6d089657b6 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -80,12 +80,19 @@ static struct psp_assoc *psp_assoc_dummy(struct psp_assoc *pas)
 static int psp_dev_tx_key_add(struct psp_dev *psd, struct psp_assoc *pas,
 			      struct netlink_ext_ack *extack)
 {
-	return psd->ops->tx_key_add(psd, pas, extack);
+	int rc;
+
+	rc = psd->ops->tx_key_add(psd, pas, extack);
+	if (!rc)
+		psd->stats.tx_key_cnt++;
+
+	return rc;
 }
 
 void psp_dev_tx_key_del(struct psp_dev *psd, struct psp_assoc *pas)
 {
 	psd->ops->tx_key_del(psd, pas);
+	psd->stats.tx_key_cnt--;
 }
 
 static bool psp_dev_needs_defer(struct psp_dev *psd)

-- 
2.47.3

