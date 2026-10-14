Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A852736DA15
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005511; cv=none; b=JNbS5Ud0pgSICZM8f716oArvqT5Ddd7HWfvArqMTzhK/qeY9WJu5YvEoY8zz9f6sDPdQUs2hjPxmxKoaTBQph97clDK7sq7lbQF1Y3jYjSOVHTV44gRzXpjZCoyOPR40Pv77g3oqxW5Qa+PzrqQGWJqn2SH/ru6Va9pYKuCx4NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005511; c=relaxed/simple;
	bh=WtL9X5nPzIdYuoAAXN6Zzu7uWhdYRuMGxsOiLZE43Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z7jR4h65TOUjUtc7m4SLQ+af4aH3zeOQ6+LPYODqiml4wGYNqgUH7shIQX+DYPKgecd1Nf8NPt8D0TSVqZVAGfo8kaV0OsF+3U1giqLxLNHA5JXPcrgGdbzWA4OTiQF6U18OC3WLpSyU1lMItoSdonynHWkXYSmnYfVtolmHbFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3O5WTuo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3O5WTuo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b060ec084so2956251f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792005508; x=1792610308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nTdH3X2l/etlrD2v+ho/jiApqNL7hD+sA31og7/oRbo=;
        b=L3O5WTuolHzjBFTp2gipcnk6AiK2uLdzzBJQsyPjrBLnjVvUtY2EhJFHfi8KHQnNrq
         j41IgXtKVtquqULnqOq4Atw/qzGBMFEhgtQqIvlIE0kn48XLzWkGpuGdA5+3ZvtOO6Ia
         qiDyJUshRUpqxEpbok3Q5dVj19pGmqsCMb4l3OYKldOgF9cAsJP9BFG8XlOiz+g9Zxrj
         Qki7OZPzBywtNUOGuHG1Ia1f4KwDcMRMVvVrSV/WmSt2p4MuWpXuMFnkHz/cdRAh5Byi
         E+f8hg6s+j62AnUQznZDUTNdnW7KZgEuzcHnjKK18a/jpRgHK7t9qDiVGmGzF34DG905
         7WoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005508; x=1792610308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nTdH3X2l/etlrD2v+ho/jiApqNL7hD+sA31og7/oRbo=;
        b=AM0IAGHDL29UZD3knt7Lqd1a9EPCYmOG5oemjxysxN58PFtBzLhz4kFFDgKRi1415B
         yHU5JTrm6S3wL9XZEvRHL9A0JTyDAGv0J08rwIW+kIa33F6WLnY5eYrhDQD1xoeWq+Hk
         ig4JW/upfzuUC7Cd0NQXPenhrkN4W4WLSAeZdvsHpCkUdHhoAh+XMM8Kh+HMWkyJXMf0
         3KxhzMkR97tC3MGAvBcnJILY6dFu2yZ8a3zp1b0L/R4oQqM4Sg4JDN3aeliIKI62p7Y7
         XDL+2frsFtrWtiuxUi77GquIIIvd0XKC5tnbBCtAKhNB6L5AOSRgTUt8PDGo0puFwfc0
         51og==
X-Forwarded-Encrypted: i=1; AKwUvBz40hxzE5HCiTblIyylRwfEqlIpEDt5PLh5nGEh30N5zdQYnta94k4ta+DS1YKWC8NS9arsHkg6vecoysv/VFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTk9E+wa4Dq4ZLnnZDnSw5JWi+NTagrrsBSl2GhedIIBTvqOBt
	QTwf2lhYq+Zg4/xP2BEovKeAmIP22bNrJwD95tivfrg9sl0qnSVzqk8/
X-Gm-Gg: AYBFou3G/jZZuOfk2a3BNQ0H+AWF8TtqvQXSeLcmkaj81Sy+iqwbS5PzAk3xdUj+xk8
	nrdWEDLA5bqGP25nY/YYv1l3cS1zGhXyTNu9OuF9qJXNZkaHJBs5mVtJO/810w6YRPTQMNGEuqJ
	5YbGPPfuukO/55Lxcuppd/vz1kIc1yuDFHyeFS5ybR7NJKv/VEyVa3b5lRrZqdB9CQPAT4DwsYG
	wXOiTllI5IsdKHBJlu5Bja7eqWp5JGRnyq15Sx4o3dV79OsnmQp2JplPsL5YV/8dopNPJ/k0N1r
	x46RXQ+i0smZ4D0n05okBimuQoIHC63XNxjAx7xoZNno8YkNqb2OK8G+Y2JiqWJ8qoLn5Q5nc55
	dSAy3g3hc2eyopgipwT90U6Be5OcCLN3KMah74UIpJzvLJqVQwmpUm7K7LUzFSYNuea4E3/9YTj
	4IeKBF+ogMwXQAbJO0oZVyQfEqCgyCNgQfrTVIUCd5eMWAxzlV7WEhH2jRKskOkw==
X-Received: by 2002:a05:6000:2610:b0:48b:60a:760c with SMTP id ffacd0b85a97d-48dbacdbca4mr33861568f8f.31.1792005507598;
        Wed, 14 Oct 2026 12:18:27 -0700 (PDT)
Received: from fedora ([2a02:4540:a7:16c0:b518:4b00:679:375])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6b82sm14114691f8f.51.2026.10.14.12.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:18:26 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH] selftests/mm: test mremap DONTUNMAP with locked memory
Date: Wed, 14 Oct 2026 22:48:03 +0330
Message-ID: <20261014191803.196515-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check that a partial MREMAP_DONTUNMAP operation on mlocked memory
preserves locked-memory accounting and that unmapping both mappings
returns VmLck to its original value.

This tests for a locked_vm accounting leak after a partial remap.

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 tools/testing/selftests/mm/mremap_dontunmap.c | 95 ++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mremap_dontunmap.c b/tools/testing/selftests/mm/mremap_dontunmap.c
index 96ba537facf..a0fd99ff825 100644
--- a/tools/testing/selftests/mm/mremap_dontunmap.c
+++ b/tools/testing/selftests/mm/mremap_dontunmap.c
@@ -335,6 +335,98 @@ static void mremap_dontunmap_partial_mapping_overwrite(void)
 	ksft_test_result_pass("%s\n", __func__);
 }
 
+static long get_vmlck_kb(void)
+{
+	FILE *f = fopen("/proc/self/status", "r");
+	char *line = NULL;
+	size_t len = 0;
+	long kb = -1;
+
+	if (!f)
+		ksft_exit_fail_msg("fopen /proc/self/status: %s\n",
+				   strerror(errno));
+
+	while (getline(&line, &len, f) != -1) {
+		if (sscanf(line, "VmLck: %ld kB", &kb) == 1)
+			break;
+	}
+
+	free(line);
+	fclose(f);
+
+	if (kb < 0)
+		ksft_exit_fail_msg("VmLck not found in /proc/self/status\n");
+
+	return kb;
+}
+
+static void mremap_dontunmap_partial_mlocked(void)
+{
+	unsigned long num_pages = 10;
+	size_t size = num_pages * page_size;
+	size_t half = (num_pages / 2) * page_size;
+	void *src, *dst;
+	long baseline, locked, remapped, after;
+	bool pass;
+
+	baseline = get_vmlck_kb();
+
+	src = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (src == MAP_FAILED)
+		ksft_exit_fail_msg("mmap source: %s\n", strerror(errno));
+
+	dst = mmap(NULL, half, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (dst == MAP_FAILED)
+		ksft_exit_fail_msg("mmap destination: %s\n", strerror(errno));
+
+	memset(src, 'a', size);
+
+	if (mlock(src, size)) {
+		if (errno == EPERM || errno == ENOMEM) {
+			ksft_print_msg("mlock unavailable: %s\n",
+				       strerror(errno));
+
+			if (munmap(dst, half))
+				ksft_exit_fail_msg("munmap destination: %s\n",
+						   strerror(errno));
+			if (munmap(src, size))
+				ksft_exit_fail_msg("munmap source: %s\n",
+						   strerror(errno));
+
+			ksft_test_result_skip("%s\n", __func__);
+			return;
+		}
+		ksft_exit_fail_msg("mlock: %s\n", strerror(errno));
+	}
+
+	locked = get_vmlck_kb();
+
+	if (mremap(src + half, half, half,
+		   MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_DONTUNMAP,
+		   dst) == MAP_FAILED)
+		ksft_exit_fail_msg("mremap: %s\n", strerror(errno));
+
+	remapped = get_vmlck_kb();
+
+	if (munmap(dst, half))
+		ksft_exit_fail_msg("munmap destination: %s\n",
+				   strerror(errno));
+	if (munmap(src, size))
+		ksft_exit_fail_msg("munmap source: %s\n", strerror(errno));
+
+	after = get_vmlck_kb();
+
+	pass = locked == baseline + (long)(size / 1024) &&
+	       remapped == locked &&
+	       after == baseline;
+
+	ksft_test_result(pass,
+			 "%s (baseline=%ld kB, locked=%ld kB, remapped=%ld kB, after=%ld kB)\n",
+			 __func__, baseline, locked, remapped, after);
+}
+
 int main(void)
 {
 	ksft_print_header();
@@ -348,7 +440,7 @@ int main(void)
 		ksft_finished();
 	}
 
-	ksft_set_plan(5);
+	ksft_set_plan(6);
 
 	// Keep a page sized buffer around for when we need it.
 	page_buffer =
@@ -361,6 +453,7 @@ int main(void)
 	mremap_dontunmap_simple_fixed();
 	mremap_dontunmap_partial_mapping();
 	mremap_dontunmap_partial_mapping_overwrite();
+	mremap_dontunmap_partial_mlocked();
 
 	BUG_ON(munmap(page_buffer, page_size) == -1,
 	       "unable to unmap page buffer");
-- 
2.55.0

