Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A304387598;
	Mon, 18 May 2026 18:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128266; cv=none; b=tk0jjTFLBJtIMu0nLlMj/krhJILmx50EcBl+/wkwTZJWD4Ka6ifF6ra428oALwv3omUsE5yF+o/VmaSJhyHScXoANSHTv/8uDB2PnP679QIwgmFctXMa91zRAj3jwBOBByKyBN/9rwo4QCoxuVQHONSNq9CUOyCZRfpmOJ586Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128266; c=relaxed/simple;
	bh=4CO55womEnBoPWCctzW+OpQftEjr2hhkfmJD62dJN44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PW35IYboOmtHBigPAvwGqmTDpl2XjmLXSk+5Uj0bsocel9AHtO0ScdS2sO4GJrCw0iOQ6n+io8PQrTlE8ob1QVR/2bo3NI5ia6EJ0Oi6psG2AcWPtcZnTEyylXbmSOBOBTvUTwmpEYFM2VMQ6waF8pRXMHysOWbF5MCHIq/hRcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaSA7KfQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaSA7KfQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6913C2BCFF;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779128265;
	bh=4CO55womEnBoPWCctzW+OpQftEjr2hhkfmJD62dJN44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CaSA7KfQVyQtRv+yyn5br6OHX/yPIzATzUCHi1Eb/EZspFaXkpKymTJOMyR8d9M3b
	 jR+P8fhRKGpBlxdTRzAdg+IHe0u6ScPeT1mj2WJU8i29ZZTnbHeJJGAdF1mktLD9V5
	 Xy1fM0l2ZxnhJ3zkJZBdeMOSXTScHIuWNo7zZlDQTjwfS00oIxOlu+QoItCMmYUK4o
	 kBzoL18v7OEwvqn9n8gUma7GhpA9cYchtQQZfeH1wlAvA2aPq818oZvFlK7HGEwJZ5
	 xyya+ZVcgYi2qH8i0YUH0i1mEBpe1jbyV0Ce0d9FJXB+E7l3iHdK9Bin2/Kn75I2c2
	 93SbdK1aEZ1HA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE3DCD4F4A;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
From: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Date: Mon, 18 May 2026 11:17:37 -0700
Subject: [PATCH RFC 5/5] mm: selftests: Port readback test logic from
 libhugetlbfs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-port-hugetlb-selftests-v1-5-d64ba3a785fe@google.com>
References: <20260518-port-hugetlb-selftests-v1-0-d64ba3a785fe@google.com>
In-Reply-To: <20260518-port-hugetlb-selftests-v1-0-d64ba3a785fe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 muchun.song@linux.dev, osalvador@suse.de
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ackerley Tng <ackerleytng@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779128265; l=1602;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=89off7URPXKpNOqQZuCiXrCqLPNnXfaicuty8kmghyM=;
 b=2EmdrC/gCQ3MioA72AfovP0JnhYZTfmTmBwAMfNu2EP7oCwZxCKgxIPZaCXufUhQE+ZEiaPpM
 EdlNF/U6uRBBLfpGgRNE33I/AxPAC835iYY/3i4b0CTZgeAgV36UEn3
X-Developer-Key: i=ackerleytng@google.com; a=ed25519;
 pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Endpoint-Received: by B4 Relay for ackerleytng@google.com/20260225 with
 auth_id=649
X-Original-From: Ackerley Tng <ackerleytng@google.com>
Reply-To: ackerleytng@google.com

From: Ackerley Tng <ackerleytng@google.com>

Port verification logic from libhugetlbfs' tests/readback.c.

Iterate using an unsigned int pointer instead of a char pointer, which
enables testing against a greater range of stored values beyond [0, 255].

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/mm/hugepage-mmap.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage-mmap.c b/tools/testing/selftests/mm/hugepage-mmap.c
index dd9fccb209b10..a7d4a3eba3dd7 100644
--- a/tools/testing/selftests/mm/hugepage-mmap.c
+++ b/tools/testing/selftests/mm/hugepage-mmap.c
@@ -45,7 +45,7 @@ enum fd_kind {
 FIXTURE(hugepage_mmap)
 {
 	int fd;
-	char *addr;
+	unsigned int *addr;
 	char mount_dir[PATH_MAX];
 };
 
@@ -122,19 +122,21 @@ FIXTURE_TEARDOWN(hugepage_mmap)
 	}
 }
 
+#define RANDOM_CONSTANT 0x1234ABCD
+
 TEST_F(hugepage_mmap, read_write)
 {
 	unsigned long i;
 
-	TH_LOG("First hex is %x", *((unsigned int *)self->addr));
+	TH_LOG("First hex is %x", *self->addr);
 
-	for (i = 0; i < LENGTH; i++)
-		self->addr[i] = (char)i;
+	for (i = 0; i < LENGTH / sizeof(*self->addr); i++)
+		self->addr[i] = RANDOM_CONSTANT ^ i;
 
-	TH_LOG("First hex is %x", *((unsigned int *)self->addr));
+	TH_LOG("First hex is %x", *self->addr);
 
-	for (i = 0; i < LENGTH; i++) {
-		ASSERT_EQ(self->addr[i], (char)i) {
+	for (i = 0; i < LENGTH / sizeof(*self->addr); i++) {
+		ASSERT_EQ(self->addr[i], RANDOM_CONSTANT ^ i) {
 			TH_LOG("Error: Mismatch at %lu\n", i);
 		};
 	}

-- 
2.54.0.563.g4f69b47b94-goog


