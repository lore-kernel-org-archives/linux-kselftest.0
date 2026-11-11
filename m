Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415625;
	b=IiDzjfX8bHYmQfTYZdyp6XuVJislUSAv0wYFcc4uudcG0tEEUPfsWkPhcbMGAnuyZ7zl
	 gcFAin2+YgXCD/XSywvWaGm5U60x462tjr9ygFzgsOFi+3n2lQ1GER6hF+rR/vmtLxAAe
	 2YQAk8d0PC5nAZQUZBH5lscyq8w2w1g9gJ2o5yUpSwzBO6lSrh3sDSnSS7DqejAD92z3s
	 nVd+0dG3wGssD1mURcKh1VsSJkKAG6idg+S/U9JbKN6lrBrzEPI4fxD/Pxs55jXSIvbIJ
	 6lMh9XycBxnehrZNcbkihIXdNgvBUg1SOHJ58a0uhxbR8WfI6MrR/8ZAkF3yOy0ldNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eBvXzXjAl0PssB28sXRWoJu57RNJWaLnVNDQ7q1+ZPw=;
	b=NwScy5dNs5tWWebZaZla6dJrgma/6Lx9+0WHGErZonifRMpbJkHPAGgVVq4ahoDEjQJb
	 KsOPYTwAP6UV0AuazAxcHfoskqXnraKGIbb+568yQm1fw/3YVGBmp7ee5RQE8hQt5yI4G
	 idBe2Qv20hf849R8V7DhmfgyTKcX0j7L0KVxO+K8X7YrzWp9dvrQNvz8BcIzSvkqWp08I
	 ImEfsOn9BEPfnjnQGmAInNlvbMLtSjhksP4h/y1L9tukSdpSmwDNiRPjwyEWb47d2I3U1
	 4R3bU6VBTeSNDbu1HCNAo1mOLdPDKoh9h1YTGW10FljUHa2OugOm+Yw2KhRYwi6ITTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fhItvhyN;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14205606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14205606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fhItvhyN
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso1342959a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415624; x=1795020424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBvXzXjAl0PssB28sXRWoJu57RNJWaLnVNDQ7q1+ZPw=;
        b=fhItvhyN97f+TqB77kXmFyDGxHEG5lTG1JgGnFySfPcgKGAUb4uHncpfAGcMzN8fAA
         YxdhptBxE5IrKCsUSE6kSW6aMXCQnl/6RkNI5iNW5TZtmCnUJLa6X2J/FLCWrhYDE6WC
         ZpoJKtGRhq/tKzcl7X8I0393vXkdHSdT6XQOJmbP2X2x5x5kDWCFTjVs4WosVhiguhxd
         q6+6YF0jWrI3gEa3u84YG6gKurpZpV6407KWa3l+1uFGCIVyPhz2d83eLAB2v+2xLOkD
         quxeQEqjXsivsCWH2xWLwYVz+DRYCUSljn76odj40xsS8WQLGYF+BOauh6hpXcqy0G7o
         1Glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415624; x=1795020424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBvXzXjAl0PssB28sXRWoJu57RNJWaLnVNDQ7q1+ZPw=;
        b=TeseuLYJhO6OjnR8S6sKvA/nWZXlma0I4MdZoVHLMRvjFc67SicUWWrfovIjqHp1CL
         3EDea0LhApCXo00WYSe28BdYcUhTSezZFienn+8up4szk322W387+eNokTLRTdKVPemL
         4YI1yhFnmy7xn+5KTTXDoiLNsQ7epXB2FRnTUjD0nkRJboifslWOSIzXvVRnHkv0Bhla
         QoM1r1s5dygCX+yYBftDL9nz+iliUgovpwa8QECeUdui1O9vosKIwdOTxxRH0+WzNxz6
         xa8+FlKeXBkwuy2mzirCjW+h4PzVGAn9kJyjkLFq7o5w1U6LQDZZw+5tjXWdssoSEbC5
         f5Ew==
X-Forwarded-Encrypted: i=1; AL+hErHdNqK2oniPBq8faYaB2ICC+Z7P2W4Vv76yOfaxuJlTfmO+8SXonleU45KQWvDZrteSrWiDyNNX6AQNmrWvPiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uLsE8GAfkj6aEooKmkWV0sdMEULJRc5xXXG1K8NIUZdt5kjYG
	7aJT3NTz/zSz5Ox0smsAcGGAurznB/kldHHiKuEnuiExxHVvm61BE4WV
X-Gm-Gg: AYBFou0pW+2H9AtrLM7lU7M4qQm/E8khZEIJu/70fXjpxLgGrW/nQAd5NI3ZV2NnS/G
	l6rLVqyRTw4nUgIK1+ldKwyXQn1QjUGt/OeoZ/scBTNNH5+xO8CyJXNC1hlssmkX0DMBZD1hA68
	pKSWSOAYHJJf9DX55lOxCZfxBAnimeEG1tQ4Bcw64CHxpKniV9h1CihI44nj9CvLsCx0I74nElE
	UCK645kcpRH31bZTF6qRKSDqJ8qt96EL5xhocCeNtVDoJndj/MVXFSr4SuiBPIYQVUjZeAzO93K
	3feIB5tjOBgyvk8W8LkFGLNjz+OHg6TmT4+87UYPiFCow9ALZnHj/ZhqfJAjTOHS6/wr3dT46Xr
	+uYBy/uB04bfNUx4W3sCh7SOU7FiSkXoc4SeKbqexxfCfpTMON87e//W1+S2vNnvL06Xyy2SQ7A
	HEXBkNBeSxMCGcGASSaDJmlUJG8PYjbDYqKdDz/YOPR8pdpmSc9rnGY+bR0//SyTz+zETBSGpJ6
	HL5XeR4pkyzFPKpVdJY+SuK6CuGYdbA6teTeoH5QfROus02TFciW0qp3h/wdU4BxQybs2xjiZSf
	7jH4Tv4/WSpv3F8xuygThGK6R52ZFKclnv/Mcs0y8oiSYwyA6fZlIuj5IlJvSonHCbTMyPWz
X-Received: by 2002:a05:6300:210f:b0:3eb:3952:d706 with SMTP id adf61e73a8af0-3f3000c0ab5mr3123096637.69.1794415624374;
        Wed, 11 Nov 2026 08:47:04 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f1effsm2296684b3a.49.2026.11.11.08.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:47:03 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Serge Hallyn <serge@hallyn.com>,
	Shuah Khan <shuah@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	Jann Horn <jannh@google.com>,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: [PATCH] selftests/capabilities: test_execve: drop supplementary groups
Date: Thu, 12 Nov 2026 00:46:45 +0800
Message-ID: <20261111164645.260593-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When run as root, test_execve keeps the caller's supplementary groups,
which usually include group 0.

Since commit 337490f0007f ("exec: Correct the permission check for
unsafe exec"), a setgid exec is not an id change if the new egid is
already one of the caller's groups. As group 0 is one of them, the
ambient capabilities survive exec of the sgidroot helper, and two
cases fail:

  # [RUN]	Root, gid != 0, +ia, sgidroot => eip
  # Wrong ambient state (AT_SECURE is set)
  # [RUN]	Non-root +ia, sgidroot => i
  # Wrong effective state (AT_SECURE is set)

Clear the supplementary groups before switching UIDs.

An AI coding assistant (Claude) was used to analyze the failure and to
draft the fix and this changelog. Tested on v7.4-rc2: as root, all 21
cases now pass (2 failed before); the unprivileged user namespace path
is unchanged.

Fixes: 337490f0007f ("exec: Correct the permission check for unsafe exec")
Signed-off-by: Kurt Lin <lylin1023@gmail.com>
---
 tools/testing/selftests/capabilities/test_execve.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/capabilities/test_execve.c b/tools/testing/selftests/capabilities/test_execve.c
index 46fc8d46b6e6..9428b787437f 100644
--- a/tools/testing/selftests/capabilities/test_execve.c
+++ b/tools/testing/selftests/capabilities/test_execve.c
@@ -8,6 +8,7 @@
 #include <stdio.h>
 #include <fcntl.h>
 #include <errno.h>
+#include <grp.h>
 #include <stdarg.h>
 #include <sched.h>
 #include <sys/mount.h>
@@ -90,6 +91,9 @@ static bool create_and_enter_ns(uid_t inner_uid)
 
 	if (outer_uid == 0 && unshare(CLONE_NEWNS) == 0) {
 		ksft_print_msg("[NOTE]\tUsing global UIDs for tests\n");
+		/* Group 0 must not stay a supplementary group (sgidroot tests) */
+		if (setgroups(0, NULL) != 0)
+			ksft_exit_fail_msg("setgroups - %s\n", strerror(errno));
 		if (prctl(PR_SET_KEEPCAPS, 1, 0, 0, 0) != 0)
 			ksft_exit_fail_msg("PR_SET_KEEPCAPS - %s\n",
 						strerror(errno));
-- 
2.56.0

