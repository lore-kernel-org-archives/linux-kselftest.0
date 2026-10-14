Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE30B566C73
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 17:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000690; cv=none; b=Q5mhJVujFmsFa1NCb8F5Kj1rjg7dHY9ryk5JgNnhYvdNrS0PgqfA9xD5kI5rHB76I7q+/vRhG8oYLCRx2zF1bS59FLyrr/ZTirb504CWcQk66+RAe43Q21oIxoLhXFUsaor3GEDSUdsmA25OY4MHxjajvZIhoH+q++NLpZKnquU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000690; c=relaxed/simple;
	bh=RBY1rm5m57OTxM6rzLZnBppbmcBXepNbmDS03aHEmGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brw2FdbAkOnfh2vxX1OD6O0UnpNA046aWsR7cX/LRKqTN8MQluXGhR6ccFB2GCbH1eCE8TjNnozl+SnTY+W0iTd6HN4kY3ax1rQ4ISvPu47vtfxPxa/kn7yG+wSBHZgJiCXHIubL1v2edsTFEGUY9rQm6Ur6EDLk1r6YDPOBwns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Ea8lSsHa; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Ea8lSsHa"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53506b44151so57991431cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 10:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000688; x=1792605488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJbFkHFq6Y12l3Bi7MpiC5ltuWIc3jdeP3hN8D/FbRY=;
        b=Ea8lSsHahxNRRj609qdGWSFTN8eOkYV0T4Fx9mt55/19LMcvSHE0NwwsbbOxbpRAHH
         HpINP3xZEEqZH1r06V82hbv60Vn84Fc6YSewxBzg/WpW+rvYXADVtiXPrDm2KUHRMbtD
         QSnaQHOlqG3g3nQ++z96PSmvuWv7nAgOOy7Z9iDooZrQQAFxK9oZT4DAanb0Cadmpvzn
         vs+sLCN59LkMjCtUK54gk3LAhORs+/0oILGuNctL/GgH+h6VLqm2rZqPg6U+lr2le5T0
         1IrdLM2lNHVVTGzjlhdyTGmgs0jiIMF6d5TP1VPbdGXjVjfR0QH7gpP1+k4+8yVtoQHS
         Rpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000688; x=1792605488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJbFkHFq6Y12l3Bi7MpiC5ltuWIc3jdeP3hN8D/FbRY=;
        b=CtbG/3ioPlD9RCd8KXotVgjiQiAO34zxDcrucH7UdS4rubTiTlrwEBaUZpHJ2C76Ms
         uDzYWVSJRxFPDE4xJQST1jl5fB9mvhxPjRgbZ905FVJmwYSnIEiNJTZhPHFe61Njm9J1
         YfQt7YwsczFhZVgmd4h7VcOXrkg+oDvNSLg5FBUGSTAfxwzuy2Nf3whHV8fRWaZ1qFQH
         +HXvC0/+ssE/QxS+6qxXFqDuQh0iPO4GlgaY87GURNqBxMwh6QYuazDK3wpvems9xJ7n
         tSlgiLExM+Lt5EkI8jtroGfcYifN3zy7clR3Xzycuz1Sps43HKeUgwkzMDP2ZvETjody
         WeSA==
X-Gm-Message-State: AFq9FYKxCMpAjhbjH+pjbvcICQ46KPhPSFMZxaCIUPAiClW8AyIjZneI
	Q6HQ+21z5UA8S/yEvCTjzOkonq9nYrkADxZ661TqPgbFJRiHXx2Basqny9gzZbIxNbNpGeDTVdF
	eZGesD/o=
X-Gm-Gg: AYBFou1Ab6GbXEvVGaB1uJ0u9bwBjYJmlQWemYx9W5IYlElH1wxLmPApqWPUilyL8SS
	CYy5/v9YT4OxKfdLF90jDWyQOm11v0gbq2PjhBXk+HVbDegDB86uWOR3/MwBAmqxcaGYqg1Nble
	Ld5o9QYxb641EYNzH4Os1qD/Bb2RhkwGcqBbykbGB3+is/mn9S+4+2wB2gb6jMVrW8sH27VR0++
	U7SFMWddPqlsFDNnaATtuWAuNo1v4b+RTIs0sEmlM1TmwyAacUoigqYGHE+pmLL+k+ygqrIy5sg
	mzNxs8CFevh9TICQOjtF3t3qk1vfRJFw73JcPwedszTD7BxoiNM0Ylon9KBQad2+Nn7i28YQEV5
	MSIXmk4MT4QNvHGuGkD7vdx2JReJSfHCzQOp0qs1lFL0Cxs369jHKjhEQHkSOke4ZRqKgtiDn0M
	4eftpxJMeEntVdtwJgU0lYX4BMV0KU+/jaNeJO26bqIc7IyPo53govaUKHIWkuhgVdzG0WZn4WO
	HMjeOyj5hFrPU5mF8PNh4q/PzZVknKV9VoAEPyLZWmZ6gEgt+/bqtxXLnSA9ltRj0CZ0LE=
X-Received: by 2002:a05:622a:418c:b0:535:a5f7:d585 with SMTP id d75a77b69052e-535a5f7f25bmr272204631cf.63.1792000687747;
        Wed, 14 Oct 2026 10:58:07 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:07 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH 2/8] selftests/mm: check that MADV_PAGEOUT skips holes and swapped pages
Date: Wed, 14 Oct 2026 13:57:50 -0400
Message-ID: <20261014175756.2035176-3-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175756.2035176-1-gourry@gourry.net>
References: <20261014175756.2035176-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The contract tests check that MADV_COLD neither populates a PTE hole nor
faults a swapped page back in. MADV_PAGEOUT makes the same promises, so
check them for it too.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index bb4efb92e6da..42cc08fe45ae 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -85,6 +85,11 @@ TEST_F(madvise, cold_skips_pte_hole)
 	check_skips_pte_hole(_metadata, self->pagemap_fd, MADV_COLD);
 }
 
+TEST_F(madvise, pageout_skips_pte_hole)
+{
+	check_skips_pte_hole(_metadata, self->pagemap_fd, MADV_PAGEOUT);
+}
+
 /* Neither hint may be applied to locked memory. */
 TEST_F(madvise, locked_vma_is_rejected)
 {
@@ -131,4 +136,9 @@ TEST_F(madvise, cold_skips_swapped_pte)
 	check_skips_swapped_pte(_metadata, self->pagemap_fd, MADV_COLD);
 }
 
+TEST_F(madvise, pageout_skips_swapped_pte)
+{
+	check_skips_swapped_pte(_metadata, self->pagemap_fd, MADV_PAGEOUT);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.0

