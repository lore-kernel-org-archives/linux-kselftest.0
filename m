Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485E23D9034
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773227169; cv=none; b=hT6G7foUKUMXmI8PGliZ2kW/3qnUD/Vjjs4qU5ZVMXvResZRlMtjUUoUFRe+hQcv9Cy9O40RG1gQ7Jrm9VrimCt/CEDcXO9nQhOQvrUBE9CnYRQsh6Puse4DKlB/8rbR8D//uyJTmiJhDbQ2F7FSWxj1IxouZS81B/6q/Uhlayw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773227169; c=relaxed/simple;
	bh=NAkRnW+3beKJ3rvextrWkcfSHPDeq/CJu5mW2WK0VWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LrOL3vrpkQrPSYogtrRAsBiAZphjEnXBmfKFRivVEfvE0fc6r121piMqRekTv1P5/FW11Q1EEic+nSaG8VJV1/NwSaO/c3oZR5NSNFcO9mLSUIIN1lvSc1NltYnlEbnFIX4rtXLhHGyCtElhwFIyigvy7HkaDS208XNHZlfk1MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0Xc6USf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0Xc6USf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773227165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jaQ/ZzEhZt4ymG/02ZgI+lGSkMVG7VPxwBvRb7hAOvw=;
	b=X0Xc6USfrQ6MZC4OMQZuYLCIhwbboBfP47SBrjPWag0z9gw7sX896gIxw0o820/Zy60R5L
	19gqKH0gJJLit/6AjnOFZW+ydL2IzP382QMifMokZHs0SYMJPf+LuwZ8n6lgn5cZEX6Zs0
	6wczo9sF7NX+f/XXUPUnF2u4o/RYi48=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-nhbugbZVPoGVvKr5P6BbfQ-1; Wed,
 11 Mar 2026 07:06:01 -0400
X-MC-Unique: nhbugbZVPoGVvKr5P6BbfQ-1
X-Mimecast-MFC-AGG-ID: nhbugbZVPoGVvKr5P6BbfQ_1773227160
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 048891956050;
	Wed, 11 Mar 2026 11:06:00 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.99])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8CE0B1956095;
	Wed, 11 Mar 2026 11:05:54 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: [PATCH 5/5] selftest/cgroup: fix zswap attempt_writeback() on 64K pagesize system
Date: Wed, 11 Mar 2026 19:05:23 +0800
Message-ID: <20260311110523.26624-5-liwang@redhat.com>
In-Reply-To: <20260311110523.26624-1-liwang@redhat.com>
References: <20260311110523.26624-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

In attempt_writeback(), a memsize of 4M only covers 64 pages on 64K
page size systems. When memory.reclaim is called, the kernel prefers
reclaiming clean file pages (binary, libc, linker, etc.) over swapping
anonymous pages. With only 64 pages of anonymous memory, the reclaim
target can be largely or entirely satisfied by dropping file pages,
resulting in very few or zero anonymous pages being pushed into zswap.

This causes zswap_usage to be extremely small or zero, making
zswap_usage/2 insufficient to create meaningful writeback pressure.
The test then fails because no writeback is triggered.

On 4K page size systems this is not an issue because 4M covers 1024
pages, and file pages are a small fraction of the reclaim target.

Scale memsize up to 64M on systems with page size larger than 4K, so
that enough anonymous pages are allocated to reliably populate zswap
and trigger writeback. The original 4M is kept for 4K page size systems
to avoid unnecessary memory usage and test runtime.

=== Error Log ===
  # uname -rm
  6.12.0-211.el10.ppc64le ppc64le

  # getconf PAGESIZE
  65536

  # ./test_zswap
  TAP version 13
  1..7
  ok 1 test_zswap_usage
  ok 2 test_swapin_nozswap
  ok 3 test_zswapin
  not ok 4 test_zswap_writeback_enabled
  ...

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Michal Koutný <mkoutny@suse.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Nhat Pham <nphamcs@gmail.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Yosry Ahmed <yosryahmed@google.com>
---
 tools/testing/selftests/cgroup/test_zswap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 30d3fbf6b4fb..2d065184eea4 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -264,7 +264,7 @@ static int test_zswapin(const char *root)
 static int attempt_writeback(const char *cgroup, void *arg)
 {
 	long pagesize = sysconf(_SC_PAGESIZE);
-	size_t memsize = MB(4);
+	size_t memsize = pagesize > 4096 ? MB(64): MB(4);
 	char buf[pagesize];
 	long zswap_usage;
 	bool wb_enabled = *(bool *) arg;
-- 
2.53.0

