Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ABF7080E
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646463; cv=none; b=P9lFfHf1XWPLVRULE/TZBMqyapn0ALYd+19UZHWk9w9PTHRxGCcR3t69D+l3kp3Xa2aRTWj04QJGt675fUbufs3598Cdywq083G344ednXU3AiglnVs5ChKEIxxnChOUvkNwQHXVes6CE1lwS4mjQMM83DR12loFLCDomVssycM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646463; c=relaxed/simple;
	bh=IqUaZKF+nwTuN1re1AFZQs0CX1BJ7DOi3AgNK8zWc1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ok5az/WvAXpE8sJqJGXFFSueJPZPkj5FcrIpXqoHquFBesc3ZNJwoSFUfJJCRRAvba3DmwyNv8uc1g0tq8c0H+94C4nbAILycva+v1MfAk7w0yI1A1Uw9sVgz2WVBgfSB5m1u2L5OP9OBmtVMA6ov1ynvAcvylDNMKr2BzZ4b9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SM7hmDTk; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SM7hmDTk"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79881805788so42489267b3.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 00:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773646461; x=1774251261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TYofxbTxVeUb8gRUtgDsMF1YdvMI5jrpYMWP5TzQcpU=;
        b=SM7hmDTkx0DormTDHnC6ff6vhhLnift14Y7cpQ9C4xIVBTbjBniqAK3ZYFmYGK7YR8
         VoiBdN3ejONTZ/XWtcITaa2S/dp82UA1WL6CIh6cXXGW7hOP/IdA9Xc+Awoj5EOgyQTA
         +lGqgpY93gXykfoSMZFnz11wQ3Ha7KCdpLpc9+PQtnPQrvHtp3qkm7j3SQjSAuIlOrUc
         yD61tqj8Rim7j5X2vEPEa81Z9gw00yPFGQyDS+eQZryT3Dvv01ArfMxjATJWDWqlUVW2
         KQP9FxNEP7wT23x6hGdcAWo3bX7r8XwpUzDuvJDNbaeLYi2HVK30m4gAWSFcaoFJuPHc
         HmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773646461; x=1774251261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYofxbTxVeUb8gRUtgDsMF1YdvMI5jrpYMWP5TzQcpU=;
        b=WTAOqzS2JMA1VCwRTh+bkOSKGtAMqzxZGuEDeeDA9Oi8Dcw9seW+t1juRudek0P/Ah
         8YxicenjP4Vimr9UgaNcwl9UHpOCjYF4QxgNgPrZKLTAKRrldBk8/0f2LNmTmJqInhfZ
         VHAkWpWe63zAsIdYDilf8m+NyyI8bnv0nAjkzkd7AlB/v7bw6YDlCMIjkf2cFONiEroO
         uBINiDR2tFgK78/XF02ABAsbr2KqM6wh9K46k/2Xvgm98/iHn2k5hsiOhhCKB9F0JDuH
         NbvNiPdLZz1XM+/F3M5AnX5xNgXlD6XtILft+m7kfkBUOQnFGWkEsNhIuTxYVz5DZbyx
         E7XA==
X-Forwarded-Encrypted: i=1; AJvYcCU36nOu/JQrI8CwNL002/NkMWfJtI3w48VEXag/azF107vdIajHuYq2DKoa57i19mYH9IulGjN0VeBqk/bzldc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5N/NT4k74Q15ZODCPsOVwpgKRZMzva7kxQQxWihVK4Er4h7uH
	Lp3ciW9UJ5N8SF8VhsnMmUhiQIqXwfXsxNSHp4p7vhZh/VaSM5+Bc0pn
X-Gm-Gg: ATEYQzxSqQRoomt61ozj7cbibkSU0vOqqHlxTC8rtX3rrQj5HWyWFVTLblIWkxr31TG
	vBGn5iDS+TqKifUFsCE0N3F4xuZ9FCdhlVeylxyUpt01hpAK8voGSzPloyh+pWVuXfEnJit9ofk
	YkNllpIF8KR6mHklChb+S2MME0gEw+V937cSWZHzYvCkH0Z0WQdhkYfNoEK7kGXGHWj1Ve6m3tY
	GiZp4+SSM0ZRNKWnTnBPBRewSdI9DlJautw+JCkefUjy06cwdYmVPSj+o186vyq6MYYrIgCwXRK
	5BU234ZjqUF4z9b4Oyj1nXYK8r093N+WAFleU1F/N/vkdMYMcUPHC8NPbtW41+MsDuo/MJwxqoA
	ERrcQTKVCQ7kpNb6HxLGXBnxxjCVZFuQDXdpKA8urqpQGG00RoXHCQjs76YdJjls4X3J5LU7gbj
	qr6Lxj6qmfO8AObmSnFnTyuuRIagpqrF4DQ7q8ofAIdnkxvQimzs9rQXszkOrxyWZHPAw0BUfUt
	cgSPxMvxxpRmxUZGZ0JOIQ2Jf2EHW/h5kx3Mw==
X-Received: by 2002:a05:690c:4484:b0:796:2fde:5dbe with SMTP id 00721157ae682-79a1c1c0293mr112773817b3.44.1773646461577;
        Mon, 16 Mar 2026 00:34:21 -0700 (PDT)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a3bedcsm5250551d50.1.2026.03.16.00.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:34:21 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: andrii@kernel.org,
	eddyz87@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] selftests/bpf: restrict ns_current_pid_tgid updates to target task
Date: Mon, 16 Mar 2026 15:34:09 +0800
Message-ID: <20260316073409.4040-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ns_current_pid_tgid uses a shared syscall tracepoint for
current_pid_tgid tracepoint subtests. When selftests run in parallel,
unrelated tasks can trigger the same hook and overwrite BSS results,
causing false failures.

Store the expected pid/tgid in BSS and update user_pid/user_tgid only
when bpf_get_ns_current_pid_tgid() returns values matching the target
task.

This prevents unrelated tasks from interfering with the test, allows
dropping the serial-only restriction, and removes the obsolete TODO
comment.

Tested:
  ./test_progs -t current_pid_tgid
  ./test_progs -j$(nproc) -t current_pid_tgid

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 .../testing/selftests/bpf/prog_tests/ns_current_pid_tgid.c | 5 +++--
 .../testing/selftests/bpf/progs/test_ns_current_pid_tgid.c | 7 +++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/ns_current_pid_tgid.c b/tools/testing/selftests/bpf/prog_tests/ns_current_pid_tgid.c
index 99c953f2be21..e3938bb48151 100644
--- a/tools/testing/selftests/bpf/prog_tests/ns_current_pid_tgid.c
+++ b/tools/testing/selftests/bpf/prog_tests/ns_current_pid_tgid.c
@@ -34,6 +34,8 @@ static int get_pid_tgid(pid_t *pid, pid_t *tgid,
 	bss->ino = st.st_ino;
 	bss->user_pid = 0;
 	bss->user_tgid = 0;
+	bss->expected_pid = *pid;
+	bss->expected_tgid = *tgid;
 	return 0;
 }
 
@@ -200,8 +202,7 @@ static void test_ns_current_pid_tgid_new_ns(int (*fn)(void *), void *arg)
 		return;
 }
 
-/* TODO: use a different tracepoint */
-void serial_test_current_pid_tgid(void)
+void test_current_pid_tgid(void)
 {
 	if (test__start_subtest("root_ns_tp"))
 		test_current_pid_tgid_tp(NULL);
diff --git a/tools/testing/selftests/bpf/progs/test_ns_current_pid_tgid.c b/tools/testing/selftests/bpf/progs/test_ns_current_pid_tgid.c
index 386315afad65..d02c182a7100 100644
--- a/tools/testing/selftests/bpf/progs/test_ns_current_pid_tgid.c
+++ b/tools/testing/selftests/bpf/progs/test_ns_current_pid_tgid.c
@@ -14,6 +14,8 @@ struct {
 
 __u64 user_pid = 0;
 __u64 user_tgid = 0;
+__u64 expected_pid = 0;
+__u64 expected_tgid = 0;
 __u64 dev = 0;
 __u64 ino = 0;
 
@@ -24,6 +26,11 @@ static void get_pid_tgid(void)
 	if (bpf_get_ns_current_pid_tgid(dev, ino, &nsdata, sizeof(struct bpf_pidns_info)))
 		return;
 
+	if (expected_pid && nsdata.pid != expected_pid)
+		return;
+	if (expected_tgid && nsdata.tgid != expected_tgid)
+		return;
+
 	user_pid = nsdata.pid;
 	user_tgid = nsdata.tgid;
 }

base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
-- 
2.43.0

