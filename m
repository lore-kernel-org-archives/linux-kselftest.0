Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F96A395AD1
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 01:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785808099; cv=none; b=Ii1HeZygVRUpb1y+V7YeeNOk3glDd5nBbbNQWPO1JJRBWywLhc+kXVW0PgTXyAggaRjQ+s9AYJ3Y0xrbRtOxvZdkv5TDLM0suNyQhmSaMNtFnByEIKo2TkJu6PmtSsfNhrxcmu7cxcMupFryEO8YAWXkHFKFV1LrjHKop6MGH70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785808099; c=relaxed/simple;
	bh=uoRqyxiUw9LCurSdEf9hIm/MOgPeemDa9zCCwG7QUiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kO6GK6EmfjHtzttbTqDwZLe+N8sHSoCPmPvGhI+SzKIPMeZEuiwWSS3u2ybV3aXnhzvaV7JgmmK4WDIYMQaIRRi+9d18bZVblLJPkajVu5X3cLRSsTLGNSyUhfCfNGop5N/boM2ForgDCKAMCeVZExwdR/Y4mxGjoUbU/pI3Ke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4crGZx1; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4crGZx1"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso2224530a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 18:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785808097; x=1786412897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUtJiaQMigx86+BTH4O364XnmOj7lYQYaBG+rEXNuhM=;
        b=D4crGZx1muWeCgSFPBkDeVZYFB+XQO3WdPl7YbtJI8ydDA6MFM7i36drhbYg7eITNn
         GCP8Btf4eFVn6Pfi7B02Zdg5g7BctUZcE3xrRaFilscFcT204DNfsH7ktgSTIjTyO/Eu
         LE8WdO1p7CD16M8K/cohwXdoquUAu5tri6OJycTO+bNeY1OY39afMAHHnJnA35sYx0T5
         rRQq7NhT3f8eiNElDzSl1mQ4XiUQDIj1yEvJcTJGETvIU/q3xRE0osLDPOwJhMP6/O0Q
         cblDLO/5hMPpTLXywtWdLIopDwIA4K3hzxm8o4CyOejSdeFrxq5GHrT1ZL5gvwzfe8iK
         WXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785808097; x=1786412897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUtJiaQMigx86+BTH4O364XnmOj7lYQYaBG+rEXNuhM=;
        b=HuqKgpkUX574ApuBMaE5GrbiX7C9q/2HgqUAFaP67nvMd1Mnx9UghrldFMSGpyxPq3
         rJmd9TV8PiqUE/nIwMMbqaaQVUqnaQXTvUCVMN3AjW4uHzgTnls1OSITxiX5rJi3txOf
         FmL4IoBX6M6vjHG/nIjO/ukB1boIaiyOP/ZJOeRTNdpq5t1sH0HJtu3gz1Gr/RdZHuyF
         DndieXKCQiCTt5lujIj8+BAIapRNbQQCLHPKXMzy3hSvsTENyDqhatlT+Y+Elo9YlCQ2
         xCB5OynrSyd4yre3HqSiioZnju3uuU96jGvnKtf1rhHBA2XQnO5CmctiJ7m0OLArTgfI
         ZW/g==
X-Forwarded-Encrypted: i=1; AHgh+RqcTF0FT3+pfl0jiE4tDg7dEaqJC+da8x8AVLPShr85JcJD7Vv4inMDuudYkgoNfQz4Dj2wyujdfRjAd0pLrIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNjuBgTWW2mCEPIcfSAzkboEvSiyFsxXRPtfvSzHaErarSxQX
	dIMRPPWpuZSEzSRwdJZt5oELoFk5WAn3hQgqSe2MKSOfPXatU7KZ/OZ0
X-Gm-Gg: AR+sD139yrLDbtjFtDvbyLF0LwO48dTLZzOtrteExWKpTGIJuOuHClXGtxszNMg/7jt
	RhLHmpzJ4ICfKtB37HyEmMaMMspFunoMHuyJNnJER/Dmydw4Q6sNhi+1g7YbyUq9pFWRqJ8oGrh
	hyXhWvGgRbzUMcucXyv0Kc+CjeQXzlp09oSRI4zoopn8ctppzBImwnoAZu3qRN+e4EcewQEB430
	8gxUOBXjOuOJjdcPd7lv+fWdPaLKyTMhbGMxdxtv0PSSu0e96e/zaan+OZn8CuNZejAMRtwo9Hs
	R6vNx+jrVWZ2AH+OnXsSSbLiK43M38KJGbwG4PtYeTrX2WUexyC95yeRGdMQqR35TKRd9MYALDA
	gLzZ6JOizqNgh+adfLiItSpLFjAD9sGpHAch0MLqjmOMK3EIHGXnLzsCebK8oeyOHZv5NMY4j4O
	JgMMN5mIqbaAKt64ptGP84YyUKITEce4++nUf5S+62eoNyasBHq/2ljRtI//t3cFeLtN1fhxXFY
	QjDmtuciMMYnFKhmcdwlMmFNBukYLy57O3Zmz8VOLuqyjcsY6SJLFZk+E8cFA==
X-Received: by 2002:a05:6a00:951c:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-84ee4865f9fmr11371595b3a.31.1785808096804;
        Mon, 03 Aug 2026 18:48:16 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:cb1c:934a:3e5f:ef88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7b97sm4410164b3a.43.2026.08.03.18.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 18:48:16 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Gal Pressman <gal@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Nimrod Oren <noren@nvidia.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v5 09/10] netlink: specs: rt-route: add the route deletion reason
Date: Tue,  4 Aug 2026 10:47:13 +0900
Message-ID: <20260804014714.4362-10-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804014714.4362-1-sigefriedhyy@gmail.com>
References: <20260804014714.4362-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the del-reason attribute and its enum to the route attribute set,
and to the getroute reply, which the route notifications reuse.

The attribute is absent from the newroute and delroute request lists.
RTA_DEL_REASON is above strict_start_type in rtm_ipv6_policy, so
encoding it in a request is rejected with -EINVAL.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 Documentation/netlink/specs/rt-route.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/netlink/specs/rt-route.yaml b/Documentation/netlink/specs/rt-route.yaml
index 9f4a1a253676..f14532798640 100644
--- a/Documentation/netlink/specs/rt-route.yaml
+++ b/Documentation/netlink/specs/rt-route.yaml
@@ -78,6 +78,15 @@ definitions:
       -
         name: rta-used
         type: u32
+  -
+    name: del-reason
+    type: enum
+    name-prefix: rt-del-reason-
+    enum-name: rt-del-reason
+    entries:
+      - unspec
+      - expired
+      - ra-withdrawn
 
 attribute-sets:
   -
@@ -185,6 +194,10 @@ attribute-sets:
         type: u32
         byte-order: big-endian
         display-hint: hex
+      -
+        name: del-reason
+        type: u32
+        enum: del-reason
   -
     name: metrics
     name-prefix: rtax-
@@ -299,6 +312,7 @@ operations:
             - dport
             - nh-id
             - flowlabel
+            - del-reason
       dump:
         request:
           value: 26
@@ -313,6 +327,9 @@ operations:
       do:
         request:
           value: 24
+          # del-reason is notification-only. It is above
+          # strict_start_type in rtm_ipv6_policy, so the kernel rejects
+          # it in requests.
           attributes: &route-req-attrs
             - dst
             - src
-- 
2.43.0

