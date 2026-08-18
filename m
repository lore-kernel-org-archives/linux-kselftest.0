Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6533B3A6B9C
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053805; cv=none; b=WaO39Vq4YxH6NNS4QK7JRx1Fxsk55peLeGw1EImVG7fmEeVhrP2lkTo4saZ/5CNwMwDz/iRMXb6p59X8I8KKxF6BvHIc35tgBF5OVcQsu1IQtSIPEhrnmNgByXFmbIJ214JbSpcdevOeZPc+zgeL2UnXFGAZgt3ZuLuECuurBgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053805; c=relaxed/simple;
	bh=32O0Qc6tB9URGbw5Ia3Gg+ncB7y7PvsbQbXxBtSqZ1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eGY2CwwPxYFko7TP16U4MhyGXnt8RxxU/nZ4lDwsTx7yRGxMcqo1+qNCFMR7wSGjY4FpbEH95dNO9LQ9m5ZW8HNmG4IIZu4FFf8Qb1yO3OY378Q/JYEGe4vJ9yruMlkc1NVN3wlLKQe3bjYWe62tMvI0+Q/wTQvf7smksoLLCe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvIQirUf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvIQirUf"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc891373e0so58698625ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 04:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787053802; x=1787658602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1U5ZWa2tue/tT4u4ftKlc77EC64ZThcLUHsYap/X3I=;
        b=fvIQirUfmnvGqMGMPo1LvsOxzTtLehyRZEy6QP6EI+OmkZPS5CyuhUIUkO0R1KqD0O
         HfE8Z+c1m1P6LfBTKtFNHUkDhfXL2fH6HVqpwy7+a8S09GBjRMi4zp52tmD+Vlf01lfw
         KPE900xK7wZ9LVvWtQ3QV99pKrejOK/4nxNLaFu6Yje3BMq/MK6k4Fx+wkGHRksRJsRW
         gDRxsUrRLTb9ww3/jvy5hqbx+MxTfVQAG3Njcr+s/3A8NKuR+OKkH2A7AKKaf58tsIWH
         BwIo1/9evSYAEfWntyFlTrBDLJnTMxjx6w/IMFQ9LH5GO9iAXq0mob61hUUWXVhzq34O
         CHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053802; x=1787658602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1U5ZWa2tue/tT4u4ftKlc77EC64ZThcLUHsYap/X3I=;
        b=VPzXQuKMpbEHhKkk3OzPSoFplPrL4IoIKO+XXplKy/hB32m/hv3HPcay9zXhcaD3V3
         rmBmfta03hrqR+WaAIn7U9jel2mut3cE6fWTDipqpom7Q3kejmcHSGJfoqB5oGGVLLUR
         5AZivpiidgvaMgS6wjMS+fu89EtqwxjP6/yiwxuXcPVsBnreXGiRP6QTQsp82S54En8j
         vw9MKXJhNyuEExTh8rtFzTO9uVuikycLFCZVq25PUb1AqXzQWtSuqg3zfe/yvZvpCot5
         zGdR7h1iOMl6pgcbuKvA9bdwuy6z8KB0d8TwAkrKxfHHqpVwLbGPQcUx+jTZfr5UVjjL
         fPmQ==
X-Forwarded-Encrypted: i=1; AHgh+RryXBwfQ+igadTbz2eI8G8Ani4C95sDl3FrIqAwUpOFkh4HSaM7rWTMcBO/Xxv8squg3HEqe3YNfeL81xSep28=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNTwAxjyoZ6tXygIWuGYOy1LW/WYmyWBfUGkJqs7sQdNDl0wIR
	0YHZ2B/ZRm22sAgnfWHe29lM0QG+HnjGmN1ISo/KCFIRR3nTJje0DgvN
X-Gm-Gg: AR+sD12qI8OjeoVNJFZc/YCLP4qmmC+x14qRzbveUAD1g7f/Tr56GRXo4624yfPQkrb
	aS62DA7OYJFu94d9ny1qeA2gFZrlWZ10+C0vOi4kcKIJTxN8j/p1oxezwl/0gjX84Qr/0QdUw2P
	M25F8zHbPw8LWJGoc7EMuMxLfHvIAChy1jAYcHZ2cqwxCJ8uYKh9pTs421SjaQRnsFEjlRSmMhZ
	1ereVuET+vxAZPFt8iFMXPJMEig93bZlXEF7T/6VjxHs6Wjdl61Par9W48hWfEKu7vk8wmkThMm
	f4UkIFlTBGZOItG2DjdJy1nv6/E4CHHf3Ci6CvRme5KnzFunMJtPwl5cY6si6lUjcz5GrB0xCjv
	yZLgjHW+2EC+9e1v+O2a2EuE2soXdmQkLJ9OLAHTXKSKfeV5oyqMDcVnYEmm6NDdxJ6HmAL2uBW
	1uEIfY+7QIvdCUPhq9BDHme9b3mXotnh4+nENlNYRGvIN/fGx9nuP4CwyOVYiK6IR8lJeWATsQn
	2UWrphrNUlxfqmnqJxHjw==
X-Received: by 2002:a05:6a20:da0d:b0:3c3:97fc:93e1 with SMTP id adf61e73a8af0-3cc71e2b434mr41265772637.15.1787053801602;
        Tue, 18 Aug 2026 04:50:01 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dceb20sm14736628eec.3.2026.08.18.04.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:50:01 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Yury Khrustalev <yury.khrustalev@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hemanth Selam <hemanth.selam@gmail.com>
Subject: [PATCH] selftests/mm: remove the local PKEY_UNRESTRICTED fallback
Date: Tue, 18 Aug 2026 17:19:45 +0530
Message-ID: <20260818114945.1312987-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pkey-helpers.h defines PKEY_UNRESTRICTED itself when the macro is not
already known, a stopgap from when the generic definition was still
under review.  It has been merged since, commit 6d61527d931b ("mm/pkey:
Add PKEY_UNRESTRICTED macro"), and pkey-helpers.h already includes
<linux/mman.h>, so the guard is never taken.  Honour the FIXME and drop
it.

The mm selftests build against the headers of the kernel source, see
Documentation/dev-tools/kselftest.rst.  Building them without "make
headers", against system headers predating the macro, now fails to
compile instead of quietly falling back.

No functional change intended.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/mm/pkey-helpers.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index 2c377f4e9df1..626c2e1655dc 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -112,13 +112,6 @@ void record_pkey_malloc(void *ptr, long size, int prot);
 #define PKEY_MASK	(PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE)
 #endif
 
-/*
- * FIXME: Remove once the generic PKEY_UNRESTRICTED definition is merged.
- */
-#ifndef PKEY_UNRESTRICTED
-#define PKEY_UNRESTRICTED 0x0
-#endif
-
 #ifndef set_pkey_bits
 static inline u64 set_pkey_bits(u64 reg, int pkey, u64 flags)
 {
-- 
2.43.7

