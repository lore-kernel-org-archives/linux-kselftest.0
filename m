Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701735;
	b=PoioT2TH9NpasM3gthrSVHDmv2hoPjVq9LoRT6gUmt3kiRMe6CqeXKIzbUsesDpEtjbx
	 iggP43uyBFMxJwLVXBFl8RvCjuy4uoLjLkq4LXTYV6/UrkMQZSSTAl5scNlP6+gPsgOYF
	 aYSUPBJKE5nUxmMj3s8pWmRNAOO07zAPdFAtNjVhmTnR9IkU86Z1JrNQBWVE/oObPsFZl
	 Wj9WQ+uuqID840/DMcLB02DJuom5DtYF/EfqWstDt4TVPwNFmdqPK7qRQ7HZp6//jGqKu
	 jZmVMk6oS0zRUYBwMPu3lD3yVBeIQieWgfzvLQkqcGm2LXdnYeBELGAasA7dhqhuTrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yFvHrJ226gOIeLudLE6azLHSFzqJ0Fej3gicSvLOC2I=;
	b=Mj+EG6zxdY8Kz/RV6w/N+z/GQDhcMolOSgdWARLkm3NWZZ5L2y1GweLP4xiIkgN6Dk/3
	 wbaK493SbIHzbvoersjp08897x/DyNUS9kWDaJ5MtyWNjCtpHi1SoWTs9aZ8lN3IEinSN
	 oDkErb2t8kIVL15V+mMWwf2CMWHFgeGyYOsjPyqiBqUd1IZ9ya7dKhYNLVGJoquFecWci
	 YetxBI0XK7dyGIlbydm+MO87G+qyCgDEgirbk76MU5XC0+M0d5MZC3kmBWbxpBM15EQvK
	 HFcWYWmH1aGEUfA/GsZ4T2QSWXavXbxe0LgKJb0UZ76GOTQ9zX+02BhayyW0SevGhHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLF5Ie2f;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57AC60A6F63
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 10:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57AC60A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLF5Ie2f
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e47347279so2480936f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 02:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701733; x=1794306533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFvHrJ226gOIeLudLE6azLHSFzqJ0Fej3gicSvLOC2I=;
        b=ZLF5Ie2f2xyVVZ02CTWAaM44AP5P/tpCx89DQAuEHO4v24WtrhxFcdf5UCSlEtZP2N
         9lOSAzm1m88H9pLip9TEpiVjjQ6nccTJjeleZgCF8vxdOHoPQ/msF+ZojZJb0byPTVZ4
         ppRH4ScAXnVuZRHtrgOqKNjcMO0XZ00dY7ch4Q142omBAVXtAo9Y2X7VihnKmfwUVSnU
         Cfk6GQEIZM58/3od82Fr3rHe9SorL7X9qH8YpmjwgSF5yMf2RZhOPGylvgbpKgB/MYWJ
         J2bCv/zhgrPsQFD8k3UDENlb4sUkijuYnPMqsf2VX3J211uwQij77ltW7oTg4MhDaMxr
         satQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701733; x=1794306533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yFvHrJ226gOIeLudLE6azLHSFzqJ0Fej3gicSvLOC2I=;
        b=hu4L1MTQx7SO6WO9pecAs+wiocAwQQAXBuFZkoM7pZ3vX80KHmQAo2/QhT5lrqjZ3F
         GbHTLwuwVPfZMlaFEMecEY9Do9wgidoFEWgxNRl3vuM8edwRivvtpIY/NVUAu1eGcCT6
         rV98xJT7RAwAGZ0ogKjc+Fk0ys5SgP2h6JO5lHQoP8j3YIElqKtEBiRPuYDz0lJUNNij
         IUIt982v+08VQOJm56hZ5x1enlyOGk9nwpYFDVhWJ9lY4PtYzWtvokRhnIlvYtLPmFyW
         4o0IBVqsoqUfLL9bqM6IWqNpjVn2LydHOlLqW3PsZvzq4UErhqZK82gO49sBAMSEhfAZ
         gj4Q==
X-Forwarded-Encrypted: i=1; AKwUvByASVKYwGpzbE9iCNYjMoshEEjFcyQgjQaS7TrVTFu29Rxv7QzXGcvIPr76X2b0LOub7axa3z22X2jop1nuulU=@vger.kernel.org
X-Gm-Message-State: APuU4Z80YBZh1mwhkTOvDJc4sMyS/G5/ayNhUkxWF3DD5wN+pqe3Hrqg
	WowY14xcONFTexz/C2q6zGhVZpfqWYN6jN8+XJILWX1SCWr3a+scVKiv
X-Gm-Gg: AYBFou0tr6urcoGbYJPVjhcUUbUYCL2Lw/56FpNU+TfGzq+PaqRarOcthwWZoGpV+3T
	gEO3huKNHSmf6xLifXXt3VWP9mNGZRbcMPO+yyT0ALefWCbZBkPDcESeCdKt/DFw4l6JjtgMtEc
	MPFHbGh+KWRYekNuZkC2n3DlbLtC4kSlaHm2KSqtLYKYViBsmAA2YpxYvF09fIlGZKOzI5cF/tz
	arPUalkrEHlBv8rVyP/K2tShHe1iitKVeDKjO2qL1uY8T2KMJlDjXnasW+NOopUGLM3DtNx3SL8
	2USZ0KTs1DRXBhosH99d7WpXG1uhjbFgxGUFESsSotSwoDANJ8Zq3CqLWCi0jZGry2oQNjERMh5
	8KNvuQmtcLX5y0j1vrBWZNtBNEXYpYTCDZ3eZFfuqxRYnDGYzgb/nKZm6lQxUF3kILsWtp5iiCu
	9oyDTPRN43nw0eL8W1+HdzXpyXZEHgKCU7pl1xdHwly/x+fKefvHGal5uh80JT3lkF48V2dMYDu
	dMs6xIfsr4+IpE+xUk3qNx53odEPSSJH8sne/0CLg67MhSewapA5OKRNzKEtbiCUBony7iGyxEQ
	2NI4MPHAHIITNA==
X-Received: by 2002:a5d:5f89:0:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-48e6e5004c1mr26768734f8f.50.1793701733040;
        Tue, 03 Nov 2026 02:28:53 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm24941003f8f.22.2026.11.03.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:28:52 -0800 (PST)
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
Subject: [PATCH v3 2/2] selftests/mm: add a uffd test for re-registering during UFFDIO_COPY
Date: Tue,  3 Nov 2026 11:28:36 +0100
Message-ID: <20261103102840.68903-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103102840.68903-1-azpijr@gmail.com>
References: <20261103102840.68903-1-azpijr@gmail.com>
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

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Changes in v3:
- open the source userfaultfd with O_NONBLOCK and check for POLLIN, so
  poll() waits for the fault instead of returning POLLERR at once
  (reported by sashiko [1])
- add Mike's Reviewed-by

Changes in v2:
- "all memory types" in the commit message
- rename copy to result

[1] https://lore.kernel.org/sashiko-outbox-194303@kernel.org

v2: https://lore.kernel.org/20261102081140.201987-3-azpijr@gmail.com
v1: https://lore.kernel.org/20261029221129.89068-3-azpijr@gmail.com

 tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 298609544445..e811ca49bb83 100644
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
+	src_uffd = uffd_open(UFFD_FLAGS & ~UFFD_USER_MODE_ONLY);
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
+	if (poll(&pfd, 1, 10000) != 1 || !(pfd.revents & POLLIN))
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

