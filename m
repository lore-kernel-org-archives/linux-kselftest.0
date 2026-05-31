Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5531296BC1
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 09:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219112; cv=none; b=LQ36d23i6Zd50mrewjNGUkOrUb8E0w1iavSAtMDwP2Lqi5GpmraWTdZkRcUVn9e+nja9yiMN17bKPVEM52TLoj8uMdxlKgdvVxQcKQZD0wg1T20CxyQ+fEsoWE+krzS/+iTDqUK1kxnOyr5FcMPuoa8q7UWkm6WSWVo16/66kEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219112; c=relaxed/simple;
	bh=VZcQSRfQiopEACrfJex1DgYI+aBZbUYPqBPUPF6aiZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGmAg6rtap7ENP57YX9LjNJ9Dq5ENYuAzYM/zGq09M48z/KYddzbh86eGZdy6MBXi2bts2AuvEnH7ytk0w/fNL9ECLuPAtOvXWk6TP83kRWgpwzhFuFaOr+dRx6Glhu8WfuzCZ0i1oJfaX06lmPPJCSusYXBvUDXuirAgr8GyxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m/6br8Pg; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m/6br8Pg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780219108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6imuRvcJ2QoeCub05D2ebeR8TkoLAgpZgEl546Rm/CQ=;
	b=m/6br8Pgr0pSniSxeY58mcipn8VEfCt3UaNwBwtJEymYbqoFWlk6qwGw8qfuifnrCdeHpo
	6VJMZjHCwuuE/0/WMTjdnzfp/9HuT+62jbfWOGUWa2GIoXldzjZHq9ctR6xLEc9/FmgEcT
	dqMzlsvuNJgGsMSsL00C3XinN4F/VGI=
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
Subject: [PATCH 2/5] selftests/damon: fix memcg filter path handling
Date: Sun, 31 May 2026 17:17:21 +0800
Message-ID: <20260531091724.84381-2-kunwu.chan@linux.dev>
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

A trailing comma in the memcg_path assignment makes
memcg_path a single-element tuple instead of a string.

As a result, an invalid value is written to sysfs and memcg
filter configuration fails.

Remove the comma.

Co-developed-by: Wang Lian <lianux.mm@gmail.com>
Signed-off-by: Wang Lian <lianux.mm@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 tools/testing/selftests/damon/_damon_sysfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/damon/_damon_sysfs.py b/tools/testing/selftests/damon/_damon_sysfs.py
index 2f6f2699db25..006c92a76ebe 100644
--- a/tools/testing/selftests/damon/_damon_sysfs.py
+++ b/tools/testing/selftests/damon/_damon_sysfs.py
@@ -271,7 +271,7 @@ class DamosFilter:
         self.type_ = type_
         self.matching = matching
         self.allow = allow
-        self.memcg_path = memcg_path,
+        self.memcg_path = memcg_path
         self.addr_start = addr_start
         self.addr_end = addr_end
         self.target_idx = target_idx
-- 
2.43.0

