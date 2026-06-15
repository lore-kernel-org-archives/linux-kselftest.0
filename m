Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57782F8EB1
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 07:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509172; cv=none; b=G6CWXczHc4q80TCU9e5SPZ7qxCk31GBoTs6A75YgMWtY/dSMZCccuUPfYkHKvaQJCfCPIzMmYH5VXvGKHW2FJfv7sTXvoxkISAYF3OtvG9Nn3TsCjyApIU9P34YNKutp17PcPSJ1PJJXi8KfmMgrjDT+3ZScpkLj1UPujpCzSFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509172; c=relaxed/simple;
	bh=GhXEyKkP29VXLeRmonNXmZuNyFF8Y5CTi4bvaeAk+uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fo893hFyFcCrt9KyexBrJRqk8SQiFgSnX1TeU2PrbGTH1siUryORFVbAhNBcqiPrJrGCFfmGMJynoCTm3WY6Pg6jF7zBqBMoTDc5hUnUGLj7eD62ripemtLdUqD6gfgmqObVCIwiJBWxIiMtelHm5kwPMqv9fcnyPc2DJ6jQxFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rr4/Y4Qt; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rr4/Y4Qt"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so18642845ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 00:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781509171; x=1782113971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLEgrGhLLiPgaGmE3Is2kQZUG4Kfq7t6C+1yr+NyMNM=;
        b=rr4/Y4QtNFmxPXRI+sAgboLescjFzj4MrCOekGhnAvbvmaas6yt5MoE5+a0rhxYyAT
         nzAmqJcRzaFXzLvkcdjYRJc+pGJRnwz2zSmorFZilPdlSensyNzkn4zhYvph2nP7JRjo
         dgv5+63AH2BYBShK+iyx7whSnunCjUDX0UcaH2QNgy01X7L8PPfocovBAlimw2jLkFkW
         BscXnZadeg+GxdDEjHd4Y+Y/p2dGmdn0IQiXcvp0w+Q5wVJeDRb0JyawZzt2OSrNLVB3
         Dp7in6an2SI9lw7gAA4KF2p/hVzBDnWd1bvhBb+cCvNNvojPg+FEoEmTPSPIB9wZYrGl
         zquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509171; x=1782113971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CLEgrGhLLiPgaGmE3Is2kQZUG4Kfq7t6C+1yr+NyMNM=;
        b=DrCJagtRUa0/1eg5HHtrkLveiwqD/0Xb/CylHB/c/ue5Bl7Di8kqqQ+CpOE7lWuWJM
         m7cGSC92bPPFATn6IykzY4K4ZPUrYxifImipDpoQbbnc2ckslEwiCFLA+9Vx7hBFiaSr
         mF7hGo7JdBunomfso6G0x9MCCI9icFU/QQox0kBnu2W9+T482UbKfGiQvUzKEcaJ5fv6
         nbyaMrl8PnCvPkgtgSjSjp79Z3T8z7Frl/6HX/BiIc7mMy1q/QtvrDfDzbRMayJxlrJG
         8WT1gnAmN6gy1T5q+OH/ryh2NHCyD8/S5Go1fOyZ8jOkPqPB4V7wa0mP0XTJKy3vxCz4
         v5Fg==
X-Forwarded-Encrypted: i=1; AFNElJ/ueH4tR3Ncgo06SP9krCnFN/g/Ovz5QtfcpyCMY1LCdcKizj2dGnJVO6u4Lw/P2ceJfSJyYq2O4JWxq1JW7yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXxkNaIuGZ0UIl8OnZg8I1OPWtJMYxEiY0RPJrFxSCbcjwl5M
	G3nvqCBsguehSk3UwhXHp9AIG0mpCuzbCvFJ4tlXxvUuWvjRVtz6mIsF
X-Gm-Gg: Acq92OGv0nRCCzLkLKHv40UDNN4MR4M38EOAwKLVchHzTxmMJlUQWVJaim4b3GOygNs
	87Q6RlittDrA9JOQec1j3DMjbO5RLGORXEc47BjbTaI+VtZeWutlHHoihOE1aDSy+Y5ScXcebdk
	JO887rV8pKJDL5Gm43VKVJ++AkwmSQYFlWSbTOlXeVwKZGzKm/xprNMPwPe9Qj8wg5uPnmQTpFD
	sBSGF48UjE74BEviomlSKnxt5+z9n1IoTtllsbRRzGjxMZsnDGXZ9G8hGEcMvRjK8FiyyDCcS9Y
	BRh1yRrC3nwabWKsC1/NtMj4ZYPkZbenX5x3cjt33UDsB82G4HsTegEPiLAL2XLZU2f6zUxDpTu
	NVJ3feNCyYBASyGMIDUxTZembHnlgXcWIqNKnkXqdNxWayNxWuF58sPuaQI/9amgnZnXl565CXI
	5Fnu9pOtDynXhJ7xTeUvZR67laXxjUdIjsRXLNGz/w8xhDCQIZsUXFBgZtEWzRJwQ=
X-Received: by 2002:a17:903:1acc:b0:2b0:b016:773f with SMTP id d9443c01a7336-2c410414f4emr136000405ad.11.1781509171045;
        Mon, 15 Jun 2026 00:39:31 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a304:100::209f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c43307a259sm91271345ad.68.2026.06.15.00.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:39:30 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	paul.chaignon@gmail.com,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf 1/2] bpf: Fix partial copy of non-linear skb test_run output
Date: Mon, 15 Jun 2026 15:38:55 +0800
Message-ID: <20260615073856.152479-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615073856.152479-1-sun.jian.kdev@gmail.com>
References: <20260615073856.152479-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For non-linear skbs, bpf_test_finish() derives the linear head copy
length from copy_size - frag_size. This only matches the skb head length
when copy_size is the full packet size.

When userspace provides a short data_out buffer, copy_size is clamped to
that buffer size. If copy_size is smaller than frag_size, the computed
length becomes negative and bpf_test_finish() returns -ENOSPC before
copying the packet prefix or updating data_size_out.

Compute the linear head length from the skb layout instead, and clamp the
head copy length to copy_size. This preserves the expected partial-copy
semantics: return -ENOSPC, copy the packet prefix that fits in data_out,
and report the full packet length through data_size_out.

Fixes: 838baa351cee ("bpf: Craft non-linear skbs in BPF_PROG_TEST_RUN")
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 net/bpf/test_run.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index 2bc04feadfab..976e8fa31bc9 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -453,19 +453,16 @@ static int bpf_test_finish(const union bpf_attr *kattr,
 	}
 
 	if (data_out) {
-		int len = sinfo ? copy_size - frag_size : copy_size;
-
-		if (len < 0) {
-			err = -ENOSPC;
-			goto out;
-		}
+		u32 head_len = size - frag_size;
+		u32 len = min(copy_size, head_len);
 
 		if (copy_to_user(data_out, data, len))
 			goto out;
 
 		if (sinfo) {
-			int i, offset = len;
+			u32 offset = len;
 			u32 data_len;
+			int i;
 
 			for (i = 0; i < sinfo->nr_frags; i++) {
 				skb_frag_t *frag = &sinfo->frags[i];
-- 
2.43.0

