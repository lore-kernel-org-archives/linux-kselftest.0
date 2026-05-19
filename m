Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EC24C77CD
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 10:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185814; cv=none; b=PoeuRGNNnmoXc7XPiPjzhPma4ipvyg2X0XShfqWujZrQW4juoQI/F9zb+4FCZdvYglrphtst/3XDK6pMDnXTgbaQiU9XsVnm1Dxx5A2NowtcJy47u9Eu6aFFO42JoaVmH5CZu7Jhr+WzIWI+bLRYF12t9KDIvBbbLNRbXj3z4ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185814; c=relaxed/simple;
	bh=IAAwWh03pdac2K5J/sLxDn417sjQdd3KhJoJA5nTTfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qbNPasnSuVi7Zw4IWOm4lQvVe4ZreA3X/J33eFfXFICI4C+qcK3iEDBQklnF+CYbW5PXchqeuosOFVhUIKqZyyofNunO2+9wnbM1P7hh0N9b6xp8vkAkDuSUZZMqQxQde7UtnM69cQGIYXXXqC3zdxgmUygApLPZNEraneOqxxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4umtEZ8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4umtEZ8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b150559bso25877645e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779185809; x=1779790609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ro1NSZvRVql9o2DvHeVvERMz4uZR0yLxany4x2XUJw4=;
        b=p4umtEZ8P7WFKELyxA3JPRI7/xpqGZ6I+YaQbhQsE5weWhQAWi+Ye22xCtqySsvPDB
         xSm0wwrGjk+OKKjOt7hcsO7LVy0wvCA42/6KM/99whP0dFtefLjsKWndyfQCaLHQi1jo
         6vDXzJp73nDy9oZ6FkQsKPUC6ggddrJriAzm8rO7ze2nyPZV/OV6IrZOSZejEkFhLz/G
         2JP6KLlDDhBIbDyywqbl4emqTRVCZ8N7ju9sqJvSfA19xT2CFBzRulmdIvO5gGsPd8Ct
         wNJZrGpg+/FD4/wY9UhLAgsdGwNFQAffE3lnOZDlgg0sw1ZMkHKao4LKORHU0Zl2ReX8
         4O9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185809; x=1779790609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ro1NSZvRVql9o2DvHeVvERMz4uZR0yLxany4x2XUJw4=;
        b=XRkdAkOgx75e4/xyR8yAkty0sud4wSlihUXsfaoUGRkv/cJUq4TpYhokP5iwpZqdqR
         bH/s1bLug2r9ux8WA1C3tRbyYJITw9yEzM316VOYoq06WN391mU9bkjbcskD868MpQC3
         TZGmk48hj56CZpHvdY/b3LfeeJcjEqJZgjswF2qxNzqbKdWxrXmK9dd9d2F+NePGMOYv
         oxLgQFW9Yts6AqgDFN6eCmtpZghqE/bIAW0/jGS2aIvu47+bChFi/Q4P44W8k/FQPNmg
         w6WLeQDk2xht1Xa+v2Bh4ZOz0kyscVRgLVqMEdRxAflomuzI+nVFKWmTxjpIG8cYtCr3
         COfg==
X-Gm-Message-State: AOJu0YygsNxL0ZkFAwOh54+Etjubp8FlsZFT4ytQRn/u2idtW80nNH/8
	nHorqimtQ+MM/mi4uKGPqZkASordS3M0IXcgyVcEtqGQ0HxvQBYifQ72
X-Gm-Gg: Acq92OGE5FJQRCpcl7lfH5nVhxT7pCwJgErhxVaGOs/RY5FCk3KS2Lu9NH/CIm8UsQ9
	6eaGMf3ECil5Ii1AVsOrqVOGk9ngGf6IukbaKcfqtzoLvafLVux7FTeyz3VlCxirD2asNsB7MMK
	HwQgMft2+S/PmbnPLGJOiZVDUIqQLGambDM/D/AxUW5DowQE3+Ob+OchlE73rcGU4WMgOZ/5TJz
	1U524lK8/5DdezLP+SqyIhC2ncESApvZAw+gdMHCOGlxVRgug1dDPg5QkMoUih1EjyZf6PKJ0Hc
	6g8UyCzg5FQwAm22n2gKyMWvOHL+fseVuzBDcQ2TvRwRQ2K0b/zR9YP6fMeXmhsiSTlpWkDmRTH
	lV/dQxNSv52LsD0hnqO4ee78zA+GdC9hlC/WQViFRlPeTHxLcPhs/4z4eYg5XbPMrAvWjLyFsjG
	rIYA7lsUf5SlL+y9QuX4XaRDYxJCrDpraiiFr6XOVPr0TKZCQz7gUzBlDStrylrcM0v0RQlUgdO
	4HnkRzbVvESW94i4FXmNkhDglhxvlTnANKsE8w=
X-Received: by 2002:a05:600c:4e87:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-48fe60e142emr304545055e9.5.1779185808635;
        Tue, 19 May 2026 03:16:48 -0700 (PDT)
Received: from localhost.localdomain (wifixm-si-gw.uab.cat. [158.109.94.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6aff4sm103710025e9.25.2026.05.19.03.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:16:48 -0700 (PDT)
From: MigMarGil <miguel.martin.gil.uni@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	MigMarGil <miguel.martin.gil.uni@gmail.com>
Subject: [PATCH] selftests: watchdog: add WDIOC_GETTEMP coverage
Date: Tue, 19 May 2026 12:16:45 +0200
Message-ID: <20260519101645.10837-1-miguel.martin.gil.uni@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new -g/--gettemp option to watchdog-test and exercise
WDIOC_GETTEMP, printing the returned temperature in Fahrenheit
as documented by the watchdog API.

Signed-off-by: MigMarGil <miguel.martin.gil.uni@gmail.com>
---
 .../testing/selftests/watchdog/watchdog-test.c  | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
index 4f09c5db0..e048bf21a 100644
--- a/tools/testing/selftests/watchdog/watchdog-test.c
+++ b/tools/testing/selftests/watchdog/watchdog-test.c
@@ -5,8 +5,6 @@
 * - Tests Magic Close - CONFIG_WATCHDOG_NOWAYOUT
 * - Could be tested against softdog driver on systems that
 *   don't have watchdog hardware.
-* - TODO:
-* - Enhance test to add coverage for WDIOC_GETTEMP.
 *
 * Reference: Documentation/watchdog/watchdog-api.rst
  */
@@ -27,11 +25,12 @@
 
 int fd;
 const char v = 'V';
-static const char sopts[] = "bdehp:st:Tn:NLf:i";
+static const char sopts[] = "bdeghp:st:Tn:NLf:i";
 static const struct option lopts[] = {
 	{"bootstatus",          no_argument, NULL, 'b'},
 	{"disable",             no_argument, NULL, 'd'},
 	{"enable",              no_argument, NULL, 'e'},
+	{"gettemp",             no_argument, NULL, 'g'},
 	{"help",                no_argument, NULL, 'h'},
 	{"pingrate",      required_argument, NULL, 'p'},
 	{"status",              no_argument, NULL, 's'},
@@ -87,6 +86,7 @@ static void usage(char *progname)
 	printf(" -b, --bootstatus\tGet last boot status (Watchdog/POR)\n");
 	printf(" -d, --disable\t\tTurn off the watchdog timer\n");
 	printf(" -e, --enable\t\tTurn on the watchdog timer\n");
+	printf(" -g, --gettemp\t\tGet current temperature (Fahrenheit)\n");
 	printf(" -h, --help\t\tPrint the help message\n");
 	printf(" -p, --pingrate=P\tSet ping rate to P seconds (default %d)\n",
 	       DEFAULT_PING_RATE);
@@ -222,6 +222,17 @@ int main(int argc, char *argv[])
 			else
 				printf("WDIOC_GETBOOTSTATUS error '%s'\n", strerror(errno));
 			break;
+		case 'g':
+			oneshot = 1;
+			temperature = 0;
+			ret = ioctl(fd, WDIOC_GETTEMP, &temperature);
+			if (ret)
+				printf("WDIOC_GETTEMP error '%s'\n",
+				       strerror(errno));
+			else
+				printf("Watchdog temperature is: %d F\n",
+				       temperature);
+			break;
 		case 'd':
 			flags = WDIOS_DISABLECARD;
 			ret = ioctl(fd, WDIOC_SETOPTIONS, &flags);
-- 
2.43.0

