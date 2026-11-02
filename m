Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613807;
	b=KrPRcLlTug1OrN/6ObfxUkiMpNT7AwauykSFqlJId7pWt1bkZSxdHOI/MpF7TdClk4cN
	 wS2+gv8tloVIUKKOoJzqlvLEK0HjhQfiiE8Dz5fZD2f5AkZ2sldcoOJIJDqrIbmY0ILLO
	 0AoTajhNS+lXfAlWwGYtNG4A4XBPuX/mKZGQDcSNrbbkbqquIVS8GX+L0C5qjnaFTCvVJ
	 YV8KPj3NWAIB94iQQg9fjXMFizzbvJSCJChr7WHxOK6NHwpw2C4HEOi3fWXxkv1Noq4sC
	 TImhE0eXQiakWwpDx9zwDEaUdk6VcqSNPwCDMoMFhZq/2H9UTLmqLp/jN3A2HkR63tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613807;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qsWUhK3u8xxsdLOp7S4PeHirDge8KSgZCNYY2BYGink=;
	b=dmfDeAbRFuScM7WFTaSPpAXFoUPLf7Qd8tT1t4UwFX6IodeCH2uLRKeYw32+kMrKSOmH
	 0//gGBpNyB5wn0KN/ZwPNCtnGvMmExWKOOI+w+oAEqy5Exf3BMj79aqwF5HNfttn8HHZJ
	 u6AZ7sSZQ/+OvmvlLGQkGsM9XcGOZ++87h10lmQm101sk+Jthc2jIu4oKXQdSfIH9avrv
	 41cJTR3cLmYxh3s0L8aH153NHmaH/rVMvmWZizV7porlc4yCAwEhbBhraUwmPJz9/itTm
	 gztSB9u2BhaxKwx6r4D8pc2576jX+jMiChGNM2sf/qZhqidwvxpek1C1gvejZT9V4iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b8EjWOy3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE17606A330;
	Mon,  2 Nov 2026 10:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AE17606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b8EjWOy3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED9851762;
	Mon,  2 Nov 2026 02:03:22 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.156.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B23643F59E;
	Mon,  2 Nov 2026 02:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613806; bh=HON1k1mBTpdlmMMiPcmWNkUSmFAOD7DShtnrwNyZsw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b8EjWOy34JhDwaDUOj5cn+bmSD3XP+922StiAJYibForPcZSBJV6qentDC7RousFl
	 JDXcNJrghYZEBK7VGzSDLxw0FtnACrI60F5ocfB/0O0JSuFAx3e0D/KcGRSkGjSJhE
	 O/qlMSCzMTQZRQJekuUMfSqUKORwnDgl2eeCtt2A=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.com>,
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
Subject: [PATCH RESEND v2 07/12] selftests/mm: mremap_test: fail on data corruption
Date: Mon,  2 Nov 2026 15:32:06 +0530
Message-ID: <20261102100211.141831-8-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102100211.141831-1-sarthak.sharma@arm.com>
References: <20261102100211.141831-1-sarthak.sharma@arm.com>
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

In mremap_move_multiple_vmas_split(), if data is corrupted
after mremap, the control jumps to cleanup without marking
the test as failed.

Set success to false before moving to cleanup.

Fixes: 7d6597dfef11 ("tools/testing/selftests: explicitly test split multi VMA mremap move")
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 111cc3414073..514d2003b88d 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -682,6 +682,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 			if (chr != buf[j]) {
 				ksft_print_msg("page %d offset %d corrupted, expected %d got %d\n",
 					       i, j, chr, buf[j]);
+				success = false;
 				goto out_unmap;
 			}
 		}
-- 
2.53.0

