Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607113;
	b=fRDBnVjpuBf0F8QbMTwbCNoG4GlMt4+CozMVjbN64VRnPwtEEmz6mWyE3rHm+9/ONmiR
	 D7HCdqfBshoAD5De6W88o4EMaz5j/IOetQmX2bVVEh3tj2O67vLMA9W+ezjIYrdUfBN0y
	 rsI5OZV5IxX1V042tfAIe5fs/5tLOb7degM6+ibgXtz8irUmZX9IsfR3Hi5Jl5cU8ThhI
	 ZgMhcUI4yRaUSjvyoKzcTK3lsqEZHxiyiJsIVaG1zRKRzhcs4L6W/9eCj30H5T8SldYGE
	 dIeq+KCyEq5pLtK+moZFLrSGw96j31PvViVZHVNyh3Y7WbPyKUCpX7X5qO9sAfTXyLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Skgy5VZxk2gILLHcPLrF17iQzssiYgUtpst1TmBVQUQ=;
	b=AZg/sH2ZZUgBQ8USQgWlbRjnBcqj+dlnKIRx0X96t1vLRzHF007xKQsxZNGX5rKX1052
	 YMRMEgpO2P5o+Gj7T5Qc3Ug/N4MSngpZ/jrUXwp1zv35QF+HfG3PawO7WZihmUpik9KXc
	 mzYzwagOmrN36YCW+H9EN23B6ynKrvHmQOeo9R3qC2EDql7yfJMVq84mCGLwcPp0pYRpM
	 IpJd9VtGayHQzrW7x4Lc3mRju9Jc7MK49qFUYDFWQONllEc1h2OOXYaXssf9s4GvbBFky
	 01H1OsDF+ERr0901cRQw+PiTP9ILYG0IKEuBZNXipMO/dIBSGw1lZXcjmziWZdSqTbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ADxFO8XK;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D858606A334
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 08:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D858606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ADxFO8XK
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so2492950f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 00:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793607111; x=1794211911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Skgy5VZxk2gILLHcPLrF17iQzssiYgUtpst1TmBVQUQ=;
        b=ADxFO8XKZwuBPWXh4fy0M9tOg8XzXE4D8ydzy9OPgrmVlLRcjWrilUzQSO3D2T19QJ
         fg5uiBO+J7SBj8AuT7rH3CocD/NJ5KTypblXMyec2iyS7DGMP1wyFIVtek3EhmT6BMQi
         S0v34GYeGl7TXQUFhUPwRvshuLBtczh0Fpp5ZHA/OuhIR/BClpsOUODDUJC1yQ8gkL/7
         VNrezhA6bjmIX44+t5X/Eq756lITZN4j1WLm/+Hleb7A1s7Icc53AG0VuF9kOSJtqBRj
         BHVI8f5oJ0BkJs0QYLezEwik1KIMHqEW5EbCanRlCuzq+V8cy+V29uxRSo8u4bGpH2kF
         EHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793607111; x=1794211911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Skgy5VZxk2gILLHcPLrF17iQzssiYgUtpst1TmBVQUQ=;
        b=oZ6VfoijkFgoKzf/JgV/C1/sVWEu58M6ucb8vWxtwRO3Si9jIJ+wvivvf+cF/QtHxJ
         Wn4OfVI/8yG0UA0IY/x5QQfQQttTBQuolcyjxnHIi8S3xyqPoIj3hKEXFJWM97CZNZN5
         miwDfndPRGMBfl1PuUT4Gap2pfzWFJjeJEm4/d7+fyjP+VwkjcpwR1rBgCtMFER3iqls
         7xO1+/4aD5d9ObwAn/XHK+9VQEUpUXCeeFcU/CfT5WntWUjtXMAAebqvIeLeed9Lx03q
         83jA5grsZiHwYCjdcw8pE+HLV3mkPGAj9se1C1XDJtfRqJXYIsvrAsrvRh4YfItEBTHx
         U68Q==
X-Forwarded-Encrypted: i=1; AKwUvBxBDCtGuD4MPQHVbhl35mPcQpSpHlRO7oXYIN2ANaO4wYTk5UVK/0ErFOpmfukxQu2JoflNxHGBFijEctjSpAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpKBFixnge6kUkYGrk76DvIHxh5CMN7ch0QBSh0JkRYLAV1bgz
	mvYjwc9WO+DfW0bDKAIcQJNRyt4WFczArewzIoKrCd70saFX7dlvKikF
X-Gm-Gg: AYBFou0ulWv6/XWuxs3N1lf07H0XAfxfCub8jRovvmoDLPBOmeWBJjOx7yGEeplFKvg
	kNkrME+BRDFN+f2ALD49OG8OZS+S0o6MTWq9zXLPk01KU5m7LSozA3znsStSMqyGiQ9BONv7k1H
	ucJs4ntNIfA2Z0VxuYi2tDzyOfb0u00x9J5zlqTQOhSBTPsfw4pCjf+FrrNUWKe7Dpx9W3vos6w
	5uXUGwBY6rLI+I8IAdUxbEXiNnlT4K372DbiB50H9fgT0qEIE9O+v3EMcdiqwydztt30zTq12Wx
	qKAHnCUSG3+4oPgFswkGZdwQpcy3f8G5/lIesC3uObnieDL0kWuV/Wl2OA+5YUsGIsBnbRltpPG
	Zt6zwThuy43utEeE3+LgGXFJraMGux9fbHZ9ZWs7OXb/U8UckeeE2y2ew3aY6QzX1c1yxRqHtKY
	qXOe+WVOLVqvAbJG6hjY5tYJZwwKI9Y1X1ScxBU1Xm7lJL6vMjWgFqgx3hKpCh3F7QW95UcNJKX
	fKKw5vn4+xB/G4kAO0lSLV7rOXktWmKaYyOfFZmOt3scvMEckN4ms8CRO6HEHp71mnoIZv4UP7L
	2GoUauPAXI30lw==
X-Received: by 2002:a05:600c:46d1:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4ac17b2cdc2mr215325315e9.27.1793607111269;
        Mon, 02 Nov 2026 00:11:51 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm333331005e9.14.2026.11.02.00.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:11:50 -0800 (PST)
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
Subject: [PATCH v2 2/2] selftests/mm: add a uffd test for re-registering during UFFDIO_COPY
Date: Mon,  2 Nov 2026 09:11:31 +0100
Message-ID: <20261102081140.201987-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102081140.201987-1-azpijr@gmail.com>
References: <20261102081140.201987-1-azpijr@gmail.com>
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
and leaves no uffd-wp bit behind. This covers all memory types.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Changes in v2:
- "all memory types" in the commit message
- rename copy to result

v1: https://lore.kernel.org/20261029221129.89068-3-azpijr@gmail.com

 tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 2a97ba1d6feb..cc22b4cde621 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -375,6 +375,104 @@ static void uffd_wp_unpopulated_test(uffd_global_test_opts_t *gopts, uffd_test_a
 	uffd_test_pass();
 }
 
+struct wp_copy_args {
+	uffd_global_test_opts_t *gopts;
+	char *src;
+	__s64 result;
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
+	args->result = copy.copy;
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
+	if (copy_args.result != -EINVAL)
+		err("UFFDIO_COPY returned %lld, expected %d",
+		    (long long)copy_args.result, -EINVAL);
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
2.56.0

