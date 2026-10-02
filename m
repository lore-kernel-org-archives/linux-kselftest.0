Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BFC3D25A2
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 21:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978105; cv=none; b=UoOYTFWvOIPF7JOoA+5vdY66Nyxiu8FJm3l13lKHZGzbT18SbYZB9d7DI65WrRKz7Ye9N+2mqAelF/rLvSWhTIYuraSTe2m8GFmoX+4aYOby7T7fku2eGmn2m6CdgBjW4PimL4ipONiUecmbA85REKKqrFJFuVe7IP6WUFbU/E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978105; c=relaxed/simple;
	bh=VD3Hz/9DzNsRGxMWcveNGmeZZzofDchA7Ax7edN5DOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PWeHtenFBlkO1H6pSmyFlANBHjrm6XIlrq/qgTcJsI4rSLy3IiItxRMgCZ4JUK+ZKjEk1DHRmsiSfbiTA7Q7QxOLMQffCuj2reQNK9vYl/ni6fJz7oG8UQZmc7MWX3ZVArijckmuZ4rVr/N/DXwqDH2VTholIhMB1xsFY+y4CJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=NLGDTOUa; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="NLGDTOUa"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ac9d666d4eso146877b3.3
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 14:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1790978101; x=1791582901; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hBay+pkpwERtZ4nN6gmSwBzZpZ+h9K9WoaUNPQ21Vl0=;
        b=NLGDTOUav1QAkA0nWFIf37Mc0x+1A/+Ct8w9MG4i7jB2y9HFtlKYBCf+dMc5Z2f5wa
         4pwRynadwxTFWfFEnL3/TZcukXdSGCCg7yVxLb1lPLClZHYd6BUUdwzOX3BRahjZFgrk
         DZu+Nw/0NQBoqKNOMviVxPNeZlHsy3E00GDoLYBcyYYHDiEtDj3yfsRprsEA9fvWTeEO
         88KuZCXqUOwfWeJVA0twXpgENPPeUYOV7RYE2OTt+fnLH2toWTFM3a23fwLz2nxEVBaq
         brhRbcrPDkIGYym9iTrbOevAFYZoax11ejYasOfPViY/hSN7x/kuD+DSJeaLLr2PXqaI
         Tihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790978101; x=1791582901;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hBay+pkpwERtZ4nN6gmSwBzZpZ+h9K9WoaUNPQ21Vl0=;
        b=lp+ZlMJ/17p2vn2MFyjBzmRukDqH3LDl0FyxeLJBgFo/+YhkJlmyftjAfKqs8RO5hA
         zvllrqXFM4a9NQEc3zeMoPQuRSv2hQILj8in6RxMQcMJd5kjIvGeYfj/CkYkhgS445PO
         +nMuicfJJVR0x2iUEYRTmiQurcvwjfPqwQ9G5Xq1nVKzemjcLU9nK+HXR7HnYcpcmd9l
         JsXrj4Wa/Gdgw4qpg62v1pBcJ2tXTAHUB2shZN81EdgDK5Y1lzPSnjxchOxaJ8L7cAFf
         1qsw/Pqzby/akGycqMUlExrnHg5VdG6l73/W19eT18FymKZ0GgTy33gTJVXPAeJayrut
         8ChQ==
X-Gm-Message-State: AFq9FYJi4XZMQfZ0BTANtINB6LYGd+ctYyMpH5NCGTB0CWAY1JB1Z7rp
	abEVsPAEO4ni5XXBVYbhtJytfVhZlPS7YOVtWYeUKzo7ncahqlEm1Qi3jHZ0uzhE4tI=
X-Gm-Gg: AYBFou3Q8fWG8RTj4FSAkI36lCcEXjw/Cme7tIf0YIDifECChsuvoIFd0g/O1NKZiZ6
	B9Ip84j7is9YWnj2lVfd4QgHuzKcrlEfRNlrmu8BklAzD+6cUbspHgZuij1htQwLjKS84A9GJxl
	xNBRm0wfESx4AyR+aWexCBnj699qjBIN7aDIJ+KVWLK0DZMqHGeC6qF3r6aTdE+UgKw9XKTp2rq
	ZgrS0sWk7CtA9PkLngIaZqIUYhTHegKnff7+WMYJd4Or/9A/okg1KO5ketKbQB78IZce0I9PIAl
	N73rT8PCgixMtC50n9D7LOwh+RFLKIg0IyyUozKzBEFYN3GIzQ9QvwKHcycQ+AtK5s+enfu2WVn
	QcGvOkjwWmQY9FCm0656QLXyT1LfcZ+QU1WaSxAmlS17kVyj/2dxnOnMRFOQKofZhj+TPbmmGCB
	idP0kG4MCcOpXAgjRivKpz88jUnrQvgl/NmmgDzuigmAKOFQurneBTi7pYkzW7z+OGQw6BwSXL1
	cKet2vorRJkNeJmDqSeXBlwxRjRRs0t93/ABnzS8TjcOqn9hhjf2A==
X-Received: by 2002:a05:690c:660d:b0:8ac:e42d:35a with SMTP id 00721157ae682-8ae94ce98acmr4734927b3.49.1790978100965;
        Fri, 02 Oct 2026 14:55:00 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:24a9:81b6:f7c4:c7f7])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae328ee37asm14837137b3.10.2026.10.02.14.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:55:00 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 02 Oct 2026 16:54:46 -0500
Subject: [PATCH] selftests: breakpoints: Skip step_after_suspend_test on
 systems without a wakeup capable RTC
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-breakpoints_rtc-v1-1-a3b6542a0fdf@oss.tenstorrent.com>
X-B4-Tracking: v=1; b=H4sIACUowGoC/yXMQQqDMBBA0avIrBuIUULwKqUUjRMdhSgzsRSCd
 ze2y7f4P4MgEwp0VQbGDwltsaB+VODnPk6oaCwGo42ttTZqYOzXfaOY5M3JK22dbZwb2zYEKNX
 OGOj7Oz5ff8sxLOjTvYHzvACTQei/cwAAAA==
X-Change-ID: 20261002-breakpoints_rtc-0686388d44ff
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1

This test puts a system into suspend state and uses CLOCK_BOOTTIME_ALARM
to wake the system up. This alarm can only wake up systems that have a
wakeup capable RTC source. On systems without such an RTC (for example,
most RISC-V boards), this test puts the system into suspend and just
hangs, requiring power cycling.

clock_getres(CLOCK_BOOTTIME_ALARM) fails with EINVAL on such systems,
so add a check based on that to skip this test on systems without a
wakeup capable RTC source.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 tools/testing/selftests/breakpoints/step_after_suspend_test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/breakpoints/step_after_suspend_test.c b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
index ca2aaab9e4ca..727790259429 100644
--- a/tools/testing/selftests/breakpoints/step_after_suspend_test.c
+++ b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
@@ -18,6 +18,7 @@
 #include <sys/timerfd.h>
 #include <sys/types.h>
 #include <sys/wait.h>
+#include <time.h>
 
 #include "kselftest.h"
 
@@ -158,11 +159,21 @@ void suspend(void)
 	int err;
 	int count_before;
 	int count_after;
+	struct timespec res;
 	struct itimerspec spec = {};
 
 	if (getuid() != 0)
 		ksft_exit_skip("Please run the test as root - Exiting.\n");
 
+	/*
+	 * CLOCK_BOOTTIME_ALARM cannot wake up systems that don't have a
+	 * wakeup capable RTC from suspend. Check if we have a wakeup-capable
+	 * RTC to prevent this test from causing the system to hang after
+	 * it suspends.
+	 */
+	if (clock_getres(CLOCK_BOOTTIME_ALARM, &res) != 0)
+		ksft_exit_skip("No wakeup-capable RTC for CLOCK_BOOTTIME_ALARM\n");
+
 	timerfd = timerfd_create(CLOCK_BOOTTIME_ALARM, 0);
 	if (timerfd < 0)
 		ksft_exit_fail_msg("timerfd_create() failed\n");

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261002-breakpoints_rtc-0686388d44ff

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

