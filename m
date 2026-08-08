Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B0830F7EB
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150653; cv=none; b=CNJ5BFK1xCH40PpY04f3YTjaIxqaWRz/mt4KQMI2EQGqsEJ9irQaQuiQjBUGPFV7GFtGn6xwwbfgJ65t0ZI0AO6Buc+tBBSM80ZhGv/Y/HUiPGVL6scIE0cLduF4mJOhQ1xRiWj5S2ywJuyueFpfahJLQE8SFz1caR0syxnQgN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150653; c=relaxed/simple;
	bh=RXRTAXtIAvF5W4zhV9XvNk6Eqr4bA6CJDR4OTuU8uKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xkib00COcu1Kbt/1qtLRDkS/dQtVohkskAv3qCRE26CrIwTen0POGfn6zji4WeqHnsdfDcrzgub1RKprnHeTcjmWT2zzXJwlMlMSkJKrBCFx82Nn/XPxSwA2szADWZhcYeQUr4I5ew5D5jIpg9lNcLMKUkI1z512qUVneO15Cl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvUFkvks; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvUFkvks"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so129205a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786150651; x=1786755451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=diMA3NQ10gzHFnNLk3VwTDac6B6hmowUzo1h66c0BkU=;
        b=pvUFkvksPeHuKWj+IZsJ7F5QsUK+omc8El8hI3uoMdXoUrbzGN666TcVLgyvIy1d+J
         JPib1bvOnnwLMazUztHEOBfk40VRUt6WHaAoKzpiWumEE9MGHMX6eNBYqK/VPU+AlmBv
         6Jag3WolleR5Agxewig03Ko8eazJHaLmRzSe/T4kgEld1LRmTQwiWSJsG7nxfe4Ar/1c
         w3xswLFdgX9novDK4vBG6tHEM614p6KC5YByy9xK32oawgaxMvD9c5fpiyXmS8xVzXHb
         k2nQrEKb7H1kEXkJpOZBqAgj2NaLnGh75eh5JW46fxrJ+7+6ZoC+D0U2+y1j5dUPHrBu
         3dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786150651; x=1786755451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diMA3NQ10gzHFnNLk3VwTDac6B6hmowUzo1h66c0BkU=;
        b=TyPp8KW6y2aCDk8yeumrD7Pv3tdy1juj3m7CxUCPc3WLB5TcIavL19+1gufXOL91QO
         3/HS71PflzYBf5MOxuv5Sclo97Zj+gmYTbOD5wM86I55NPSgeHvv2gpkG1GVEC7bCX7a
         x8OnL1avklz1yoZMLAj7nvcnDR1eHJSMrlavPj3GhQpIqEvYc8d8e90+TtIAJbwmYzdK
         7hd/zvONTar0kz8/mZa1nU5h5hPkjVd7EOjIQFSHpnYC1DFWq3PW0km+HA2iXX7uMgGi
         RZ6sPVBX/xoeDVuWCJat42x6pbK7v3VqRzFc6Bnd2eTrbXqA2SU/dUi2ISLus+Z5DqWM
         bFGw==
X-Forwarded-Encrypted: i=1; AHgh+RpfsWi/PsJvKTDZqWvpiNj2WKAHaEw4/+OVinel0jXvASWJEJ1uqJZeTlqAupzYGQqEV5HnrM+Lab30OnQvcfI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg5c2RF20el1rr2pc6bm886kgHcO0PfYcy7OTPmnHIT/yP0WxH
	e2uIh2W6cvi0DFSJmDvHq+qQGOXMuSm/m3wxIoCN5xJ+/CoZ6tgAKUQ+
X-Gm-Gg: AR+sD111jG/qHxgy38YPbiuoEeO/KoMfID6JLMZYFJ8jfyv8f5p9MCr1tlNDcrJSPab
	HY/dk8LoCKzztnztuMbki2Vh9ds7mVv7AG4WmigB2tYZpNe2NC2PDGrEqZadjZ+HRJsa1Dv3RBq
	j+9s7CoaZ7CftbdRDzSGSidEoP4ubprHCfgZ8hwxef56L3wmd7/FfO1hSr22w2M9ZulCOSwhjjG
	8ncxpbT9xVTsph4In+ay2OX5oJ0drPMu+K58Cr1eDogPmqlIXsY7WJvVnQCIPh6WX1KN9xdxcW3
	OiSJjqK6aQa9sjsJBFBRLdpnoASs1E4fVvi2pc+qhTmds9vQI2uo3SkWq/Hawkwawh9D71eO44n
	YKMlq9q1WUWPZLIKlLo8f3X+15chTqj3JQtz2DzumAfoboNmmhCUokkjPkMjLo20PpeIbaxAE4f
	D0GPOGP23LjIXQwVq6NCb+OT7WPr/FkK1j65SGMG65pgPkMr0HyBoUv6Bayv4naJtcXt4gfZqKn
	dN3bL2NOzQo/RukfGcJPBQxNMfFTzWMg4lbIBltPh1EOxVsSRvC//vac1FuN/Y=
X-Received: by 2002:a17:90b:3985:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-3903c58ee8emr25039098a91.14.1786150651049;
        Fri, 07 Aug 2026 17:57:31 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:d7e9:6449:7464:1dfa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm4205182a91.2.2026.08.07.17.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:57:30 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v6 09/10] netlink: specs: rt-route: add the route deletion reason
Date: Sat,  8 Aug 2026 09:56:41 +0900
Message-ID: <20260808005642.26901-10-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808005642.26901-1-sigefriedhyy@gmail.com>
References: <20260808005642.26901-1-sigefriedhyy@gmail.com>
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
 Documentation/netlink/specs/rt-route.yaml | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/netlink/specs/rt-route.yaml b/Documentation/netlink/specs/rt-route.yaml
index 9f4a1a253676..253037ea5176 100644
--- a/Documentation/netlink/specs/rt-route.yaml
+++ b/Documentation/netlink/specs/rt-route.yaml
@@ -78,6 +78,27 @@ definitions:
       -
         name: rta-used
         type: u32
+  -
+    name: del-reason
+    type: enum
+    name-prefix: rt-del-reason-
+    enum-name: rt-del-reason
+    doc: |
+      Why the kernel deleted a route. New causes may be appended. The
+      value space is family-agnostic, a value is never reinterpreted
+      per address family.
+    entries:
+      -
+        name: unspec
+        doc: The deletion path does not record a cause.
+      -
+        name: expired
+        doc: The RTF_EXPIRES lifetime ran out and the route was garbage
+          collected.
+      -
+        name: ra-withdrawn
+        doc: A Router Advertisement withdrew the route with a zero
+          lifetime.
 
 attribute-sets:
   -
@@ -185,6 +206,18 @@ attribute-sets:
         type: u32
         byte-order: big-endian
         display-hint: hex
+      -
+        name: del-reason
+        type: u32
+        enum: del-reason
+        doc: |
+          Emitted only on RTM_DELROUTE notifications, and only when the
+          deletion path records a cause. An absent attribute means
+          either an older kernel or a deletion path that does not
+          record its cause, consumers must treat absent and unspec
+          identically. Currently only IPv6 deletion paths record a
+          cause. The attribute is notification-only, the kernel rejects
+          it in requests.
   -
     name: metrics
     name-prefix: rtax-
@@ -299,6 +332,7 @@ operations:
             - dport
             - nh-id
             - flowlabel
+            - del-reason
       dump:
         request:
           value: 26
-- 
2.43.0

