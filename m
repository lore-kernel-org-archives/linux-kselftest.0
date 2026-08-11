Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A572C3257
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 04:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786420920; cv=none; b=YZCu9/X/12LDOi2EIBsF+aXDRWj061kevfU7bEMg1zV+MLnEXeesYVjJGOgwewWl9k5XiWTRDEN7WNR9ViC7hZ6uu6IHz4ty8OSZYpAcEt+1u7BFG0t5Jzh8L8hMTPUtSyTALs1hwRa33tBaGE6xjGNVFplUAMXymNNScW25PEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786420920; c=relaxed/simple;
	bh=wyrRbzBCRcFfgGyw6L0mkv5rVWa6/BFxWE6D7AqovX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQOrlugIIzPgIyOK2+FwHnPYVTD21uWsPDYMn4H8oimOy97A0u8jdZtMfIGxij80xImuqGEoUOEnrIPPtfPBuE3TrzQCpQYTG43MjSX8awUCkEd4Ht0Fg+pSCffY/l0zy+jORrOOzv+xNUDdAA5zVPgvQti8ImSFMFDPXcLYcnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3vFiTOY; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3vFiTOY"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso2555626b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 21:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786420918; x=1787025718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ht8yfAM2PTIYfCuXzXj9SbALgiJ1GqBCtjRB+c6/JlU=;
        b=j3vFiTOYzUJHgn2eJy0FmYQeq5OUcuUSqij7IobVMl0KfAleE+Tm1xsyz5GlV7JhSe
         tI63QlwSx9kcoUI6JVLw1adTfDf93m0GAnBzHYWwPax9w6jCZZFFAstCjaXzA/nN3mEW
         s6Xctx0Mb+4c7hRcXnR0AxdBoklzZPmsqzRq5w0BnHS433D+ix0U/55/7cgpheAG0NfS
         79TFqQZzCSx45hU4jwnfZWsD/5EokPaMjvWANMURuHSnbXueMVJ36hFaPkuufBpiydqy
         uijvvAX3K3NYW246MrwPwYVdCMrVlyDxVOusU/F8XzAnernOXxgNRcgfMxzsAGIaHfti
         JqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786420918; x=1787025718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ht8yfAM2PTIYfCuXzXj9SbALgiJ1GqBCtjRB+c6/JlU=;
        b=NAnBIpdUvere4qJ/SPT4NakAVv4BpAum8yGridg8owr5tRgR27DIs7Ij1/cwZG2vxV
         MPQxTBCaZVN8g+AySnCXC0mNuLP3lNUSCOeXJFhYMkTTzw8HT/duHjVe3dtfwBK51jrT
         /3EVSVlBnak6p5k+wVMBy2gOPJtkWwWdeK466qfERnRzq89eObnHop7WoFeAiErZVOzo
         GgyQmZ811VG6jVgfcTdDla/z+zcLApTMIQaf12iLKVstd/x3dK4up0odm6D520ZU3Wfe
         fVmUJtEL9+MySNjS5ZbLvF2xZTNJOm8EdeX19N4823fydBATuV8jypGhhJxpFjWxmVDU
         5l6A==
X-Forwarded-Encrypted: i=1; AHgh+RrdMh6FBkx09jgKlhM1Wks1A1Z76B/knjRnzi7PxEhXgbq7+wJGvb0D6dw09s665g8sVnWpobmOq8hs6eie6Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzune/ftKB6PoosY/8zPG4S0LhrAEbOg6UW2ZCUZvCybp7zcHgF
	eJ2zsyVvBxcjIjNhX1x7wTAGC5Lej4zjcYT7wDKI0XHbiGOQJBZMp9Mp
X-Gm-Gg: AR+sD10OV4dl3ZFM6SFJQKHEE/Uxw4BZxgSEQH8ZeS78ues2dAogbsLXkSl1ELN9QuV
	ExB6Y0qb6w0ChoxDiaCttcGlYJrYCIcoZV6KhZfTotWWMlPY8OLjPzVv0252SKx4D+04w3uOfAR
	xoGzers4wW5h3eeMXZD9lM75ZJ4CR8cr1EzUJyERw/sktPEQeruhJJ593HqsWG13GwHJXg7DYIx
	QCVhEjFFG/XVWQ9VDMbbQG6T8kkSMc5Hi21TlsqhdJv+LGZLF26BeV/CW1gdgdIAUXJRpVVQ+lA
	p7kDpj7q2v+VoCcOL6xtdWLC+QKlSz68QxJchHWHZ2yLdRHk5gBbFReHhTmDjLkaM1iEe4BpcfT
	PqIBeeWPp2ybNHhk+FM6hr5ijl6Ma3Z2rFZMWxZ0xb/AB9At60ClDGdPNCfavVYhwCiyDWJ2KKy
	iZUw5AVon633rSIc0xzXKJNJf+Ob0T0Txw4KnYeRnyhjZkueqGZW5xACJnZ6xy9RsQrGRPYzqxh
	7eA4i83XkORQ8QQ17eEZv8WHWg=
X-Received: by 2002:a05:6a00:987:b0:847:7f3c:b5f5 with SMTP id d2e1a72fcca58-84fa869923dmr299588b3a.11.1786420918167;
        Mon, 10 Aug 2026 21:01:58 -0700 (PDT)
Received: from patterson.cs.ubc.ca (patterson.cs.ubc.ca. [198.162.52.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbed8bb9569sm163683a12.3.2026.08.10.21.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:01:57 -0700 (PDT)
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
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: Test RCU iterator state pruning
Date: Mon, 10 Aug 2026 20:59:55 -0700
Message-ID: <20260811035955.132989-3-dingning04@gmail.com>
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

Add a path where RCU protection reaches zero and then starts again.
The iterator is untrusted after this gap and must be rejected.

Signed-off-by: Ning Ding <dingning04@gmail.com>
---
 .../selftests/bpf/progs/iters_task_failure.c  | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/iters_task_failure.c b/tools/testing/selftests/bpf/progs/iters_task_failure.c
index fe3663dedbe14..566a1d3dffeab 100644
--- a/tools/testing/selftests/bpf/progs/iters_task_failure.c
+++ b/tools/testing/selftests/bpf/progs/iters_task_failure.c
@@ -61,6 +61,52 @@ int BPF_PROG(iter_tasks_lock_and_unlock)
 	return 0;
 }
 
+SEC("?fentry.s/" SYS_PREFIX "sys_getpgid")
+__failure __msg("expected an RCU CS when using bpf_iter_task_next")
+__flag(BPF_F_TEST_STATE_FREQ)
+int BPF_PROG(iter_tasks_rcu_state_pruning)
+{
+	struct bpf_iter_task it;
+
+	asm volatile (
+		"call %[bpf_rcu_read_lock];"
+		"r1 = %[it];"
+		"r2 = 0;"
+		"r3 = 0;" /* BPF_TASK_ITER_ALL_PROCS */
+		"call %[bpf_iter_task_new];"
+
+		"call %[bpf_get_prandom_u32];"
+		"if w0 == 0 goto unprotected_%=;"
+
+		/* Keep the outer RCU lock active on the straight-line path. */
+		"call %[bpf_rcu_read_lock];"
+		"call %[bpf_rcu_read_unlock];"
+		"goto merge_%=;"
+
+	"unprotected_%=:"
+		/* Create an unprotected gap on the taken path. */
+		"call %[bpf_rcu_read_unlock];"
+		"call %[bpf_rcu_read_lock];"
+
+	"merge_%=: r1 = %[it];"
+		"call %[bpf_iter_task_next];"
+		"r1 = %[it];"
+		"call %[bpf_iter_task_destroy];"
+		"call %[bpf_rcu_read_unlock];"
+		:
+		: __imm_ptr(it),
+		  __imm(bpf_get_prandom_u32),
+		  __imm(bpf_iter_task_new),
+		  __imm(bpf_iter_task_next),
+		  __imm(bpf_iter_task_destroy),
+		  __imm(bpf_rcu_read_lock),
+		  __imm(bpf_rcu_read_unlock)
+		: __clobber_common
+	);
+
+	return 0;
+}
+
 SEC("?fentry.s/" SYS_PREFIX "sys_getpgid")
 __failure __msg("expected an RCU CS when using bpf_iter_css_next")
 int BPF_PROG(iter_css_lock_and_unlock)
-- 
2.43.0

