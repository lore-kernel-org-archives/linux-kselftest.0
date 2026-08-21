Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E713E00A0
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338704; cv=none; b=EEEq4huZFn973tNw93YTyKwjgjQOu5ImBy5jmqeiaxqXVCT1gXZOU+nDd0hdhZhPn3PohzeHSbNOir7ogzocoGXYEFhOYR0ZQY6ypYRX/OHexSbS4+H1gUXydBDBISrCpjjaMlgfmoKPzthPSGGhv3tt5/Dx3UBIu3rt9QSYlks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338704; c=relaxed/simple;
	bh=orQNNaUZmojI+/cs8egxOMQvuXgFqATETxJY+MjSr8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cImnj+Y0YSOASCUIjIpmIO3WtGX5S0CpxR2CYzlnj03/EQUiYHEiQmZETiC4vQjfxoVRVtOIRCz7NEpH3md+Yo00Ys1xjlylbqkl9rlo2oEErqyxX9he2arjHeueEXm7cxm15NrbhjerFhiNhnyKMhIvam0WVY+23eCaOBNizBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DKJg7AUH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LUTohYnG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DKJg7AUH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LUTohYnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s7YiByawknR2bKXyMMS9faTlbP3TdC6Smi6Eshk/hFk=;
	b=DKJg7AUH3vZg8XvIEpRvW8lDImcbuNV1WC3Iyp7mMtG2GyTSylr3cDafwWlI9VcrZFIWsN
	Ft4w90J3AdpzuCMy6syrvb5EeVJvPJkm5IGwRfrHu/ClX4ez3nkmtc0zNJ2Dsc4jpl6yUf
	U4b6tQ6ZK6LXwEx0280e79FZT9r01Uw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-pxEd-f30NNKFbxIhA2p46Q-1; Fri, 21 Aug 2026 14:58:16 -0400
X-MC-Unique: pxEd-f30NNKFbxIhA2p46Q-1
X-Mimecast-MFC-AGG-ID: pxEd-f30NNKFbxIhA2p46Q_1787338696
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c8d271ac9so7444416d6.3
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338696; x=1787943496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7YiByawknR2bKXyMMS9faTlbP3TdC6Smi6Eshk/hFk=;
        b=LUTohYnGVgS0R5QUoInTii2VjCg/+5rXJisqABF9/1YrnGD85Q/ypeEsU814uU4dvf
         0xrMkVBd02ZOz6f5jqxTqLVaJKSFY5dV5A0jzDqWAg7LwOeQEshximHrWaWQnYwujTOT
         wPK6UC9/tOtftYm5RgUGOG9jsfr+Gxdrihfet9i1DYE2LMr8IHU6BFYDCstzUIL+P3DM
         AtlL87lbWmGEIDHlfV+/dDaKp6GRo361CVlGFFYvsP7F4l8zzzCBcZ0iqgQHdiQDFbNt
         oyCpepwwcpdG8UyOO7QR2ZcLzgxfXH523NmJyVbhLcc7OXBs98jlmdbw4MqsCD4XkAPb
         v+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338696; x=1787943496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7YiByawknR2bKXyMMS9faTlbP3TdC6Smi6Eshk/hFk=;
        b=NPa+236LX14HUNLd8PDi4/qk7qF+kUG6j9dYAI5YQD7y/7M7FK1TwLTFiXhPMjcE9V
         Pfat3lQdpHZ8mKZhqtPNgoX/eIObuXphR/MMHCi9Pd67A4rxIFD9NLSdW6da5emVYmAS
         VNdv7zMHQvYs86nbNZKSK/oqesXPBIrzakCnYoGa5VI9YiHdHCtBDPKfEyoMoq7ilBje
         saVXLasGNPDpn64Tlqu9qtz77WWVQgA14KvsL/2GpaLdQXu23cAOGABB9fzD2jGNwdge
         yWHDxD/V/ilcWDiXPHbbQosZOIRdqA5Clb9in5R8X1KwnSOlmeRTyHp8lmRBNo6xdF6y
         /Y5g==
X-Forwarded-Encrypted: i=1; AHgh+RqeFu++QrXuAyTOfkzqiZVyz5d1/PVcywO4gTha/jeqK+ZudZ33KDyosIDlDlnoIQyYAZeZ0Pvff1Z9T5k1gXY=@vger.kernel.org
X-Gm-Message-State: AFuF++lx1aTK3chmjMpodRsjnd/aM5nyZt/P1uB91JhUyXnLZbXpz8uS
	sXFfhT5/8EHt/xRVWSOzZpdjnnXxJl5G+8dp5/9PazPtb8CID0pZgxu64M5YRr+P5a690Xmct6n
	vUTcru/tGJfCa7Xs72T/qJdAuMr9MLT5eSDcqhcr4moYLIgOkuWXNbBcX3y1BVjr1yFGH3g==
X-Gm-Gg: AR+sD13YE4b4S03MZyqCK51aVb3DsfmefahFkjmMqsKqzHraYjpriRIXL3rwmWhvG7v
	2WQK/rNbIrOHnkZxkiNWjsLfjSmWwE/s103hmUv0sGsrxHXJh0U0qQ7xaAZ+FmSJy0CSEvHNz42
	LyuQDImVeIjP8nl1K7q+QQOUHT3gAho1TOfSH72/rUGOwNlMgshKKtQykd0pE7rI3hkVDNbouEm
	yxjJ+0FCY+PK+9BskhiO37btHIWoffYZNvsSVOFkCgXn9aVQK3x+8RbTSy7YOX3zjvZ1nyhRZ61
	QpZXjDNSLABRNECGk2enBvQjPGRZqIKEq7NHCbo1F7nH4M0tzfkJc5rUfXuf4YP+6cpXskHYjly
	3uIdBgTOztlsH9BpP9NrQ+ByHBN15+HZduSAwH+S/6S56
X-Received: by 2002:a05:6214:3114:b0:8de:25f7:98bc with SMTP id 6a1803df08f44-90c8fa2ace7mr7854906d6.22.1787338695852;
        Fri, 21 Aug 2026 11:58:15 -0700 (PDT)
X-Received: by 2002:a05:6214:3114:b0:8de:25f7:98bc with SMTP id 6a1803df08f44-90c8fa2ace7mr7854186d6.22.1787338695297;
        Fri, 21 Aug 2026 11:58:15 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c6b42455dsm51197756d6.37.2026.08.21.11.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:58:11 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:57:02 -0400
Subject: [PATCH 10/11] selftests: cgroup: add memcg hugetlb_cma tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-10-d21b165b8440@redhat.com>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
In-Reply-To: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.3

test_hugetlb_cma_charge gets a hugepage by incrementing nr_hugepages,
confirms memory.cma.hugetlb0.current increased as expected, then
releases it and checks the counter returns to its initial value.

test_hugetlb_cma_limit sets memory.cma.hugetlb0.max to 0, tries to
allocate a hugepage and verifies it fails.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 tools/testing/selftests/cgroup/test_cma_memcg.c | 209 ++++++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_cma_memcg.c b/tools/testing/selftests/cgroup/test_cma_memcg.c
index b5b5ea140518..9bd41d9a6177 100644
--- a/tools/testing/selftests/cgroup/test_cma_memcg.c
+++ b/tools/testing/selftests/cgroup/test_cma_memcg.c
@@ -4,7 +4,9 @@
 #include <linux/limits.h>
 #include <sys/mman.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
+#include <dirent.h>
 #include <fcntl.h>
 #include <linux/dma-heap.h>
 #include <sys/ioctl.h>
@@ -15,6 +17,10 @@
 #define CMA_RESERVED_CURRENT	"memory.cma.reserved.current"
 #define CMA_RESERVED_MAX	"memory.cma.reserved.max"
 
+#define HUGETLB_CMA_CURRENT	"memory.cma.hugetlb0.current"
+#define HUGETLB_CMA_MAX	"memory.cma.hugetlb0.max"
+#define HUGEPAGES_DIR		"/sys/kernel/mm/hugepages"
+
 static int cma_heap_alloc(int heap_fd, size_t size)
 {
 	struct dma_heap_allocation_data data = {
@@ -145,6 +151,207 @@ static int test_cma_limit(const char *root)
 	return rc;
 }
 
+static long find_largest_hugepage_size_kb(void)
+{
+	DIR *dir;
+	struct dirent *entry;
+	long max_size = 0;
+
+	dir = opendir(HUGEPAGES_DIR);
+	if (!dir)
+		return -1;
+
+	while ((entry = readdir(dir)) != NULL) {
+		long size;
+
+		if (sscanf(entry->d_name, "hugepages-%ldkB", &size) == 1) {
+			if (size > max_size)
+				max_size = size;
+		}
+	}
+	closedir(dir);
+
+	return max_size > 0 ? max_size : -1;
+}
+
+static long read_sysfs_long(const char *path)
+{
+	FILE *f;
+	long val = -1;
+
+	f = fopen(path, "r");
+	if (!f)
+		return -1;
+	if (fscanf(f, "%ld", &val) != 1)
+		val = -1;
+	fclose(f);
+	return val;
+}
+
+static int write_sysfs_long(const char *path, long val)
+{
+	FILE *f;
+	int rc;
+
+	f = fopen(path, "w");
+	if (!f)
+		return -1;
+	rc = fprintf(f, "%ld", val);
+	fclose(f);
+	return rc < 0 ? -1 : 0;
+}
+
+static int test_hugetlb_cma_charge(const char *root)
+{
+	int rc = KSFT_SKIP, in_cg = 0;
+	long hpage_size_kb, hpage_size_bytes;
+	long orig_nr = -1, new_nr, before, after;
+	char nr_path[PATH_MAX];
+	char *cg;
+
+	hpage_size_kb = find_largest_hugepage_size_kb();
+	if (hpage_size_kb < 0) {
+		ksft_print_msg("no hugepage size found\n");
+		return KSFT_SKIP;
+	}
+	hpage_size_bytes = hpage_size_kb * 1024;
+
+	snprintf(nr_path, sizeof(nr_path),
+		 HUGEPAGES_DIR "/hugepages-%ldkB/nr_hugepages", hpage_size_kb);
+
+	cg = cg_name(root, "memcg_hugetlb_cma_charge");
+	if (!cg)
+		goto cleanup;
+
+	if (cg_create(cg))
+		goto cleanup;
+
+	if (cg_enter_current(cg))
+		goto cleanup;
+	in_cg = 1;
+
+	if (cg_read_long(cg, HUGETLB_CMA_CURRENT) < 0) {
+		ksft_print_msg("hugetlb CMA counters not available\n");
+		goto cleanup;
+	}
+
+	orig_nr = read_sysfs_long(nr_path);
+	if (orig_nr < 0) {
+		ksft_print_msg("cannot read %s\n", nr_path);
+		goto cleanup;
+	}
+
+	before = cg_read_long(cg, HUGETLB_CMA_CURRENT);
+
+	if (write_sysfs_long(nr_path, orig_nr + 1)) {
+		ksft_print_msg("cannot write %s\n", nr_path);
+		goto cleanup;
+	}
+
+	new_nr = read_sysfs_long(nr_path);
+	if (new_nr <= orig_nr) {
+		ksft_print_msg("failed to allocate a hugepage\n");
+		goto cleanup;
+	}
+
+	rc = KSFT_FAIL;
+	after = cg_read_long(cg, HUGETLB_CMA_CURRENT);
+
+	if (after - before < hpage_size_bytes) {
+		ksft_print_msg(
+			"hugetlb CMA counter not charged: before=%ld after=%ld expected +%ld\n",
+			before, after, hpage_size_bytes);
+		goto cleanup;
+	}
+
+	write_sysfs_long(nr_path, orig_nr);
+
+	after = cg_read_long(cg, HUGETLB_CMA_CURRENT);
+	if (!values_close(before, after, 3)) {
+		ksft_print_msg(
+			"hugetlb CMA counter not uncharged: before=%ld after=%ld\n",
+			before, after);
+		goto cleanup;
+	}
+
+	rc = KSFT_PASS;
+
+cleanup:
+	if (orig_nr >= 0)
+		write_sysfs_long(nr_path, orig_nr);
+
+	if (in_cg)
+		cg_enter_current(root);
+	cg_destroy(cg);
+	free(cg);
+
+	return rc;
+}
+
+static int test_hugetlb_cma_limit(const char *root)
+{
+	int rc = KSFT_SKIP, in_cg = 0;
+	long hpage_size_kb;
+	long orig_nr, new_nr;
+	char nr_path[PATH_MAX];
+	char *cg;
+
+	hpage_size_kb = find_largest_hugepage_size_kb();
+	if (hpage_size_kb < 0) {
+		ksft_print_msg("no hugepage size found\n");
+		return KSFT_SKIP;
+	}
+
+	snprintf(nr_path, sizeof(nr_path),
+		 HUGEPAGES_DIR "/hugepages-%ldkB/nr_hugepages", hpage_size_kb);
+
+	cg = cg_name(root, "memcg_hugetlb_cma_limit");
+	if (!cg)
+		goto cleanup;
+
+	if (cg_create(cg))
+		goto cleanup;
+
+	if (cg_enter_current(cg))
+		goto cleanup;
+	in_cg = 1;
+
+	if (cg_read_long(cg, HUGETLB_CMA_MAX) < 0) {
+		ksft_print_msg("hugetlb CMA counters not available\n");
+		goto cleanup;
+	}
+
+	if (cg_write(cg, HUGETLB_CMA_MAX, "0")) {
+		ksft_print_msg("cannot set hugetlb CMA limit\n");
+		goto cleanup;
+	}
+
+	orig_nr = read_sysfs_long(nr_path);
+	if (orig_nr < 0) {
+		ksft_print_msg("cannot read %s\n", nr_path);
+		goto cleanup;
+	}
+
+	write_sysfs_long(nr_path, orig_nr + 1);
+	new_nr = read_sysfs_long(nr_path);
+
+	rc = KSFT_FAIL;
+	if (new_nr > orig_nr) {
+		ksft_print_msg("hugetlb CMA limit not enforced\n");
+		write_sysfs_long(nr_path, orig_nr);
+	} else {
+		rc = KSFT_PASS;
+	}
+
+cleanup:
+	if (in_cg)
+		cg_enter_current(root);
+	cg_destroy(cg);
+	free(cg);
+
+	return rc;
+}
+
 #define T(x) { x, #x }
 struct cma_memcg_tests {
 	int (*fn)(const char *root);
@@ -152,6 +359,8 @@ struct cma_memcg_tests {
 } tests[] = {
 	T(test_cma_charge),
 	T(test_cma_limit),
+	T(test_hugetlb_cma_charge),
+	T(test_hugetlb_cma_limit),
 };
 #undef T
 

-- 
2.53.0

