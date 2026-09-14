Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74802F7445
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 01:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350367; cv=none; b=NLgUqCjaYhX5wp5BJHaOLWd2O8lo2IPE2tg3sv3Wycy5SYzOGvlIMWkDQIdT9h2pfZRMw7gkZ6sHUNb1gnjNtQdzfILWuZ+7Oq5eAeTzWwVtgCA3fm58NqoH692NmL2rWnkd4Zmwz7NiOE9faZUExcz2sSBu9xPjtyD4uTlJjWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350367; c=relaxed/simple;
	bh=XWZSGWd0VF3BDk2Yg1A/EXE1uFX53VnoBEuepPt1BZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LN/Hpfy5TX+pxh94NB8Sx55CFZrVOZvZA1EMlocuR/kTBW9LIuQSdmSRubOTNN5hOroMjpc4WKxwX0gpy69Zps+yDrsZyk+0dQNXzuiz6SBWaZjdOuimKlA9xBZ9rQToTlrr9e4KVogNFABJZ62GfyNvcOE8o17rvwHk7ZFUY4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DR/bgdsP; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DR/bgdsP"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so1015922a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 18:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789350365; x=1789955165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6q020bOQ0jwuBWM3LeSY8k8HYujoeSZlWF2NlYzVlg=;
        b=DR/bgdsPljUgtaFRX/bjYdAttfefBZcB7asPvpvDxFZ3heijMUWoQ16Cw5OObbBWgB
         KoXZUiO2G4+kPw0afcqGPKzIjQpKnz0CTmxT27DkjGbIw4XfBQ2liyHcBCxGCJDEJoWj
         LBL5Qh99LJmFAXb3Gm7BVfrfbE4qaTCNLXljx9y50Po6Ic5aQM9tB+FQQ8D98BDLxouO
         BRD1rjSepQ3EyDbHbefwfmwwyFu2Y4DpWDzZyHCiZrojTGf0FdogkGN9+mlxpq1K0hAo
         C4KLV4gM4NcP5CdwpZwIhVHq4jXR0v2RnAxE8dyRaGOm4ozslvXHnERq7LwdBixAJIYi
         hyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789350365; x=1789955165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6q020bOQ0jwuBWM3LeSY8k8HYujoeSZlWF2NlYzVlg=;
        b=gMadLHyBuQ+aqc7kFibku8CzoxagHnaMjwje8vYPBKgVC87T8ADQv33yEfOafWBDd4
         BDYCla/o1W1qjpxlpoJ3Ydh4DQCFYCMqv3njdWbu9mVkFbg0Bk/M5dn7SCsvUhXpFNux
         2Mv+JyVDg3B2gq0Ty72DdMDi930VGMrm8/aRirkBLAIfmcMNKlb1jEweSNFAIM8S064w
         /xQztgjeMUdDCbEZeVNp5ua3xbIMRe6+IERG/loAwQvpRaBEZrqwfbvHUn0d9EzCnstJ
         HICz0aML0NA2pdAonLBlGANM2azEG/Wl7XpLv7aD863HOGi54L5hZykX9kHy7Fc2opSu
         E1Ew==
X-Forwarded-Encrypted: i=1; AKwUvBydsuGe4BvN5soiztw55Po74rbD+/VFHUwVYnoXFyohyp/IHZgYPxNcewiQeyuin/a+FlwD99aMcYvPuAm9RMc=@vger.kernel.org
X-Gm-Message-State: AFuF++nBRtuNrn/NTfnH0/wnFEOFDwP6Sy78BkCnJ0/H6Xy7PSle4sXt
	ZhkYQ7X/qIMdzWE1t7u7+R1dV7XkL3VBVlLPSGzeTa5QPE7Zf54WcicG
X-Gm-Gg: AYBFou25ZZ56ONJQ/DGPonl11Qc0JAsXwrztheOoSwtj3y97hQ5pZPBD+XHuM61awjG
	6sxR3DlXcWtY2rDvMgKBjoI+UoTtW5b3H36Rg+L3lpRK2yNeauw2H5+k2YqfA7ghLBXdWkUmMf7
	Kdr2LsCUZWsyH9ONRA/6PLTwAtGqPOuTLOybwlGSqeevViKIF0wLAp3EDxaxOB6n88SPibkoDoH
	bo0kPCXmijqqYSYuqE69+DbBqwEr0sx30IClmUCHg3qC+hLtaXK6cmwDgkcDA64p2FTLqMrxuqS
	QKYOPwB1EkAMaqI7WdvPFJIckohElUH9/tJ22Q4AsMEo5tL/j7b6s94xkG5H4byD+Ab7z3A1nZV
	LAd/sjVkRmD9dhuhYIzfLTU//qmayk16PgXqCyAVxoPEbJVrR54S/FusN4OG8evlYO0jSTxuEFG
	hh8yCqfF+yGkcQCjh9cVs6yKbF6vOaXZPFi7XLdjalyM41pQ+d9klnN6/5LFF5AUauTsX/S28g0
	jrOxA5ppOdwC+bI85DsL/fpn9Ksukg/ZYA6o/rPcP+j7Bg=
X-Received: by 2002:a17:90b:4f4c:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39dec099eddmr1038486a91.20.1789350365102;
        Sun, 13 Sep 2026 18:46:05 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:fd07:4a24:951e:c85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d1056sm17513403a91.7.2026.09.13.18.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:46:04 -0700 (PDT)
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
Subject: [PATCH net-next v5 3/4] netlink: specs: rt-addr: document AF_PACKET multicast dumps
Date: Mon, 14 Sep 2026 10:45:38 +0900
Message-ID: <20260914014539.5015-4-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914014539.5015-1-sigefriedhyy@gmail.com>
References: <20260914014539.5015-1-sigefriedhyy@gmail.com>
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
 Documentation/netlink/specs/rt-addr.yaml | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 17ead2203451..1a17e55d1cca 100644
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
@@ -168,7 +170,13 @@ operations:
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
+        protocol join are reported with the global flag set.
       attribute-set: addr-attrs
       fixed-header: ifaddrmsg
       do:
@@ -181,10 +189,13 @@ operations:
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

