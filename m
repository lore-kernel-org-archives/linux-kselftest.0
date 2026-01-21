Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A354611E7
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988572; cv=none; b=GYxkZCW7F/0EsUUSWx2/E+scqAQLqkOFmRd7hd5NIeU36vfcCrGfcZaHZ41SjCi/raCw20HfrrEwkmHHtNmu2u5hxj30V64r9W/OEBlOJCMiFndQaqPFiYBogJ8h8UHnqZt0LqJXXlZe53ripo+3twG5EHJ+pt1/G2DMGL6VtvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988572; c=relaxed/simple;
	bh=u7um/yROV0Uoc6Lyio+e+E+tFGmnAo1AVUvWvMlK77s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=inKt+UvWfdri3m8h0L3Q1nmv/JUahaUvjTTquF29k71N+d8I/XnGjf+YOhGoGF/fW4xI6doV38LONgttOZ8WBKKvAUAq4Jv0ZBwjJnv4mmTkw6Id4BpnG1YvQkIXXw9E7wLklOkZK3IxCAdz7s1Dp1pmAZoyp0E/ayXkkaJk/MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6GkV8cu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6GkV8cu"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a7b47a5460so1117925ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 01:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768988570; x=1769593370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6crH5fiQLouF15MwsFqqEri1pA43lFVDbD7kBDfCmV4=;
        b=L6GkV8cuMRL1Z+LTFZjcZ2ISHcEZUIQ0vgCJ0FdVPSYFsn6wvv+kr68r1zkuAyHAMM
         JSaDhiHJdHSiGhE2RnAkfw0vYRAI+PylmmYzrPJx7p2RePu/AFyc1KdS+qcpnmfCWoeY
         9nGzgn6HJIuhifXbeElI7gMwySWBHzRgGUUMpuyh1KsHJfnuc3Wv7Lt2VoAzfjiKOlzz
         6XqWc6KyTO2moFbYR87JIHy+nxJcb8ukrdmeYAfNIYDyNN5ki2ktFTQdV433u/WG1qvd
         DUyfqqsaSNBXMhiC9QCtj50OjszazAwbou1Xl9JK68o131FtlX6BvCC67nkmS/wB+e6H
         eGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988570; x=1769593370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6crH5fiQLouF15MwsFqqEri1pA43lFVDbD7kBDfCmV4=;
        b=KIxjT9cSEs5vCIu7uDVnwkmPmlJLHk9bYItjgDas3EGm5HprrUi6UxClntPjSPxcRP
         WVJ7WDbMF/u+aYfJeWbvfhNxmhXQ/uYigFZB+SUXxKN3A70/VtygBtVdl6DXwoSV62BG
         dSCxMZ7nb5t0HNuVy07egaI2bTFpr20OqdMGkwMyqu3wmNU/mKY8kn7UCxYvq6iLBmt6
         CdzI1Y5WKgb1DPUgpNj+7yhVJDD12H9n0V4KXR4BMdiq/XkykeZWhozv3T2P8rwRSvTN
         JWLdVG94OAiEXxav8JCes2xV61l6R43AMnJ+pPUqNq5nr0+LnNfVKfHkBhfHLuXpg9zA
         PZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCVm348SRu/7EXaffm/aGT+7uI46gFz5m5kw/WkB1R6uZZWz5Buzmdn1XS+y1xHGgB+PPRuAlBx5FRMeVV92j2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3hHk6Gqoa3HmN7ySp7P+ne62B6DUZaSIz1uFMdDtsF9GDsHbC
	dRn+rHU5K+NdCZBkZy7VYujY6N4GSVUZh1V4l6JrEfPKA0D867tX9oA=
X-Gm-Gg: AZuq6aLXkByDWJJaRJzj3uFB9eYyJae9vS3mPul6WXLAaD4aiEMlpsBf/VX0zxbSENJ
	ahsxpyfvmw456x7HNxGPgsXY3jBMuv0JkDkQ78mKFfB3PDk/m6Rfh9ppBpocAbJuVoU4jEusEvK
	XKoAyfOEg1h2QLIkYhWf4dl84TZOzhfGS6oLHN01n0Yl1+soi3zWl4wWiCia3aOuxPUNzUdtjhx
	mXZwOvQgVuJzhfwY20jaP9XitJHKjfRvC7oXQsvABzGy20/OE1sJQZJQyputbH9dW/AByb0/FHR
	P5j7ubw2y+09WoDC17SWq7qnMKXIlm8IegVxhM6KsPQ5//hCvwOmsntuPQIZxi1mlU+KQVScko1
	iJpahSAZjX4BjmSbb2Gc7ILIbdccoo+CsIBsOmYXtZp3vJfJBg9k4c38FdDNofcEOombjPCxgcJ
	+2iEFENAie4xt1+QPSxRbMFAxwcg==
X-Received: by 2002:a17:902:f745:b0:2a7:9163:8e60 with SMTP id d9443c01a7336-2a7916393a6mr21147595ad.23.1768988570185;
        Wed, 21 Jan 2026 01:42:50 -0800 (PST)
Received: from DESKTOP-BKIPFGN ([38.76.140.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a770945806sm40536875ad.70.2026.01.21.01.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:42:49 -0800 (PST)
From: Kery Qi <qikeyu2017@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	shuah@kernel.org
Cc: martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	yatsenko@meta.com,
	bentiss@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kery Qi <qikeyu2017@gmail.com>
Subject: [PATCH bpf] selftests/bpf: Fix resource leak in serial_test_wq on attach failure
Date: Wed, 21 Jan 2026 17:41:16 +0800
Message-ID: <20260121094114.1801-3-qikeyu2017@gmail.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When wq__attach() fails, serial_test_wq() returns early without calling
wq__destroy(), leaking the skeleton resources allocated by
wq__open_and_load(). This causes ASAN leak reports in selftests runs.

Fix this by jumping to a common clean_up label that calls wq__destroy()
on all exit paths after successful open_and_load.

Note that the early return after wq__open_and_load() failure is correct
and doesn't need fixing, since that function returns NULL on failure
(after internally cleaning up any partial allocations).

Fixes: 8290dba51910 ("selftests/bpf: wq: add bpf_wq_start() checks")
Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/wq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/wq.c b/tools/testing/selftests/bpf/prog_tests/wq.c
index 15c67d23128b..84831eecc935 100644
--- a/tools/testing/selftests/bpf/prog_tests/wq.c
+++ b/tools/testing/selftests/bpf/prog_tests/wq.c
@@ -16,12 +16,12 @@ void serial_test_wq(void)
 	/* re-run the success test to check if the timer was actually executed */
 
 	wq_skel = wq__open_and_load();
-	if (!ASSERT_OK_PTR(wq_skel, "wq_skel_load"))
+	if (!ASSERT_OK_PTR(wq_skel, "wq__open_and_load"))
 		return;
 
 	err = wq__attach(wq_skel);
 	if (!ASSERT_OK(err, "wq_attach"))
-		return;
+		goto clean_up;
 
 	prog_fd = bpf_program__fd(wq_skel->progs.test_syscall_array_sleepable);
 	err = bpf_prog_test_run_opts(prog_fd, &topts);
@@ -31,6 +31,7 @@ void serial_test_wq(void)
 	usleep(50); /* 10 usecs should be enough, but give it extra */
 
 	ASSERT_EQ(wq_skel->bss->ok_sleepable, (1 << 1), "ok_sleepable");
+clean_up:
 	wq__destroy(wq_skel);
 }
 
-- 
2.34.1

