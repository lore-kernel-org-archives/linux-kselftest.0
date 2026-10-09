Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B23358B9
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 02:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511502; cv=none; b=udbFHz283TWawvA7nGjq7egXLgIC2gNaERzkfXtuXLPYzWT67dEq7FNi7angk/F8oRBOs3PrZatdaUWB3KvWXQlUhkeVz044xUbDbVwiA/GuH8vatHWfZK5560jXIWb4YfsaOfqeaXH8uTGQwNrBnpWcnDbg8c4a+XeOThKFwZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511502; c=relaxed/simple;
	bh=3PzxtR+1mBAdyRx4eV1Dnd14mhtH+QhtatlKw0yvMyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UjeyOGMpA5R83GE3KuwlZ8MDSgpc7ZZJEWDE6A19YmJOCWBwGLD+sJcMIDd0If3Zbe43hAfuDPSEsCUkUW/ejMvsTEbvbj5RWbS3KT8JWSRYQTZCcsLdLsiULKVtRVWLAxGrLYJluZTEQZQ5I2+s6teNsC9gFh+kHnKsa5aYaHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Am25ouR6; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Am25ouR6"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-154e9d2d979so3686997c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 19:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791511500; x=1792116300; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QVVHBgvK6OKW53OVYnJLSJofdOQSOkfgS/m6Zeijg8o=;
        b=Am25ouR6zcE01ixQy9ZJkl9jx274CIOw1FwoDqXGvDxoEp3ZVxjyg9A6mdlG+4xtdc
         JsLef885thzm7oWDKjK991CgsFL5hZxyzqpYW9FiYEEMidyUX3QOXGjHnXicINph7LbX
         RliNBaFESkzTIjbwY1pbnV2j4H25iUqHghSO6VpHdN96qPb1jlps1Jok+bc2bbnKImw1
         oKUx+Gg7m+Dw624XsjJGtM93pnqTo8GQu8GFHv00SxLiHEyHD9prdjHNAfarXFwkjvOj
         fPMp67oO6gsbdSq9pdtt7vwjYInCYuMlHS4fNNQjAn2re3a06v88eA/TSpsJ5w8+VFuI
         EWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511500; x=1792116300;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QVVHBgvK6OKW53OVYnJLSJofdOQSOkfgS/m6Zeijg8o=;
        b=wDLpEqImQ6TVZveNMpIK/Kcigaj2Rn7pz8/FEWBK57Ofox1PVsDOJymUX/is3gSnbE
         2IaDM/6/nMqS2iytfKRMSGN6KzuXp+AbpxfKcQUYzBX6O4ItRNWi/6h8VMBm466GDQ2M
         /0B6/9fCi39s3RV1R/HG+IgzPYLiU/jJO3h6rXXxnQtCjrtq2Vavhbvfgn+g2XYfQ2N+
         ehafV+/3n7cDg5Gf7VO3J3Jxay9r6pPHEahIi8aAFMUcuibxebJg4e4LjLgS4wYSaKdD
         S+XfxL/KmSdRyts4BGoU3PWYMw2S+Z+qGH6a45WH6t3z9aYNu8p5vN9q0czPFGsEwVhU
         Rg4g==
X-Forwarded-Encrypted: i=1; AKwUvBzGAKZWguLWELwMbzHR98yEvs26EUBWWlrEPvHBm7+jimkNXZFWlJe57/Nfs5H0xWcVdRBewvCdedzIR5tPOco=@vger.kernel.org
X-Gm-Message-State: AFuF++k8LSUTSGG0oYc+P0U5BdY2x+3IsWTkVWFBk3dPD+2Oj72G9AJ6
	jRopXMI8+MsQ93M9Ald2mNqapoLwxetom4Eh5hfxKizln72QFuh5QPln
X-Gm-Gg: AYBFou3cQpkoz0ZSYFELcbdisufOsNXjd2KrqZU3OGB4qae+tiYi/ft6dTEOsecCVFu
	rsJaZMAXjavgtsy0v3tcAnGTUgzUJssXlTSPHBTBYUc+oIfRFfJr3QSVbcc4IAG2XfNPNPJeVrX
	w5HP2rKuwGOV8qvRdowZV+4M3vk3sa7E1e7j3H43lC8NqvPi2748i13qjGaDoTjMRqNZnGO35w9
	HGC/3ChQ+KzORsOY+FTmHiUaSlWCaFB3OmFac7OrvBbo5Oz6GI0AVULCR/l4dZkGTFdi95lwjyb
	M0b/x/qO+B5y0eWlYnQLQUn8VQ4rEW6kHEbSZ9mOGC3bIl8Z6nvYdjyczAzQ7w1apLyfYZ5SmvG
	cGNP4qtJeO0Kd+UtvTkMB8neTU26S3q5LstCKumXgtTNSN90hAWL5xhyfCKTkpA3o54zBockzks
	2bp8eHsU7hCr3NZugPags+DedUOY9y/6Z9P4voPtxS4NOfd0lRXkTUHFpelXsVHWV7Hg==
X-Received: by 2002:a05:7022:e881:b0:14b:1ef8:698d with SMTP id a92af1059eb24-16a5d174c3bmr630165c88.15.1791511500470;
        Thu, 08 Oct 2026 19:05:00 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6f5csm1979850c88.11.2026.10.08.19.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:05:00 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 10:04:55 +0800
Subject: [PATCH bpf-next v2] selftests/bpf: Run the enable_stats program
 with BPF_PROG_TEST_RUN
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-enable-stats-inflight-v2-1-691ee379e511@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMZLyGoC/5WNQQqDMBBFryKz7pQkgtiueo/iIokTHYhRnCAW8
 e5NvUGX73/+fwcIrUwCz+qAlTYWnlMBc6vAjzYNhNwXBqNMo5VqUSiGTJIF3RKQknWRULItAac
 QeRgzUh9c3VjTqlBDeVpWCrxfljf8Zon2DF1pRpY8r59Lv+mr/8u0adSovHsYIuObvn4Nk+V49
 /ME3XmeX+9fkt/gAAAA
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

enable_stats attaches its program to sys_enter, so every syscall of the
system runs it. Once the program is detached, the test compares its
run_cnt to the number of runs the program counted itself.

Detaching doesn't wait for the runs already started on other CPUs, and
each of them increments count before run_cnt. With other tests making
syscalls in parallel, the test reads run_cnt one run behind count now
and then:

  test_enable_stats:FAIL:check_run_cnt_valid invalid run_cnt stats

Run the program with BPF_PROG_TEST_RUN instead of attaching it, so that
nothing else runs it and both counts are final when the test reads
them. As a single run can be shorter than the resolution of the clock,
run it until its run time shows, unless its runs aren't counted at all.

Fixes: 31a9f7fe9337 ("bpf: Add selftest for BPF_ENABLE_STATS")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Run the program until its run time shows, as a single run can be
  shorter than the resolution of the clock (Sashiko)

v1: https://lore.kernel.org/r/20261008-selftests-bpf-enable-stats-inflight-v1-1-0cb92ee2c6d3@gmail.com
---
 .../selftests/bpf/prog_tests/enable_stats.c        | 26 +++++++++++++---------
 .../selftests/bpf/progs/test_enable_stats.c        |  2 +-
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/enable_stats.c b/tools/testing/selftests/bpf/prog_tests/enable_stats.c
index 75f85d0fe74a4..691a82a4d6d20 100644
--- a/tools/testing/selftests/bpf/prog_tests/enable_stats.c
+++ b/tools/testing/selftests/bpf/prog_tests/enable_stats.c
@@ -9,6 +9,7 @@ void test_enable_stats(void)
 	struct bpf_prog_info info;
 	__u32 info_len = sizeof(info);
 	int duration = 0;
+	LIBBPF_OPTS(bpf_test_run_opts, topts);
 
 	skel = test_enable_stats__open_and_load();
 	if (CHECK(!skel, "skel_open_and_load", "skeleton open/load failed\n"))
@@ -20,18 +21,23 @@ void test_enable_stats(void)
 		return;
 	}
 
-	err = test_enable_stats__attach(skel);
-	if (CHECK(err, "attach_raw_tp", "err %d\n", err))
-		goto cleanup;
-
-	test_enable_stats__detach(skel);
-
 	prog_fd = bpf_program__fd(skel->progs.test_enable_stats);
-	memset(&info, 0, info_len);
-	err = bpf_prog_get_info_by_fd(prog_fd, &info, &info_len);
-	if (CHECK(err, "get_prog_info",
-		  "failed to get bpf_prog_info for fd %d\n", prog_fd))
+
+	/*
+	 * A single run can be too short for the clock to tell. Run the program
+	 * until its run time shows, unless its runs aren't counted at all.
+	 */
+	do {
+		err = bpf_prog_test_run_opts(prog_fd, &topts);
+		if (err)
+			break;
+
+		memset(&info, 0, info_len);
+		err = bpf_prog_get_info_by_fd(prog_fd, &info, &info_len);
+	} while (!err && info.run_cnt && !info.run_time_ns);
+	if (CHECK(err, "run_and_get_prog_info", "err %d\n", err))
 		goto cleanup;
+
 	if (CHECK(info.run_time_ns == 0, "check_stats_enabled",
 		  "failed to enable run_time_ns stats\n"))
 		goto cleanup;
diff --git a/tools/testing/selftests/bpf/progs/test_enable_stats.c b/tools/testing/selftests/bpf/progs/test_enable_stats.c
index 1705097d01d7b..e28d674fc77ac 100644
--- a/tools/testing/selftests/bpf/progs/test_enable_stats.c
+++ b/tools/testing/selftests/bpf/progs/test_enable_stats.c
@@ -10,7 +10,7 @@ char _license[] SEC("license") = "GPL";
 
 __u64 count = 0;
 
-SEC("raw_tracepoint/sys_enter")
+SEC("raw_tp")
 int test_enable_stats(void *ctx)
 {
 	__sync_fetch_and_add(&count, 1);

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261008-selftests-bpf-enable-stats-inflight-edfb36a280f3

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

