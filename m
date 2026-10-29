Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311903;
	b=23Ifbtvv1nK6XsaWSmOx47eYPm+LnzDoZylp0hzI6KeBg4SN+7N6B2tzBXEz8S9tzn9N
	 s2c9tS+Q8fZBsMy3XaAs9pkBtTT2H4p71Q4IsBGCSBlcQafrasl69GSTueggr1HjPtOVC
	 SX4D4HQSBZb0LN9aTb3BYDO/MNt86TXQxDby38Jy1K6n3rQU9WAQM/xtKVi0gRqRk95zX
	 Ker3ohp72UFd1yUwi/JeH2oQ+sHwiep/rtVBiWJ9DfI3U3uOlCXZS3mfoD7dbR/EXCpfr
	 CGC3hmInrKh3+r6orvmYTbdWqJhIKzueO0LI8WKvHsrs278OB+2Gc+nSmAELdgfPaPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ItLu3zI4jj0VkRO3F8vNU1JfE+9qdeT+xzrqd6vWApU=;
	b=yGmUBuaIKmYBRGbeZNpW1CVX0KtaIzCYELbu12blGQ0tvBugGsB1ReiXvarFk7u8EByi
	 U2qnMV3VZgdTKFkHJPOfnQYo+rrqnc0sjicmR05mOCqvXEJZPpbpxZomPP7FEjLA2zzka
	 bntPdf+zPTE9IZRQtYmxhDpJzFj2f+pCNXovAgYmwmfYMVK+86Gb7rVyrk8RWTzlKKKbE
	 MWGZqNVqUdZU9zg3SOPP6yVf+s5VTKdgeVfUWdR4ZkHS34PElWsCCQKIW1Oi3oBHB7UNo
	 yhxSMHKEbMKtd3p256YnDUltIAX2cXBNPUZZbmN+npRAJc9Zd9jpFuy7rJCT0pFIzPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Po27IPM8;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBED606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 22:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EBED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Po27IPM8
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so431715e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311901; x=1793916701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ItLu3zI4jj0VkRO3F8vNU1JfE+9qdeT+xzrqd6vWApU=;
        b=Po27IPM8ae5DI9c2BMy860P6VUqQXfN7mzaM4V18jJfF7UgZosgdaJOsGP68429PZM
         ja/PD64vFtplj6hRsecSFWucascqMcpNkVK3XNZtqDJGNmUX85zFkWz3Cdh7CYi2r2rK
         mhDM83LR71kOP+NMJaDzO2Cm8OLEfmrEvUry8KG8H/+9tnpUyCx0FA8UaT5Iz9VEJwko
         u+MhB24FYHMO5pFpgLtVVm+9Up2/M43a9h/geTBUOdhnGYlBXCM1XP2XYrgNpUUhTnP1
         9NGd+6EKGq5cE6wlsvkmiqbJlzBNQWBllyailUP/1bg0XUp0hVkAvw787nIUCrwG4Kvs
         cQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311901; x=1793916701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ItLu3zI4jj0VkRO3F8vNU1JfE+9qdeT+xzrqd6vWApU=;
        b=XjeDSanCdNWiV+fA/bGkZtTFUecD34MfbvJ3qt1xnomFShr4goQQyddf5jYe+9msGE
         iT4tgcTAZHLmhLUCfXR2DQyuI/Der0rhZ2wWMdpbtM8AApwWvO2yjT8SWu8vNX33YKot
         yhmEg1dYt4cTe5JC3wwsTxpRp+k0ZkKsJ5XBUQinotHdWyMr0CmaQfEV6j4liw3b5rj6
         KESqW7liFOapba3/PROKnzxaWac4oU6FmVejdNfl0gwQIaRcwpEZx2FadAqF/+KCKRfW
         Kiftq1T4+DWPdmOp57hncqx2OeytE0PX9imYcHLDzNfrrKR6IRDIk9Hcm8HTvWGn05Ig
         BzSw==
X-Forwarded-Encrypted: i=1; AKwUvByr0/pAs/xFNF/skPJsIH09KPq5rQeGd+RppAzgNFNik1x+r7/NLrUqJFwwjM1Kv5tB3kcZikMCGGl7mUqRVzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOchjZOMPssx6TsV/rBmWhjSEYtwt030cESQ0xacRMEgtdN6xd
	FdQz5OmGSB66MqZzEM9qr9JAkkwIEQ876vD3msQqi1hx5zaaa1JwrulDiMDNcUXXHsQ=
X-Gm-Gg: AYBFou26YSLSOLRlouQXDes1xzPYMihsWFctc3olUMvtA/yxZGQf8Ohn08tcwV44g6x
	xKlsxdmp0Hn5jdbbO6Bnomh+Xfy6WuKgmio/l0Wbmq7+fb4tPY2NBLsDgMrCz1NtXiuyv/IJmrZ
	B95eOx79K24EJ0KRUL0I56asfyFCaIhrb5GA9mpn350vhOLcIhGWCcqxW3OSjiSS5a/c4JriyAv
	4weCT7w/6DJP+Ug6M5JpQb6vHEJ9HpjZDxytusTrfejf4O32k8FyNmL04evTvgp+WBgk+owkZWT
	J2w9ArXpL61P30wTaq4cXC6nfz3MBvzKiwXvTmKTGVLTRUwqCVS6rY7fPgTh+tULfD0/mGXbuhd
	uBiBuDOka/QmkjBbSj/96sWyCufBNctLD53EUMQ1pySpouhzaxCIn8y8qjfY05y9nxpckeA5OfW
	j5bUcDO4Cid8Nm3MEstCjJ5gq1CzvBjqmVaysGPT5k0LaojXKgcGr1MA+jMD0Dlp/QOqwqO0ZwL
	m57Bm4N5siUhEU0TOX5Oa5yroaekct3i0WHqOJ9GtJh5+yFR6Nz9fzaRy2EBXsir8hhtyOIZZtk
	Gvje5Pdf5o3GGg==
X-Received: by 2002:a05:600c:468c:b0:4a3:59c9:a750 with SMTP id 5b1f17b1804b1-4ac17d168bcmr7131775e9.9.1793311901449;
        Thu, 29 Oct 2026 15:11:41 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm104011305e9.10.2026.10.29.15.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:11:41 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH 2/2] selftests/mm: add a uffd test for re-registering during UFFDIO_COPY
Date: Thu, 29 Oct 2026 23:11:02 +0100
Message-ID: <20261029221129.89068-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029221129.89068-1-azpijr@gmail.com>
References: <20261029221129.89068-1-azpijr@gmail.com>
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

Re-register the destination without WP while a UFFDIO_COPY_MODE_WP copy
waits for its source page, then check that the copy fails with -EINVAL
and leaves no uffd-wp bit behind. This covers both the hugetlb and the
non-hugetlb UFFDIO_COPY retry.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 2a97ba1d6feb..8a7efaa7b3ac 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -375,6 +375,104 @@ static void uffd_wp_unpopulated_test(uffd_global_test_opts_t *gopts, uffd_test_a
 	uffd_test_pass();
 }
 
+struct wp_copy_args {
+	uffd_global_test_opts_t *gopts;
+	char *src;
+	__s64 copy;
+};
+
+static void *wp_copy_thread(void *data)
+{
+	struct wp_copy_args *args = data;
+	struct uffdio_copy copy = {
+		.dst = (unsigned long)args->gopts->area_dst,
+		.src = (unsigned long)args->src,
+		.len = args->gopts->page_size,
+		.mode = UFFDIO_COPY_MODE_WP,
+	};
+
+	ioctl(args->gopts->uffd, UFFDIO_COPY, &copy);
+	args->copy = copy.copy;
+
+	return NULL;
+}
+
+/*
+ * UFFDIO_COPY drops its locks to fault in the source page.  Re-register the
+ * destination without WP while it waits there: the MODE_WP copy must then
+ * fail instead of leaving a uffd-wp bit in a VMA that no longer has WP.
+ */
+static void uffd_wp_copy_reregister_test(uffd_global_test_opts_t *gopts,
+					 uffd_test_args_t *args)
+{
+	struct uffdio_api api = { .api = UFFD_API };
+	struct wp_copy_args copy_args = { .gopts = gopts };
+	unsigned long len = gopts->page_size;
+	struct uffdio_zeropage zeropage;
+	struct uffd_msg msg;
+	struct pollfd pfd;
+	pthread_t thread;
+	uint64_t value;
+	int pagemap_fd;
+	int src_uffd;
+
+	/* The source fault comes from the kernel, so no UFFD_USER_MODE_ONLY */
+	src_uffd = uffd_open(O_CLOEXEC);
+	if (src_uffd < 0) {
+		uffd_test_skip("cannot open a kernel-mode userfaultfd");
+		return;
+	}
+	if (ioctl(src_uffd, UFFDIO_API, &api))
+		err("UFFDIO_API failed");
+
+	copy_args.src = mmap(NULL, len, PROT_READ | PROT_WRITE,
+			     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (copy_args.src == MAP_FAILED)
+		err("mmap() failed");
+
+	if (uffd_register(src_uffd, copy_args.src, len, true, false, false))
+		err("register src failed");
+	if (uffd_register(gopts->uffd, gopts->area_dst, len, true, true, false))
+		err("register dst failed");
+
+	if (pthread_create(&thread, NULL, wp_copy_thread, &copy_args))
+		err("pthread_create() failed");
+
+	/* Wait until UFFDIO_COPY blocks on the source page */
+	pfd = (struct pollfd){ .fd = src_uffd, .events = POLLIN };
+	if (poll(&pfd, 1, 10000) != 1)
+		err("no fault on the source page");
+	if (read(src_uffd, &msg, sizeof(msg)) != sizeof(msg))
+		err("read() failed");
+
+	if (uffd_unregister(gopts->uffd, gopts->area_dst, len))
+		err("unregister dst failed");
+	if (uffd_register(gopts->uffd, gopts->area_dst, len, true, false, false))
+		err("re-register dst failed");
+
+	zeropage.range.start = (unsigned long)copy_args.src;
+	zeropage.range.len = len;
+	zeropage.mode = 0;
+	if (ioctl(src_uffd, UFFDIO_ZEROPAGE, &zeropage))
+		err("UFFDIO_ZEROPAGE failed");
+
+	if (pthread_join(thread, NULL))
+		err("pthread_join() failed");
+
+	if (copy_args.copy != -EINVAL)
+		err("UFFDIO_COPY returned %lld, expected %d",
+		    (long long)copy_args.copy, -EINVAL);
+
+	pagemap_fd = pagemap_open();
+	value = pagemap_get_entry(pagemap_fd, gopts->area_dst);
+	pagemap_check_wp(value, false);
+	close(pagemap_fd);
+
+	munmap(copy_args.src, len);
+	close(src_uffd);
+	uffd_test_pass();
+}
+
 static void uffd_wp_fork_test_common(uffd_global_test_opts_t *gopts, uffd_test_args_t *args,
 				     bool with_event)
 {
@@ -2403,6 +2501,13 @@ uffd_test_case_t uffd_tests[] = {
 		.uffd_feature_required =
 		UFFD_FEATURE_PAGEFAULT_FLAG_WP | UFFD_FEATURE_WP_UNPOPULATED,
 	},
+	{
+		.name = "wp-copy-reregister",
+		.uffd_fn = uffd_wp_copy_reregister_test,
+		.mem_targets = MEM_ALL,
+		.uffd_feature_required = UFFD_FEATURE_PAGEFAULT_FLAG_WP |
+		UFFD_FEATURE_WP_HUGETLBFS_SHMEM,
+	},
 	{
 		.name = "minor",
 		.uffd_fn = uffd_minor_test,
-- 
2.55.0

