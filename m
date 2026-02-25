Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA17E33C189
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 22:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058862; cv=none; b=IBiwWiv6rZR2S6QBRbxQ7hSbZ0R/0NR5osQpeg1E7fc+eMJRYDZAVZnIyp+lNJKK3jysS0zpZmT4xxluN+rp3ibRGdsruA6v9ymBOCmtsnigSbaoMN7TjwQzW6bJKwY647JDjk/aM4hy1+lF0Idf7j1LEzPf8cntOXOEAv7iIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058862; c=relaxed/simple;
	bh=ymKrZvnn1wXoX3MO7tLDPSCDvegTjqhP4f2VwqTSGPs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LmdfXpcJBoGWfDDhoTNPZ5drBh9owc3fAVE6mfOCRRnrMHbdJwJ+Q8gGIXKDe4GTdNdLxS0Lkox+F50G80BNX8gK/slS/Sbhd0WcQfl7QHKC2zbwlet4zTGBhcAgxpb3dqEqch59NGRE6SXoO0imjBSk4RRqk1GM7Vrx8hSLLYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fRyqgEis; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fRyqgEis"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-358f058973fso53672a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 14:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772058860; x=1772663660; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VLezOUj++5KtU+iy76kNFYSHOIOxW3z9n/oglLgyr0s=;
        b=fRyqgEis2xyUjaczHDwUma1EDA4AN3QlAcp39p2ElDW4QdhH0DTLDPCl7rTl5rsZfh
         Y/ck5cCTlHbNLSolchZLjwn9VSuHY3NZZ1siS5e/dTqtYxfDTWYgaUqQ9RbV42/Dx2lp
         5aJsid0eP1DXY4+W6icRzkGWD8wx1Qmv4uRhPoUzdIKx7wwtLVb1iW5xHv0trPMR3qDo
         4oOanaN7QY1I2kSkutdShCw1hportGfjNSeQH6lxleyityFGAjNU91i7EA+eyop34/e0
         R5REy3LkQFB3KGJRT274Er5i19oVizrit3USMZ0IZxf6EZgXh0+M7llGlnj5nVMB5zlM
         118g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058860; x=1772663660;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLezOUj++5KtU+iy76kNFYSHOIOxW3z9n/oglLgyr0s=;
        b=LAiaOzBcO4a07q+jQ/SZ/JpETrM832uKLGFQNQbxvPvA351c1ZfzCS/0UCTjVMrKK5
         7LJQsIDmq6gv/bG8PJIFFpghiFLHTfBuwP91iACkosZNPLzHwyDDm/MWL1MLn9IZXdOS
         nFSrDphKqzgu7+UqKa/XoDfAWAfNkTSvSYokR/YoCP2tGGgxG+LbQMcXHMbH1Tr81mPa
         cDpqtK/QxRbQipCHcZtATnVftB+5EmLHsseKgQpnG9KL+peKx+s15x/AI+cu+LCtyOnz
         tzoBcabMuKNY5NSERphtdDjlwuUWs2/FOwu/pBD+krT1jteLVuz8GDUUhnUgtaxzBhHk
         kY1w==
X-Forwarded-Encrypted: i=1; AJvYcCUWejk/B/GfME9kOYdrkzUA1fggYIAAufa6ceBVUb40F824Nihf+lK+Y9E9bfa17WIumh7v6DMYUNTBcpfByng=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF7TZqxTp3rwsLKpZr0epkYpVeVDRTYtrRHm7SvJLS1P+w0YkW
	4BB9HnE3uk59ACCrpSl+4+pFmeHlUcBUmJt2l1WaKG98EBaeJwHzQNswk2gZ2PW4PFMGiTkTe50
	vWyxFmSl6U5E9+S8dBw==
X-Received: from plbld14.prod.google.com ([2002:a17:902:face:b0:2a7:7822:9011])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:b48:b0:2a0:bb05:df55 with SMTP id d9443c01a7336-2ae034613a3mr358175ad.21.1772058859947;
 Wed, 25 Feb 2026 14:34:19 -0800 (PST)
Date: Wed, 25 Feb 2026 14:34:04 -0800
In-Reply-To: <20260225223404.783173-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260225223404.783173-1-tjmercier@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225223404.783173-4-tjmercier@google.com>
Subject: [PATCH v5 3/3] selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, amir73il@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

Add two new tests that verify inotify events are sent when memcg files
or directories are removed with rmdir.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Tejun Heo <tj@kernel.org>
Acked-by: Amir Goldstein <amir73il@gmail.com>
---
 .../selftests/cgroup/test_memcontrol.c        | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 4e1647568c5b..57726bc82757 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -10,6 +10,7 @@
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <unistd.h>
+#include <sys/inotify.h>
 #include <sys/socket.h>
 #include <sys/wait.h>
 #include <arpa/inet.h>
@@ -1625,6 +1626,115 @@ static int test_memcg_oom_group_score_events(const char *root)
 	return ret;
 }
 
+static int read_event(int inotify_fd, int expected_event, int expected_wd)
+{
+	struct inotify_event event;
+	ssize_t len = 0;
+
+	len = read(inotify_fd, &event, sizeof(event));
+	if (len < (ssize_t)sizeof(event))
+		return -1;
+
+	if (event.mask != expected_event || event.wd != expected_wd) {
+		fprintf(stderr,
+			"event does not match expected values: mask %d (expected %d) wd %d (expected %d)\n",
+			event.mask, expected_event, event.wd, expected_wd);
+		return -1;
+	}
+
+	return 0;
+}
+
+static int test_memcg_inotify_delete_file(const char *root)
+{
+	int ret = KSFT_FAIL;
+	char *memcg = NULL;
+	int fd, wd;
+
+	memcg = cg_name(root, "memcg_test_0");
+
+	if (!memcg)
+		goto cleanup;
+
+	if (cg_create(memcg))
+		goto cleanup;
+
+	fd = inotify_init1(0);
+	if (fd == -1)
+		goto cleanup;
+
+	wd = inotify_add_watch(fd, cg_control(memcg, "memory.events"), IN_DELETE_SELF);
+	if (wd == -1)
+		goto cleanup;
+
+	if (cg_destroy(memcg))
+		goto cleanup;
+	free(memcg);
+	memcg = NULL;
+
+	if (read_event(fd, IN_DELETE_SELF, wd))
+		goto cleanup;
+
+	if (read_event(fd, IN_IGNORED, wd))
+		goto cleanup;
+
+	ret = KSFT_PASS;
+
+cleanup:
+	if (fd >= 0)
+		close(fd);
+	if (memcg)
+		cg_destroy(memcg);
+	free(memcg);
+
+	return ret;
+}
+
+static int test_memcg_inotify_delete_dir(const char *root)
+{
+	int ret = KSFT_FAIL;
+	char *memcg = NULL;
+	int fd, wd;
+
+	memcg = cg_name(root, "memcg_test_0");
+
+	if (!memcg)
+		goto cleanup;
+
+	if (cg_create(memcg))
+		goto cleanup;
+
+	fd = inotify_init1(0);
+	if (fd == -1)
+		goto cleanup;
+
+	wd = inotify_add_watch(fd, memcg, IN_DELETE_SELF);
+	if (wd == -1)
+		goto cleanup;
+
+	if (cg_destroy(memcg))
+		goto cleanup;
+	free(memcg);
+	memcg = NULL;
+
+	if (read_event(fd, IN_DELETE_SELF, wd))
+		goto cleanup;
+
+	if (read_event(fd, IN_IGNORED, wd))
+		goto cleanup;
+
+	ret = KSFT_PASS;
+
+cleanup:
+	if (fd >= 0)
+		close(fd);
+	if (memcg)
+		cg_destroy(memcg);
+	free(memcg);
+
+	return ret;
+}
+
 #define T(x) { x, #x }
 struct memcg_test {
 	int (*fn)(const char *root);
@@ -1644,6 +1754,8 @@ struct memcg_test {
 	T(test_memcg_oom_group_leaf_events),
 	T(test_memcg_oom_group_parent_events),
 	T(test_memcg_oom_group_score_events),
+	T(test_memcg_inotify_delete_file),
+	T(test_memcg_inotify_delete_dir),
 };
 #undef T
 
-- 
2.53.0.414.gf7e9f6c205-goog

