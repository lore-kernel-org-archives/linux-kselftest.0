Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5A9263F34
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 12:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776254622; cv=none; b=SowyUxKzAQM1ZYeuk9AUE7NzxTWGsg21MxCl/hmwftE1I9GWMIdE/OU1pZ3BxWKHa2TzLFNlXrGTrqHm1/QzoeZo2Fp9aHcXpy1vkZeZGtmEDuYz/n/d9q8po26Jr9YfrjeT5McYS0DgXo1vheNxL0KGL5/cIftl5cHJc5/rTNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776254622; c=relaxed/simple;
	bh=3U6UHJgt835GYv40BhwoYNP4PwkYd8x9aLaj/9Mma14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oqE/cku0I0KQyB/q0vc1DwGDkvBjOCuOTZYI6g//ezlzeRGQlIaN5azDc8viieH9Mr4pdze9r3sw3AYDx0I4MzJA2+odXF5+chzBW1XaxcW6iStDNzRqhMzEIkYMpSNqIXh+UhuOqIoEo2WkSaTtXbs06/W/IPMfzh5gVVTh4S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K3tGrjLb; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K3tGrjLb"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d7650202fso2632521f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 05:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776254619; x=1776859419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MY7KppkO24AIxEJgw2x9OFRmnNC7DRzHfNEKohz8ESc=;
        b=K3tGrjLbd6yDHpJ0f/H2z7zGvYNrKp8VcNp62WUe2KHkJxXopaqAUC4N6clumbRBos
         7VAXcmcRFHTn1wDnwKhhUCD+Nd6V8xAeIuYEeoOMibYgvCXeg9a+fExmOWLuB3cdxVkZ
         BSdxvTkHHxoPAxfmkCxE1xnndEwVhmP15rf0I1qlTdGcQR5NuBV9/gi+LI97NRGnSQMB
         R6+UemVi50sL+thMMLIhN8hWOVwgepgr3ol5NG9nqPCR8qoUoT29OMqSqtzwpkBF1YvJ
         yhPBWQXuKs7GkvLuFJrp3eyfdeRQ/IC10ImEt1cQQd0XhT3TNJaAmbrr4Uoq72+E6W4K
         RSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776254619; x=1776859419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY7KppkO24AIxEJgw2x9OFRmnNC7DRzHfNEKohz8ESc=;
        b=W2hBo9lL8vajt3qhBmAqgJYnKU+rGox8pxuyKwt9kg2C0L/Ewq4QUx20KHf2SUc7cW
         bm503isWNXmko/hAPm6CkBcUs+JWjSxjH6zyNSGSRdsyRzId4njSUey3ZEDgWwi0AyTU
         3Cuu+n4RxqdRa/IyUzJDqm4QJpSEK5NllJha0q50ZRaUcBPNDb4BD8iqARgddGFNpsmJ
         hPt/fezer2fSKdR5V3xl+hXFQNIH1MPh6mBTt4Z3YYmFlnvbEiamU55ktopt9fovi1hF
         u1FlATU0i4Xy3zSPCRVsZwfZRyQgM2tqoLXkeSDeyGKb+1ARpnY+aWIi4XYIYDWJEcsn
         4B7A==
X-Forwarded-Encrypted: i=1; AFNElJ+ORIcPej9thC6+38hlhHG/CP16hO8S8KYllXMxGgSc9bZyk+pu8n0wBZR8mEef1xGpgHvoRQtnslQgDhudTM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjmCQeFvieYPscJBVZzAe2wCTjuKJ2GiDqzDoANZUytxoWVUyd
	khS8NYRNAykUAAAES+EYjuLdbANcmeQtR5rPwtuNoUjGSuc5ToZ/B7bsmaj7cV6ZXf4=
X-Gm-Gg: AeBDietMGKU4ZvrflaH+hWDN3fYTM4Y2dzzh/Oz2BNaVd1KO8tKrh+tu5HE0349d5qE
	8+MOOnIjGkctpFmuRwYEJdxG4hlmeOIxp6LHhwLlA4NAGwtlPTYR287YWFq3NHvgacmeiouYsFU
	qDxvekWggxZfTu6boagU8bdPlO9n6OMh+/ZjXL/XFDCzQJCaqs8OzT0ttAXTI0433cCbEoy+GZ5
	+RntYyygvCKrKo2Eg3WHyuSPL+zL4ojzpTMC9BbtYDNR/UOgcLKc79NpDLhzJ8Ih18Eut5lHrc/
	/mQdLci9/264jh4ID6NpY6wntrXSJ0kkx5OG4ex9tlGozSKXZqBJ3QGZpCzHZ9jOKcDli0v/vkC
	+edlIjj0SC5LW4ziZjkwwPp/KJ48FgvDBTj2gKCkh+ynRRziZ5nfmR6OVtwF5984ewEtEcX09WA
	qcNG3lpRd6ex0FsAFP3g4UGP9cXbpci1fhlkkf2yz5tUZnN8nZCNw/wSqsVg==
X-Received: by 2002:a05:600c:46d0:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-488d689dbfcmr301107095e9.30.1776254618851;
        Wed, 15 Apr 2026 05:03:38 -0700 (PDT)
Received: from localhost (27-51-0-223.adsl.fetnet.net. [27.51.0.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4780f035csm19983145ad.15.2026.04.15.05.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:03:37 -0700 (PDT)
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: bpf@vger.kernel.org
Cc: Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next] selftests/bpf: Fix timer_start_deadlock failure due to hrtimer change
Date: Wed, 15 Apr 2026 20:03:28 +0800
Message-ID: <20260415120329.129192-1-shung-hsi.yu@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit f2e388a019e4 ("hrtimer: Reduce trace noise in hrtimer_start()"),
hrtimer_cancel tracepoint is no longer called when a hrtimer is re-armed. So
instead of a hrtimer_cancel followed by hrtimer_start tracepoint events, there
is now only a since hrtimer_start tracepoint event with the new was_armed field
set to 1, to indicated that the hrtimer was previously armed.

Update timer_start_deadlock accordingly so it traces hrtimer_start tracepoint
instead, with was_armed used as guard.

Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
---
Currently only fails on Linus' tree since hrtimer changes haven't made
its way into bpf-next yet.
---
 tools/testing/selftests/bpf/progs/timer_start_deadlock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/timer_start_deadlock.c b/tools/testing/selftests/bpf/progs/timer_start_deadlock.c
index 019518ee18cd..afabd15bdac4 100644
--- a/tools/testing/selftests/bpf/progs/timer_start_deadlock.c
+++ b/tools/testing/selftests/bpf/progs/timer_start_deadlock.c
@@ -27,13 +27,13 @@ static int timer_cb(void *map, int *key, struct elem *value)
 	return 0;
 }
 
-SEC("tp_btf/hrtimer_cancel")
-int BPF_PROG(tp_hrtimer_cancel, struct hrtimer *hrtimer)
+SEC("tp_btf/hrtimer_start")
+int BPF_PROG(tp_hrtimer_start, struct hrtimer *hrtimer, enum hrtimer_mode mode, bool was_armed)
 {
 	struct bpf_timer *timer;
 	int key = 0;
 
-	if (!in_timer_start)
+	if (!in_timer_start || !was_armed)
 		return 0;
 
 	tp_called = 1;
@@ -60,7 +60,7 @@ int start_timer(void *ctx)
 
 	/*
 	 * call hrtimer_start() twice, so that 2nd call does
-	 * remove_hrtimer() and trace_hrtimer_cancel() tracepoint.
+	 * trace_hrtimer_start(was_armed=1) tracepoint.
 	 */
 	in_timer_start = 1;
 	bpf_timer_start(timer, 1000000000, 0);
-- 
2.53.0

