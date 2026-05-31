Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4055D292B4B
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219128; cv=none; b=uH3KIa4aZOkXOjUwyY7IEy78MoljmInqXcpr7+b5mMaRXhhd7YhvWXrdzdvBEFriRz2Li9EPRkWRwMkA3mjSxOinH/a2iJ+heFy1DtZBVhI3LaA96vESZdpflWuE7jkXFunjLzepFcSY3YFHDVZFuazgVbIuMVGfS4tTN6qcHk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219128; c=relaxed/simple;
	bh=Oi9TOfRM00yKh2hjFmYWzrjR4gdAQnsqLvjS47ZWXt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZ0rHTcyI5t1Zpgc8D5HzKlD8YYp6HguvHirCaZJNMCgQ/RIGXCJkGsNdygBuH3/A0yaaiZOWQyqq7CyY06eahQ/+NZ9Oi2UuNXlB3u85R0/rRbGHgOhjp6UzWIiMwn3EbKVYMIHdXGmBtiYlL2ke8eORmAa+qCsvO/Ag1YvYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I85kX9iH; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I85kX9iH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780219125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pUXlvjUSNqO6nqpsnfmoQbgmo6bJELXxqIMM5q8DZak=;
	b=I85kX9iHuSB4rgELtUXiTKxp4LeoVAJXY9ZiGYr1JFPIhsY68s9PiOoNM8YX9CUag5u9qs
	WOhcmabCUD/dnIWkLMCpicmBHd4yclTqlOYvf/wfm6KmJxrs9uVDwk1xmLIuxFKRdU97f6
	4C/NRfHTqAiXngV82B0AoXZTN63E6Zo=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: sj@kernel.org,
	shuah@kernel.org
Cc: damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Wang Lian <lianux.mm@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH 3/5] selftests/damon/damos_tried_regions: fix expectation output and join TypeError
Date: Sun, 31 May 2026 17:17:22 +0800
Message-ID: <20260531091724.84381-3-kunwu.chan@linux.dev>
In-Reply-To: <20260531091724.84381-1-kunwu.chan@linux.dev>
References: <20260531085633.48626-1-kunwu.chan@linux.dev>
 <20260531091724.84381-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Kunwu Chan <kunwu.chan@gmail.com>

The expectation print has wrong operator precedence: '%' binds
before the conditional expression, so the else branch prints
'not met' without the prefix 'expectation (>= 14) is'.  Add
parentheses to fix it.

Also, '\n'.join() on the list of ints raises TypeError;
convert to str in the list comprehension.

Co-developed-by: Wang Lian <lianux.mm@gmail.com>
Signed-off-by: Wang Lian <lianux.mm@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 tools/testing/selftests/damon/damos_tried_regions.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/damon/damos_tried_regions.py b/tools/testing/selftests/damon/damos_tried_regions.py
index 3b347eb28bd2..d6472e6a6e08 100755
--- a/tools/testing/selftests/damon/damos_tried_regions.py
+++ b/tools/testing/selftests/damon/damos_tried_regions.py
@@ -55,10 +55,10 @@ def main():
     collected_nr_regions.sort()
     sample = collected_nr_regions[4]
     print('50-th percentile nr_regions: %d' % sample)
-    print('expectation (>= 14) is %s' % 'met' if sample >= 14 else 'not met')
+    print('expectation (>= 14) is %s' % ('met' if sample >= 14 else 'not met'))
     if collected_nr_regions[4] < 14:
         print('full nr_regions:')
-        print('\n'.join(collected_nr_regions))
+        print('\n'.join(['%d' % x for x in collected_nr_regions]))
         exit(1)
 
 if __name__ == '__main__':
-- 
2.43.0

