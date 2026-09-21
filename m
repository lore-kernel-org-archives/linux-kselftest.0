Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7536248F005
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 00:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035210; cv=none; b=keV6pnmaz1fFJFnII9SMrDyAkwgQQ8ObMucHqG8P/IkMGTUH8GKeYz6jvN4G57TscTlVQjzBMGd4fOAg6bh7CTrE8SkIvh02/Ufehvy8udWAG9z7j2IrQuc5/NdsTukIswkYIgsSuzQD6tK1Ns/rD1QaIrbuOGcKPzwbpC9TYWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035210; c=relaxed/simple;
	bh=7ym8eCannUJoplyLEig2XRjsDs0s3r99iL28MZ1+Bek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3+ggp1UnF1zL6+Ar+I4+CNy5xVG9U0OVvKNlkdZgK6pqWx+1CCwTWev263ESTnxHqj/O+Kba3HOVG5b9AZc9AA85M8Bv2WZFEmAbl5LMpcTk0lK+Ha7Oqv6TjEmrS2RdRwZiZEkUC62msftGY2bpTB9A1aAHbGDWw6j1K1yLzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iqo9ph4K; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iqo9ph4K"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d93ff61046so34909785ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 17:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035209; x=1790640009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvI2CLJV63upsK+i3iXF166plHPTeUWc5AYad+dRYdo=;
        b=Iqo9ph4KpqPjlE4SCd/88mw3JPRBazn/7fV+nF3JAam4cRoMwyfHEKAmJMppHYtNiH
         P+XelFGVD43BiRnLyHM5G503qcehmX7IihjGNeyEwpxBPQK/CnVp/LnO4+lbBqSWXcCo
         ox35eYal0h3TwST/xeEYGZc5M6ZmaCVvFrcEn8Vj5TtE1lIRMt4TlDYhYyYExnPEC58A
         Q85MYPx0F1otyqXPn4nwi0cRirVszjlZ0tKi4KLy3iBmrjr1pO42AHwtpHGd8sD26XyD
         tHadN76zzSbKFaiOUL81YQw8i6ajPAhmlTdy2GfNojNGOhXPcKwG2JN+a3HeGNrYaebF
         usNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035209; x=1790640009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvI2CLJV63upsK+i3iXF166plHPTeUWc5AYad+dRYdo=;
        b=tCXXb7EM8Bfb/a8VWUvHbNISyLN0Qfmq5cW8D27nN4MeHaT0SRZnNu/DXXyOh10HIL
         jaGh+OOAogdFf6sa/jZ7GEUelD7xKQS5D0ka7c8SfIzbC6+cMXBdTnpZlvfo76ATuMo5
         5mPWRbeVSOrHWyo5Y6i6lVL+KcNXb+Q9uaTr57Jyw8SfCNwfoEQcfD9Ik5r7qmr14c0l
         gXtPz1Su+b5mezFJoiWvpZU4dJypqsJCdo0eZmWEoZKzY1xx97tdSELU11HQLkAv0SJf
         96gOVfbwuSDrXA6dadX6+Qq81Tq30sEjqLi7D/pDe1BjUDg5+Iei7jWOoUTQjn4Kodg1
         fR6w==
X-Forwarded-Encrypted: i=1; AKwUvBxJuuesKP6DDXRVeOr/kFoNlDbkr+cPCk58+KMf+8LF3j/dOXA/DtHXy+IAh8yTWZIYUJ5dl6t19MmxHn5TqLs=@vger.kernel.org
X-Gm-Message-State: AFuF++nfChN1z4mg96j0HTIXuRtTsaFhEHvq1TgNo2DrbQ9Ja9ulyekF
	Z0YMOuwvE8kRlQH9RS3+ZuJjpUv3Yb9seDf7xaotDL5yqBxh431L91SV
X-Gm-Gg: AYBFou0VjzybJRdltbah0N7fZG7Dxh/yAH/IOm1Ducc13MpdAsEg1M6iQQwXt6z5WZA
	Do+5QOSEh/PyshFNPzzfRUNItQM6y1hnxbwMIAAQB72IND4oIczOUcGUysRjA8lAc//DGYl8Era
	5Y2gW7qAs9t5khAYoCJCFVr1ZcEYgvYkgNdqNHlS0YIzGWknhZOU0n0spQQ2HkCfc3HizZPWctv
	r4Fg/OAtbNB94EmtYUvgiWX+mqwd/NPjhpbNPeNiuNFkZ+yMI4FnA68zKdrY876K5loFrEV9Htb
	RUQTUW5gYM1I5rNQqU01VbUzY+Grz7Xeox0QMty+KM1cJBvb6XcxJkXFVV2TmAnhpzn8fmYQriI
	Pbo0KQmNASj/3lRhroxxw4lvhGg6JhFo4CghCmU2pfs7LjqCmZLXT2sPb7PbngGsn1bvRq6ebrQ
	7xNX8xnJEIhHW5CmItBQoSf3/BEctm1YL4ZSaeWpyv6fj/uR6h4rua7L9mEDbtRgLjLn+eH0jX+
	/7FhKmymuq4tGr9dZcOPAom3zTVdz2qk/VnF3C/6YCFw1qPQUKdTVGYd8rkKxSDYfA7MbaWFG9k
	k6Yy8+xnOtmm
X-Received: by 2002:a17:903:1211:b0:2db:55d6:349d with SMTP id d9443c01a7336-2ddb1b9c164mr180081355ad.21.1790035208694;
        Mon, 21 Sep 2026 17:00:08 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d045e78sm386135ad.51.2026.09.21.17.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:00:07 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v6 3/4] netlink: specs: rt-addr: document AF_PACKET multicast dumps
Date: Tue, 22 Sep 2026 08:59:50 +0900
Message-ID: <20260921235951.3214-4-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921235951.3214-1-sigefriedhyy@gmail.com>
References: <20260921235951.3214-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the global flag, list the attributes the AF_PACKET dump uses and
describe how ifa-family selects IPv4, IPv6 or link-layer output for
RTM_GETMULTICAST.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 17ead2203451..dc5c0ce259ba 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -77,6 +77,8 @@ definitions:
         name: mcautojoin
       -
         name: stable-privacy
+      -
+        name: global
 
 attribute-sets:
   -
@@ -168,7 +170,15 @@ operations:
           attributes: *ifaddr-all
     -
       name: getmulticast
-      doc: Get / dump IPv4/IPv6 multicast addresses.
+      doc: |
+        Get / dump multicast addresses. ifa-family must select the address
+        family: AF_INET or AF_INET6 for the IP multicast groups joined on
+        a device, AF_PACKET for the link-layer multicast addresses in the
+        device filter. Link-layer entries added explicitly, e.g. with
+        SIOCADDMULTI or "bridge fdb add ... self", rather than by a
+        protocol join are reported with the global flag set. A non-zero
+        ifa-index restricts the dump to that device, ifa-prefixlen,
+        ifa-flags and ifa-scope must be zero.
       attribute-set: addr-attrs
       fixed-header: ifaddrmsg
       do:
@@ -181,10 +191,13 @@ operations:
             - multicast
             - mc-users
             - cacheinfo
+            - flags
+            - target-netnsid
       dump:
         request:
           value: 58
-          attributes: []
+          attributes:
+            - target-netnsid
         reply:
           value: 58
           attributes: *mcaddr-attrs
-- 
2.43.0

