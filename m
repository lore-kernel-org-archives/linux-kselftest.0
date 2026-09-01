Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4766D49504A
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 18:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286050; cv=none; b=IHbDT6+lTKefvkMND0vi+frrMQoCc2ARh2WJjYc0kJlPLRAC/9rWT10EZ3ZjI4vPvx8/Tx1T/vwERuffvmrluN3EAJ5eXPWEad2GebNvha6EWBLQXuHXr/03zWvf3ZC46V3hJ4z2SxU5xAmdHSXvbhEPV40+xJkTJj+MHttrDP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286050; c=relaxed/simple;
	bh=OMBn7uiudnSSq54gX2RVyNKqmRP8wdhdzksmUcad6So=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LJChjXmUJcex/v2phARghZ6VZ9Bjz3sjbE6aYtK2KFPdzk0ob87lxbqtg9UJf+qSxRxL1Q/zeAJGfo9bbPv00hfZ3ZnHT20hyhJGMlBO8CKWUWIto1EtFmQNPeWactFTIYbRlnw7qSQ6ZW+m2iAMLW6dSsjIN0cY0TTO02drT4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OqhXS1Zt; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OqhXS1Zt"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so227041a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 11:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788286048; x=1788890848; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EEIZgCOB2hl947kqAMQSV91Zoox41yoYUfb/qDb9/EY=;
        b=OqhXS1Zt/cKsJMBefL6SAk9JugUcqqHOeg5bXHkAdSI68clOpYhCeIouauQcZJuljH
         gdX1jvxOaDisTk2IgegBQGH9eyWJR+JizNcMStPBdk/3Mb/doyqaCYAUdBjbO+gw7lCm
         ifaBTQ0FGDZHUQrNadbLJyxNQ7swOUTzE6Bh5G8mQXYTMLxwRY2EXtM1+u5Zkbet1mvZ
         TiXnHd2d/dFT/B+hx8qWer96kx67KVrrcsQDPcCfsIZ40VDbNz6IN52c9M3wir9GrKLZ
         gaPC5RRBXcbo+GNubysKzQ+EICpEnOnFLjU2ZKCv+VB0yVc2JYEmbDD++/snikIBKZwC
         Q9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286048; x=1788890848;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EEIZgCOB2hl947kqAMQSV91Zoox41yoYUfb/qDb9/EY=;
        b=oUDaxVxYKiJciEUUC/OSiT1BRUfst+SJhY/hHz/fXJnm0EU+odQEgJ/JnrFQe83SoX
         9TmFe7ZeVpDTWmKMlRLXoJfldHFfk7xhYIIIUEF6nPcxL5U7BpctYrOGLlZeK27Obuu2
         u5TMyRQxHIcuTrJBNUxK12/VzZTOjwJVgo+Nxm/HS9+f2lD36izB0XFn8BDvhJ5d28mo
         SgKbdvXOOkatFnltl+TruL+RfaIpcjVyQyDqHmSMs/NpkotSSyZVYnFSjjEh28hnkBtQ
         /99rOoCmVh9iV8HQD3qhgHuAkzwFAGF8IpnriYRGoNtzMZR24wjVX3uhDKQ+D3hD93oX
         ZPLg==
X-Forwarded-Encrypted: i=1; AKwUvBzHp9S9g51IN8R1cqUFkA/PKQFULoXyB0S9Zuib15yuPBnoLRvmgVw14bOT1bFTAjCW96L0X+L4F01alE/B7es=@vger.kernel.org
X-Gm-Message-State: AFuF++mCPe6pPn5ulWTcFJRA+ZQ/V8DH5re1TAin0q5T/5ZESepTyJtz
	43Y/EqMM7+QBTVuyUEyprjbCc9Zc2dJtM0rYmqtP4MUJYrAum9ltHOBDDvuZsaVjiE5nTUYEWjS
	u1WE56z+mRXPAbw==
X-Received: from pjbiy13.prod.google.com ([2002:a17:90b:16cd:b0:38e:b470:e6db])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3fcf:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-3989be5b4camr43204014a91.20.1788286048322;
 Tue, 01 Sep 2026 11:07:28 -0700 (PDT)
Date: Tue,  1 Sep 2026 18:07:13 +0000
In-Reply-To: <20260901180713.4185641-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901180713.4185641-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901180713.4185641-6-dmatlack@google.com>
Subject: [RFC PATCH 5/5] selftests: liveupdate: Add multi-session test
 coverage for session_retrieve_into
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the multi-session Live Update test to specifically verify the new
LIVEUPDATE_SESSION_RETRIEVE_INTO_FD ioctl path. In Stage 2 of the kexec
workflow, the test explicitly delegates topology by allocating a clean
tmpfs target and driving the folios into it through the new API,
verifying that the data preserves identically to the native KHO mapping.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 33 +++++++++++
 .../selftests/liveupdate/luo_multi_session.c  | 56 ++++++++++++++++---
 3 files changed, 83 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index fa07fed08364..8ab1e662eeaa 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -33,6 +33,7 @@ int luo_session_retrieve_fd(int session_fd, __u64 token);
 
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
+int luo_verify_retrieve_into_memfd(int session_fd, int token, int mfd, const char *expected_data);
 
 void create_state_file(int luo_fd, const char *session_name, int token,
 		       int next_stage);
diff --git a/tools/testing/selftests/liveupdate/lib/lu_utils.c b/tools/testing/selftests/liveupdate/lib/lu_utils.c
index 74d41115c281..8ed9c367f92e 100644
--- a/tools/testing/selftests/liveupdate/lib/lu_utils.c
+++ b/tools/testing/selftests/liveupdate/lib/lu_utils.c
@@ -324,3 +324,36 @@ int luo_test(int argc, char *argv[],
 
 	return 0;
 }
+
+int luo_verify_retrieve_into_memfd(int session_fd, int token, int mfd,
+				   const char *expected_data)
+{
+	struct liveupdate_session_retrieve_into_fd retrieve_args = {
+		.size = sizeof(retrieve_args),
+		.token = token,
+		.fd = mfd,
+	};
+	long page_size = getpagesize();
+	void *map = MAP_FAILED;
+	int ret = -1;
+
+	ret = ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, &retrieve_args);
+	if (ret < 0) {
+		ksft_print_msg("ioctl LIVEUPDATE_SESSION_RETRIEVE_INTO_FD failed\n");
+		return -errno;
+	}
+
+	map = mmap(NULL, page_size, PROT_READ, MAP_SHARED, mfd, 0);
+	if (map == MAP_FAILED)
+		return -errno;
+
+	if (expected_data && strcmp(expected_data, map) != 0) {
+		ksft_print_msg("Data mismatch! Expected '%s', Got '%s'\n",
+			       expected_data, (char *)map);
+		munmap(map, page_size);
+		return -EINVAL;
+	}
+
+	munmap(map, page_size);
+	return 0;
+}
diff --git a/tools/testing/selftests/liveupdate/luo_multi_session.c b/tools/testing/selftests/liveupdate/luo_multi_session.c
index aac24a5f5ce3..7882f49aadaf 100644
--- a/tools/testing/selftests/liveupdate/luo_multi_session.c
+++ b/tools/testing/selftests/liveupdate/luo_multi_session.c
@@ -1,4 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <sys/mman.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
 
 /*
  * Copyright (c) 2025, Google LLC.
@@ -31,6 +36,8 @@
 static void run_stage_1(int luo_fd)
 {
 	int s_empty1_fd, s_empty2_fd, s_files1_fd, s_files2_fd;
+	int tmpfs_fd;
+	void *map;
 
 	ksft_print_msg("[STAGE 1] Starting pre-kexec setup for multi-session test...\n");
 
@@ -53,25 +60,50 @@ static void run_stage_1(int luo_fd)
 	s_files1_fd = luo_create_session(luo_fd, SESSION_FILES_1);
 	if (s_files1_fd < 0)
 		fail_exit("luo_create_session for '%s'", SESSION_FILES_1);
+	ksft_print_msg("  -> Preserving memfd (token %#x, content: \"%s\")\n",
+		       MFD1_TOKEN, MFD1_DATA);
 	if (create_and_preserve_memfd(s_files1_fd, MFD1_TOKEN, MFD1_DATA) < 0) {
 		fail_exit("create_and_preserve_memfd for token %#x",
 			  MFD1_TOKEN);
 	}
 
-	ksft_print_msg("[STAGE 1] Creating session '%s' with two memfds...\n",
+	ksft_print_msg("[STAGE 1] Creating session '%s' with memfd and tmpfs file...\n",
 		       SESSION_FILES_2);
 
 	s_files2_fd = luo_create_session(luo_fd, SESSION_FILES_2);
 	if (s_files2_fd < 0)
 		fail_exit("luo_create_session for '%s'", SESSION_FILES_2);
+	ksft_print_msg("  -> Preserving memfd (token %#x, content: \"%s\")\n",
+		       MFD2_TOKEN, MFD2_DATA);
 	if (create_and_preserve_memfd(s_files2_fd, MFD2_TOKEN, MFD2_DATA) < 0) {
 		fail_exit("create_and_preserve_memfd for token %#x",
 			  MFD2_TOKEN);
 	}
-	if (create_and_preserve_memfd(s_files2_fd, MFD3_TOKEN, MFD3_DATA) < 0) {
-		fail_exit("create_and_preserve_memfd for token %#x",
-			  MFD3_TOKEN);
-	}
+	ksft_print_msg("  -> Populating custom tmpfs file at /mnt/mfd3_source...\n");
+	mkdir("/mnt", 0777);
+	mount("tmpfs", "/mnt", "tmpfs", 0, NULL);
+	tmpfs_fd = open("/mnt/mfd3_source", O_CREAT | O_RDWR, 0666);
+	if (tmpfs_fd < 0)
+		fail_exit("failed to open tmpfs_fd");
+	ksft_print_msg("  -> Preserving generic tmpfs file (token %#x, content: \"%s\")\n",
+		       MFD3_TOKEN, MFD3_DATA);
+	if (ftruncate(tmpfs_fd, getpagesize()) < 0)
+		fail_exit("ftruncate tmpfs_fd");
+	map = mmap(NULL, getpagesize(), PROT_WRITE, MAP_SHARED, tmpfs_fd, 0);
+	if (map == MAP_FAILED)
+		fail_exit("mmap tmpfs_fd");
+	strcpy(map, MFD3_DATA);
+	munmap(map, getpagesize());
+
+	struct liveupdate_session_preserve_fd preserve_args = {
+		.size = sizeof(preserve_args),
+		.token = MFD3_TOKEN,
+		.fd = tmpfs_fd,
+	};
+	if (ioctl(s_files2_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &preserve_args) < 0)
+		fail_exit("preserve tmpfs fd");
+
+	close(tmpfs_fd);
 
 	close(luo_fd);
 	daemonize_and_wait();
@@ -110,6 +142,7 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 
 	ksft_print_msg("[STAGE 2] Verifying contents of session '%s'...\n",
 		       SESSION_FILES_1);
+	ksft_print_msg("  -> Retrieving memfd (token %#x) from session...\n", MFD1_TOKEN);
 	mfd1 = restore_and_verify_memfd(s_files1_fd, MFD1_TOKEN, MFD1_DATA);
 	if (mfd1 < 0)
 		fail_exit("restore_and_verify_memfd for token %#x", MFD1_TOKEN);
@@ -118,14 +151,23 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	ksft_print_msg("[STAGE 2] Verifying contents of session '%s'...\n",
 		       SESSION_FILES_2);
 
+	ksft_print_msg("  -> Retrieving memfd (token %#x) from session...\n", MFD2_TOKEN);
 	mfd2 = restore_and_verify_memfd(s_files2_fd, MFD2_TOKEN, MFD2_DATA);
 	if (mfd2 < 0)
 		fail_exit("restore_and_verify_memfd for token %#x", MFD2_TOKEN);
 	close(mfd2);
 
-	mfd3 = restore_and_verify_memfd(s_files2_fd, MFD3_TOKEN, MFD3_DATA);
+	ksft_print_msg("  -> Creating empty tmpfs file at /mnt/mfd3_target...\n");
+	mkdir("/mnt", 0777);
+	mount("tmpfs", "/mnt", "tmpfs", 0, NULL);
+	mfd3 = open("/mnt/mfd3_target", O_CREAT | O_RDWR, 0666);
 	if (mfd3 < 0)
-		fail_exit("restore_and_verify_memfd for token %#x", MFD3_TOKEN);
+		fail_exit("open tmpfs target for retrieve_into");
+
+	ksft_print_msg("  -> Validating LIVEUPDATE_SESSION_RETRIEVE_INTO_FD (token %#x)...\n",
+		       MFD3_TOKEN);
+	if (luo_verify_retrieve_into_memfd(s_files2_fd, MFD3_TOKEN, mfd3, MFD3_DATA) < 0)
+		fail_exit("luo_verify_retrieve_into_memfd for token %#x", MFD3_TOKEN);
 	close(mfd3);
 
 	ksft_print_msg("[STAGE 2] Test data verified successfully.\n");
-- 
2.55.0.966.g6673acef38-goog

