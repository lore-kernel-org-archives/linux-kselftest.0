Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ACB3C9EEF
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 14:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228362; cv=none; b=SS1l6BNnHql0CJ0CGqqFCsPwOfmDH0Mv8plvmgN5xIpptbIz1NDVhMWMjpv/fcsVNKPOqscjTfsgArhg0yoUDG7kRbD0+SuGA88zxpH0Pto9NwRpuAxCfo5bxDwmhXjSkeGFqlgruNXr453vvVE3CtjIQ7ovXbzZ8mkNwZEzqls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228362; c=relaxed/simple;
	bh=aUpES7Gc9kEPXxJ8Aaeynu09heHY8n8dzJ+eSENcNh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kW5cSVyD3+t/F5pxtBQtocJop262HrnudjxYkVXuQ8WQO1/0xYqrE62wDtQgkAd/Yd8Vxp0IFsI9vpzVf54ukDiOSL2PwAAZZRvgaCyvd8nlv5tpTuyt2BbjfqiOyj5lyTl/1p4ONnz5HPrs22vpon+gCcqsJleez6hP5wlqjzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AFYtEEG2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AFYtEEG2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so17917955e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228359; x=1775833159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FH31e8AWCzEljZIdx40WqHOE1eMjOl08QVJ0UOLH5y0=;
        b=AFYtEEG2RfJGSx0VPjkQaorC/EI5ttHdUBd2HdU5Rq9+BsefoJwentJVYQgA/dlNLd
         GqWbskDcn8vz/gN40ovaGG8MWXO7XehVC5migT9/V9oOBsHeJtBEN7hjQIAwUqOH6J0L
         bx8Jlfzg58BU6YHvecteLZWpnDsgbx5baawVUVLS7ofXDM7p/VUh4TCwtaanKh+flCvp
         G2OHNMxTnuINv57jqL0X4cbg1VAVLKSG/lTamaxJEYYZ2BMpdmbtp9+8zivPD8q0J7Ie
         SI2iuLbG28zbuUwIWRvk6AXqpLILFJ1RLaTKO6hw0kmTHwDCt+L0e28LPquLJxu8qe+b
         VUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228359; x=1775833159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FH31e8AWCzEljZIdx40WqHOE1eMjOl08QVJ0UOLH5y0=;
        b=UMNaxNp3Ihyw2kb+jxxxgoL+CjxnQ7KF6x4qjN/r/nLp4XRGftYHqikSUB1tSuxQUN
         mzbeFZVRypM1vEoh79ZTc6c1UQCAwjF2skcJEu37LwfHF8SCTQFy7pErNLbD3AIZS0Gk
         LQ6TI6MN6m6RaqzY5f6fik8HS4QsLkxXIOe/DlTJ4VJx82V9tO/3SJpwHYNCkwlDTf5K
         NaDVocrKHYmkfc9huxa5ShRq1H90Iac5XHtlVLkfuHveX1zVjuX3jJrKZUwZxl+JS6t8
         B4OrQfmmBZpchmnh3H1RMJjy1THwDyJF2/VwZkzvb4AVI4xfu2JAftRu84pm4qj5o0fM
         1keg==
X-Forwarded-Encrypted: i=1; AJvYcCV8nY+GMZOTJC7WIKp5F2q0I9dJT3QwFt4trEQ5BjFF4zHaGylBpem/3InrSPtx94A4dR1jf60Ys1xpmCfJl24=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUvmwdPq2P0smY0DafivaHZLd3Zogs+WhGqAj0hRowPiJPWfX/
	1zdmJ8TZRPJCyS5nc5+7epLRTHBnO2n2G+GJbohI1BzyaYzUPp0GQKBKow4lMFGfN8s=
X-Gm-Gg: ATEYQzxrbKs1qxoxp2tg5u/0Oy6zs2WJG4MBWfCa+jtRFOJe6CopXMUDRxvFC5/1pw0
	p27YDECgvvfm3yWDPHXzoiSspJh7nEwzwOZ2u5kxUUC2RwKrnZk68MurS94HW9ly5uZv5UNcFm6
	W6jtBsZLF3RCAJWWuvf7l0J/WAf2hyF9Lo0+4MDXNshubdnRO9RbELJBGVKnVX9hbf8AapsQ0Fp
	eiamIacgKl3wN+efsfYVpyfQo3KwpjFc1fArNYBdCMoSAWE0ncFskq9J/mQp3gewblfNuuh/AIs
	eHG6rrTN8x0l+ox+RebhsdNriLTOPc5u/4f64kpzUmjgSVgOc5ndNvLyu11C3/wLnRMLc08GZ9a
	ciXHLhP3RCnvQniq2df1pWdh+ZaIJrGtPq/GyNmstLBZHMjPqH8gr/mvRjhEAE7gdkVuy4C3omx
	LGiLWsV7oL
X-Received: by 2002:a05:600d:8449:b0:487:1fbf:e0a1 with SMTP id 5b1f17b1804b1-488996a1e01mr40470055e9.4.1775228359261;
        Fri, 03 Apr 2026 07:59:19 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9b8d22b4sm7057743e0c.0.2026.04.03.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:18 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:58:56 -0300
Subject: [PATCH v2 03/10] selftests/bpf: Avoid rebuilds when running
 emit_tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-3-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1031;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=aUpES7Gc9kEPXxJ8Aaeynu09heHY8n8dzJ+eSENcNh4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHm0vdr2N5i6HZ4gffnwvQbcf2SfTzaga49ypwgLvh9I+uo+pRH9t5bZhXy6KgdapZF0ZhDvChf
 zV+dxXyN2Vwo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

emit_tests is used while installing selftests to generate the kselftest
list. Pulling in .d files for this goal can trigger BPF rebuild rules and
mix build output into list generation.

Skip dependency file inclusion for emit_tests, like clean goals, so list
generation stays side-effect free.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 6052bba2c157..781238152c4f 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -703,7 +703,7 @@ $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_BPF_SKELS_LINKED)			\
 			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
 
-ifeq ($(filter clean docs-clean,$(MAKECMDGOALS)),)
+ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))
 endif
 

-- 
2.53.0

