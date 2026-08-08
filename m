Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAF8331A5B
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150648; cv=none; b=h9Dc4QIxqgTJuOQ54hiSOfqSWxzMsa8dr+6g2caeK+ZqzxJ2Ho/st06fqoUf+8XFjtOWIr85j4Zirgid0V/uBIH9bCI890hYvhUGVJymzqWbtMD7AUFnD0Th6iFlhZe5V8nFMqtIlq7c+6xkt+DygdZ+1ncZkEkP/7PmYBHck40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150648; c=relaxed/simple;
	bh=/1aVlWW0aqZciYFSw+AOVrBgxkbF7Mvd+1bStEYFWQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pm9PwLCqpxpzdYHkhq8nI8xa5wOlEKe4viAp4a7Uvy12Ca35c+BO7+whNP2RiVyABIyw5j5K34XQSWzR8f0SgFyFryqpM9SSmdBjDxp3/S+BOYIe+MNTIBLXjip76l+gdFltg/IDYEf6GlgDdASiqz+hRRgQgEO15uYbS8sLt2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okFlVBKO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okFlVBKO"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso132170a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786150646; x=1786755446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yuxY4tXM3iR0bUsRR6CCNuiHoOS0/eoyg0oTXxAyJpU=;
        b=okFlVBKOC752/QidXq6WJmPC8WPZfQpgKT+E+4pX06HnXaaY7tcP3tS+YCAHRy38k7
         +wW0pV/pkgYYNmUcvEmYeSndORXgS7VOUWwx3p7Zb2ErVBnAbouAs3+O2jFlUY7d9YQu
         qm2l/K7493H7c91Al5svUEFG/KUY+NR2hwehEy+c4GkuaGalfhlFA3XhtKubDL8g79ZI
         iTT9xGv3gvhU4KSE5XNTKJxTpg7W/+tLXao3KAKKyq3JNPhRI3Bt15r209c9s0Vjkifs
         ZalZEen9Pka8QuoHr+iirsxWYttju+5nLH/AwfJxTOd6Mga8T0KGvJJfhIM57ZQVI03L
         zdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786150646; x=1786755446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yuxY4tXM3iR0bUsRR6CCNuiHoOS0/eoyg0oTXxAyJpU=;
        b=c73FoEAWJ4ci7ZJdy51RaFVuRhqB7//VsaeU7Ss4JguL20fi6LqboMOA1f7bT7pmTe
         VFtC4Vd2Z2GCb7vL2FmZ/EWOpnDoPnNqmK24wC0MH7Yt+Dnom4GEqYc0bqE4aM+Zpsrv
         W47ITa58JYYakeD1fzGy54nMrTOw6BzaTEwmj2df7dfMJvNwMG8DpBPnCE+8NvJdWjbx
         6Ej+IwZq2jsmGZ4LzYhax+um/ubhN1+rePUJvj2ry+RUiMw3mmNAl0Mh+OojUcB1CBEh
         u5WkJVIQo6ZvPTHsl7b/5kFqc7vVxSc+VFxdDoS5n7FrU+1EnoM7VKiGwcsqcI7C5n0J
         7rGQ==
X-Forwarded-Encrypted: i=1; AHgh+RruP+iLcQSD4a90mzzgKmUokOR3WgQeToamDWW9plXeCzygE64BxAqYthHuFck8NLwRormI9icnErltOf3suj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxeN2FUC7rMq/XSlSG4Rb3hIy/p2XWA2AeV0YEM/52GqmyjkF8
	67QAaaeS555cGwMiuCc5ncIk4QkoB2TaxC28XGCJfgtQWiPagnEZnEQU
X-Gm-Gg: AR+sD10JO0nXYBl/aWpQ412UDcueD/bz0fl++Oz+OrSu04WxZfvdnfkH4gk8zhY1620
	mRQDX0pgEoRME81K1dDkgEKEPUU1gY3mB54udOZNgQBMn6pvT+eSpfUVpv61ExAheMXx1KIFJfn
	8uAn6Jj98jQT1GdqhcDe61rQxJdTzHDVBYoJrAakjZakxDo7gzAY17FCnY12WLsX+hS1TcDI5nd
	0vn94IPbVR11zTOcJl3br4PnNnp0CkLx+bBCRHJsECEduVfs2w961jR9Lvn0pDXpGwMZfw7QmCT
	u//6ch4joQFOng7OvYj7yPGnLI3qa6Yhayf2yeySkOFn8iB9lO9n9ZGX0zHNPQJ12cBT52QPJoz
	h78OHpIh2q/hLW/ugAi1g7pltLKjJnM9c6o+q3G7aJBoLndbsg8qlsqJkcn5/CvbilcnPv8L+rp
	dENnd9vznFgexVRLIkcyfnEDRExnVt9ARVvug6gSY3pAtcrGch5ZulLQWuoZrpMwiyolpmAk01f
	4wevXMRDSaBUhie18aruaCd69iTzm7ay6mrP2e5rhxFlHia9Cg=
X-Received: by 2002:a17:90b:4f81:b0:38c:e9e9:e7ce with SMTP id 98e67ed59e1d1-392822bf6abmr3156672a91.3.1786150645933;
        Fri, 07 Aug 2026 17:57:25 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:d7e9:6449:7464:1dfa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm4205182a91.2.2026.08.07.17.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:57:25 -0700 (PDT)
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
Subject: [PATCH net-next v6 08/10] netlink: specs: rt-route: split out the request attribute list
Date: Sat,  8 Aug 2026 09:56:40 +0900
Message-ID: <20260808005642.26901-9-sigefriedhyy@gmail.com>
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

