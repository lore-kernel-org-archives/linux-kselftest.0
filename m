Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28990399357
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 18:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776883114; cv=none; b=lbR7m7EZVDd7YGdK29U+0VaGnYBMcLd7vwDeSPJPRF3qf3iv8vGT4vCewsfv7EGF8AzJWuvtyWYX2hXbBHRJcRd/wrclVUOVTVtdt9AbFyujVPZE8BKb8UGKfZbskUW33qRwDCrgoxV7aexd/eXvuD/7JyLqx14nd4pOHhyvDtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776883114; c=relaxed/simple;
	bh=BcxRMIhkNuu2sSh+H+IQ0Fs35eUwSLc/sSU7chKO5WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A9+EY3aOTUcN1kGbZB9GDd8HEpMCYkYP8S+Uh8Bq2vXwpD80mfgH9NyYkJdZXPipvvmof48KvGVM9yimz2wlVsGJwtRNM6xBnaMCJc5kL3cAQ0hQ4UV9mlthgoL6x4tfJSJHyvQAuXqHvVpuVtMvvCZiTiDqydHYkIgjyDoVfNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWkMvQ8C; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWkMvQ8C"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82fa01e86e2so3089491b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 11:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776883111; x=1777487911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qo4HSW6PCAr8ze25Kke7fPDCSM3HoYXfLWuG/y7OdJQ=;
        b=QWkMvQ8CsCk2Ohv1EhpKt23jH010x0ySlnNxgEG2pSgH0e9O6tEIwPbYUfAIlZMZoh
         AH92GTnoR7zAJGgLBB3pqSJHIKyadDuQgSJ8wSX7Bz5Wd6YuHa0zUJJV98enMf6/mUBU
         tQIhPWAO8/UMtRGddzq5Xanme3nFl4wHKHr3JfvdpLRiXVnt3QkqAjChbk1iXxHK24/3
         5w0Wpv57WO8Vl86eTX2rOSGWy3bW7P+f039Q8e9ugTLpzlPv4RDlKrhkOOPew+ADA3IZ
         VsxmgEQ75i6996oSV4B9pKSuMRH87x0pJbZ+gNfsJl5zKts35cskugDgTL5Lf86PfbZA
         PjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776883111; x=1777487911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qo4HSW6PCAr8ze25Kke7fPDCSM3HoYXfLWuG/y7OdJQ=;
        b=I0jQ1I0gVos5b8z2bS8gbV6lOashchWtGYuMBtCgMsemQnkjlLAHh4EliVxe+vPBOS
         O0FJrLQxXfdKGlvpuv/1Kk9WybGvV7KxuowZo/vnPbI+P2rZCENxJ9FH9wuMCqNQxnUC
         piw2s0P69FTa/WNq9Pqv1NM/bXAyOkMjbO7uAaSbuJx3OYOQNIXkrB+Nx3Rg2mvoxFn1
         oLbMSAIxQoFL02nkNqwI+PmHuGbbHnK87FhY8z9IB9IjXY2wdLjE97QWD2ZeIAbABO15
         Ta95shQhPiZwbqft72nhndtTFfpqjoHPWwhHTUlWsrti83J4kBempl7wb1Nhq7dMMia1
         I92Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Gzpq5b+T26GQQOcFrxwx2zqhqeqj8ufitwkKK7qwiH+8OZ8Y2nGHpoU7GVla4x0jhR98+CfNnPN0qwuie11s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYnEBVaOsoeP26/88zlGjDrVpCLFC6rYpPCH8OTiNNlHPUaHal
	htLs+KNHUFZqnoyIo8Bt4xxY3HI/Qr4h9K223mza1QdC+99xksZUM6e4
X-Gm-Gg: AeBDievYqBfuAtQPGHyxWpH9VYM50YJow36r9DB/23abXQpQrgiJTkKZMosI/TWwmiy
	rcoBrA3lqLEhriw1B5vR9SbXUn37aQ+H/zWFC5WxrjIFipKJFSW0Q/BcG5OWY/SuPjWJWsvAn3B
	mXSi7XDuCSEnPY1qXyNISyYi2BjUet6TkMknwUzYmeqs+yb3+XgJ0eeF66W7QcPZk8KLA0shrMb
	PdyEp7yJlUCo8tWO7eRplky00uHpmI0DFpx1ztvbyhXtiwETJUI/jKEifu4dtuv1eR9Q5syZ2YR
	+fATPqYOuu+B/0FMVIIriNu7NqMRkYd02NryBjNroePBCDJphgO4Cm4Xf4nNCwlFDwg0WmptgZm
	TWTZ9vlowocdTUMBMWna+dvBdb2qQelha4Z7Yp/DmePXiEASnGSNPxTdee7SKpZeZ4+gnrwrxsI
	KZJF89dh/1L5KHTqPHe1zZ+gndrWPPis5WpOHjsCidThE=
X-Received: by 2002:a05:6a00:1acc:b0:82f:4a4d:377e with SMTP id d2e1a72fcca58-82f8c8c2f8fmr26121261b3a.28.1776883111412;
        Wed, 22 Apr 2026 11:38:31 -0700 (PDT)
Received: from archlinux ([205.254.163.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6439sm18034262b3a.41.2026.04.22.11.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:38:31 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: andrii@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	memxor@gmail.com,
	shuah@kernel.org
Cc: jolsa@kernel.org,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] selftests/bpf: replace bpf_probe_read_kernel with direct access
Date: Thu, 23 Apr 2026 00:07:57 +0530
Message-ID: <20260422183757.15069-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use direct field access instead of bpf_probe_read_kernel() for
nlk->groups[0] and inode->i_ino, and clean up related code.

Removes obsolete FIXME comments and unused variable.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 .../testing/selftests/bpf/progs/bpf_iter_netlink.c  | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/bpf_iter_netlink.c b/tools/testing/selftests/bpf/progs/bpf_iter_netlink.c
index 00b2ceae81fb..5930bf8899d2 100644
--- a/tools/testing/selftests/bpf/progs/bpf_iter_netlink.c
+++ b/tools/testing/selftests/bpf/progs/bpf_iter_netlink.c
@@ -17,7 +17,6 @@ int dump_netlink(struct bpf_iter__netlink *ctx)
 	struct seq_file *seq = ctx->meta->seq;
 	struct netlink_sock *nlk = ctx->sk;
 	unsigned long group, ino;
-	struct inode *inode;
 	struct socket *sk;
 	struct sock *s;
 
@@ -35,10 +34,7 @@ int dump_netlink(struct bpf_iter__netlink *ctx)
 	if (!nlk->groups)  {
 		group = 0;
 	} else {
-		/* FIXME: temporary use bpf_probe_read_kernel here, needs
-		 * verifier support to do direct access.
-		 */
-		bpf_probe_read_kernel(&group, sizeof(group), &nlk->groups[0]);
+		group = nlk->groups[0];
 	}
 	BPF_SEQ_PRINTF(seq, "%-10u %08x %-8d %-8d %-5d %-8d ",
 		       nlk->portid, (u32)group,
@@ -50,12 +46,7 @@ int dump_netlink(struct bpf_iter__netlink *ctx)
 	if (!sk) {
 		ino = 0;
 	} else {
-		/* FIXME: container_of inside SOCK_INODE has a forced
-		 * type conversion, and direct access cannot be used
-		 * with current verifier.
-		 */
-		inode = SOCK_INODE(sk);
-		bpf_probe_read_kernel(&ino, sizeof(ino), &inode->i_ino);
+		ino = SOCK_INODE(sk)->i_ino;
 	}
 	BPF_SEQ_PRINTF(seq, "%-8u %-8lu\n", s->sk_drops.counter, ino);
 
-- 
2.53.0

