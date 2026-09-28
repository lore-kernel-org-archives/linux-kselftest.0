Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC904F5E16
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628847; cv=none; b=SJqERIHUpKmnVaK2uppbyHAob3D+Nk9qyMnP48XishZSkdINz/89IOhKMTJKNnCnl8ahNigoqnSnjKMiV5bb+MzHod7J17tqGqaaygs6+/iQghix62A5sevhg4NoKXmqDkqLJzbAk/H0MmcJjlDAKE/zFdcBOz4Zz8jolfg/IpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628847; c=relaxed/simple;
	bh=p4z8FqgH2wRH3DNXfLP/C8tVgznBcTgSwV5kisQHgOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oWAaiGYPYetgFcNnpBY78un3ZmEVzMuIDzTdKM8KA284AZdmYyQ3sHARhgl7UUq/Bny6k0FCeOBg4+BGT9A3R+JA+OrRMm+5wseKvfpEWwyws/ICxNnEczYLjP530drdiMNAzdAhrPvuP/vz93lPUGxZz/d+9z2hwKPxgfqTGdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nizLRGAa; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nizLRGAa"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso11722535e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790628844; x=1791233644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MoftrO08HwDktpofinrTBCoRJxn64c18AOQxxmnppJw=;
        b=nizLRGAaKFUMCIahkZZE2GItc1v6vkpzHOzS/r8qI487Td6UTZcGg7REC555U9QtyX
         axizRcFPBZ6Lv5TYF102D2O1EDk/AdN3kkdXDKGwjHK7dok1oSa+qrAnAj5rM3uYg2+s
         0QX9P+BRWYZj3N+9ReyoD87Go57wyskAS7KdvL6431DLvoX4V2u/bo5lBv+Y1QXY0yy3
         /JE+5rV1jtMeCcQaPLPDZu1K+ELrv8L+WoSwIttqlheGpoZ+gX0SjBdBFDedGGOk7B8Q
         mZscQevshL2fGEbhAnD9mpcAqUWSorJyhn3lZoTUF0w9tuN8uMNaX9s2DLeTpNl2tToh
         RsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628844; x=1791233644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MoftrO08HwDktpofinrTBCoRJxn64c18AOQxxmnppJw=;
        b=ZOGcz7oXmJYSBD/zFLCt3vqD4EZjlEu+QeMz5CSGZAv+P9ukoTQg1goR1ud4moS2OZ
         sWG3UU1pnw3COw8hbCdo3vIYZIAXtDRbl3yKQd2pBvSezv3TgrjOpGVMoOQqm8h3uHn3
         17nWSKC453fFyUkU99mGCjsQJoWadTLKYAPkvrByme90iQuTgRdwdyshg/vu10VY6GB9
         vxo3O5hIikWHHdkIfYW7MlwzzhHhM6XEdn0S4YFQnUR8yrvz/ZdWo/O22j4ITFSoBwxo
         ecz34LNbLAo0cFSzEufEyK/AX2rbF6mx+1WCnCQ0t8giee8KxnaNes4o5C3xKvfhBcqk
         IxJg==
X-Forwarded-Encrypted: i=1; AKwUvBykq5nVuNhzZHZaRrYKaAHcvWe/sCde7fpv3W2KApWPhTbDFiIcwYTI4wFg+sOYbbMyjm7zLz56s61qQeJJlZY=@vger.kernel.org
X-Gm-Message-State: AFuF++lSZzTd+dlj+XrFRnRiyH6cbeg7/sPE/qXTeHAlRuSpTPEAcPQC
	0Mew6t9Xh7EHnQklL6IBvyzUaNkfhUBH8bfta0I8AmIMxb4fPAuh1Va2
X-Gm-Gg: AYBFou3AizJuFkq6KWXwDOMmbY2ac6QjDwsWFe/gIz7AP6Uykd2gl02AEqyzrZY6K/v
	wPB8tUV+xvmAzdYuS2PuulM5GfYY7PYoPVN1ZZe57SaF5I5mn8vqMsG1sqQi/99S9yPTkQhqTNR
	qqPdmsDk+hgzQzaLVkk+aohJm2y393fmwWo/bnnXicveZcnMnLzQUwhIzaaR6dOM7PeOso57QaG
	c+N/vhWoPIXCNpXk8dZ2ufcJOC8ibycTIFyNIkJR6XrKdho9vBpv8Tsv2S6pergNHJzX43KnIvb
	1jrVR1FqAAosGqSRCF1Vo4cQFwlOIXwM9chD1SAJ7SLr5iGPe82jUMgozimbJdKBCi2PWjoVX7U
	b8dpV9fTaJuSd53MAqlk/LvPN4s1FzZl1C6+cUCbWASvixg/i3dDxPKfZJTqFmiljF4ij0g4Qgp
	OzJdhw3PN2vmqBBGalwaL7PDB3XRp1/UWaivwS6YrHJ8ki4bIHxG0kAUVXphzukpk9hF61Luc/7
	OS73krBa14pjEc+rppzheivGwCtdPR0fUShHpOM1cNoaN8I0Jw1kd9+3KDkHFD7dv0axJTBWIOm
	7bUWG5yOngFXOMx+afm6Nqq6v+i7SzK0fXNwxmZ/EFBAnE5XAbeyFJ7Sj1FfTkfOwYU2AD3MkXF
	GmHqkXdchteg=
X-Received: by 2002:a05:600c:8a1a:20b0:49f:f0bd:1e40 with SMTP id 5b1f17b1804b1-49ff0bd1ea8mr133111765e9.23.1790628843492;
        Mon, 28 Sep 2026 13:54:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acba-a601-4494-3582-465b-0eab.310.pool.telefonica.de. [2a02:3100:acba:a601:4494:3582:465b:eab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm21210805e9.14.2026.09.28.13.54.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 13:54:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] net: mctp: Make KUnit tests depend on flow support
Date: Mon, 28 Sep 2026 22:53:52 +0200
Message-Id: <20260928205352.30502-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260925192510.93840-1-kmehltretter@gmail.com>
References: <20260925192510.93840-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MCTP_TEST selects MCTP_FLOWS, which also enables SKB_EXTENSIONS when no
transport requires them. Enabling tests should not silently enable
additional kernel functionality.

Make the tests depend on MCTP_FLOWS instead, following the dependency
rule in Documentation/dev-tools/kunit/style.rst.

This keeps the full flow-test coverage: the suite is available only
when flow support is enabled, for example by the I2C transport.

Fixes: 109a5331143d ("net: mctp: tests: Test that outgoing skbs have flow data populated")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Depend on MCTP_FLOWS instead of removing the selection, as Jeremy
  requested, to retain full flow-test coverage.
- Rebase onto current net-next (014d795c7383).

v1: https://lore.kernel.org/r/20260925192510.93840-1-kmehltretter@gmail.com/
Review: https://lore.kernel.org/r/8edc4e71edceb124e2dca233cddb75e198b53a51.camel@codeconstruct.com.au/

Validation on net-next 014d795c7383: x86_64 GCC 15.2 builds and QEMU
run. Both MCTP suites pass all 80 cases, including both flow tests,
with no skips. Kconfig checks cover flow support on/off,
KUNIT_ALL_TESTS on/off and a module I2C transport.

 net/mctp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mctp/Kconfig b/net/mctp/Kconfig
index d8d3413a37f7..e64d4f7ef6aa 100644
--- a/net/mctp/Kconfig
+++ b/net/mctp/Kconfig
@@ -14,7 +14,7 @@ menuconfig MCTP
 
 config MCTP_TEST
         bool "MCTP core tests" if !KUNIT_ALL_TESTS
-        select MCTP_FLOWS
+        depends on MCTP_FLOWS
         depends on MCTP=y && KUNIT=y
         default KUNIT_ALL_TESTS
 

base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
-- 
2.39.5 (Apple Git-154)
