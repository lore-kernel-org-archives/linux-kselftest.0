Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962579;
	b=h9SP0ZPfSfmf89i2CkuzjSlmNqYSb1+qA9ElhucDPXy8UkwUEeJuO8HL2VVfLacrJ6xB
	 tUJCN+zILEdUKZSCuBr/XcOOAgD9cwehPDlrP/ljy70HEGf72rmIL84+udmUQyje/tC/v
	 G67MCulpJZ6Ad3lCsro2feS+1SCErWkSScFIOxigzq4uBh3NHkFpc5VhUQFPcTwF0ZjZ/
	 4GULDo04JmVez6B7/jgDvO4eGUw1zxA/DFNpWpPLSSEcL8UVXWU1TqvvL0lrm5AINGMRP
	 Df7i7vInvN1I/adXwsNmXLP7gFUtuEuSBaJ+MK/sAPvci+/OUu7MTyA0HezghpCH0mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962579;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IntcUjxwgNLtHOPR/YXFXE90UCsfrPbdVNTWrhH07h8=;
	b=SYz266xAuuCIO5meJt/OF+q6Zvn1EIjMu35bf4yIhihmoQASIWsl/KwS9qP+dzWrXNCA
	 qz8Fvvu4fMAH/ETK/KBCM0+CZQwnCAVB7NNr4NfopeBULvRHKD1IhsFFOdQeZP1rL+9bR
	 MPklv4B820E3llZyeWXq7Wdk/VaV6274Pr5Mn6YgoDXDovDQRzAzC98dDuLtN9GNxs7uo
	 E5SRSzt7TIA2x0AgHemlPvnDZMgxKg4DdKsEXs3ivQCGOWittTarengbBWNfKy8T8w8yT
	 +n73BoCUfr8y4rwyiLrgePnEUT0EsF38FXtPSfuWRiQ+MJobVVkmqwQ9P0+1Q0EixpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AAJTPCjT;
	arc=none smtp.remote-ip=95.215.58.177
Received: from mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9568C606A33E
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 10:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9568C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AAJTPCjT
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3jkfoR067/Flf47+e2LOQlU8r6Ck3Qy/GPAvsTLC2P0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793962576; v=1; x=1794567376;
 b=AAJTPCjTta1oiiYfalVzhE1hn290tL3JxQZfv2lZ+0Sbnss58gj/MV4NMlSKPeCFQoNimngB
 2JcdjLjASsxb6BJKJ3fghJJepdzM8uP1aA/zH2OSkZAZoyPM2XdpHm3t8NFtpVtOuM8uAjCGkfU
 pP5RrpG1v/teULXjH1DLryhQ=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 775cdc43aa869329;
	Fri, 06 Nov 2026 10:56:16 +0000
X-Mizu-Trace-ID: 775cdc43aa869329
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Ridong Chen <ridong.chen@linux.dev>,
	Chen Ridong <chenridong@huawei.com>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH v2 2/4] cpuset: add early empty cpumask check in partition_xcpus_add/del
Date: Fri,  6 Nov 2026 18:55:36 +0800
Message-Id: <20261106105538.2915492-3-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106105538.2915492-1-ridong.chen@linux.dev>
References: <20261106105538.2915492-1-ridong.chen@linux.dev>
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

From: Chen Ridong <chenridong@huawei.com>

Add a check for an empty cpumask at the start of partition_xcpus_add()
and partition_xcpus_del(). This allows the functions to return early,
avoiding unnecessary computation when there is no work to be done. With
these changes, partition_xcpus_add() and partition_xcpus_del() can be
called even if xcpus is empty. The caller no longer needs to check whether
xcpus is empty, eliminating many conditional statements.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index cf38e8708ddd..85e5b529d144 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1315,10 +1315,13 @@ static void partition_xcpus_add(int new_prs, struct cpuset *parent,
 {
 	WARN_ON_ONCE(new_prs < 0);
 	lockdep_assert_held(&callback_lock);
+
+	if (cpumask_empty(xcpus))
+		return;
+
 	if (!parent)
 		parent = &top_cpuset;
 
-
 	if (parent == &top_cpuset)
 		cpumask_or(subpartitions_cpus, subpartitions_cpus, xcpus);
 
@@ -1342,6 +1345,10 @@ static void partition_xcpus_del(int old_prs, struct cpuset *parent,
 {
 	WARN_ON_ONCE(old_prs < 0);
 	lockdep_assert_held(&callback_lock);
+
+	if (cpumask_empty(xcpus))
+		return;
+
 	if (!parent)
 		parent = &top_cpuset;
 
-- 
2.34.1

