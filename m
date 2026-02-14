Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343732FF158
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072864; cv=none; b=sMmBNar+1j1j2ptcPhnmH0NshrhOjT69tVm3DSBtrFuUnwtbafUcVJ1ot1NbOuoNfTP1EWBYNbkJc7MnMlH1wI65Iz6giF8xPELlvNLiFV+M0tIXvTaYYPxkbw6a0vEFfbiyROSGGlswkSUT8wRDzTxNPllJoLBOw0Wt0aIRJoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072864; c=relaxed/simple;
	bh=aJnFa1Hsewgi8H7YxpRPpFYJuripGJ/a5ZfAUhM+lFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BKf14EcrmVh+s3rvDb9pQWe0DbTGxs8bsoGdmaz57HTsIw/biCCvfWLW8HHvOic2UAjREwVyhZdPsIL0TooSxcOB7E9obuO4g/KM7kX8ga8igYT+fQ0XjRUz0dLKbOFOk3qugJQtX0gWRzeAs1tMRPpFnsHILh4KnI/9hkQVMNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jE0XANPn; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jE0XANPn"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-824b5f015bcso2132007b3a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 04:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771072862; x=1771677662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6tCm1dSlSN76Pq+BKvxzLO0K4J3qy/k2J9RReSkTgE=;
        b=jE0XANPntZmPjg79xXv/G+pctvHqQFQ8q/XrZzkUxCt1aF6b/a7JExzVye3EThvBl+
         OiIdpJo02UrycuDQzMicMABlptaWql/+qp5IOe6UDhGfyLb6ftYC8f5OamH3cQ4p7ZNd
         LkH2Rzp0jPcm3S+WSPLHUzk28ytM3/nhHOEsuLnnKdxRC/tJWYdGH/pCTs1U4JDF2FO0
         GPIo2jF4Q9+B+qBbYGjUDKTfbmC0JHEg27f46GXpAdpF//Mmg3hgzc/AK3ZfwLvw6qUt
         71DgdcuhgLqiqqakjE2//acKxwWy7jmoUT2bfvpD9/Z00vx3gl42Svs+kV59seFmbkjp
         kM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072862; x=1771677662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L6tCm1dSlSN76Pq+BKvxzLO0K4J3qy/k2J9RReSkTgE=;
        b=fBH1OiCdLOKoVtxiDpN3iuDzDn609hSS4EPjo26OLONPR37E1Ucla9sAQZ+5Bxg4+k
         z3l1vHPOBnE0P8IkoIUOLyvnAPM/mwSPj204qZwtdBbCv8o5VkEp5q/vcdNtgSxmYpvp
         J9E3Vu+A6vHQmQdkv06hnSz7SX/KpgmgolcDo5WkzFRaar2HHuZ2JWPL0H654ZBQ7Tmi
         GtCCkkSK0JUsfQLgb+jwcsupUI1ThdmJnPaRM1e/Qr1Tu1b3pAkncuAfUb8hV9ouDxj0
         7RhP+G6tdnrKbt2CyZDB/GtSZC4oZqlrl151woKJXmLCwC1zMCPrA4PGRBciDO24NVQt
         fRlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTE0n8gvBWtTOMcjK8FwCEv+qPQ4tckb+oz82oUFrNBrptV1qy0xqXwUyydYkEV4Ixl0P5wRnnFx5xhIgups4=@vger.kernel.org
X-Gm-Message-State: AOJu0YykS9w2Z57/2ef4dMr1i4DKA7El0UI5zdshr7uZ3AF/m10BOaVO
	uS14vo9DCfxNBYS+h3q9pP6KIz/qpzw04hzcBefoIUxgTSYINkc4Oyn4
X-Gm-Gg: AZuq6aLqWo3x/OoyWurxu2xBHJJCL34rRbdQEnSLHNsT5EG3pkJF4ef6O+KHvkWXWIV
	ZkU/b6X72jUttN1xoWPAFKmUI30mk0te0uS7GAlopsxydlcioMDhbqppouVGjlPWkZi+cSyCkYi
	RbUTiDZuu6UIr1NPfzXggaQe6qDtepioQ65nmlUT5f41FKVjJqeOIRkWJ7x8wafS8Jp45UjPBTD
	KSI96pzcry2iiBEDX7z1PILCLergas9fXw87nC35W92gvKJPFzisyfoC7bKAPxo4878pIAFfjlw
	lHNdkEucao1rL9DFObQ/st2tNbaC5tSbP1CY7KZdOvRbVf1xAk1kIXMKdg3xUph00OjmcyNxt2q
	Akn9P9ScrY6EYS5AmeRo7f6DLp5IMR2TCprx2YbE1KM4wFZXcdIypze/VoVZ87+VmZ/Q4bjhWdr
	LjjvncOUxkuZSC7oTGTb+pmsxeUaSg97YrxEf+If1Jc2f611OfV5X/
X-Received: by 2002:a05:6a00:3c8b:b0:81f:b3ce:17a3 with SMTP id d2e1a72fcca58-824c613364dmr5989012b3a.48.1771072862533;
        Sat, 14 Feb 2026 04:41:02 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2e40bsm7064497b3a.11.2026.02.14.04.40.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Feb 2026 04:41:02 -0800 (PST)
From: Chengkaitao <pilgrimtao@gmail.com>
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
	yangfeng@kylinos.cn,
	alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH RESEND v7 2/5] bpf: allow using bpf_kptr_xchg even if the NON_OWN_REF flag is set
Date: Sat, 14 Feb 2026 20:40:39 +0800
Message-ID: <20260214124042.62229-3-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214124042.62229-1-pilgrimtao@gmail.com>
References: <20260214124042.62229-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

When traversing an rbtree using bpf_rbtree_left/right, if bpf_kptr_xchg
is used to access the __kptr pointer contained in a node, it currently
requires first removing the node with bpf_rbtree_remove and clearing the
NON_OWN_REF flag, then re-adding the node to the original rbtree with
bpf_rbtree_add after usage. This process significantly degrades rbtree
traversal performance. The patch enables accessing __kptr pointers with
the NON_OWN_REF flag set while holding the lock, eliminating the need
for this remove-read-add sequence.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
---
 kernel/bpf/verifier.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 2927a4622ff8..3536a91ff8c7 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -9329,7 +9329,8 @@ static const struct bpf_reg_types timer_types = { .types = { PTR_TO_MAP_VALUE }
 static const struct bpf_reg_types kptr_xchg_dest_types = {
 	.types = {
 		PTR_TO_MAP_VALUE,
-		PTR_TO_BTF_ID | MEM_ALLOC
+		PTR_TO_BTF_ID | MEM_ALLOC,
+		PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF,
 	}
 };
 static const struct bpf_reg_types dynptr_types = {
@@ -9489,6 +9490,7 @@ static int check_reg_type(struct bpf_verifier_env *env, u32 regno,
 	}
 	case PTR_TO_BTF_ID | MEM_ALLOC:
 	case PTR_TO_BTF_ID | MEM_PERCPU | MEM_ALLOC:
+	case PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF:
 		if (meta->func_id != BPF_FUNC_spin_lock && meta->func_id != BPF_FUNC_spin_unlock &&
 		    meta->func_id != BPF_FUNC_kptr_xchg) {
 			verifier_bug(env, "unimplemented handling of MEM_ALLOC");
-- 
2.50.1 (Apple Git-155)

