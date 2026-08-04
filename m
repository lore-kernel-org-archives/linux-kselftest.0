Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5953A5E88
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 01:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785808093; cv=none; b=Hr+0mXJPqbx63tyeJ3muj9bhZWV6IZxYSUProZjisshGu69g3yDZFX5ySPmVgaoLW25Lftz7exGAsjevQ3WI4N6MQAzKHoGZHFYuUAlTdbcUkPtbA7JhRPNKmqi+F/3NMaDGyFMZ0Jfda/FDcJHBLt03ECEVZAgUkKLf5XtXOz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785808093; c=relaxed/simple;
	bh=/1aVlWW0aqZciYFSw+AOVrBgxkbF7Mvd+1bStEYFWQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PmwgHxgemQyHNGGNObCwu8m+HbORWnsiHR5EPgVCIuY2YpAhtkP6D7PqT8ctbDHqKdt8TMPUEopiRRm7BDc9B4UD1aADd8/SVgKoZBN/dzgkosNmqWgtF7R6+2hyTFQ8862gmCVeKnvMG6MJVzigEyAC9Oql6B+j1akk/of2yxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtDiJHQm; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtDiJHQm"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84874b52eabso5429189b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 18:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785808091; x=1786412891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yuxY4tXM3iR0bUsRR6CCNuiHoOS0/eoyg0oTXxAyJpU=;
        b=GtDiJHQm/bFbpu9rUDpLcmlkqztxWEKdfxzGLu7qbDVcTiMYKPXCCgVf0jtu2KlDEl
         yFGOzqYt6LdYHqRHSVbiIj/SaS1jtUR0rZlFl1R3Omb5aWZvb0WUgjB2CKaJsltxq40o
         3IerutTBVBRwl6hD6IGQyN60jNEm7Yz9scVHOIInyG/5mp0xsbpWe2dotXNk4ZKWtPcn
         r2oLs1uxVnmTbnyECzV4h/tfUuMLC8DRVKuNWPCjfIKX7RzkpuINrNb6FanTPnwAK04a
         +OPtPu0vJxPHWYAzNyhWtNeyjPjeIf5/IQVXrXRiaf4weXsH7G8DdgmTEu89lLww2A0C
         magg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785808091; x=1786412891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yuxY4tXM3iR0bUsRR6CCNuiHoOS0/eoyg0oTXxAyJpU=;
        b=YgTnRJfNCAtj2Q9aXxIf97h78QMYMSTTLN39EnMH5t/QNG6Obp2XPY6ybCnJNb/HXA
         xTV+tLkAr0rx5ir/Hsxru/ktpVANNUoFs25wQ4VooQS+zDGGy9yEtbOMyAkLsW/yV3RJ
         zpVAij3xhrMF1/VlKROBAflInLjvG6+3Z40TbGC1VEPducK8Tfxv6812Lb7iFBo3n6Wq
         +mTrr7MYr4hMFlPRY03/2UdvTQN5n+IXhDSMvxRhtl/jc+JNUUPJXM+OQ4slyQcImDMa
         4i63Mat1NYEuFWSlSI4wr4V1iQRhRtVwH2AmlowjXNXICWcV4NCTCEQ0qxBLdZpbg74X
         GLgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+egmpui53cAFocfk+NO9p/aF/vB45YiRNwYh3fX6bNi2k0ivMYvHKeHCq1554FgJaBeIzrbv3cR5WmX8F34k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhrW4cj5MzEH0BSc3yO+BSxCnK1rtwo6dYq4Lx+M9eyN9A8GmX
	JkkeZuE2Hg3JlzEXNYrwRxWgmRMVrwPZG2zjvzEsKmrPpC3pZn5+HVHo
X-Gm-Gg: AR+sD105pQzjvB7Hunp5Z330TH8hud5CS5ED5QUASADIUjUV7M+scXGbG9vqnXMaI1C
	MZiUCnA6Gqx8uAIc+EhzUnMduNkp9SwbdDz1ZSr+FccH4iVXNVsAvrZWdzRdO9PTfuuxZLP/qhm
	m6Z+N0eSmzR/utx+4sfaZL/6Kn2YHR/H/e4GuZkAgb4XwpKigOZUFv74odyXtJzPsPpFMpfxxKW
	exZpEJfKGJmZDtJv6Ti5o6MPBSk8CNi4dGSfG/qlNJLjZFIzU24O4nN4WRe70Xp82EC1DBssRzC
	S+fa3A6Vnq51H6JrVldC5KZ2JMIXVhp4uyFiy6Bbu+6tcehlA+menTjiwbou0YmIkRkfOkaLkXv
	fKPg+n6pQeuFK3EO++5m/XwwaaiztxNoJCpVn7SrwxUVbDeoDsijgoE8md5lsBv1wy4n08QFusN
	RDZig3iAjBIrkT+j3Ksrl0sgHEwJoooQbYcHeOutvgmvetyiWEXpgbeiAmJuiVOeo36HTxnCyr7
	EUbuU0GegKvmnN55NI1gVfJPyrgZzb6iuvpBjdqKruYOwm7xwg=
X-Received: by 2002:a05:6a00:ab0f:b0:845:4d71:8d15 with SMTP id d2e1a72fcca58-84ee4921bdemr11575444b3a.37.1785808090858;
        Mon, 03 Aug 2026 18:48:10 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:cb1c:934a:3e5f:ef88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7b97sm4410164b3a.43.2026.08.03.18.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 18:48:10 -0700 (PDT)
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
Subject: [PATCH net-next v5 08/10] netlink: specs: rt-route: split out the request attribute list
Date: Tue,  4 Aug 2026 10:47:12 +0900
Message-ID: <20260804014714.4362-9-sigefriedhyy@gmail.com>
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

The newroute and delroute requests alias the same attribute list as the
getroute reply, but requests and replies do not carry the same
attributes. Give the requests their own list.

The two lists are identical today, so the generated code does not
change.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 Documentation/netlink/specs/rt-route.yaml | 32 +++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/rt-route.yaml b/Documentation/netlink/specs/rt-route.yaml
index 62b215614210..9f4a1a253676 100644
--- a/Documentation/netlink/specs/rt-route.yaml
+++ b/Documentation/netlink/specs/rt-route.yaml
@@ -313,7 +313,35 @@ operations:
       do:
         request:
           value: 24
-          attributes: *all-route-attrs
+          attributes: &route-req-attrs
+            - dst
+            - src
+            - iif
+            - oif
+            - gateway
+            - priority
+            - prefsrc
+            - metrics
+            - multipath
+            - flow
+            - cacheinfo
+            - table
+            - mark
+            - mfc-stats
+            - via
+            - newdst
+            - pref
+            - encap-type
+            - encap
+            - expires
+            - pad
+            - uid
+            - ttl-propagate
+            - ip-proto
+            - sport
+            - dport
+            - nh-id
+            - flowlabel
     -
       name: delroute
       doc: Delete an existing route
@@ -321,7 +349,7 @@ operations:
       do:
         request:
           value: 25
-          attributes: *all-route-attrs
+          attributes: *route-req-attrs
     -
       name: newroute-ntf
       doc: Notification about a created route.
-- 
2.43.0

