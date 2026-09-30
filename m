Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4D84CA796
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 11:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767769; cv=none; b=eWVnF9h40ntga/+oVq6bASpaC9ELuGi8fipYGgZCyMiPEd4SPKP85HZ7ZFCTelsHwPriixG71S2j9VMZCTbPXAMFYVIbLCNXfaQDGBu7jy8mlMs+Rs1CqhKofpEpQrOD8F6j7tueY+fGZ6xvsOUBRXY/1qSljRP7vluobB6MSmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767769; c=relaxed/simple;
	bh=MtRgZIL0ejzkv81A5uoXkUOIGYLKSnfs4/MRbrb/dH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0sNcaaY2LGUqrcmt5IE/KYZz2GCIAcW9h/kZpzWz/fmALXWRXlDzjtSVxUZIhJ1MAD+m5EZiwLdtQFsYsMRuXi1L5MQxyQU4kgbQl6zVB6vcAXPZYNILlZOJYdF7Sv12KZmHa+DKM5PyPKWrztQXC8YHbojtYtrRS1BLHJo7Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNKiX4ki; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNKiX4ki"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7cadbe09cso970761a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 04:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767767; x=1791372567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eDtomUq8zw6nK1KObwDR6CCREpvglQp6A+WXvBo8Gzs=;
        b=TNKiX4kiUPdsvOWP9SceCTouK6sy9iUYNjo1F8p9Mjxl7+lwcdssD7ZKzSS0/xNJt5
         uXpVEDEEwiMs13xJSNvz5v5hIoas9TJqjepmu9rU2fJ/zR2OZgiby+dfL1Fjw75rYGC5
         QLmvrPGdCnVtrJMiyoZUk8qDvZ62TUQujP8MY9ys/usdldL3pDj31Cy6lx/ZumGiYwtN
         Z5T8oLTuX9zLVZUpQoIGJg8POp4DjP6tvZThArmXEphubZSTQw6nwtz/Ib8SDNj9/KOi
         d2/VsFm1E0Rdl1jb66V4QHR3THJ2wM6nbdDoxMMc6qUtKY/6jZHFDcOVOZrMydY9b2Zi
         didg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767767; x=1791372567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDtomUq8zw6nK1KObwDR6CCREpvglQp6A+WXvBo8Gzs=;
        b=o1W0HrF2vyRG6GAuMSOQ5a2lCyTPFpRUPJLQ5FUe1WHBLI8S8ImviABGHtfuM8p2as
         Zbkb2lnoFLtOo8gH+bVXYd01Lz5FfXyLEd2sa4fGBFxdV72EHvwbWH/M4JkCGHvqj7GJ
         XpX0fxwbaHWk28iZryRT/i6Qi2WHenGo92xapM9BPoYi3tiR16OtuIqiyhlePc165qSJ
         4QqE6CBB858CfXQKstz60yanf4hpXTv3ay4YuOOlsThk0WDia6taZUnuQR+0FMY208NJ
         y6EdsCYKbOfNIYXupdDlGgf4TLzWk40xdT1kFBKbuLRaSHcRUeFG4Dt3VuAv8WGNho1X
         eQEg==
X-Forwarded-Encrypted: i=1; AKwUvBzLr1Vp6C7T3EBratMBfEeErYQo1V1/LzsrxT03Ir2t+JmnTQTQQLxKBcNSlhigBE6GICcRJslrIpCRKwuZatk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvf3Io/QjpyEjjlxu9k6rTXAx27A0Nfumv6szyfK5/8FueYGwf
	9Q3A8P9tK/sFEQvrL3z1uEw2BeKHlgWW37u0rtCcIo2rZr5fdBz1BFe0
X-Gm-Gg: AYBFou3BN6vYhuZ0FPspSXAFCccPKcksdZJB/gFBxfDHzSOSLNweLZc0EafwMl70m2V
	PsN2nizFvwmjOxdXDduLX1VoVGw4JyVKoFRn1902e70+uNfyZArFvsiu+jQcU4NaUBo2/0SCZ5J
	6WHQmoJbLI0gDhjvNSkH6DrToKDaSDXTV2bD1xfcaQaLJDL5UDM7vwSSILpxq22ZpuQ/za4ksEc
	Txl+ysSP0hjnAPW4SHc2L4uwFCaVmicX6dqxIkIOcdhiqhPyPqbjbK1KBM7+3Dpv0TYC+aRbSuV
	5Gon/tuAdkOXyC/63a4uaDaNZBGqxMnoxRUc0IqR6v+SohiSDQ8qH7qVuuzt0LcH03j+T0E8FUy
	KDjE9/nQLhH5/Z/mJ2BnrcGeeNiKnFKFBA2eo4cesfngdDGY6LMa9glp+2AxLx/0cCL30QbgnM5
	e35zQ+Idt1mVi+8LqLjDwJ1erPRFRm7mGqb6MCoH9PS8XahxRBaFIoTyWAUY/imUFVArpkvkUN6
	INyR0IIzQeJKGzvmsFGde78mNSANAHtZKrC0PYXi7RY
X-Received: by 2002:a17:90b:2787:b0:3a0:e76e:ae10 with SMTP id 98e67ed59e1d1-3a4d175ddcamr1003462a91.28.1790767766632;
        Wed, 30 Sep 2026 04:29:26 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:3fb:270c:7df4:18f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab46db6sm712637a12.31.2026.09.30.04.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:29:26 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kees Cook <kees@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v9 5/6] netlink: specs: rt-addr: document AF_PACKET multicast dumps
Date: Wed, 30 Sep 2026 20:28:41 +0900
Message-ID: <20260930112842.21323-6-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930112842.21323-1-sigefriedhyy@gmail.com>
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
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
 Documentation/netlink/specs/rt-addr.yaml | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 17ead22034515..1bd1184d1e202 100644
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
@@ -168,7 +170,16 @@ operations:
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
+        protocol join are reported with the global flag set. For AF_PACKET
+        a non-zero ifa-index restricts the dump to that device and
+        ifa-prefixlen, ifa-flags and ifa-scope must be zero, AF_INET and
+        AF_INET6 apply this with NETLINK_GET_STRICT_CHK only.
       attribute-set: addr-attrs
       fixed-header: ifaddrmsg
       do:
@@ -181,10 +192,13 @@ operations:
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

