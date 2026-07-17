Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B234F3DB630
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 07:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271815; cv=none; b=X1cTrDY+xzmHLDO62QLMr3/3UMg7VRXykTWmg42ZKV9ctzBBg/WLHQderTO413xH00v54Zu3NHMhZ2CLu+pweu9fODiMkNCzetLoigIuImvyw0gujC50YiHhP3MC6us/s2xMZF6t7r+HkizDThcBEXTcMQseW/X9kWarKQwxzxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271815; c=relaxed/simple;
	bh=bk8S0aq67C4/1YG1nYalFFib8wYN9jCAvj9WGRVobwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QrkUjCEtU0oTSoU36q7xdcNBLWTGcp5/UzLL/1y8eXH4tOdRb1G458md1TsLHEGbRCzyYvhJLoJbKzbXNpcZLz9UUeRf9C89LZ6EuCT/TNwOpq2Oy5ej6qSAGZDuCVwziLCcAiCcHqwq2+Q5BR1omhXa2/MOCtOXb0Poy6OmwfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LFWcRMMZ; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LFWcRMMZ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784271801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z8nty2Cb7mt9YgTiJdrfdlvIVrvucL4Q1GJIZGhzmKI=;
	b=LFWcRMMZC3ARLQWT4SjdxAGcKL8fbEaE50vua4PcsSiuQVzWqpj2o2VTZ8d32o/Y5iltB0
	JrY3G0HQcQStbJEORWi0tLNNlPdaH5+xYCUxADZmgw/AF9tB9nfQ4Vk82qS9+jJHfX7NAg
	MJ9UJQB3AFFY+k2/7NvkzZ6JMf8ZPNg=
From: Hongfu Li <hongfu.li@linux.dev>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH] selftests/mm: Fix BUG_ON checking wrong variable in mremap_dontunmap
Date: Fri, 17 Jul 2026 15:02:51 +0800
Message-ID: <20260717070251.73212-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hongfu Li <lihongfu@kylinos.cn>

In mremap_dontunmap_partial_mapping_overwrite(), mremap() stores its
returned remapped address into remapped_mapping, while the BUG_ON
incorrectly checks dest_mapping instead.

If mremap() fails, dest_mapping still holds a valid pointer obtained from
the prior mmap() call, making this BUG_ON never trigger at all. Correct
the check to validate the actual mremap() return value stored in
remapped_mapping.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 tools/testing/selftests/mm/mremap_dontunmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mremap_dontunmap.c b/tools/testing/selftests/mm/mremap_dontunmap.c
index a4f75d836733..96ba537facf7 100644
--- a/tools/testing/selftests/mm/mremap_dontunmap.c
+++ b/tools/testing/selftests/mm/mremap_dontunmap.c
@@ -313,7 +313,7 @@ static void mremap_dontunmap_partial_mapping_overwrite(void)
 	    mremap(source_mapping, 5 * page_size,
 		   5 * page_size,
 		   MREMAP_DONTUNMAP | MREMAP_MAYMOVE | MREMAP_FIXED, dest_mapping);
-	BUG_ON(dest_mapping == MAP_FAILED, "mremap");
+	BUG_ON(remapped_mapping == MAP_FAILED, "mremap");
 	BUG_ON(dest_mapping != remapped_mapping, "expected to remap to dest_mapping");
 
 	BUG_ON(check_region_contains_byte(source_mapping, 5 * page_size, 0) !=
-- 
2.54.0

