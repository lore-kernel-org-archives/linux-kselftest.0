Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698807;
	b=AO7RGdrYRmZQIszDxUZtC3aPaCtxdSDcOzKbjuXRzUhKrcnlg5pktk6TkTA4IBy1fCUZ
	 6dcpEz0pUxtfMntmPjBk/NDNwVtGkfoE5BYUZ9lU9BBjwFce8vwXKKGDgtsXxYvZKFwEX
	 SBaeHh1hKHvLi0UuoDlm+1UbcNsrw+KBnZeAvccpG2dLrm19urdZC6XIZj6p2w5vSXBb2
	 +a5Rm/JoASo097bBBMXEKz0hBnlcGHlOMjgcVxcWqUh55oVxb5Isv6X3hk4tPyzOKXA8c
	 RihNy86rNm8S2NktuE8prTi0H5s6u8/Ga3so0/mEz+bMGIIH160yP32A5bUd9Dy0Q4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=daRFrpcIrlH42tetS90Eak1tlN3MgASpqpr5j9a3ui4=;
	b=DOeLydgLGk/mUGU6hJJk62M9zvwJJagA0HLTqHyEKPTaMkzkEWZqlrHSCjrJRLvSXqGt
	 snL6OZ3ddRpUnN056m5mm/9kkiAkuEKw6cnky5ky125LRDMPODaEvksUd0o6uhrgOK1mj
	 u0Wdd+N1XK5/HCaCgvC9HKWLJ6TdPVIqRIv1DCRcc0x7F341jLqlqdzXW7MkPtkHQXu18
	 j8i8PqcWdKxfGRHIdsp0k6tMBwuGiXxE7igSrbE5Y9YzyJzuggzXY9HhfwyB6iX7RfrUT
	 fXouGICun36Qr2aNTGUNDA3+gNGtnBRI31Y3BvGsdIGRWOUCKrpm6sdrCwkEuvP7xJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxyvLAly;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7456C606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 13:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7456C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxyvLAly
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491971ac844so6235771f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 05:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698806; x=1796303606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=daRFrpcIrlH42tetS90Eak1tlN3MgASpqpr5j9a3ui4=;
        b=mxyvLAlyUVE+0osyMFx67YYa0114KEwR80/ILtfHiAA06149BQAbxGOFGwWpKis++i
         vp/WieV9Or02ciaLI4k9Zs5qsmgIlb/CsH3RIO7OwoxKTisggAGnXAnlr2P19JR6e5UC
         cor3LpmMwQUU90h7Wap+H58UpLiodl+V6i9RHC1hNiym5ndproAqi0U8+aHpRyxlwuSE
         j7zj23IKUlSx0v9T+mNXDatA6LhXuIh4K0RhA/ay8rH9ONHZTZd2RTrWPft17ANAjRo7
         wIsSC+bNTK0oamz1+AGbArsgfr0c6o1rRyY0yl4Ir1n+pURb3OV0cGqdh7jdOQ1cgc3q
         kLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698806; x=1796303606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=daRFrpcIrlH42tetS90Eak1tlN3MgASpqpr5j9a3ui4=;
        b=GAy8+dvvs07LM99z7VWNhbOcSz9oCCCcF3umeb6Qq9hDYnrlEiGhSm5TPdGKKM5IDU
         FGmf0YHhEeMO1Hu/oRvXYDnn32omRh2vpAoNHl1rIsGc1ReDKmREp6k67XOCOBAv6H1d
         4I+0idfo9EChackWEGYMQWxkPkgTbJDqJSiEEYC1JBo+V8iIIGfF/Gcr9MTG8FZiKEVF
         YhVcfvvjXdGVYzRkgErZMIFu1h5QGlL2iaS2/5i8IRyx1e+5QdSZl3tC7PhD7G1eBKZN
         aCFX6zKRxkbQUEFyRaZ22eBhMSO0UJ/sB+q4bobzIo59eNTK0HR3xsdzZinhOkESHYud
         xNAQ==
X-Forwarded-Encrypted: i=1; AL+hErEtylDe35+wViveRIIaigK884bOjpj8obsJdNsxVsIQ0JZ0Vu8Ep2KNuYJrEfZGCdzmTFgwm1F7UleQ+fPJSlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kdPArmQ1lMEYneIAu842fa+5SD87NEfsgLm6DACcRFFk7XamF
	PMOqBgcUlJHwhL6lPX0DVcAHJ+NkrltZERhs6nbLNVA4fh8/JBu+C/7q
X-Gm-Gg: AZFdTZcllwSjKXdFYj1S8+t6DsQMSPPJ3JpeWI10/Bn+RONcV009FldiNh/djnKRvAo
	FCD/v5c+f5fDYQB9TSKTOWeOyBg1n0zBFAIpm6jij0d68EajQYW0e19ej053eA8cUkaqP9RfSm5
	gFSbv+4w3cwQekfh6fZ1Dd3+JEKMt8uPOYxnjP4GIkyyktNQlVNIS5FqJnMgFUAuYZSgP41/4lC
	ZS0aUEXfjTwJDXpwFb5fz7IgQBn2eZJTzAnItJq680y+C2qFhInG6JFLn1aP2bJoauOrSsD47Gq
	1AmrchZI9su7J7Qm4Pxm7tApb3lCXdQg02HrjYmLCa2meRjxb4PuTJhWaYShubW9X0q+3dDveT3
	tKH7n/FtHGiaO8SaIux3mDxva2GxbD5gRSbPjYfYJzyua+1K5NYPuV/Uqy38t38YCpeK4OcaiDe
	SvX+8vN3F9oq8dZpnCixjR3HRqUCG6ejYVJPIKYBoJ5dW2Ew9yjdTBSBJXQfcUbrCXDRqTCWThr
	Q1IsqV6KczadOAWvZTK4qUcyfipR93FRHFOtyDVf7cRxAKKKS/pBHbYBXjuwOchD817OX8/Mnj3
	AVm0VYglcZb5u+MvvCpKtOSqZCA9CWDm4qQrEn6TaHzTLd7tQXzxkx8SW1/IskiCVFXad+Oz6jz
	x
X-Received: by 2002:a05:6000:41d2:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-4abb0c5d65amr39924027f8f.18.1795698805751;
        Thu, 26 Nov 2026 05:13:25 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm41679091f8f.58.2026.11.26.05.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:13:25 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Amery Hung <ameryhung@gmail.com>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 2/2] selftests/bpf: test task storage memory accounting
Date: Thu, 26 Nov 2026 13:13:18 +0000
Message-ID: <20261126131318.470837-2-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126131318.470837-1-mahe.tardy@gmail.com>
References: <20261126131318.470837-1-mahe.tardy@gmail.com>
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

This tests that the memory increase as we add elements to a
task_storage. Copy the map_memlock() helper from arena_mem_usage.c.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 .../bpf/prog_tests/task_local_storage.c       | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/task_local_storage.c b/tools/testing/selftests/bpf/prog_tests/task_local_storage.c
index 5b2b56cc3a4f..1415782ad72f 100644
--- a/tools/testing/selftests/bpf/prog_tests/task_local_storage.c
+++ b/tools/testing/selftests/bpf/prog_tests/task_local_storage.c
@@ -495,6 +495,65 @@ static void test_uptr_map_failure(const char *map_name, int expected_errno)
 	uptr_map_failure__destroy(skel);
 }

+static long map_memlock(int map_fd)
+{
+	char path[64], line[128];
+	long memlock = -1;
+	FILE *f;
+
+	snprintf(path, sizeof(path), "/proc/self/fdinfo/%d", map_fd);
+	f = fopen(path, "r");
+	if (!ASSERT_OK_PTR(f, "open_fdinfo"))
+		return -1;
+	while (fgets(line, sizeof(line), f)) {
+		if (sscanf(line, "memlock:\t%ld", &memlock) == 1)
+			break;
+	}
+	fclose(f);
+	ASSERT_NEQ(memlock, -1, "parse_memlock");
+	return memlock;
+}
+
+static void test_memory_usage(void)
+{
+	struct task_local_storage_exit_creds *skel;
+	struct bpf_program *prog;
+	int map_fd, task_fd = -1;
+	long baseline;
+	u64 value = 12;
+
+	skel = task_local_storage_exit_creds__open();
+	if (!ASSERT_OK_PTR(skel, "skel_open"))
+		return;
+
+	/* Just load the map */
+	bpf_object__for_each_program(prog, skel->obj) {
+		if (!ASSERT_OK(bpf_program__set_autoload(prog, false), "disable_autoload"))
+			goto out;
+	}
+
+	if (!ASSERT_OK(task_local_storage_exit_creds__load(skel), "skel_load"))
+		goto out;
+
+	map_fd = bpf_map__fd(skel->maps.task_storage);
+	baseline = map_memlock(map_fd);
+	if (!ASSERT_GE(baseline, 0, "baseline_greater_zero"))
+		goto out;
+
+	task_fd = sys_pidfd_open(getpid(), 0);
+	if (!ASSERT_OK_FD(task_fd, "task_fd"))
+		goto out;
+
+	if (!ASSERT_OK(bpf_map_update_elem(map_fd, &task_fd, &value, BPF_NOEXIST), "update_map"))
+		goto out;
+
+	ASSERT_GT(map_memlock(map_fd), baseline, "memory_increase");
+out:
+	if (task_fd >= 0)
+		close(task_fd);
+	task_local_storage_exit_creds__destroy(skel);
+}
+
 void test_task_local_storage(void)
 {
 	if (test__start_subtest("sys_enter_exit"))
@@ -521,5 +580,7 @@ void test_task_local_storage(void)
 		test_uptr_map_failure("empty_uptr_map", EINVAL);
 	if (test__start_subtest("uptr_map_failure_kstruct"))
 		test_uptr_map_failure("kstruct_uptr_map", EINVAL);
+	if (test__start_subtest("memory_usage"))
+		test_memory_usage();
 	RUN_TESTS(uptr_failure);
 }
--
2.43.0

