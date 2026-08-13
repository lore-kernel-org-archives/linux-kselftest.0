Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC3A395D9F
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 22:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658428; cv=none; b=UwfSPttlIs1ov0nnuim7UMuptvuV4EHMCz6pjMzTHWpmH6xfsqkEsKaf8jhlqZfLDiHcdKELuB2yHZlZv3v8eOK8mrFJ5GV580aaFYEiEWm5XyEkHkJ/EHVgweq2Lfw6jJmHax+NHVq/KbT7ik4k31k4oU5mTnGc2wUfeWmfdk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658428; c=relaxed/simple;
	bh=RMeGTOEbM8dieI8j+EDh5WMW8HN23IZPs2MVxpaGdhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPfqrFPdODPUqSdbqAUqKYh29SkYSeOL10J+Mkhwh/VIzV2xCudZqmEZ5T6433nQLffeoGwRTUlYr3bKbmO68bKHRgjkD6fmVfFXRAmm97ZDvmCIaULExlqfo71liEFd/Yh4m6+WVp1COAem7ieW9RiMM/05j6juda09l8OhKBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=dwBQc+xE; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="dwBQc+xE"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4a416619cb2so204096b6e.3
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 15:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786658426; x=1787263226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPDr3ZJlS5GTxsyqliUMtwR1qFNPfxJRKflCt05bQVg=;
        b=qkFx9tmmJFRDUQGno/3ePMSCYeDCYlIK216v+lUBSXdg23m0ltw2B9m+Tm9XIoXpo7
         /Zgl3qdX6U4BglEMoxaWMH+jHJ91EqDFOlLNqQEFMnDrJu1yQbN6g4LHhgkG0D9yxP46
         Hgg0QoZXoyk16zywYSEUQaHKObYuVl233UOjYxbEaLpm34jr2MoF0RSDZ/2kE5mNvGGa
         YZvKuA7lGfdU3b21pFGMuwrGxil06C1pNgQU4D7I9TPnOE0s3Xjbbu59P+DSu0XmxG10
         YcO0V1dhAc4N7/QjEGr3lEFDQY1Fi5JVNtUGqMRJB58s+FsmUktM25nqrDLPEYDaU3zu
         49Fw==
X-Gm-Message-State: AOJu0YyTU0zHHdSVlZ7bqDG98oGHWxPGZdEjpq0TZm+w3OBHoiAsRqM/
	fpSAjTQcYMxANcJFjoIUAJejNcxvNxilmuQDsOA+cu9V6CLzzUyDWBti
X-Gm-Gg: AR+sD10jm0zh8a2P51U87nHryZvowr5Sr5a3AbHWk+Oq75kx0Z/Orn7j/SLBjt5nxIz
	X0i0LhLAhYEa/a8TdnCt/wwR+BCcWyzOBUYhYCucqos4ILau7cMrEY49hPzUEZLIeId0xCHOWhm
	xx6a7Eu4YA68977JlCAlWBLuFcGpIS+1mWmSnuyJ2HpUR2QzogNIslLGwOrCc6fyr73GWglDIXv
	XhH4vJW6LkJXpq70aocSKBripeHYJ6TtaHuBoZHbupNZoiBQKmMbTj8DPGNLMGXVg/0nQ03xY2+
	V1bUUuO1vMDYBERFSxfCkgU9v5hc2mIPaJccg0K6p0/90cuIMEOMHyOpF1UbSTCmzfPdRCbOSpY
	vYbAiJPtRzcsgd95LH9e7weN+G94+lIxqpxl+nCB3svm4R3AiLdHrRD4DrCkv/miCALY7RlocaY
	iZHeyd0XmfsDNL9Is511/Kw6UJPUdVKkVWhZpqQWzqBjvQ08l1eF42DgpRRRljV/ypz6KCrWthZ
	Mq1wiABQ0Gxqp/CiaWKyqMaiJqNMYxGvbbtux2YWyxvG8Be6hROWopR+5Ec2HrIMA==
X-Received: by 2002:a05:6808:6808:b0:4a0:cf55:3cf0 with SMTP id 5614622812f47-4b24152d08fmr1116474b6e.9.1786658425531;
        Thu, 13 Aug 2026 15:00:25 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b22cfb1ea5sm2686341b6e.16.2026.08.13.15.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 15:00:25 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D0C960B53;
	Thu, 13 Aug 2026 22:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1786658424;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cPDr3ZJlS5GTxsyqliUMtwR1qFNPfxJRKflCt05bQVg=;
	b=dwBQc+xEEO8Lem0UqHc7a+xb1HKh8t1Mon7PDhApH2sdDGzQNN5EesIsU0WgzfFujf1Nky
	pnx5hVPZHEZgrrs3N7GJSbbA7gU75kXjCI7xUMVfauJS00bXrzQgG7dePjwTMzCIaTj7bp
	2dkv7FWVj4R1UTzaqB/4lPAaFWQHSvclGoYwwO+Vzuv97FnFjowZe0RL3ID4zePydq+yW1
	se69TfHUF7ruxldEqvJ+Sq6GhY7Lt+qXvNRUxLV7ByPMx2F+B40VpvIfOt9RiMvBE+ah0o
	mrIctsR13Ahd8VURzv8kx6L80B09idparmt53RzLXnz1yFlpl7oKDLQuisAJWA==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Thu, 13 Aug 2026 19:00:04 -0300
Subject: [PATCH 7.1.y 3/4] selftests/bpf: Ensure UDP sockets are bound
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260813-7-1-y-selftests-bpf-udp_xsk-v1-3-cd5c51e7dcec@marliere.net>
References: <20260813-7-1-y-selftests-bpf-udp_xsk-v1-0-cd5c51e7dcec@marliere.net>
In-Reply-To: <20260813-7-1-y-selftests-bpf-udp_xsk-v1-0-cd5c51e7dcec@marliere.net>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, sashal@kernel.org, 
 gregkh@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>, 
 Michal Luczaj <mhal@rbox.co>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Jakub Sitnicki <jakub@cloudflare.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1786658405; l=1781;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=e5SB35u/vSYta099gqNsW1ZXfGRvMi7KbdZiL0YQZvQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEyquNT6uZ2Fxa6C+zrowcs8rlT1fTP/cvbiH4TBJWGkEO3xPD/RHonB8/fso6lAWNK61MWpzww
 2AlGkAzKf/A8=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

From: Michal Luczaj <mhal@rbox.co>

[ Upstream commit 65f46946e951373275d793b35129a7c3ebeaaf51 ]

Update sockmap_basic tests to bind sockets before they are used. This
accommodates the recent change in sockmap that rejects unbound UDP sockets.

Signed-off-by: Michal Luczaj <mhal@rbox.co>
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
Link: https://lore.kernel.org/bpf/20260707-sockmap-lookup-udp-leak-v4-1-f878346f27ab@rbox.co
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
 tools/testing/selftests/bpf/prog_tests/sockmap_basic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
index d2846579285f..b4019d1a5575 100644
--- a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
+++ b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
@@ -807,7 +807,7 @@ static void test_sockmap_many_socket(void)
 		return;
 	}
 
-	udp = xsocket(AF_INET, SOCK_DGRAM | SOCK_NONBLOCK, 0);
+	udp = socket_loopback(AF_INET, SOCK_DGRAM | SOCK_NONBLOCK);
 	if (udp < 0) {
 		close(dgram);
 		close(tcp);
@@ -876,7 +876,7 @@ static void test_sockmap_many_maps(void)
 		return;
 	}
 
-	udp = xsocket(AF_INET, SOCK_DGRAM | SOCK_NONBLOCK, 0);
+	udp = socket_loopback(AF_INET, SOCK_DGRAM | SOCK_NONBLOCK);
 	if (udp < 0) {
 		close(dgram);
 		close(tcp);
@@ -947,7 +947,7 @@ static void test_sockmap_same_sock(void)
 		return;
 	}
 
-	udp = xsocket(AF_INET, SOCK_DGRAM | SOCK_NONBLOCK, 0);
+	udp = socket_loopback(AF_INET, SOCK_DGRAM | SOCK_NONBLOCK);
 	if (udp < 0) {
 		close(dgram);
 		close(tcp);

-- 
2.55.0

