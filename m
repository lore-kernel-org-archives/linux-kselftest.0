Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2439B34D4EB
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 07:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771830301; cv=none; b=NpBK4UkONBAVa1ZBfQmdC3FGLfYHpddifuTw9snH9nm0haK8teY501Vyp10Q5WAgJs57up+LFUi/j2B4MA7Hup0YyyKCIRCiGd3xM70VQimALcBoukAKFfRsPkvL5sgKVrjXvUecWylmChUPPDU/XduqTiySzH37K2x4f1nkaqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771830301; c=relaxed/simple;
	bh=d3UwQnzpg88aX6gn7ACJy409YivRzc8RbQqNjcTrFfw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fk8v5G+wfxdm/NNaulo0MjqZcUpwyh4uQeDL2R1q3qC6enIqS22XC7SKYv4QeyBP0LDW6jhwhZ/qYMcWP+tvz6M0CX7x2v2ocF++U+0TxyX9PqI29on4p6O2Y6AqVy6skAYU/ADXjMXn/x/G9DC8jdMK5DnlIqUhPYWm/7Fq6Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B6J0k94Y; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B6J0k94Y"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a946c0e441so37711315ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 23:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771830299; x=1772435099; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8EPkBYTIogg/WcIy2FNnZriREPEXUqsGjhG96y07ko=;
        b=B6J0k94YQxKXI/ATg+nnFkMegMK0+AC3JXFPYcwdbPpJQI6PB8F1FKAxK5PeGupwMD
         dQJiUUDatgLKphe4YPs2kJyg4BVq8njg69WHA9tn1ejUCn40awFihwD4+fcLibNP/Uj6
         tb9oa8JlrGzeqcUhc/n+1Q3oxnmEdSCiQvj+lYLuqUem6hLo0pechZbbnDqqhMnh/QBZ
         ivocdVkfelgivR5MVabH5RikvqZO4Zlsw38O4Bv6QXxI7oLDATsARVJEK+lA1eIME57O
         /OiaeQf5FaexRoN2Dx+l9fekkDYwz7TjsM7SK0rThrs8nviZtP4Vliz75osEJNYEittI
         l9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771830299; x=1772435099;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8EPkBYTIogg/WcIy2FNnZriREPEXUqsGjhG96y07ko=;
        b=WPGgF1LDJoe3Ry58+k7k+T63kyLOrAVgfwlX4cfWCvUHbPTylUzW59LQfsPdQu7HiQ
         +LrS5KjgcyDv6Mvi8F2uyX5MKqNQwQsPuvMnRqjGD9yqEQt8e3pth2ZXw3pbn5KyQTbL
         gzAfW9a9++U4dCfE6E/zHZnVrdOdym9SdnqfW2Klydb/HjoktAdDEM3Gj5tM9PcdZGqP
         CMyFwl74L7nlXlWLe47g2zl8oZIyPAEpwa9oM+LSKCBz2Zf5FcA4Crjw3LPSbT47wUU0
         dFPfUyZreO2hCDjFAn1Fj7wTTYGhT1k4eVrmLZdvqOtdKQXkpeMYBOp7JpMfdDPt4HvV
         M63w==
X-Forwarded-Encrypted: i=1; AJvYcCUlaLbxCGzCRdriicRVTOsCv0V5WuqeLyyCol405nNIfhLZdadlDsiM2EG1oEwCikD+kRtNM4OFN1m/e8EGmZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzrlXCLpHfyKKPlhf44NiTZ2DibKokDjoX970pwayjK6X/bNRX
	Z+gELbwh+VEmpFRjCAOLPzswwEzRoI9n6jKT2C1Cof9PZZm4bA0meg6DXSqTrh7iqnVHbXBg0hf
	3Nvt1EXsAA7AZDGxQMOyXPRlqoA==
X-Received: from pjbx30.prod.google.com ([2002:a17:90a:38a1:b0:356:3562:569c])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:248:b0:2a0:a33f:3049 with SMTP id d9443c01a7336-2ad743fe006mr64180505ad.4.1771830299282;
 Sun, 22 Feb 2026 23:04:59 -0800 (PST)
Date: Mon, 23 Feb 2026 07:04:39 +0000
In-Reply-To: <cover.1771826352.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1771826352.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
Message-ID: <e08ed6869b9f555169476d220d7e8112e7163cee.1771826352.git.ackerleytng@google.com>
Subject: [RFC PATCH v1 06/10] mm: filemap: Export filemap_remove_folio()
From: Ackerley Tng <ackerleytng@google.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, willy@infradead.org, pbonzini@redhat.com, shuah@kernel.org, 
	ackerleytng@google.com, seanjc@google.com, shivankg@amd.com, 
	rick.p.edgecombe@intel.com, yan.y.zhao@intel.com, rientjes@google.com, 
	fvdl@google.com, jthoughton@google.com, vannapurve@google.com, 
	pratyush@kernel.org, pasha.tatashin@soleen.com, kalyazin@amazon.com, 
	tabba@google.com, michael.roth@amd.com
Content-Type: text/plain; charset="UTF-8"

Export filemap_remove_folio() for use by KVM.

KVM requires this function to remove folios from guest_memfd's filemap.

guest_memfd used to rely on higher-level, exported truncation functions. To
track memory that is actually allocated (i.e. i_blocks, st_blocks),
guest_memfd will need a custom truncation function to do accounting cleanup
and will be using filemap_remove_folio() for truncation.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 mm/filemap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/filemap.c b/mm/filemap.c
index ebd75684cb0a7..379d62239fc5f 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -49,6 +49,7 @@
 #include <linux/sched/mm.h>
 #include <linux/sysctl.h>
 #include <linux/pgalloc.h>
+#include <linux/kvm_types.h>
 
 #include <asm/tlbflush.h>
 #include "internal.h"
@@ -262,6 +263,7 @@ void filemap_remove_folio(struct folio *folio)
 
 	filemap_free_folio(mapping, folio);
 }
+EXPORT_SYMBOL_FOR_KVM(filemap_remove_folio);
 
 /*
  * page_cache_delete_batch - delete several folios from page cache
-- 
2.53.0.345.g96ddfc5eaa-goog

