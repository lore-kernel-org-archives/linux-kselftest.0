Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616117;
	b=wYzpQhHdmvtyiacEYaXwusiy8YEwIVrvcBx+5ip5LAJmmqr0JRzFfJLFrteHDsD6B2AF
	 GnIBSV8OrpfTejwEsmuR2TiNDk9McoY3GayYwm38O2p/uz+CNu2RyMXghJgW4LU3cuhZk
	 iUKgsvHo9V1IdM0d6cs7QfvnlIkxuoNez2OsJrj8m1F8iXNTJIt3yWiFnXuVWY+8vU4lK
	 9S1clAbhJOz9+0987YEdG8HjYOaKblbOWgUrTZcU6GbtW7uvOE8w00B9LHQdM7lgnuFkB
	 b6vF4BQgwWrmB6f3zy5stLqyF5pGg6gPpDRpiLoozA8PmNykczwPK5/IywjOaYqGjHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OJg1Na+PMAE5RwVgjsfjwULctd8zKBeuPkayvvN7fUg=;
	b=rpZz+wFRKRdJKlEVzwDUse49Ccvpwo0JxpLqM4aEyyUKO1wBcp/DzeE5RNDJhQgQ3FF5
	 wPH4HOzljPNVB8lI/jfH7/kSGfLMkGaaehicdS1tTe/C5GgJKdClAgI7i0gzSKJt+6aH/
	 DOLob/tSlKw06SKcz0xyi2B4fxgtsXK36PY3TumsmxYWO0JI/qXY40grXl/Nydj+lLFDS
	 gg7sTfiSdJVumE9QSh/TdlFjHwF0MCqc641jxCeQFVH9zvmGJA2/0Qx9AB8x04sw+yCFi
	 paI7s+RbRnaXpEZi6xK+i9pfC659jc3EaB+Mfm6M7i4glnwzAr7iA5hTmhh0sy+6iBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXxlfkdP;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B105606A331
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 10:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B105606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXxlfkdP
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ea138a3497so17292345ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 02:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793616116; x=1794220916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJg1Na+PMAE5RwVgjsfjwULctd8zKBeuPkayvvN7fUg=;
        b=xXxlfkdPW21250q7PUPfcil8BeNIbEIshPoxXLywEd8TRjzx1liJ7/Hz9KCGpAulKp
         Dyk0yEGAHFjU3byqDEtn+VPd/OIRaeF3IOwmpSqWjFPuaOCjeOlwwdQXD6ptVoc9q6yw
         KTCE7U0PdC+Ng87qYy6SXn9sgJlF39YnJ2Cra8SWyf2awCjZUEk/7wAuOLxsbF973QVW
         jCBY7wSdvIa4/IViLo5T+6LDm9Ekl89YUdl+iUpB9iqNt/Mbh58EBQgHVcuzYtjkIWlm
         B75GsR+BwNFMvc6qU1tSEt42oFlj1ZdcWmhlhXQxbdF3MDQpjAzt5A7CM/wZnFus0NI9
         21bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616116; x=1794220916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJg1Na+PMAE5RwVgjsfjwULctd8zKBeuPkayvvN7fUg=;
        b=pNkp7ryKmKu1PTopHmE1ucu6JunPjtD79972stCQnKJxYPrW3aXguC6ENCj7twykIN
         +n6QnQt5GCvdojf4+L6c92KLpioYTZAYEb8HYkvR+e4jV+dMtE01VEpA4NKU1inlTVSo
         zUb2QsddqIPg2JeRx1/DXtsuCm27BO+JYrhJCnUGh/vEAmd7qBMghdvW8tchYNXpWg3o
         ddm27aJaWpjUEGtelYY6rM3AJRhIBiM2dIzF2MbawU1PMXoo20+3LBPzfz98zcGVygUe
         thm1h/wRxnNYwfgJZsdZ94+NeN95sYnNxMTTYy20dRoCr7xw3/fqRHl8S0vxg3CNiAs1
         6kNA==
X-Forwarded-Encrypted: i=1; AKwUvBwWqyJpMGsL0F0CaYNCM5bSlhjMYe7wzFmvMeTQ8i+Zetxdbr0TTUud0+vuu1lBZAthn92MvSTIQ2L1+Wzy0wM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AvzK6UYVbRTj50IJBrT6XrDm6XrIPoVCLlEQ5JLK48A1mnsrg
	6oVu+Z/CiQBMQmU8ZqCpbdAI0jFlYF85uQ9Z/PoKU0lCQmr/ifarWy6I
X-Gm-Gg: AYBFou2bocP3Hdb+RezIe+JZH7vU84sPmHsEat/ncASTy5Kh5CawmY2adOVFaBhptsX
	XIPDpMOGWi1MqDCuMFoarHnUqYPeu44EwR4V8LQ1VCjSaiJWMS0DrXuPKOH+VuMeo5ZBDiBIrm+
	cSp7maxCj7vIKIIYNNoGqSkOcf00EQcIOlwZaIT+LZKNqncyBoRtdReh7xyQer15OtcQNWfoiJd
	9yiGcVyB79OMgZEbxMsZ6pB0B3GL2XP50PisUBs/5sZpBx96lVtjfUJoAqCSTf+k1o4luwRHkCL
	h/x63LWNPJIlU9HjwEX0CTdJmjtzvQP/mKa3QvJn3NCoiSuOJVNAaWNSFZoETVRinX6uW6gSJED
	WjD4gEw3pzYj4oGLTXoX8ajltwmvE1FuHprf1QDjAJmxVL7DEePYgEnQiEcHaIkbq0rWWlKmvf4
	VgiGo4BUYH2knOtbVuY5AiyGELD65+Cojwwv4YdcoSne3l/xUCNxHXA3nXVv+plAQwXqnnFeP7V
	vDX2yQs5f3gtgSAUI4tv3xbBG39rbI1ZBcUGQWlTa9kSgzy3RgcoIlwMudUqEt+LUaVwdHW9GeE
	ELPBp3hOkjkYewMGT5a3If/U2dZHKqI8NQ1L7pBb8mhUIsuaF5bN
X-Received: by 2002:a17:902:f691:b0:2df:8b09:93bb with SMTP id d9443c01a7336-2eb3648b69fmr89524235ad.10.1793616115753;
        Mon, 02 Nov 2026 02:41:55 -0800 (PST)
Received: from umang-Inspiron-3501 ([2401:4900:1f3a:7c59:eeec:de7d:b077:9b9f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3925ff38sm25195465ad.36.2026.11.02.02.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:41:54 -0800 (PST)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Pokhriyal <umangpokhriyall@gmail.com>
Subject: [PATCH 2/2] selftests/mm: test a uffd write-protect range with an unregistered page
Date: Mon,  2 Nov 2026 16:06:21 +0530
Message-ID: <20261102103621.156928-3-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102103621.156928-1-umangpokhriyall@gmail.com>
References: <20261102103621.156928-1-umangpokhriyall@gmail.com>
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

Register only the first of two pages and check that UFFDIO_WRITEPROTECT
over both pages fails with ENOENT without changing the first page, when
protecting and when unprotecting.

Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 56 ++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 298609544..57e442fd2 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -375,6 +375,56 @@ static void uffd_wp_unpopulated_test(uffd_global_test_opts_t *gopts, uffd_test_a
 	uffd_test_pass();
 }
 
+/*
+ * UFFDIO_WRITEPROTECT over a range whose second page is not registered must
+ * fail without changing the first page, in both directions.
+ */
+static void uffd_wp_partial_range_test(uffd_global_test_opts_t *gopts,
+				       uffd_test_args_t *args)
+{
+	struct uffdio_writeprotect prms = {
+		.range.start = (uint64_t)gopts->area_dst,
+		.range.len = 2 * gopts->page_size,
+	};
+	uint64_t value;
+	int pagemap_fd;
+
+	/* Only the first page is registered; the second is a separate VMA */
+	if (uffd_register(gopts->uffd, gopts->area_dst, gopts->page_size,
+			  false, true, false))
+		err("register failed");
+
+	pagemap_fd = pagemap_open();
+	*gopts->area_dst = 1;
+
+	prms.mode = UFFDIO_WRITEPROTECT_MODE_WP;
+	if (!ioctl(gopts->uffd, UFFDIO_WRITEPROTECT, &prms) || errno != ENOENT) {
+		uffd_test_fail("protect over an unregistered page did not fail with ENOENT");
+		goto out;
+	}
+	value = pagemap_get_entry(pagemap_fd, gopts->area_dst);
+	if (value & PM_UFFD_WP) {
+		uffd_test_fail("failed protect changed the first page");
+		goto out;
+	}
+
+	wp_range(gopts->uffd, (uint64_t)gopts->area_dst, gopts->page_size, true);
+	prms.mode = 0;
+	if (!ioctl(gopts->uffd, UFFDIO_WRITEPROTECT, &prms) || errno != ENOENT) {
+		uffd_test_fail("unprotect over an unregistered page did not fail with ENOENT");
+		goto out;
+	}
+	value = pagemap_get_entry(pagemap_fd, gopts->area_dst);
+	if (!(value & PM_UFFD_WP)) {
+		uffd_test_fail("failed unprotect changed the first page");
+		goto out;
+	}
+
+	uffd_test_pass();
+out:
+	close(pagemap_fd);
+}
+
 static void uffd_wp_fork_test_common(uffd_global_test_opts_t *gopts, uffd_test_args_t *args,
 				     bool with_event)
 {
@@ -2403,6 +2453,12 @@ uffd_test_case_t uffd_tests[] = {
 		.uffd_feature_required =
 		UFFD_FEATURE_PAGEFAULT_FLAG_WP | UFFD_FEATURE_WP_UNPOPULATED,
 	},
+	{
+		.name = "wp-partial-range",
+		.uffd_fn = uffd_wp_partial_range_test,
+		.mem_targets = MEM_ANON,
+		.uffd_feature_required = UFFD_FEATURE_PAGEFAULT_FLAG_WP,
+	},
 	{
 		.name = "minor",
 		.uffd_fn = uffd_minor_test,
-- 
2.53.0

