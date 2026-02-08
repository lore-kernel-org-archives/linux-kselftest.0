Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72655287511
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Feb 2026 02:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770518984; cv=none; b=NyY3QU8xmQW2K4H0t5I2h0GFBStxgn/AJ/xIdR1nbHNNcCyz09bfaW/xMw48MVKW/2jrfOM+V2RcyXom8v8B0HdmUGLvvw1dJD9hzY7muZkZKliy3VfS3YMsGoYXpWSzZateQ2lHDcJCzdITvDrhsHrtrpyvgsSafEU4Qrgr0hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770518984; c=relaxed/simple;
	bh=4TgoVZ4LlN4Q5YxWLL35dOLSFW+6qRdJJNSbmiAoSSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJOM81Is67RkEU2Z7VVvVmzPVLLJu810fjbd5VvAZfuzONMMYY3IBPp95fd/hbI9zoYcsur1SvnffG4ucUx5iksUMcuem9wNFK+lhbdCBErbkh7SC/1hlXmYmS6tIFRlm184/OypDEzSl+WEl6fOwx2fgstSAGUaWK2D0+tAnxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+yrrnV1; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+yrrnV1"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c6c444e89bcso1197387a12.2
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Feb 2026 18:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770518984; x=1771123784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEwKgEcJoSX88Rslg66p6kDbLyhXBoZdC1+Ki+lttc8=;
        b=R+yrrnV1x7iOqaaxD8aoxIuTYtUGP4N8hyrpnbpTiUQk4vF2MInckSAl+t97yiLZKr
         uijHfJqtqR4621yJUVF7dZoHHNNWaBTra9R1erjFobCGwHf72j6rsEQckRkWnnRRIUVg
         Npft07jXokisX79lYohws3i28jWR5+SJGR9232Q/ha+zIlc/sD3rptZzpr72uc50UfTu
         ucbJfkk8XxUo+fVIWJEokVZYqACMHtj/hpbvu4PQGiZ6hMM+5mJ0hWBlPQsvW1RbTDO1
         +j9ru0x9UaI9cb3EcUo+BecqQpwdPMDofRgUwcOFtQSXy6LGb8K52gmlOvVmrad5TZjV
         u11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770518984; x=1771123784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JEwKgEcJoSX88Rslg66p6kDbLyhXBoZdC1+Ki+lttc8=;
        b=jJUyf0vKNNkVvPOuxPcijIw45WY8MenB4KYQi2PWhdtMUofXviqlIf7D8swXn89tYK
         ZixppCCfNqxvu54A2lMvX8p2KsdPKxr57ilm19JTZskV+SbUYd3y0eXN4P8M8Ytv4+aW
         7XqDqMQAM1BXPIgwPt1Dn9utLuFJuUwGerOl3XVxW0XvXCiIKUdnF8VrlggUzfURxMrB
         34PMHQ7iRY1N2AnXvxdgIm1c+7C9Svzis0loxWMMFPAq7UgcWVGc5xbDl6yO8BATU/M1
         Bh0J4w/nkBVrl8kR9IKlCWEsqT39bnSPe9KJEI3TnVPBy1YVx82UMByfTOXnL4uaQ4gF
         2XJA==
X-Forwarded-Encrypted: i=1; AJvYcCWDN5Ox3NBtWo2BqLpQHb63RqSIMKgJDqqblH5LdG6LDtpu/EGn2bAsK9VG8amF2sdV54JEtw5zqH8IIm70z6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSfYGNmzRTnf/i9a7uyFkHKA6QZ7RSXOqH/IpxcLm7OQHu0igu
	SPjMWHC5tJZvttw2SdsRw0SjPqoUCeWL/L4KoH+w5liN6LzrUYtDE7ZX
X-Gm-Gg: AZuq6aInlZOvgw1K+vTfxfWhVbSeD03fiZ0fYF/JtAL/ZvgzV2jl2S4GfxuDO+UAaDE
	2j5HRcktLGe5JioRzbkmrOX+k0D43t8/Ox9cv4g49u8RzDs7jGYcU7i26Wu6avGsGrm8ZeKUUKY
	hy3oqdOpgU867/68tyH4L2FSd0uxMOxWcYI2K7A2BF0UKv3p7kZ5QWuZbF+0fRz4DB+wGPwzIpe
	rpKT3OFmwdJpRXxSwRjPxFti0r2pbBEShAOJ7jIPguMahiJ3NLtKi1zlGJFIKqmj/IOksDn+VNB
	tajISD0n7Y4dVGBeiPjAKsF7tnKOQYK5JitYkAESZEszpOgR37OtWjwfizpDJNK7/87ZIr0OnC3
	fzekbh1VbzABDXQJZg4st2iGzLCjAiY8i5sz2hXblaLpWFk7skzTgdnwF7HLZ3o/gQ9toR95zNc
	af2Tnur89wdpx7xN7EwexME5ouzSqoJVNFDU1kBdYttvqixnbvOE8=
X-Received: by 2002:a17:902:ea0f:b0:2a9:450b:104 with SMTP id d9443c01a7336-2a951969dedmr65714265ad.55.1770518983811;
        Sat, 07 Feb 2026 18:49:43 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b9f5esm67194715ad.51.2026.02.07.18.49.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Feb 2026 18:49:43 -0800 (PST)
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
Subject: [PATCH v6 4/5] bpf/verifier: allow using bpf_kptr_xchg even if the MEM_RCU flag is set
Date: Sun,  8 Feb 2026 10:48:45 +0800
Message-ID: <20260208024846.18653-5-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260208024846.18653-1-pilgrimtao@gmail.com>
References: <20260208024846.18653-1-pilgrimtao@gmail.com>
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
 kernel/bpf/verifier.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index bb3ff4bbb3a2..50cb4956e5bb 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -9261,7 +9261,8 @@ static const struct bpf_reg_types kptr_xchg_dest_types = {
 	.types = {
 		PTR_TO_MAP_VALUE,
 		PTR_TO_BTF_ID | MEM_ALLOC,
-		PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF
+		PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF,
+		PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF | MEM_RCU
 	}
 };
 static const struct bpf_reg_types dynptr_types = {
@@ -9422,6 +9423,7 @@ static int check_reg_type(struct bpf_verifier_env *env, u32 regno,
 	case PTR_TO_BTF_ID | MEM_ALLOC:
 	case PTR_TO_BTF_ID | MEM_PERCPU | MEM_ALLOC:
 	case PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF:
+	case PTR_TO_BTF_ID | MEM_ALLOC | NON_OWN_REF | MEM_RCU:
 		if (meta->func_id != BPF_FUNC_spin_lock && meta->func_id != BPF_FUNC_spin_unlock &&
 		    meta->func_id != BPF_FUNC_kptr_xchg) {
 			verifier_bug(env, "unimplemented handling of MEM_ALLOC");
-- 
2.50.1 (Apple Git-155)

