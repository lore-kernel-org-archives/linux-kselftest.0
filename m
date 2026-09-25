Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0734AE13A
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 16:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353267; cv=none; b=UHiIMeEALOosyC/QPE/Dt/dcDrzRRqGkrVGMqdhniSQOZjat9j+sksi3dUgQ/fSzHf4eUs0I4Cl+mjw03imchZU9A9OMBToS/BZo+mKKQjrmJAZ95JiGzxA2BsN9bPKu0zpJ4c/H+QnwItTxh9VvLmQYFJ9WjLY9aZ6OHl5lgLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353267; c=relaxed/simple;
	bh=IXqYLSNlN3+owIrqosOU308q2bQAH8sAY3xQuy+kLkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRy86orfXgQJRMJyAszPdatrqW5n7YT+hAe2YDSf8ze+FYxivsOuWY9e4EvfEtX6XPhRcxS6J2o8DVGZxugeBo9Si7mcrs/hh+U9eQxMdGCjSRatdEgnV6TjW8zVcEIPmwlBFOiMzkDovAlO6PjsEHW3uwMlrAqKCjfczbaV9m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMmd2BaH; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMmd2BaH"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8e6afbc52so1054402e87.3
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 09:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353264; x=1790958064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xc+N3lz4OMfvfmoZkfj8BFomqJGhAV5k0kLsDM4UM+s=;
        b=bMmd2BaH3Skz4XR/dkn2IVxnrSDfu0zHhaKvRSBvp/r1kIL7l/acnuYJP8wohlqWol
         0dF/BfIefSVNhUbHaR9YPYxhAguaWxwVFfG1rQ7MU14YRlVH/noG4EuGPUYZFrIh7eRA
         YuMdD8EWDc3G3MjDW2/isVMq6FgyKDWEtCcZjQqZsONcLrJxz56E9v/ycbf00DXB0OWc
         Pbos3qhib+FQ6TWp2OGa3+tga/3W1qaYYZnBCrmy8Wf8XKbWH17G0X46j1UajXlM/vBv
         EFemEy6S8iFbOGGF5r/D2Xdac93OlgaBZu4Qifk2tZlBba18NX8p3NDCu9KnWmaz1K3k
         e/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353264; x=1790958064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xc+N3lz4OMfvfmoZkfj8BFomqJGhAV5k0kLsDM4UM+s=;
        b=n27mK20USf65h7OUpB9Ry4LsZZDNXRqNaeMt7pq5xQZtDUZtk10q6QS2is1cYzN6h/
         BJRmM55VjgYnHYF+rZYFl06bIlVluORb938k2hHrQ3QpG9wDSqW32gbNpNzZ+W3Afv9b
         TTrSiAyX+q+ofR3eWNtiwLivXKidlCPxJSdRByV6iGOwzJJCJsLUpE75BbGhluk2vYtN
         +rsD0PM28alv4YvRdDA9BmkNL4cYdu0AE+kTfjpiOSaM75e4T8YECkK014MRNsvTFn+H
         yM0TsAGDEnTQ7Y9rLnQEm7JUDvL/C5dYVXZou0XlQbl+xLOGn56kHdrFpKwWEbOw967k
         Gj3A==
X-Forwarded-Encrypted: i=1; AKwUvByy4Xj3xHPYtvsMSMORZPG8vNmcrJBb1QDbB/iSRjdJeSz7WSRVb0C67q6e+mw0dgqZHZjUSpLxQf8D5LwvRFY=@vger.kernel.org
X-Gm-Message-State: AFuF++mnvt+sEjrq4gUZkNqOq/g2CbJZ+6D9pLUDRy05yZQQJDbMoyfx
	nK7l8652bHBlrDC2RpftInV7LMTxPI5/1s2uQZgRKPooOZe8j40h6TIR
X-Gm-Gg: AYBFou0bdjyv0+6msFLi4UU0fknT0T48/3QDhLtpCjI1ugf5S4yzCa0lwg/mQgtBfHe
	fU260UTZoqYZmpSh5FUSmktvFB1R+gaJzOw1rx9rZ+1LZO/3xiIJ97gXjpMCJFlRLWOEZUQP00S
	GLiXhQhv5LXDGX43vv35ucb+higa8v5HyXwbkoeEf2OHu8CdSBLi/LZR+WCuA6Uwhg0j4t3hUpk
	VB1weq6Ndmiu1fm0lR7fgfBSB30FeqxJFBqNNHMbdAbj9KM+sXqH7o9Z4UPkDUGemux02PvCfMb
	BQOeqAks+RyYO0opVewMjV5x03ssLuJRA0i/KKb/zUJm1jxhw3v4oVhqzoQtjU7QWWHucvzuX2a
	fRgr5ldOvn8exQ1KpwYwS87P982lOVi/BSbw9XechM48J0EdbZdAHAVDpUbbcw3XDtz7MXxojxr
	w7zZSliQZVilchElIF10ESN+FRfJ9jjcwTsjDr3TqW34FIF+OZ0IsrNyCxYeUdYKimwkG3LhyjT
	WQu2n0/SIwm+cyf
X-Received: by 2002:ac2:51c3:0:b0:5b8:c04b:27ef with SMTP id 2adb3069b0e04-5b8df040c84mr2689343e87.5.1790353263930;
        Fri, 25 Sep 2026 09:21:03 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.66])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6ae62d7sm655740e87.20.2026.09.25.09.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:21:03 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bpf@vger.kernel.org
Cc: qmo@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	kuba@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: Check that bpftool map dump fails for socket storage
Date: Fri, 25 Sep 2026 19:20:02 +0300
Message-ID: <20260925162031.27259-3-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925162031.27259-1-skokovmaksimevg@gmail.com>
References: <20260925162031.27259-1-skokovmaksimevg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Socket storage can't be iterated from user space. Create a
BPF_MAP_TYPE_SK_STORAGE map, attach storage to a socket, pin it, and
check that "bpftool map dump" fails with nothing but an error: a JSON
error object with -j, no elements and no count on stdout in plain mode,
and the reason on stderr.

Assisted-by: LLM
Signed-off-by: Maxim Skokov <skokovmaksimevg@gmail.com>
---
 .../bpf/prog_tests/bpftool_map_dump.c         | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c

diff --git a/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c b/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c
new file mode 100644
index 0000000000..0a0fa8926b
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <sys/socket.h>
+#include <unistd.h>
+#include <bpf/btf.h>
+#include <test_progs.h>
+#include "bpftool_helpers.h"
+
+#define PIN_PATH	"/sys/fs/bpf/test_bpftool_map_dump_sk_storage"
+#define JSON_ERROR	"{\"error\":\"can't dump sk_storage map"
+
+/* A socket storage map with a single element, keyed on a socket we own. */
+static int create_sk_storage_map(void)
+{
+	LIBBPF_OPTS(bpf_map_create_opts, opts,
+		    .map_flags = BPF_F_NO_PREALLOC);
+	struct btf *btf;
+	int int_id, fd = -1;
+
+	btf = btf__new_empty();
+	if (!ASSERT_OK_PTR(btf, "btf__new_empty"))
+		return -1;
+
+	int_id = btf__add_int(btf, "int", 4, BTF_INT_SIGNED);
+	if (!ASSERT_GT(int_id, 0, "btf__add_int"))
+		goto out;
+	if (!ASSERT_OK(btf__load_into_kernel(btf), "btf__load_into_kernel"))
+		goto out;
+
+	opts.btf_fd = btf__fd(btf);
+	opts.btf_key_type_id = int_id;
+	opts.btf_value_type_id = int_id;
+	fd = bpf_map_create(BPF_MAP_TYPE_SK_STORAGE, "sk_storage", sizeof(int),
+			    sizeof(int), 0, &opts);
+	ASSERT_OK_FD(fd, "bpf_map_create");
+out:
+	btf__free(btf);
+	return fd;
+}
+
+void test_bpftool_map_dump(void)
+{
+	int map_fd, sk_fd = -1, value = 42, ret;
+	char output[1024] = {};
+
+	map_fd = create_sk_storage_map();
+	if (map_fd < 0)
+		return;
+
+	sk_fd = socket(AF_INET, SOCK_STREAM, 0);
+	if (!ASSERT_OK_FD(sk_fd, "socket"))
+		goto out;
+	if (!ASSERT_OK(bpf_map_update_elem(map_fd, &sk_fd, &value, BPF_NOEXIST),
+		       "add socket storage"))
+		goto out;
+	if (!ASSERT_OK(bpf_obj_pin(map_fd, PIN_PATH), "pin map"))
+		goto out;
+
+	/*
+	 * Socket storage can't be iterated, so the dump must fail with an
+	 * error and nothing else, rather than print an empty map that holds
+	 * an element. The buffer is cleared before each run so that a run
+	 * that fails to start can't match stale or uninitialised output.
+	 */
+	ret = get_bpftool_command_output("-j map dump pinned " PIN_PATH,
+					 output, sizeof(output));
+	ASSERT_NEQ(ret, 0, "json dump fails");
+	ASSERT_STRNEQ(output, JSON_ERROR, strlen(JSON_ERROR),
+		      "json dump is only the error");
+
+	memset(output, 0, sizeof(output));
+	ret = get_bpftool_command_output("map dump pinned " PIN_PATH,
+					 output, sizeof(output));
+	ASSERT_NEQ(ret, 0, "plain dump fails");
+	ASSERT_NULL(strchr(output, '['), "plain dump prints no elements");
+	ASSERT_NULL(strstr(output, "Found"), "plain dump prints no count");
+
+	memset(output, 0, sizeof(output));
+	get_bpftool_command_output("map dump pinned " PIN_PATH " 2>&1 >/dev/null",
+				   output, sizeof(output));
+	ASSERT_HAS_SUBSTR(output, "can't dump sk_storage map",
+			  "plain dump explains why on stderr");
+
+	unlink(PIN_PATH);
+out:
+	if (sk_fd >= 0)
+		close(sk_fd);
+	close(map_fd);
+}
-- 
2.47.3

