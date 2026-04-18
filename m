Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271FB337689
	for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 18:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776536046; cv=none; b=kXlEiSwpijA8os1MrxnXyvNBhEGciYQXEVbGoqBMtXCbjjPU0v3tneCi6HWIHDhnFgN6cu+1cI3ppvAEbClvLRY9UJCAyaJZ4GLz5Q4QJATgNVbSpRsSSzI0ff/T6zNhGUrSc+L5L3GGD//PXXUTTLJkFeRfgXfLgotpm+Zp+Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776536046; c=relaxed/simple;
	bh=7RBn27jm2AVfQcHGM0Run5F5ojS7pQWf7fH3/FxJq4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZG+RsdsOsgmP89Y5bHlDxp3PU/zIHrSuscM175IWAj/95pBI06Y4D97LkIZLfgk0RznWXCO7bzet9cANZQFLvLLt9NCInKjj3INQ7bRGVmluw2lH1D17W2bxrl4nHiadTHjssEhX2bJY6vhcoFFeije6XBeq34LDcAv5Nn4ATSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eALkrFDr; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eALkrFDr"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82d0b68837aso1073217b3a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 11:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776536044; x=1777140844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEq5CzQFwtAXQUDE7BtOjkL3C6G38PVDQBhAKTNWHjg=;
        b=eALkrFDrAHvlzw/c96wLEydh0GLNFhsEgQGrlraVxNIpyhKmp5Fpp1HMnk0KKfOYar
         JGKusaA17cJdbHEQzA3wK2QiiwwA785o6hIv8Uin/hqLXbTHDa0/0FD5UT0SyAhe+0Af
         3dow/EBliWkLfRdZnywsnUiIZ0OTAQokGpUihUdSwzWr4Y/CUM1oWow83us3Y1YwrKRT
         GFbW8TXEOzob0UOmwmZ67/1+7TecuXQxK6QgNhP5Uw5FjZUURDvdkWQ2w9lExyFYKLgl
         +oT3DztYSiWmWViHF3+h+khG7RwgCreu7rWrNsD5O4O34b8BRr5y08SBkdbFt1n/dNCb
         QKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776536044; x=1777140844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kEq5CzQFwtAXQUDE7BtOjkL3C6G38PVDQBhAKTNWHjg=;
        b=KFOE0Kh+skyPeFs01vMCBds+3KAeTd2aCdhUJkcCksKfjFMbp/KIUS+T1EIP6NMEPj
         n/RX7RKRjp3dBMmljXJQ6Qw4uF1fBbDvE5HFYsJ3KZD6ohQ8ndsPpLK+l3IyxTLvGoaR
         FvAVPqH1eMn3UMYc0WHP1LHCPN7g0ifsMfcuspV6iQxL26XYey8L4wptLtvtyNS52RF0
         xqBrBxVkls+GnsOCFHc1IQ+MFkPTXFZZwG6vafnOn2VCtTZPCboQbs8ZN8k/6ORF0e1y
         DGLnmFTyu0upLMnIzuQrQ/NyvCK3/j6aeXzhltI/yNVatYHgZn7Z8SfrJ8LiAsNAnhsk
         pJNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4t/t3Af++90ksq532f/45how65bOdjsGkwhD01YDitjDzWXfM1L3ZxlVMm9MJZhl+dMp/ma3S1Apr/ouQXX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmLrCkBFwJY8BbLV9HIF6qHqyV7RKhp6HWScZVa+7uN76Bp0RA
	H0mPWfYZQx0p+0xO6mes9S6KrgCjsXIhonUzb5+687Y4kfWHCtMxw513
X-Gm-Gg: AeBDiet5W+jxR33gA7J+jrjYt2hAJDGoAgag52ywa/SaCi/Z2fjw4JtpZQdWl2Fpdzl
	/fGSVkN0/C3o1c9kXz8KOWLogGeS2wLg1OiUCHtPoOWT/tDNb8Y0eh/bD0J+cEHhlCVt3GwlwFO
	gafhQFn8ZPtl4rl6pL84KRrmbHz0T8AmG+fen1c0tsdFxMpQ2Uj6C1ZLvUlTvI2i2xCW6c5NXMa
	XIYw4SB0lJYbJHfQD+1+yCdFQdQkuQbd2CW83G41v8ncnJNkFOmmcyPMw32CQkmdfk7wLADrIwn
	oWTgeBDCL0t38rllw02vQ6d3sX4dzStMdaQXToe43/VdROmO6aoEmEi7O2FT80cbrVafvdyom/o
	PN+zZN+3IlM/eM9ntw8IVpEwYxH63S6lkvZd32IleeX9O+p5crYOFRCp+1ldxWrIXNQo7owKig4
	QmA9Aoytu6BinozVeyuoiOy7JJCOTX2aDmQcBn+XemTkOZdo55SHsQdGfDtoOXkg==
X-Received: by 2002:a05:6a00:14c2:b0:82f:8332:4933 with SMTP id d2e1a72fcca58-82f8c7dd158mr7842814b3a.3.1776536044462;
        Sat, 18 Apr 2026 11:14:04 -0700 (PDT)
Received: from DESKTOP-MUHC17F.tail07b66e.ts.net ([188.253.121.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9f7735sm5659402b3a.21.2026.04.18.11.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 11:14:03 -0700 (PDT)
From: Zhenzhong Wu <jt26wzz@gmail.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	tamird@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhenzhong Wu <jt26wzz@gmail.com>
Subject: [PATCH net v2 2/2] selftests/bpf: check epoll readiness after reuseport migration
Date: Sun, 19 Apr 2026 02:13:33 +0800
Message-ID: <20260418181333.1713389-3-jt26wzz@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260418181333.1713389-1-jt26wzz@gmail.com>
References: <20260418181333.1713389-1-jt26wzz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After migrate_dance() moves established children to the target
listener, add it to an epoll set and verify that epoll_wait(..., 0)
reports it ready before accept().

This adds epoll coverage for the TCP_ESTABLISHED reuseport migration
case in migrate_reuseport.

Keep the check limited to TCP_ESTABLISHED cases. TCP_SYN_RECV and
TCP_NEW_SYN_RECV still depend on asynchronous handshake completion,
so a zero-timeout epoll_wait() would race there.

Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
---
 .../bpf/prog_tests/migrate_reuseport.c        | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
index 653b0a20f..580a53424 100644
--- a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
+++ b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
@@ -18,13 +18,16 @@
  *   9. call shutdown() for the second server
  *        and migrate the requests in the accept queue
  *        to the last server socket.
- *  10. call accept() for the last server socket.
+ *  10. for TCP_ESTABLISHED cases, call epoll_wait(..., 0)
+ *        for the last server socket.
+ *  11. call accept() for the last server socket.
  *
  * Author: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
  */
 
 #include <bpf/bpf.h>
 #include <bpf/libbpf.h>
+#include <sys/epoll.h>
 
 #include "test_progs.h"
 #include "test_migrate_reuseport.skel.h"
@@ -522,6 +525,33 @@ static void run_test(struct migrate_reuseport_test_case *test_case,
 			goto close_clients;
 	}
 
+	/* Only TCP_ESTABLISHED has already-migrated accept-queue entries
+	 * here.  Later states still depend on follow-up handshake work.
+	 */
+	if (test_case->state == BPF_TCP_ESTABLISHED) {
+		struct epoll_event ev = {
+			.events = EPOLLIN,
+		};
+		int epfd;
+		int nfds;
+
+		epfd = epoll_create1(EPOLL_CLOEXEC);
+		if (!ASSERT_NEQ(epfd, -1, "epoll_create1"))
+			goto close_clients;
+
+		ev.data.fd = test_case->servers[MIGRATED_TO];
+		if (!ASSERT_OK(epoll_ctl(epfd, EPOLL_CTL_ADD,
+					 test_case->servers[MIGRATED_TO], &ev),
+			       "epoll_ctl"))
+			goto close_epfd;
+
+		nfds = epoll_wait(epfd, &ev, 1, 0);
+		ASSERT_EQ(nfds, 1, "epoll_wait");
+
+close_epfd:
+		close(epfd);
+	}
+
 	count_requests(test_case, skel);
 
 close_clients:
-- 
2.43.0

