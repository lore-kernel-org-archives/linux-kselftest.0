Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EA9388E55;
	Thu, 24 Sep 2026 05:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226047; cv=none; b=A9gSu+9nrRruk1bt/8Nc7tqYO4M3rRTNdnZcMWRav6EZRCyJ8J1VgxgijuUeO1Apnt52vYtVerq9ToX3QJlZ5YwO794NeE0vZXF+jab002i47yJB9nP+pcp81wdy4MZXnJm0KwLBFm150wPGvVV77Fkge0BIGS0z1Frkxx3B3y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226047; c=relaxed/simple;
	bh=EmkguL785IIXMYOOGQrzJ/6/Y6ZZO1ERK0FFTi6WP+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVZF/Fao1f8xFnka3hYK62zCN8nm8ldgRkqyxOX5vgc5ezLjaJ2JxuZX1to1vx7G6X1MOi0kNRO2ZumL+jjKbmSoXJSaMYyNZfYBjwqmvI5RaupRo4vbVRZ0O8CCwhRc/XSSq8twUCqDlDXVpgCeURfMp6W4d9oCzwaDGvcDSso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VoQ3Sil+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VoQ3Sil+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA0191476;
	Wed, 23 Sep 2026 22:00:38 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A171A3F86C;
	Wed, 23 Sep 2026 22:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790226042; bh=EmkguL785IIXMYOOGQrzJ/6/Y6ZZO1ERK0FFTi6WP+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VoQ3Sil+u+bZMg3gQzQxSDAl5ZC1MWS/6iqveSX+OWgskIoqG3Ry90TTIuPJS8Cn6
	 i7jwJdERAIbLo+84agDoFnJTIV0pU5Yti+FWAWyXM8OA1nzzLZwAbALQKXmfP+YJb5
	 LpEYezMaDIsIuuEYUagvFmvju0a9K7vjwJJ0NBag=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Park Tae-sun <ts930@dgu.ac.kr>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH RESEND 4/9] selftests/mm: mremap_test: correct multiple VMA range size
Date: Thu, 24 Sep 2026 10:30:04 +0530
Message-ID: <20260924050009.19974-5-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924050009.19974-1-sarthak.sharma@arm.com>
References: <20260924050009.19974-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the test mremap_move_multiple_vmas(), pages 4
to 6 form a single VMA. But the helper function
is_multiple_vma_range_ok() checks pages 4 and 5 as
one range and treats page 6 separately.

Check all three pages as a single range and skip
the page 6 iteration to match the actual VMA layout.

Fixes: d53f248258e1 ("tools/testing/selftests: extend mremap_test to test multi-VMA mremap")
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index ba9b7f7566d0..869df22d46db 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -373,7 +373,10 @@ static bool is_multiple_vma_range_ok(unsigned int pattern_seed,
 	for (i = 0; i <= 10; i += 2) {
 		int j;
 		char *buf = &ptr[i * page_size];
-		size_t size = i == 4 ? 2 * page_size : page_size;
+		size_t size = i == 4 ? 3 * page_size : page_size;
+
+		if (i == 6)
+			continue;
 
 		for (j = 0; j < size; j++) {
 			char chr = rand();
-- 
2.53.0

