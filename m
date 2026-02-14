Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC79D30AAC0
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 12:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072876; cv=none; b=dqfXcH74rtJER6nRaVhxYP5N8QdjQRWb5z8DfWTnPklxJebJ0EvziY58ZG/oUp/WQGqPkBBCcK9HwwJ7iTRHDZx1LmqMa9SOHSjPouYRAiS2xNWEuE6cWXg5bjXx3WLKj9qCQv0RX2/y1EH/RBdHTY5dbldyxO6sA8P8eH+aKrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072876; c=relaxed/simple;
	bh=Ye+oWlYE72o2jiv4nukJNQWUydaCpWaI5XFqBC4XqUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SgSaI5LRXPpEbDDLXImrwtX8HE+JTHi0yt2P7m6BfavPL6ZHk02hqMfqMEsbFTKJ2aXWLqsde5Xg5Y1kcvLNsh+uD6fP40A1ocTwPi95iK4Uni88dSTGL9Cg4FE4uh0j7XpKRM6i6hoJsXBCcagOWIfrbrJE/k17w2Ad1Qz2iwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQAk/LAW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQAk/LAW"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-824adc96ad2so1838005b3a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771072873; x=1771677673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbPLRwzzn4WS3fd519NwtSlQa9Kkj67LEXJEwwxQVcI=;
        b=kQAk/LAW9bgNkx12z+KU68iAKh+j4YeD38XOunQfVY0cCkWyap8sozLKzC6GQ6d47+
         KfOhx9Z9fTMshg+Lu8NFrm/Gd9N7yh7oZ6vEmJaWAxJEOjGqzllhkZ/Wy5rLiAK1v3NJ
         xJJznZ/ZXkczrgjo4ek/7luv/S0citc+i6GmfTfriNmyJjV66MytjpJIot6y4I35kgJl
         9z3I6lEvQaPqFXqey7uHX6jAvchOP9fwAZOlT8S4AMqf4b2LScY6S0t0uE/PFRTeo7nS
         epm3x9OBZq6f8vZYDQTXUgMAQ3OyYw1Sx/tuwVFZ0KlCi1wRLQ5+0ve6CDXfU3rZDMFb
         QJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072873; x=1771677673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fbPLRwzzn4WS3fd519NwtSlQa9Kkj67LEXJEwwxQVcI=;
        b=aN8857SlsNhAAwboyku39izelT+mgFaHA2CmNxVIDTYgKeBb6eJ4OdFvqzTg7cEpkN
         307SP6/IqYZJxqWIL58dUabef8EA2SOML35+TUCP90yN1DbloU50j3yx/ktNo6h5BKJD
         EhW8hYOYNwuDhq0u4CcZOtqrhbHG875c8ZppLPmf4zxmvb0kyn9TRdYjmqU19Q4sYm4x
         Y8g5jK7CgyadQyKXhuXSTyAS1xmDB46CrwEqA5k3ellPTS9lbqm0dTP0AbB6Pmqiux5d
         6b7zGJh0Et7o7MVOYzp1y7Uhw30reDaCahOIXT8GZ3a3x46cVOMoD0R1CA+m7VH8CXZR
         Vy3A==
X-Forwarded-Encrypted: i=1; AJvYcCX079COSOugm1PpsMxzBxA3BlRNairM8HUEOnhqM6y8g1dcYRs/wfbKigY+GmQLNdBcHeOTPN2YCMUudFsRHHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1/U4/mNDBPInN8NudTUhloruPpbhTvOfv9eUKyqjqweLgs8MW
	apdNZ1o5nuucNWzohOIbi6OiakZJGudWtT+BBH3rKB5dLVefffYqYHdc
X-Gm-Gg: AZuq6aK6wZWD+UwRklloi024UzrzuytyiIEqVnRD2luMdAe9HOZaQ0uS3GuomQLnmYd
	35J3AsB7yR4KL1LrO6WBY/aZjYBY9e6qJzjvztEvXLAm5R7J/gCoZFF9krzLefFFwIS3fSoGRLf
	c0fxjbxgFNOQT7r7tDh+L+7wB7iQv3i8Bx4NRNmKbMZ3iJkQATlQTy2e5H3/osvvvrc40bx/q38
	Z6mTNBR+a3zrPDqkuKOx3Yr8n3hsMmOO0ApWWUUGPnD8w1HmmeMyTh0BvMqozQ2DhWqRGE/3FOt
	GYrHivSXFKAeBkDgyDNxLPuztSoOPaEn8Ix2QbK49PJDhit1enuKGKSWZjF/AvVO8dPQZSECBBP
	pZvixlqF7DXwrXcCpeHC3hVYobKHd0yedh+Fw/k6cKbGSYBFxlTvwZ/nNr4hb2tBFXcBVHIcGZD
	/eBVTgThd3zXxogKBx6XPOhgr9vuiBJx6lgMFoj4NL2XSWYk22iFR5
X-Received: by 2002:a05:6a00:4205:b0:81b:8872:ae10 with SMTP id d2e1a72fcca58-824c5d0f68emr5058863b3a.0.1771072873255;
        Sat, 14 Feb 2026 04:41:13 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2e40bsm7064497b3a.11.2026.02.14.04.41.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Feb 2026 04:41:12 -0800 (PST)
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
Subject: [PATCH RESEND v7 4/5] bpf: allow using bpf_kptr_xchg even if the MEM_RCU flag is set
Date: Sat, 14 Feb 2026 20:40:41 +0800
Message-ID: <20260214124042.62229-5-pilgrimtao@gmail.com>
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

For the following scenario:
    struct tree_node {
	struct bpf_refcount ref;
	struct bpf_rb_node node;
	struct node_data __kptr * node_data;
	u64 key;
    };
This means node_data would have the type PTR_TO_BTF_ID | MEM_ALLOC |
NON_OWN_REF | MEM_RCU.

When traversing an rbtree using bpf_rbtree_left/right, if we need to
use bpf_kptr_xchg to read the __kptr pointer, we still need to follow
the remove-read-add sequence.

This patch allows us to use bpf_kptr_xchg to directly read the __kptr
pointer without any prior operations.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
---
 kernel/bpf/verifier.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 3536a91ff8c7..f673cdb55961 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -9331,6 +9331,7 @@ static const struct bpf_reg_types kptr_xchg_dest_types = {
 		PTR_TO_MAP_VALUE,
 		PTR_TO_BTF_ID | MEM_ALLOC,
 		PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF,
+		PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF | MEM_RCU,
 	}
 };
 static const struct bpf_reg_types dynptr_types = {
@@ -9491,6 +9492,7 @@ static int check_reg_type(struct bpf_verifier_env *env, u32 regno,
 	case PTR_TO_BTF_ID | MEM_ALLOC:
 	case PTR_TO_BTF_ID | MEM_PERCPU | MEM_ALLOC:
 	case PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF:
+	case PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF | MEM_RCU:
 		if (meta->func_id != BPF_FUNC_spin_lock && meta->func_id != BPF_FUNC_spin_unlock &&
 		    meta->func_id != BPF_FUNC_kptr_xchg) {
 			verifier_bug(env, "unimplemented handling of MEM_ALLOC");
-- 
2.50.1 (Apple Git-155)

