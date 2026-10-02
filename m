Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD94544AB7E
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 21:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790976072; cv=none; b=SNkArdgZomlT0ZE6o6QqgGJZEpeVSYvujdq+Go5jSw7tb3GJ2rnruV+/at4xc1q7AMPgfVR42BP8jWJNjbBjbB9xIrmtfhSyOKQXqXpQLRb3TEh437CTdb4NCdSqWxvFohvLWzGmBUTC0YAe6VYmtedS2tg63L6eJ0TD9VL3Bfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790976072; c=relaxed/simple;
	bh=t5wWBrGsG33k1BbhMasdkPiERxAa2b8DhvgK5I4BLnc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=erE1iH2JW8zN2qW8CaruW2cf0lmDrJ17DMy5eP2k5cQqERkwZ0lrUBjZGpuvDKHIVZq7gW4xxxjXyscVa6QmYMlEyHyUjGvXRzNVp/VoLVaTq8pOupGkf445/kZLFTiisX+4TFEvMxi3+ZfFEi72NCQbatVZ2y0rXm7M+DrjHtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XN8Cb6Tk; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XN8Cb6Tk"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso156984f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 14:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790976069; x=1791580869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ysJfmU2nfXZTtv2veyVxAaXsizKh3WhPhhl4gdeIEl8=;
        b=XN8Cb6TkH/Is+iiqkQ3xv4bkD7rFfFE+OrplKO6bvz1T4vQF7iyfGSFIpJObRLVukz
         V9J9Uo8mQev43w6WLASe6dAt5NMWGHRtg9++8pkrXC3C1+NAnGRiV88KTDi/sSiaO/43
         DeadgRqPf22qp5wlgGjECpDU7Rif8BrEzrFQ8AR0xiTGVV5IUkIJ6OI0fTdFg8XuTbGw
         saPdx+P7r+KwSf+tz/1oJJrXOCAqh/uEXxt/SDCBTeiI6es69CEJP0iCNkuAh8vfb3WC
         yjZTOkbHrCSO0F7Js8NKYFEhK90mhG8w4z6oodLa9IR0EgugrtOZf+ahz/EX0XugHU9k
         WlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790976069; x=1791580869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ysJfmU2nfXZTtv2veyVxAaXsizKh3WhPhhl4gdeIEl8=;
        b=a3OIpNw1Uvlewy42S/PGspT36QPczivdeEm3HPtUFEO2aEuE6ztHBbJdUO6D2hR1ju
         Bkjzfd6mUYG+TtUTQISzDy4gl6AW6cROyIW6nwVrugEVSP4hHLscz+eACsmcH2uHsqxP
         ol7WMIoh34n0xQSOUKmspzuqaiJxrU7PLMYuvbZ+dJTvUVHlCI4rVNPyYZ0PZ5HhWMwD
         iFOhBxBb865BBZc1/lgBkqDODkrrNf8G4Rt8codinEmZKw2PPZGewbCKPJ8N/mjIBxuY
         CSWZ8TCt/ZvLWkJbfk3k7j2KcJPXdLXJkuYT3tUns/G1+i+uB/dPTChJB/2HmBQkGL7y
         64HA==
X-Forwarded-Encrypted: i=1; AKwUvBzl5kDV2e9SRU6OlohkcINAgduJ1UD6Kp+7Y91Dyx+jazvqibf2+7kk+lBCgc95JkPxgYDRrr1YBDiYvQj3DaI=@vger.kernel.org
X-Gm-Message-State: AFuF++keeydlDaRL99YMa6/jpxMEPZ9HtlSom6qusoZ70JaPJf3cMqW/
	WaXl9nJ2M2kKLabGA2qTonP9RSbnXDAR3va3ZxynMIcnxAj41pcRvs4a
X-Gm-Gg: AYBFou1P18KSe4zNy//91BsgApVjaCQav0SWlZPT2PyKqf0XPkPlDsCaGyXSVPkgWie
	ET35Ed1RY8eo3N4OyRxAB9O0bMeDezc1+vxI0IeQTWtBL/co6c4Ck/9/yIhhn9WU8PemE5WAlmN
	+JwwEijqxJgxqWnbsH7++leToEPpFM1r0Me3QBiGZD1aMKAdpU0unrM8lcuEjNlVzl3cGLiGZce
	8YpMmZt/Ge1vQ0eyQRj03Tz0F1v71RJ48U0/gTd+2NOaIzkG+YecsyVpqtmTzAVW31AzOVndj05
	v1W6AJ6rAQrjiB7AufmDvk9Dsvx3oJMIm5IPBW2GGm/qWfYngjXSuPcbs9rht7JNgKxgYw+gz1m
	+RuxLzz05iFiIwGSuuwP9bYOOnka+gGpYvRYbA2VLgd+1Gb0HGkIQ0kIjciA/hHryGqNdJyX5g5
	ub6Jq97WhZ8s0oBaBJWhMA9qPCkSSGhcjL471nYGo6LCXalpg9UAXbb2bLDxsaiUC/g2QlX3oPG
	4c0qCCoszK2M95LFj4uf90gu8WBRyENE70Xhsqp4jxf9aleQCXmEyAkg3rOWepnC5IlfgyBwWdq
	CwEk/zX4+xquqbYFitAtqtqFvq+0eZQrQJ3+YLkf8p9mvcqyuZSeoipNgTgd15kum59dVVcmcam
	WtZ1Jti0=
X-Received: by 2002:a05:600c:3490:b0:4a0:1b14:e845 with SMTP id 5b1f17b1804b1-4a0274d1600mr67284215e9.2.1790976068456;
        Fri, 02 Oct 2026 14:21:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-af35-1901-81da-eee8-c2d0-ee3b.310.pool.telefonica.de. [2a02:3100:af35:1901:81da:eee8:c2d0:ee3b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm111894055e9.1.2026.10.02.14.21.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 14:21:07 -0700 (PDT)
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
Subject: [PATCH net-next v3] net: mctp: Make flow KUnit coverage an explicit opt-in
Date: Fri,  2 Oct 2026 23:20:58 +0200
Message-Id: <20261002212058.25117-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MCTP_TEST selects MCTP_FLOWS, so KUNIT_ALL_TESTS builds flow support and
SKB_EXTENSIONS even when no transport needs them. KUnit's style guide
says tests should not select otherwise unused functionality. The CRC
and crypto library tests use explicit ENABLE_ALL_FOR_KUNIT options for
full coverage.

Remove the selection from MCTP_TEST. The core suite remains available
without flows; its two flow cases use their existing skip paths. Add
MCTP_ENABLE_ALL_FOR_KUNIT to opt into full coverage, and enable it in
all_tests.config and a dedicated net/mctp/.kunitconfig. Both profiles
run the flow cases without a hardware transport.

A plain MCTP_TEST=y configuration without the opt-in now skips those
two cases. This is the coverage cost of leaving otherwise unused flow
support disabled.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v3:
- Keep the core suite available without MCTP_FLOWS; a plain MCTP_TEST=y
  configuration now skips only the two flow cases.
- Add MCTP_ENABLE_ALL_FOR_KUNIT to retain full coverage in
  all_tests.config and a focused net/mctp/.kunitconfig.
- Drop the Fixes tag because this changes test configuration rather
  than fixing a runtime MCTP bug.

v2: https://lore.kernel.org/r/20260928205352.30502-1-kmehltretter@gmail.com/
v1: https://lore.kernel.org/r/20260925192510.93840-1-kmehltretter@gmail.com/

Validation: The MCTP KUnit suites were built with GCC 15.2 and booted
under QEMU 10.2.1 on an isolated source export from net-next
014d795c7383, with the changed Kconfig files copied from 071876fd5048.
Without the opt-in, mctp-sock passed 5/5 tests and mctp-route passed
21/23 tests with two expected flow-case skips. With the opt-in, both
suites passed all 5 and 23 tests, respectively. On the full
071876fd5048 tree, the new net/mctp/.kunitconfig resolves all requested
symbols and selects MCTP_FLOWS and SKB_EXTENSIONS.

 net/mctp/.kunitconfig                        |  5 +++++
 net/mctp/Kconfig                             | 16 +++++++++++++++-
 tools/testing/kunit/configs/all_tests.config |  2 +-
 3 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 net/mctp/.kunitconfig

diff --git a/net/mctp/.kunitconfig b/net/mctp/.kunitconfig
new file mode 100644
index 000000000..4b2969e42
--- /dev/null
+++ b/net/mctp/.kunitconfig
@@ -0,0 +1,5 @@
+CONFIG_KUNIT=y
+CONFIG_NET=y
+CONFIG_MCTP=y
+CONFIG_MCTP_TEST=y
+CONFIG_MCTP_ENABLE_ALL_FOR_KUNIT=y
diff --git a/net/mctp/Kconfig b/net/mctp/Kconfig
index d8d3413a3..a89678428 100644
--- a/net/mctp/Kconfig
+++ b/net/mctp/Kconfig
@@ -12,9 +12,23 @@ menuconfig MCTP
 	  devices, you'll want to enable a driver for a specific hardware
 	  channel.
 
+config MCTP_ENABLE_ALL_FOR_KUNIT
+	bool "Enable all optional MCTP features for KUnit tests"
+	depends on MCTP=y && KUNIT=y
+	select MCTP_FLOWS
+	help
+	  Enable all optional MCTP features covered by KUnit tests, even
+	  when no transport needs them. Currently this selects MCTP_FLOWS
+	  so the two flow cases can run.
+
+	  Without this option, the core suite remains available; the flow
+	  cases skip unless a transport enables flow support.
+
+	  You still need to enable MCTP_TEST, either individually or through
+	  KUNIT_ALL_TESTS.
+
 config MCTP_TEST
         bool "MCTP core tests" if !KUNIT_ALL_TESTS
-        select MCTP_FLOWS
         depends on MCTP=y && KUNIT=y
         default KUNIT_ALL_TESTS
 
diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
index 31e930a0f..b3ea56f4e 100644
--- a/tools/testing/kunit/configs/all_tests.config
+++ b/tools/testing/kunit/configs/all_tests.config
@@ -26,7 +26,7 @@ CONFIG_GPIOLIB=y
 
 CONFIG_NET=y
 CONFIG_MCTP=y
-CONFIG_MCTP_FLOWS=y
+CONFIG_MCTP_ENABLE_ALL_FOR_KUNIT=y
 
 CONFIG_INET=y
 CONFIG_MPTCP=y

base-commit: 071876fd50482a68603a9460d80dd6dd58827ee1
-- 
2.39.5 (Apple Git-154)

