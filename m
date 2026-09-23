Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B8B494A04;
	Wed, 23 Sep 2026 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161309; cv=none; b=dBdVS857LdzMddL3G2AW/WQAJlH3Givw5salTpA6HKm+cKYVGbYFGPRFIpNWSRQkGNiaUHMYR02I2ynppccIghYQ3U4Dkk3MoxBhSYISY/ZAnzjXfryXN47f3YTXTFUBn4MHI+wVXBv7jhsZTtvs3owQgHwRA5B7rfVQS2OY3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161309; c=relaxed/simple;
	bh=os7TsDMccUA+latXENT28M3rbe2rwbG6e5bpzP+PvA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=isnup22LONIWSQaQ3xdUqIxUY/YYaNVCk1pu+zQUSpitjBcO0e1B0g3UkmXeJnamt8Rv+vl3mOG1ey1dfGsSE3zwgmSvNa7qkBt/IwF+EEukYFsSKWYFqbh82tBgqxhJglJlkg7I5ykLXo+EKy0mBmzeRt2CTuEMSQnEXVC2IJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=B19aC+k3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="B19aC+k3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16BBE1516;
	Wed, 23 Sep 2026 04:01:34 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E10033F86C;
	Wed, 23 Sep 2026 04:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790161297; bh=os7TsDMccUA+latXENT28M3rbe2rwbG6e5bpzP+PvA0=;
	h=From:To:Cc:Subject:Date:From;
	b=B19aC+k3DJZH7LZHsx1nheIHI3NcBwkKbYzkIJI0QetJd9bC3WeSL0paLVy6G3TEF
	 Sr695yJAqfOJ/zb461yzyF8vYI8b7AKYtK35NJrB0xMpGNh2QssHAsCO1cBj+cO60h
	 LA9qEAowJOSWAeju53Sp5/ns50Nr2gIxMumIxOyM=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH] kselftest: mm: use helper to identify anon_ops in khugepaged test
Date: Wed, 23 Sep 2026 12:01:33 +0100
Message-ID: <20260923110133.429745-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of comparing mem_ops->name to determine whether mem_ops is
anon_ops, use the is_anon() helper.

Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
NOTE:
  This patch is based on mm/mm-unstable.
---
 tools/testing/selftests/mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index bdc0c7c117d9..b0cb02bf1a73 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -618,7 +618,7 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
 		usleep(TICK);
 	}
 
-	if (!strncmp(ops->name, "anon", 4))
+	if (is_anon(ops))
 		madvise(p, len, MADV_NOHUGEPAGE);
 
 	return timeout == -1;
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

