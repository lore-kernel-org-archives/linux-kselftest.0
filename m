Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5A9175A70
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 03:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780284271; cv=none; b=fdyrUncVnYg/jZeWQ3A5HkQYkLVqKnMLztcnb1FUrGQ90lKT7opM6NE+ADYEnkPY4dz3wLpGMWlIy/OGPtHQsietx0Us5FX7tqMlElWnNCz1MRRDvR/zHhW+pNT4VeFJZmNaKJZFfUIbzBEoKms1TxgFZ4y61FUkFxu9H6JYy8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780284271; c=relaxed/simple;
	bh=yD1CcD0uANUt41ddJVjBX0yXejSTASYIhTv+ME8ByFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RkUqC2TzXKNSbbjg0VdHDIbrZsTA95sr4maDbzAdG+9F7QlIiCnl4C9fPwNiBkMqiG0HxwwHtsITYtxubb/RQgwsV/S+tTn0aWZRIgrQpCsB2qyCbaCEXFYTq0NtdUvpWiB3G/w9SJg5lXoU1X3L28ztymmzl3HKX7LG3nS9Blk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H2xUahCb; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H2xUahCb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780284268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zaY8XSpncw1tdxqTmSy3mDhJYgUUKeHixcd29qyX1Is=;
	b=H2xUahCbt1iXlMW5JNxoY9flDV8GU89RfU2uS/yDewhaLPy+mIOnA2jOK+bVt/MAzr8oL2
	JAFvuW7BZach4p1MKh9jxkcZxwCvtJGylilX4bEQSd3b74tpTw0SOVC5Nox8FJzlYN2IER
	jl16BfWBb7c9yi0NnvkjuwOBKG0G/VM=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: sj@kernel.org,
	shuah@kernel.org
Cc: damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <chentao@kylinos.cn>,
	Wang Lian <lianux.mm@gmail.com>
Subject: [PATCH v2 2/3] selftests/damon/damos_tried_regions: fix expectation output and join TypeError
Date: Mon,  1 Jun 2026 11:23:13 +0800
Message-ID: <20260601032314.424013-3-kunwu.chan@linux.dev>
In-Reply-To: <20260601032314.424013-1-kunwu.chan@linux.dev>
References: <20260601032314.424013-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Kunwu Chan <chentao@kylinos.cn>

The expectation print has wrong operator precedence: '%' binds
before the conditional expression, so the else branch prints
'not met' without the prefix 'expectation (>= 14) is'.  Add
parentheses to fix it.

Also, '\n'.join() on the list of ints raises TypeError;
convert to str in the list comprehension.

Co-developed-by: Wang Lian <lianux.mm@gmail.com>
Signed-off-by: Wang Lian <lianux.mm@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
Reviewed-by: SeongJae Park <sj@kernel.org>
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

