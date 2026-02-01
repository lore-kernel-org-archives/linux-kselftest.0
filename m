Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA00C27AC4C
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 03:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769915788; cv=none; b=Ed8broo3PKIspXH5V6bpcz12LRECuklYS/h3Z3kuCsgDri9Pp+G/pHOo16aUA/P5QH/FS86E5PNFHJyLJre48t7lrGadxwOU7zmbCLQ8Es0aPsAUYhvKIgYTfWUn0x0ajA43duyRUtpI0LO0rzPX6p0CpA8XEGlPv6lWxf/kO+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769915788; c=relaxed/simple;
	bh=sWh4qRJW5wuJPUJ9xDpga/kqSm/hNDUxwTBOVpO7yLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulaAPCwPbmgIzij3gtYyAc+ZqBQWmoxl6LFp66kxCHKxnecv5mu8dljCrBlctiT0pRUQWEhdM1T3s9jVDdInKc0zDvln+v1n7artJjQJm8FxRCO1/Ugg7nJBQLlGtS9nmZTNojEEYYiMIet1uCl+7QZnoQu2GJwwXIzZr0kL6U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7DkMk6E; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7DkMk6E"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8220bd582ddso1900106b3a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 19:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769915785; x=1770520585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMhSx+6lEu+8jKPgVw5bypgKSiK+gEAAE/MS9cV7FQc=;
        b=N7DkMk6Ei4jyLUgmG6n4QOYCluCj0s+R/Nr2YWcnnY3vh1hxplcbdFbu9mVpYEZcpp
         0iXEh/pxQtbjuTbSGveiPAiDosmTnHPezV7NsCit9tXsdBGsQ24WYx+1PulETCJYA10q
         n3xUzzsUMaLzookq8VLiW6dOM7/+uMRINJ+Z08fSY7RTrt08Dw5p05PekVlszlVeI1Jn
         ifGYaKi/oh4x4iT3cRTZuxLFaVjkjUn+FV62khlbzf09d05hM0LGG36va2roehK62vkx
         y3VMSXwpdcRuxZFnsIzj/+vCcyCSeb6m02n+HUN+k5ryuefgniZxzwQOnioLG0M3k/Mk
         2pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769915785; x=1770520585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sMhSx+6lEu+8jKPgVw5bypgKSiK+gEAAE/MS9cV7FQc=;
        b=Hpj6F9Ib3jO1D2lcSuf7pnN5VaqSemceZUEN8pQBqC0revqpBnfKNGLVMslxUTyMhj
         bS0iIJFtTS7pNMOnunRrQZGTrhr/0A/AtTQB+LfVYb6KCGXGosYXJrspgWBfCiwiwBK1
         Dyozy5bL/KTanAvwjPUKJL8P/q2jTNcQZ757Me0QzDfWvoh5krSNARu7ITL6XFDochGu
         4nXqjzItTI3nOpeIYA1ePi8vje4iQrl/FKmKP0dFV/Lyq0/0qqKmBeH0bT/Qqpyy116z
         aj72kcwRDCoC1LBtWw4Qi1cg8EuB4qcHF9ew8eBiq8XxEnVXd7C24u2EzopFh8dco4en
         whrw==
X-Forwarded-Encrypted: i=1; AJvYcCWO8ylklaVp/4Snf32/hvr+dFPm5V7Q2/r183k20i26GCGt1RjxCfZCCdB1eGJVzACKCFWGSCAzWWhd7i1TirA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDS/Kjdo/AMthO2bwc3Z7xJp2ytEcOB50VVphc64Qdc98ifRZp
	90kMoveIeHvDRE2SMFbqS552rU3MexuRrma1+SDx1fBh55e4Q9Svd48bptPEN+rR
X-Gm-Gg: AZuq6aK0S2Et37GSIdGnxGWu8Es410C4l+giQ1glJ6j/6Fy+OOePew63Kp7AiuRoS/7
	64KucMoRzzakyq73wW/yIqr/baI1+SRg5968ETKdDWmg7W2I+nVhPT2wlCGMumVmjt3kCkKMrsF
	x7MrMN7qLzsk1o+SPiRVph5jlDKxVjU8JoF2U+M+I61BrQxWj8nX+XjG6+mGHDkl4IPbESA/HCM
	6SRJSqiytLOtn12AOoGO/+xwfy7INS4Mx/L0afcI3lp440O1M7tdCsAme12rMG7hbacxtk6+Sa0
	UuQD2PoPpoCqQg3onjoE3IjilD4Z4xxxWx0X879LOeA4Pyzev+qctpDh9ZFnCl++MLoNUdm6gdm
	YuxFnElANAPlfGb7Dk4+/wwXdwKm/Xd2bdG2WLOSMJeiDi1zvvNf/4lTobSHJ8ljYQOcc4EHfAs
	2cnyWAlHRn9Fv2X+L9a/07Vvez2q9JoaIi1o2XHxlK0g==
X-Received: by 2002:a05:6a00:a21a:b0:821:85a4:3f75 with SMTP id d2e1a72fcca58-823aa67f131mr7379254b3a.12.1769915784990;
        Sat, 31 Jan 2026 19:16:24 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b6b2bdsm11810818b3a.30.2026.01.31.19.16.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Jan 2026 19:16:24 -0800 (PST)
From: chengkaitao <pilgrimtao@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	yangfeng@kylinos.cn
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Chengkaitao <chengkaitao@kylinos.cn>
Subject: [PATCH v2 2/3] bpf/verifier: allow using bpf_kptr_xchg even if the NON_OWN_REF flag is set
Date: Sun,  1 Feb 2026 11:16:06 +0800
Message-ID: <20260201031607.32940-3-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260201031607.32940-1-pilgrimtao@gmail.com>
References: <20260201031607.32940-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chengkaitao <chengkaitao@kylinos.cn>

When traversing an rbtree using bpf_rbtree_left/right, if bpf_kptr_xchg
is used to access the __kptr pointer contained in a node, it currently
requires first removing the node with bpf_rbtree_remove and clearing the
NON_OWN_REF flag, then re-adding the node to the original rbtree with
bpf_rbtree_add after usage. This process significantly degrades rbtree
traversal performance. The patch enables accessing __kptr pointers with
the NON_OWN_REF flag set while holding the lock, eliminating the need
for this remove-read-readd sequence.

Signed-off-by: Chengkaitao <chengkaitao@kylinos.cn>
Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
---
 kernel/bpf/verifier.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 05a6a6606b6c..bb3ff4bbb3a2 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -9260,7 +9260,8 @@ static const struct bpf_reg_types timer_types = { .types = { PTR_TO_MAP_VALUE }
 static const struct bpf_reg_types kptr_xchg_dest_types = {
 	.types = {
 		PTR_TO_MAP_VALUE,
-		PTR_TO_BTF_ID | MEM_ALLOC
+		PTR_TO_BTF_ID | MEM_ALLOC,
+		PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF
 	}
 };
 static const struct bpf_reg_types dynptr_types = {
@@ -9420,6 +9421,7 @@ static int check_reg_type(struct bpf_verifier_env *env, u32 regno,
 	}
 	case PTR_TO_BTF_ID | MEM_ALLOC:
 	case PTR_TO_BTF_ID | MEM_PERCPU | MEM_ALLOC:
+	case PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF:
 		if (meta->func_id != BPF_FUNC_spin_lock && meta->func_id != BPF_FUNC_spin_unlock &&
 		    meta->func_id != BPF_FUNC_kptr_xchg) {
 			verifier_bug(env, "unimplemented handling of MEM_ALLOC");
-- 
2.50.1 (Apple Git-155)

