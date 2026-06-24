Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A23629ACDD
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 11:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782299930; cv=none; b=jwuQ4NpsA258ANCPvWyo+GUCf70UessFatQ2hvmaK0wlMZ2YeL5M51jDH72oju2bA+bqAPD+f4AogJwsAPCiGLxq0uuv9R212QYNy1UJ3qXixbFFI6Xj3zUNCrkMSFDhaPzIxheoNSJ2jf+Z3Z1q62K237DtsKBIj0OUComNaMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782299930; c=relaxed/simple;
	bh=3W2qsB01EVLuBJUcdx+icsHw8H5k5NDhkucaHGNVIrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nt69TsK+KOI7pqMnXxMZVkxn6F3/a99QHGoJdBuZlN8UVNare2UaHZB189GyWXGvcwx6crBC2yiErSrwJfKfTKEHEdkbKJdrroa7my86VDOaS9AJVw4ivHHG71yfYG+4tsjzII6qEf6YfPe2qewDRugiWxxF3Le1gY/B2elrnlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLXk+3tr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLXk+3tr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37d46e0d246so510397a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782299929; x=1782904729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k2ugntTRhaMmg6Rq7nEjHmb0/Nlk4n5kF2nW1NYPQfU=;
        b=dLXk+3trHHPQX6zSPC3i4FwQqp2IXUyqwMc/dTQPf9bfg0zxBYHCuc59u/o1YrcdPM
         aFKRte/853MVA8i7DHuEu2smiO8nduRHspvlX7Y+BcQMFmP8MJ1V7DaIizTaqYrmruez
         GkhGDNyMX6tnFfZwzC3rdq9Loz9VeMPIKFof8RAD/Q21jAKvl0AgadWq8c2Y3b+tfXzU
         7/I4arn1o2fJBA0TQrgvtUI953ouapR3JWwKLWlF1wP+T7TAA+U2OZumWpIH7K1ruJrh
         ia/MRQEc8qT76c76gsAEQAGnPCTvyiFML5PbYUX5CSEcdb3T6MBxq+50PXGzWXKH21SC
         WGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782299929; x=1782904729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2ugntTRhaMmg6Rq7nEjHmb0/Nlk4n5kF2nW1NYPQfU=;
        b=pFL900Gdz+SV+3wLswp2pJ1h/gulW9nbQ/St6ewo7JOocjsWF+3lFom/chUmA6Rj+8
         DkxmIEnnbYH2YYo2SyzuVIqUjS7ZyofNxr9cZ5KL3vYnBYIRD6gI7jsjK99O+qGfxhbi
         qvmtFx5ITf5+17k7W7VlyKj6kD3tqNrZwcwLduvR0cORQwnlhPDEkB2ngjiapNqaRWYq
         HteUWy5ctaNQ0XJ0VuPNvydFTuwf3dinN4mNB9BlwHyY/du9w5g9LUmYcfpaJBKL4Ttq
         B2WBfZ+9tIqQVolhyqTgDjIQTHy2baPOZ0KDVHxNT41BDIc65CsnuXdby2MqbsswPcEH
         MWIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjO5qHG6NA5dDyH7d4RunDPdVOdaP2MaeQVS0wXDX0OwlDbulH0yPZ6LdRwsOmUb3MlsGgyHcMOR/R1vtXWRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/LvzXj2hqRwAfLlsSb6wZAAbqT1rYD2brsUJeCZK/izRB351G
	sWskbqYHfsCkeF14u10v5vnvKR8wVrYH4Kj21XVWMzkRyOIhpyUc3A0m
X-Gm-Gg: AfdE7cm+XhVUTUV5mn0Gx8kFg7IBqY0O4AHj6q8mS0V0rN1e3nT5xl+4zKuDvTlW+RF
	nlMXYyu8SFnvoXZj70oAjdQEOLRdwg0fnAWcJ1Dcd++GV6ABHqQsNlU5SQavP0++qviMOe5y87J
	2Q0JYv67+ATHJY/h55F2CVxAu49LpaN/SAGWia42dNENkltZmEYItmwiOFvmSTFFQvd+23tX/zm
	Yxw5V4xZqs0Z2b0YAlgyBhVstMw2ahVIxDuL1XOT1/CIo43TSkRDNo4IoKUwOdzjwAojBkczCw4
	wTXDVmIFV03dfaCieplFcVt64DKXcGF1/TA3MhuL5UkK0qnstYdntzEm155ph7WbJjnuL6f9NHy
	RJBJzqsS7qDv+f7dC43Mm9i38xBvFF6FcHj6pEJ/TN8zzIUET4+Rw7PbneU/dOywLTZQ/F+qhoZ
	H7CpSbaF44HOB7eQE3uyxHSjaLDWxgPjBHT74CFReD2f9Ka2oY7Z79C8cNNRGfdqJFOy4Vnkhsk
	zUGDtaxPwo1yOcGZXEm07gg9Nc=
X-Received: by 2002:a17:90b:580f:b0:366:132:fda6 with SMTP id 98e67ed59e1d1-37dd0d4c3acmr7879930a91.11.1782299928661;
        Wed, 24 Jun 2026 04:18:48 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.localdomain ([202.8.105.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3aa1b1csm2290385a91.5.2026.06.24.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 04:18:48 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	shuah@kernel.org,
	laoar.shao@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf 1/2] bpf: Preserve link info metadata on ENOSPC
Date: Wed, 24 Jun 2026 19:18:36 +0800
Message-ID: <20260624111837.889209-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BPF_OBJ_GET_INFO_BY_FD for bpf_link copies struct bpf_link_info back to
userspace only when ->fill_link_info() succeeds. Some link info providers,
however, can return -ENOSPC after computing valid metadata when a nested
userspace output buffer is too small.

For example, perf event tracepoint link info can determine the required
tp_name length before copying the name fails with -ENOSPC. The current
top-level error handling returns immediately in that case, so userspace
observes -ENOSPC but loses the metadata needed to retry with a sufficiently
large buffer.

Allow bpf_link_get_info_by_fd() to copy the top-level bpf_link_info back
on -ENOSPC, while still returning -ENOSPC to userspace. Also let perf
event kprobe, uprobe, and tracepoint link info fill their metadata before
returning -ENOSPC from nested name buffer copying.

Fixes: f2e10bff16a0 ("bpf: Add support for BPF_OBJ_GET_INFO_BY_FD for bpf_link")
Fixes: 1b715e1b0ec5 ("bpf: Support ->fill_link_info for perf_event")
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 kernel/bpf/syscall.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 6db306d23b47..80ab02b1c813 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -4060,7 +4060,7 @@ static int bpf_perf_link_fill_kprobe(const struct perf_event *event,
 	ulen = info->perf_event.kprobe.name_len;
 	err = bpf_perf_link_fill_common(event, uname, &ulen, &offset, &addr,
 					&type, &missed);
-	if (err)
+	if (err && err != -ENOSPC)
 		return err;
 	if (type == BPF_FD_TYPE_KRETPROBE)
 		info->perf_event.type = BPF_PERF_EVENT_KRETPROBE;
@@ -4073,7 +4073,7 @@ static int bpf_perf_link_fill_kprobe(const struct perf_event *event,
 		addr = 0;
 	info->perf_event.kprobe.addr = addr;
 	info->perf_event.kprobe.cookie = event->bpf_cookie;
-	return 0;
+	return err;
 }
 
 static void bpf_perf_link_fdinfo_kprobe(const struct perf_event *event,
@@ -4116,7 +4116,7 @@ static int bpf_perf_link_fill_uprobe(const struct perf_event *event,
 	ulen = info->perf_event.uprobe.name_len;
 	err = bpf_perf_link_fill_common(event, uname, &ulen, &offset, &ref_ctr_offset,
 					&type, NULL);
-	if (err)
+	if (err && err != -ENOSPC)
 		return err;
 
 	if (type == BPF_FD_TYPE_URETPROBE)
@@ -4127,7 +4127,7 @@ static int bpf_perf_link_fill_uprobe(const struct perf_event *event,
 	info->perf_event.uprobe.offset = offset;
 	info->perf_event.uprobe.cookie = event->bpf_cookie;
 	info->perf_event.uprobe.ref_ctr_offset = ref_ctr_offset;
-	return 0;
+	return err;
 }
 
 static void bpf_perf_link_fdinfo_uprobe(const struct perf_event *event,
@@ -4180,13 +4180,13 @@ static int bpf_perf_link_fill_tracepoint(const struct perf_event *event,
 	uname = u64_to_user_ptr(info->perf_event.tracepoint.tp_name);
 	ulen = info->perf_event.tracepoint.name_len;
 	err = bpf_perf_link_fill_common(event, uname, &ulen, NULL, NULL, NULL, NULL);
-	if (err)
+	if (err && err != -ENOSPC)
 		return err;
 
 	info->perf_event.type = BPF_PERF_EVENT_TRACEPOINT;
 	info->perf_event.tracepoint.name_len = ulen;
 	info->perf_event.tracepoint.cookie = event->bpf_cookie;
-	return 0;
+	return err;
 }
 
 static int bpf_perf_link_fill_perf_event(const struct perf_event *event,
@@ -5536,7 +5536,7 @@ static int bpf_link_get_info_by_fd(struct file *file,
 	struct bpf_link_info __user *uinfo = u64_to_user_ptr(attr->info.info);
 	struct bpf_link_info info;
 	u32 info_len = attr->info.info_len;
-	int err;
+	int err = 0;
 
 	err = bpf_check_uarg_tail_zero(USER_BPFPTR(uinfo), sizeof(info), info_len);
 	if (err)
@@ -5554,7 +5554,7 @@ static int bpf_link_get_info_by_fd(struct file *file,
 
 	if (link->ops->fill_link_info) {
 		err = link->ops->fill_link_info(link, &info);
-		if (err)
+		if (err && err != -ENOSPC)
 			return err;
 	}
 
@@ -5562,7 +5562,7 @@ static int bpf_link_get_info_by_fd(struct file *file,
 	    put_user(info_len, &uattr->info.info_len))
 		return -EFAULT;
 
-	return 0;
+	return err;
 }
 
 
-- 
2.43.0

