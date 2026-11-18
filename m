Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973748;
	b=Z6NviwK1ZNV8YgDDCF4Jba5AKBKMEw1MZig2M8o7dKMy3Liq3zvLbk5rdPkQ3tai6WLY
	 BtlPYCGVURnTnoUyJxV18hdiKdlIrm7IBli2ZRYkqw2j1WBqErJvp38Pf2Oe80jfXZeAL
	 YNylu/lEECgR6Pka0RrjxAOT+N1CT7V/+H/qR7lP8+CUj8FCdO4QjsbbKSCH3b9t2UHfQ
	 EnCLxXu9beIQWt8W9+WAOefA7o34ejvRp0b3HxKdnq6Sg2pw5g9avucqiDHxjw78ga+G3
	 fRH1M2nePkIDJjIZL25MRrFNw1Gr2yrRKRbk/oGjTD4U7kcRwL+me78jt8a25pxGH7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=IGZ1LY0R7muEviWN7fb4euvV9psptmj/QGERpFprukU=;
	b=vd1CjZtNB6G2uEwO6gNb+OY/1otGcvETxq9YP+nsyAEGkr9NbSftMBdTb7PxdOWQYvsX
	 njV4R5m4of8QrV4trgZLUDtygAaTpgEDg9CKcHKImo4a3mCOeF+TSRg5KGe9uwZWoRlrh
	 T1yidiHyW+CGWz5USEpfUFvmMUcW4BgrWDRrq5atQqrRnPHIW+m/jjQsCOicTKaEAorBV
	 Tt+XH6Ft4P9GEvttN+UFUlOrE/ST//nOJpcZyfTnZ6hEQESGJQES3vIlv9Oo2QyxX/TPA
	 yuIvw+DCXyEhvM3Q5lY4+qqWX9jZsjKbs09KNi8K/GymtYW8D83cd+CRGfShgrAwYzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mPeUg6R9;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06474606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 03:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06474606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mPeUg6R9
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so292488a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 19:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794973747; x=1795578547; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IGZ1LY0R7muEviWN7fb4euvV9psptmj/QGERpFprukU=;
        b=mPeUg6R9421yjKq8HMJfXGFNR/USS3ajLsGgaBCPa0Q8VD7nlR8WjXM7Z0LUUEYO5b
         zlu1yzTVKPYq0F4/VffGAv7KubezEqz7lZxCe7VznHjTq9Mq7O8DAHujtwQm6COtW2aV
         9YR0hsFNVrx8akhxKC3YqjyEJq36tFpF+fweqCJy4jfb8exhV6O7P6Jd3zVYk1CSIuTy
         IBIfd4mp44R6kJ9u2l7R3+H3QHsKPE32fiClZIWvfmkwDo6U5Idx3aulU1TrFCWdoC4i
         nwST+zuFxDOdrUK2FjQ96XHNxlkLjyZnVV/eUhz51A1LJdz3gwQEWTXKHNraRj8ZXxuP
         ieSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794973747; x=1795578547;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGZ1LY0R7muEviWN7fb4euvV9psptmj/QGERpFprukU=;
        b=c6iYme0hWYOW0/xHvCgGc4zhv+vNKSAeViiHJTtT85dUO3KOcV1rYeZ5oS85+4eXXY
         6kO0xfG9e2gcj1tiZkPS/mkn2ilc5pdxmioU4Mxc3CIIL1g5fxqcpN0eHb31/Jsuh4aq
         QkQ/gFn6zrMqEL28GYX08A4AYMuN7iOuurU9RXjyo3tet+0N9gh+qLSSNrYrbjBQzpiJ
         BC/F123PC6np04WX/l5sq7z8dTXRvmWwN0gJzY9q9cAGlwZBzY6aOtoBb7VjKkEkthcV
         WhTyw7IyocfzAY+Qb0M1URsW600/Mr162eZVaU/TxrQRfpe50qlxQaPWBEsr6lieMAO9
         BS+A==
X-Forwarded-Encrypted: i=1; AL+hErG56u/N1rXEu6anDqB1ZUaclQN2tS/uOF3G0iEc9TpDZEO6Y46LxgqQO+1x6rvfHxPcUziVc06oo/m/PY5IEhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oJMeRp6NjBmM5qIb7RbgVmyJj60VIBA2ycwq8VhqR1TIv+ai1
	y2tCX3xIjgoghwe/LE20yCLUlgu6NxhE1EcHbAHFBPItLAOTJGgoGTMV
X-Gm-Gg: AZFdTZfdMdRV7JxxTCRkU65y+8UvMU3s+ipI5+Ot6m1JiuaoBHhcYfu180/oZiRlQbp
	+PHDJwTnJIyZz21UFPGkRsoKF9iCeAUGpExYJyeilzFNpJ+GITlxL437LsCvxDeBiArn1RZtbuv
	7AJXw6SZbHVh0SCV6Y1jAbQynaLEDCbTHWNaGN1bCiZy1tbcaUXGq/0DyiSjRAZLvYlq7zTxjRD
	6GY63mZ0qtu2yv9Lh1s98o7HHzJ1g1xNgPgP/majLZfWXa1+XtiXXnKdnOSO5ix7HMb6nr3KDYS
	T7tZ84uUEptydGJxyptBjQO3ahJAXYnbe0T+GeH6lIgUoXbFkY9LN9t1AWXxGk2QxYAEe1JJ1xj
	qLOpj+QrZ7UAiwRGbhzDGNj7F07a8u9LzjKnS6CtXVXGoOXhaPn5QgTC87gqNdpXNt0pMlLoh9p
	N1TC3BVZhXem0qxnyemSOQqHRAPSSpatA9+MXN1a5u9w95AfE6eaSEa43bljork5+rvO4TyluYl
	CFtc6LyarAtbajxLG4/LYgNOtOk+Vtk9YvhtV1CIxg6CymAdAKrrBAq2i9OY0PNanbCwLgGERNh
	4oxwBR/Yk4MOI3GmBI4XpMizd8YhoO5eWNp4l4d8FEx52udSRfmbtC1KCZblZ7X/tr2og2n8B5c
	ZYFl09RE2zkr6TnqeSxBGsO+oSNogyNajieU=
X-Received: by 2002:a17:90b:384b:b0:3b3:be94:8ddc with SMTP id 98e67ed59e1d1-3b3d074d683mr1339461a91.12.1794973746755;
        Tue, 17 Nov 2026 19:49:06 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62930a5sm5279125ad.66.2026.11.17.19.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:49:05 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 03:49:05 +0000
Message-Id: <DMY136RTAL9Q.2WQSZ57W1YLV2@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kurt Lin" <lylin1023@gmail.com>, "Hui Zhu" <hui.zhu@linux.dev>, "Hui
 Zhu" <zhuhui@kylinos.cn>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 <bpf@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Barry Song" <baohua@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Fall back when
 memcg_proactive_reclaim data lands in shmem
In-Reply-To: <20261117170704.1146730-1-lylin1023@gmail.com>
References: <20261117170704.1146730-1-lylin1023@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 17, 2026 at 09:07 AM Kurt Lin <lylin1023@gmail.com> wrote:
> After writing the file, check memory.stat and move on to the next
> candidate directory if most of the data was charged as shmem; skip only
> when none is left. Give each candidate its own cgroup so that stale
> stats from a previous attempt cannot interfere, and poll memory.stat
> until the write shows up, as reading it does not force a stats flush.
> Fail the test if memory.stat cannot be read or never shows the write.

This is overkill.

>     To exercise the polling, FILE_SIZE was temporarily cut to 2 MiB in a
>     128-vCPU guest, which keeps the write below the flush threshold.

So the test with 32 MiB didn't hit it.
Pls don't add code just because a bot said so.

Here is what I mean. I didn't compile it:

diff --git a/tools/testing/selftests/bpf/prog_tests/arena_memcg.c b/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
index c76a7eb..334bfa6 100644
--- a/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
+++ b/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
@@ -53,8 +53,12 @@ static int alloc_pagecache(size_t size)
 	fd = open(".", O_TMPFILE | O_RDWR | O_EXCL, 0600);
 	if (fd < 0)
 		return errno == EOPNOTSUPP ? -EOPNOTSUPP : -1;
-	/* tmpfs hands out shmem pages, which are not reclaimable without swap */
-	if (fstatfs(fd, &stfs) || stfs.f_type == TMPFS_MAGIC) {
+	/*
+	 * tmpfs hands out shmem pages, which are not reclaimable without swap.
+	 * overlayfs hides the type of its upper layer, which can be tmpfs.
+	 */
+	if (fstatfs(fd, &stfs) || stfs.f_type == TMPFS_MAGIC ||
+	    stfs.f_type == OVERLAYFS_SUPER_MAGIC) {
 		close(fd);
 		return -EOPNOTSUPP;
 	}
diff --git a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
index c22dcfa..2ba0791 100644
--- a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
+++ b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
@@ -30,7 +30,8 @@ struct reclaim_args {
  * being available, and a read-only mount cannot host the file at all (EROFS
  * applies to root too). /tmp is tmpfs on many systems, and test_progs is
  * routinely run from a tmpfs working directory, so both candidates need the
- * check.
+ * check. overlayfs hides the type of its upper layer, which is tmpfs for /tmp
+ * in virtme-ng guests.
  */
 static const char *workload_dir(void)
 {
@@ -40,7 +41,8 @@ static const char *workload_dir(void)

 	for (i = 0; i < ARRAY_SIZE(dirs); i++)
 		if (!statfs(dirs[i], &st) && st.f_type != TMPFS_MAGIC &&
-		    st.f_type != RAMFS_MAGIC && !access(dirs[i], W_OK))
+		    st.f_type != RAMFS_MAGIC &&
+		    st.f_type != OVERLAYFS_SUPER_MAGIC && !access(dirs[i], W_OK))
 			return dirs[i];

 	return NULL;

pw-bot: cr
