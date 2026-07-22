Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DE43E3DBE;
	Wed, 22 Jul 2026 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711553; cv=none; b=pZNjFUQh5wDUAKOpppgWTrky1sT5PH/C/njKiTzQv2/IlAciXm+EcByJoWsHYI7RkYS5E1vDw3j87ciITTxWVoqnbi7qOVnXOb5kArOuqIH1cFuQjgj3bMXD0PSbZKFaQsx15UafBfv/xLEOCqchfU/qSOrwZwETjRBYsFSrnTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711553; c=relaxed/simple;
	bh=UkCBixZE4BaIDZgj4iTqd571WFG+D+00A3uwsD0HWlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTQyF1de9QV8PpDrEsiD6xCG7aCAN10Jik3C2Ns/RTUesUBiMNcvP9e+0jPOFC3yRp/3Kz0m6PVWAUX1Og+yocwyysYgyo7jOooTic6cEPE3p9ttA8JFxq6RsaLqsFmUmboQYGdYc2slvVrFp/S9rh1IV7PO++gjfVkG0MaeSS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=T1kpQAfc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="T1kpQAfc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A27D168F;
	Wed, 22 Jul 2026 02:12:26 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 227653F86F;
	Wed, 22 Jul 2026 02:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784711550; bh=UkCBixZE4BaIDZgj4iTqd571WFG+D+00A3uwsD0HWlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1kpQAfcd1h63oG/X29DlrT88eBxwgQGQCmu88mokQ5ya8rJ4hg9ZAOrdZBp/Kd4T
	 zBcqkQYi93Zejo75X4d3zx+HAO0JoSr6pm/Iw/qqXemVOGO6fuVp24q8y+VRaOLsQE
	 KSovYlksTVclqD9AuVzmhvnFkXVIIxEfDFVDKn8I=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH RESEND v1 1/5] selftests/mm: skip COW tmpfile cases when fallocate() is unsupported
Date: Wed, 22 Jul 2026 10:11:35 +0100
Message-ID: <20260722091219.61504-2-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722091219.61504-1-usama.anjum@arm.com>
References: <20260722091219.61504-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tmpfile-backed COW cases allocate a one-page file with fallocate()
before exercising private and shared mappings.  When the filesystem
backing tmpfile() does not implement fallocate(), setup fails with
EOPNOTSUPP and no COW behavior is exercised.

This occurs when the temporary directory resides on a filesystem with
limited allocation support, such as NFSv3.  Reporting a failure adds
noise because the test prerequisite is absent rather than the COW
implementation being broken.

Report EOPNOTSUPP as a skip.  Continue treating every other fallocate()
error as a failure so unexpected setup regressions remain visible.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 tools/testing/selftests/mm/cow.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index 0c627ea89ff7b..c1b8920e29342 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -1718,8 +1718,13 @@ static void run_with_tmpfile(non_anon_test_fn fn, const char *desc)
 
 	/* File consists of a single page filled with zeroes. */
 	if (fallocate(fd, 0, 0, pagesize)) {
-		ksft_perror("fallocate() failed");
-		log_test_result(KSFT_FAIL);
+		if (errno == EOPNOTSUPP) {
+			ksft_print_msg("fallocate() not supported by filesystem\n");
+			log_test_result(KSFT_SKIP);
+		} else {
+			ksft_perror("fallocate() failed");
+			log_test_result(KSFT_FAIL);
+		}
 		goto close;
 	}
 
-- 
2.47.3

