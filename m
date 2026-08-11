Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8324267B89
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 04:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786420917; cv=none; b=PItHHUftj3Wq7vuwuUcuJzehyzfgSQKzOc1N/xNbmBVXgKGWIaklyCeDQNN/v3S186Ov6nLhXRTUn1cl9IUJPom4WyhLtLuRhpvnERIVS2/7lV/GYY56WI1iCPgOJE+BuQ3+p+AP1qmBSQlewtB5jr8XsWijREvxZqV+1dJNKoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786420917; c=relaxed/simple;
	bh=JKB8c704sCV4XMi2SILB65TPadhP+/dZ+kBPOImvi7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYKX6A5Ep75NBMceyDo+2dzbrirTxrblj5sUt9v+D9Zl3Vs2KY7zUivKOchjGp1v7P280ybfF5UbCluNYxWNTb+g/ak5bA/lr5gyRlmHX+qd85SbDXWSPkbCIzb6ObtLE1zb6am5/3Xk26CUlXjaYd/zLgZyZuk2oVQiua3vSZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haxzS+Td; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haxzS+Td"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3003283a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 21:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786420916; x=1787025716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUF/Ie1CAko6dSXUa4KbdnibBpL2SvEJG3sel4Ep/bY=;
        b=haxzS+Td+tHg7WO2xu21LqUhUxpvz5k45ukPO14aDo/YNqVY+uZ0Z61+qdwpxb4j+p
         BTgcAtC2+W5jKivlZTATVvI6IfCnMPSYc3XBqA/SgKUj72sRnDU2UbWlyWQQvc86pdKb
         iAPBSqK1T75HkIqQNnvZv9WTXlo/dr1O6omyjvP7RvnoKzrriorb8DFwUpOS9BcJfRfr
         saVGL9D2c96s1plnEOggMV3jFx02Out/uP8g1A+uj57oxHdoEZ0Y5u3fZW4mS4FPF8Ap
         G7JF7CRe1ckvL5kfEPzinSafwk227yBZfszuTwFu/nBX8bH42YkYN6xsXguYQVo1F5Xz
         JZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786420916; x=1787025716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TUF/Ie1CAko6dSXUa4KbdnibBpL2SvEJG3sel4Ep/bY=;
        b=WGV8ka2FNUsY+u+es2XsfqLFGqCPHBea8Q8f7ToLNxi351qsZ4xXASZWSjMKMpkLxy
         lcUMZ8h7bDARloq0cd32cVz3CjetO3hQP4BEiAmLn+8W9rCDyJtxZZ3nUQYsxrjlqqdH
         tIKoguYQVYLna8K9NedcRf6SvLxpjFXr6ekidI8jeKqymugJ31R+twCwJ/zGdBw4fG0i
         owpZ+SkdCCTqIF81ZpwwDFCp38HJxXxn8w9md3L17d55P2Loj36nX/OETqpIrs2zmkJl
         OAWGWMl6jiC5BEKmZpD/YN8+WSTStrW7f5Qe0vLSb9LkiCol1IjczU+eYctdakS4zsrA
         tQfg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+bOS/O0k26qMmnVN3QYOyunV1db9YKpLOHaKjtS0l6rQb/RRfqEUxlbRW9nYWL/RXre8SUm/7QKKiI3Ni2To=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVAB9Jn8Qzrq/ZpubUzDMQPXwRyTV10Oak0NUInd3LrFRU2W4K
	3AZH9ruvO6ZbwY1w0r0ULMd/coAkWrgsaK0zzdJVxyRcR2QWNyzKcFBQePEasQ==
X-Gm-Gg: AR+sD10oMYwWB/cSy/SMlQ6kGqbQItvvWa2RWZdWfwghdYPy4sccr7/dfwQfrltoPTE
	XU6K5Jk4ujeTDE2eEWQVB7ik7IaC7SqN/hL8IhsqBg+3PDZmCWAO7a9E7hQzLZ1Gx03XChY9nxN
	/+len0TcbelDIC7Z65CLy17qcOXfeBfsiplClJcw7CHMBCjwYJfpYLvxAW/Mcu4/RmWxv9aukLY
	WWFckpUTKE/tH656P/Ptyu0QjN80vAGWuVkDxHjf1/4CBiGZQhl8kqJ46A7DsZT8as08C7eo6yW
	1bQ/ti6qygxvb4Y2Eus6iz5ljb7Tux3iItl1AvX+QgZA5j3BU2XZGNMolN/xSRZvxuZLVivzUBy
	2aNQdcUrhixaHYmVsNWBs5cobW7pPyUashRa0a/TU62JQM7tEwN4LXT6+oXHpi8ExQToNal0R/I
	Ja7uUTJ6CIRna/ae3BRpCFwXNqO/p/mlDwXSQjKenxb6K65jtylizK1mL/bBR5vdkPlfYHoGhP+
	nG2yYO5DjgSGD0wuSo+bkomiHk=
X-Received: by 2002:a05:6a00:4f8f:b0:845:3fea:96c with SMTP id d2e1a72fcca58-84fa873633cmr252213b3a.21.1786420916032;
        Mon, 10 Aug 2026 21:01:56 -0700 (PDT)
Received: from patterson.cs.ubc.ca (patterson.cs.ubc.ca. [198.162.52.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbed8bb9569sm163683a12.3.2026.08.10.21.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:01:55 -0700 (PDT)
From: Ning Ding <dingning04@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Ning Ding <dingning04@gmail.com>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v2 1/2] bpf: Compare iterator types during state pruning
Date: Mon, 10 Aug 2026 20:59:54 -0700
Message-ID: <20260811035955.132989-2-dingning04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811035955.132989-1-dingning04@gmail.com>
References: <20260811035955.132989-1-dingning04@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An iterator stack slot can be MEM_RCU or PTR_UNTRUSTED. These states
must not be equal, or the verifier can prune an unsafe path.

Compare the pointer type for STACK_ITER slots.

Fixes: dfab99df147b ("bpf: teach the verifier to enforce css_iter and task_iter in RCU CS")
Signed-off-by: Ning Ding <dingning04@gmail.com>
Acked-by: Eduard Zingerman <eddyz87@gmail.com>
---
 kernel/bpf/states.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/states.c b/kernel/bpf/states.c
index ea2153cf28d0a..4e6aafad33bd2 100644
--- a/kernel/bpf/states.c
+++ b/kernel/bpf/states.c
@@ -812,7 +812,8 @@ static bool stacksafe(struct bpf_verifier_env *env, struct bpf_func_state *old,
 			 * infinite loop check triggering, see
 			 * iter_active_depths_differ()
 			 */
-			if (old_reg->iter.btf != cur_reg->iter.btf ||
+			if (old_reg->type != cur_reg->type ||
+			    old_reg->iter.btf != cur_reg->iter.btf ||
 			    old_reg->iter.btf_id != cur_reg->iter.btf_id ||
 			    old_reg->iter.state != cur_reg->iter.state ||
 			    /* ignore {old_reg,cur_reg}->iter.depth, see above */
-- 
2.43.0

