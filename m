Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335832D063A
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098313; cv=none; b=Br2H0vNVgu0x2dQ6Pk+Kpr91Hf7Gx8hVRP2vfsIZ4O2Qm5QRvRSmaeUyAv5T2a8WYLIZ/4xoeKgMDreDq85nD0UsDJRFueuob/cSEqGJQFN0N+Kh9nNAWB2zDZA0+rLIaNwZhpqK/6+elUw7NTiBPofrh2dap9/PC223t4zV0HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098313; c=relaxed/simple;
	bh=XMrM4+Hj3SghIxgdaOrFD80PkaSmAH1qWcfG8RAykiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYcDene5VJRaediKws1GkfBEmUWiqCpo7EuFFr59MVaav4NCSzrSOZL1iC8fDyngNS6hZI2TprX54fQ+RrQxMvQXz6opdNZ62cAhSU2BMKgO8IxFlb75/mjSJYMZSp+QmooE4rCVeh1gbigMCeKiDvZn12qhGSfR2NgOsp07Zjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCjcbDBh; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCjcbDBh"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12758ce1e8dso137631c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 01:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772098311; x=1772703111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tec9IvX19mzXZCyeb8uc2mz6TaJdE7CZsee6blSRk3g=;
        b=GCjcbDBhkNYLlpLHsBCqhIl7sZfJ8iuflzVpx+VT5yx3N0OJL6u7uipNviFbKjAruS
         5tcmeAqVkyBWbeaEbnTRDQmkL3VwDWYdsnLi/O7484GMEvOnI9qracTspZIkjT6BOyDR
         yIs4fdBtSqi+2Dn1AaxPGO0aOGe3dDtR/jX7zExIB1jalXmzxbBxSyUp7adZuYe6PK4k
         zYYapSw65E/Z/5k3gS9vp9BJ8bD4eCzMNR4u1YpZoufmnsRHrVeJfhooqHDwLwqDkvb5
         A9Gz1029sXvaUDQogW2xFlKT0WWfjCBkxgu2mD2ZNYJyXwv2WUPCOrmEAiTGjln4EsIw
         9h9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772098311; x=1772703111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tec9IvX19mzXZCyeb8uc2mz6TaJdE7CZsee6blSRk3g=;
        b=o6k92oDIqV7ZiuxyZv/xDmNVyoXGqrsyT1APom+m9L6aUd6GfclVT8oX+x8lOnFcjV
         dbC/iCvmEYCrO/8YOm935VxwHGAnM7P1Q8aXXoST4cocnG9AOKVztSn8OWgf2nqVqe+7
         4CrSum4r0P9guBwXvxCpiY9DiIT9msDGpIETVhflnyq8xu1FTzDwFkWvh83HawChUHAK
         m/o6hJxkh6fc5zcwsOX30z4kp8mR+GvjqhncSXrnLIDPfX0KVshJqucZ6yEMu93gr3+y
         6ys3JUVOuYx7JxqOSuZ3quxqmB1zhZoFNGPglHBDBhI71JU/AeWNfFc3HFrMjZqvttQv
         x8NA==
X-Forwarded-Encrypted: i=1; AJvYcCWII3JcTylatRP6giJLcivWHNlQdltb16Gapm0cMEpScZzVewVLPe0no6glN4NB2GftMb3g5cur/LxNfyAeUMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQD15PqomLaVTu8eFhbsv+lo7wUS4ZR7Oim7tVD4hTqQqAW54o
	7k8G7KX9aBmXEkfTyKfUULJEcHXBk8nr1g3RhtPz67dmzj85w4lx8mvE
X-Gm-Gg: ATEYQzzQRJq7hCmmr192SOWXsLoPsoipyBZQA0wNOL7xE/NcvkbbCqzcq+86rV86FNO
	S8ZK5X4hvUT7xT8Z91YLvuxTCGyabxV+iFhGBpTShKUjBKy09UJm6q+6qJSvUXYGkmeoc9DIZBg
	cY67yAlRDaSJ6NEVYdbiC9tPcOYQ1zTapwvnxR0OIG8Df8/D60d3R4chUiIjgDmm6fEklqyWtiK
	NJ/3g0FQ4iz23HkyQE+fzvpvVrDw0ifOnsz1p5JJp7JfWQ0zFd7MT/U/DyJWCvNsyqmya1TaTo2
	jxoQSvLdgLu0pOa4jojYNjvLWABZo2QWW8phylpHOYSww5CjMHm61SbNll0RDxE/dAUv3IHYT4F
	LC/ZAiA41mfrsyWPt3HRx9VEcIKLpixY8rFXKI1wFAPv8uN92vMqttcRatP2PYVtPx5n53gA+S0
	7zOdjdRqy0Sb7DbfOi09nGxZvz0JkFUx7R75XhLGd67/LU9fShvBoM0m+ef7AEtzLwmhiPDd3tk
	9VHxzkhnDijgIz9wyHw9VY=
X-Received: by 2002:a05:7022:608e:b0:119:e569:fb96 with SMTP id a92af1059eb24-1276acda68bmr9380442c88.5.1772098311330;
        Thu, 26 Feb 2026 01:31:51 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43c12sm1771904c88.14.2026.02.26.01.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:31:50 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 1/2] selftests/bpf: probe_user: filter by pid to avoid cross-test interference
Date: Thu, 26 Feb 2026 17:31:31 +0800
Message-ID: <20260226093132.437206-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226093132.437206-1-sun.jian.kdev@gmail.com>
References: <20260226093132.437206-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test installs a kprobe on __sys_connect and checks that
bpf_probe_write_user() can modify the syscall argument. However, any
concurrent thread in any other test that calls connect() will also
trigger the kprobe and have its sockaddr silently overwritten, causing
flaky failures in unrelated tests.

Constrain the hook to the current test process by filtering on a PID
stored as a global variable in .bss. Initialize the .bss value from
user space before bpf_object__load() using bpf_map__set_initial_value(),
and validate the bss map value size to catch layout mismatches.

No new map is introduced and the test keeps the existing non-skeleton
flow.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 .../selftests/bpf/prog_tests/probe_user.c     | 27 ++++++++++++++++++-
 .../selftests/bpf/progs/test_probe_user.c     | 13 +++++++--
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/probe_user.c b/tools/testing/selftests/bpf/prog_tests/probe_user.c
index 8721671321de..280dcdb5ddef 100644
--- a/tools/testing/selftests/bpf/prog_tests/probe_user.c
+++ b/tools/testing/selftests/bpf/prog_tests/probe_user.c
@@ -20,6 +20,11 @@ void serial_test_probe_user(void)
 	struct bpf_program *kprobe_progs[prog_count];
 	struct bpf_object *obj;
 	static const int zero = 0;
+	struct test_pro_bss {
+		struct sockaddr_in old;
+		__u32 test_pid;
+	};
+	struct test_pro_bss results = {};
 	size_t i;
 
 	obj = bpf_object__open_file(obj_file, &opts);
@@ -34,6 +39,24 @@ void serial_test_probe_user(void)
 			goto cleanup;
 	}
 
+	{
+		struct bpf_map *bss_map;
+		struct test_pro_bss bss_init = {};
+
+		bss_init.test_pid = getpid();
+		bss_map = bpf_object__find_map_by_name(obj, "test_pro.bss");
+		if (CHECK(!bss_map, "find_bss_map", "no bss map\n"))
+			goto cleanup;
+		if (CHECK(bpf_map__value_size(bss_map) != sizeof(bss_init),
+			  "bss_size", "bss value_size %u != %zu\n",
+			  bpf_map__value_size(bss_map), sizeof(bss_init)))
+			goto cleanup;
+		err = bpf_map__set_initial_value(bss_map, &bss_init,
+						 sizeof(bss_init));
+		if (CHECK(err, "set_bss_init", "err %d\n", err))
+			goto cleanup;
+	}
+
 	err = bpf_object__load(obj);
 	if (CHECK(err, "obj_load", "err %d\n", err))
 		goto cleanup;
@@ -62,11 +85,13 @@ void serial_test_probe_user(void)
 	connect(sock_fd, &curr, sizeof(curr));
 	close(sock_fd);
 
-	err = bpf_map_lookup_elem(results_map_fd, &zero, &tmp);
+	err = bpf_map_lookup_elem(results_map_fd, &zero, &results);
 	if (CHECK(err, "get_kprobe_res",
 		  "failed to get kprobe res: %d\n", err))
 		goto cleanup;
 
+	memcpy(&tmp, &results.old, sizeof(tmp));
+
 	in = (struct sockaddr_in *)&tmp;
 	if (CHECK(memcmp(&tmp, &orig, sizeof(orig)), "check_kprobe_res",
 		  "wrong kprobe res from probe read: %s:%u\n",
diff --git a/tools/testing/selftests/bpf/progs/test_probe_user.c b/tools/testing/selftests/bpf/progs/test_probe_user.c
index a8e501af9604..4bc86c7654b1 100644
--- a/tools/testing/selftests/bpf/progs/test_probe_user.c
+++ b/tools/testing/selftests/bpf/progs/test_probe_user.c
@@ -5,13 +5,22 @@
 #include <bpf/bpf_core_read.h>
 #include "bpf_misc.h"
 
-static struct sockaddr_in old;
+struct test_pro_bss {
+	struct sockaddr_in old;
+	__u32 test_pid;
+};
+
+struct test_pro_bss bss;
 
 static int handle_sys_connect_common(struct sockaddr_in *uservaddr)
 {
 	struct sockaddr_in new;
+	__u32 cur = bpf_get_current_pid_tgid() >> 32;
+
+	if (bss.test_pid && cur != bss.test_pid)
+		return 0;
 
-	bpf_probe_read_user(&old, sizeof(old), uservaddr);
+	bpf_probe_read_user(&bss.old, sizeof(bss.old), uservaddr);
 	__builtin_memset(&new, 0xab, sizeof(new));
 	bpf_probe_write_user(uservaddr, &new, sizeof(new));
 
-- 
2.43.0

