Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23C347278C
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060151; cv=none; b=d80zG0GC2kaJ+rH5zcEQLa0wfF9HI6DW6UaQiZFgTkm9oKXT01YZslHJUQeBW+PMZwd32JNLLIVJj97ogmhPB7hDAWhDyRpK3MyTLPpYpfWY4Zrct1yXqMWr34NOgCoftx/9L42T6j/ajeuSBRLZFg3+lMT3mlPbrgfnOR1pvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060151; c=relaxed/simple;
	bh=aUpES7Gc9kEPXxJ8Aaeynu09heHY8n8dzJ+eSENcNh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ge5iRhw3jKWrfLNM6kkW5LLgUfRx7ADktb90QPxeEt3lEjekLyJnhj+/UJfAXl3Xxe0O6KjBFWOosoldrYLZzPQLqOYR8yBeM4p+hbD+IBRvkSra6+m3Eg6EsuKQVGiTzsUwEMBJydlp+NcEKzkK4zq+zNXRP+wW+24OvGwV/Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Sb+koR3b; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Sb+koR3b"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso74165135e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060146; x=1775664946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FH31e8AWCzEljZIdx40WqHOE1eMjOl08QVJ0UOLH5y0=;
        b=Sb+koR3bmpfLekNktSLXNu1jQdAXvz4oMZtiwizY7vEDay3E892bYxUh8JOYY4GNSD
         01jzklTtmmjHLDdUe6Dxvum6z5JzBCcHdSQet3ll1TDkmFqbVY14d3IkDsLbb240Yq5j
         f/x1/5BJuTwdtqSvcJce2gaY9ZNE6vxA92J0+YPK7QrSuLsr70NPxS0IzD2s/87C20YV
         d6Rx8yuZ1IUZTj102E6Pvl4gCsT9bioJI9FSX56+AhZ22hhhjW1VfiWSakqt1N0LULgx
         8UgOS8JrE0nov38FAhjXCNjrmeQVWqJAmg4HBJ/5FcfiEN2nzzGKQu2pA1DA9okDxm6Z
         0S5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060146; x=1775664946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FH31e8AWCzEljZIdx40WqHOE1eMjOl08QVJ0UOLH5y0=;
        b=QhJSzW/LYcniaFLqAQI4LimH9jvzkSEFBVGjegZsVo38p+sPqC3ktx1Ynh1m0eSzd+
         69XmTEA7+09oFDkMG+Gc/5oHXnDBVQlv5TG8UCx05262uwu9auri3HPrBs8CSJQXO6Oc
         wuC8QalVwhPehi+HRKG5pSL7TzqwWVPRILMWMXkE0oIaBKTkhWxEtG2df9Qr5dvrhLQf
         cOxy5jlOfTM3s6iIlD+z9UGD7tdyNygHxxUHxKfTxqV1hxtabJvYErEDa18pJzcT4hyZ
         G/OIvPNc3J19z+2m7rEq/Y4zk6IiGJ1YZ6Y7XgBL21bpg8JgQxLkmb4AG7Ax8aI4QTVV
         KDQg==
X-Forwarded-Encrypted: i=1; AJvYcCXSsjdoxhZrLU6DU4XSLN7ObwMfMb99UfexoIh//bBCF4dLpLs7C9le/N7dst9MEe1PDEkVG9A+t5bZEUBBrMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ9bL6o1O8bLyUzW78+gk21rz/mBnuvTM9FmQrBUl3mc8o1i+l
	lfcPYe0i7Lsv3aBxK/6+WJ34Mn1E3mf9gV5kGIG4lg9lgY9KmbxHKeZpYVaxrMqJqro=
X-Gm-Gg: ATEYQzxywsmNxIQhfpCD1zGHStHAGgZrIXek/Ka6TFL1uw3ulQSre/o5AQJ02Y6vrMn
	pUxkEyh4yTq2DFjoPzwa3tay9fc3Wko3k3h7tWChNX0R5HlRLkUxyiUYvcUz0YBssdfreltPSR+
	9UIYUS3v1rJXNX/YJdzdePullGZT4sQHQKKHi+7DVbf1Xr2evLW+cGu22Gql6PudaV6stq0ITTk
	zejEGqyKuvpsQg+2sQmPehlQSVWPEO9L09fzdcLRzZsv5hzrnCyIhjwt2whQhpBhsamwJorioAx
	g/snw8DRIAIMTWI33/q/0YWB3OYK5Y6grhrGYDxkz305dFdiXCiCiJ19fHdWmmZ2Jy0zEL9mMMn
	eqWr2wGQfnDPPTnSUhw5FpfmL+bh8EpXo5Lh+R6Cl1xXp+WeexJMXmbUwHWB8im5mnWZ6/ezUQU
	Wcft6rGqzC
X-Received: by 2002:a05:600c:848d:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-488835b78f1mr78263475e9.29.1775060145641;
        Wed, 01 Apr 2026 09:15:45 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb8515f9sm480658241.6.2026.04.01.09.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:44 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:10 -0300
Subject: [PATCH 03/10] selftests/bpf: Avoid rebuilds when running
 emit_tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-3-3ae42c0af76f@suse.com>
References: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
In-Reply-To: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1031;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=aUpES7Gc9kEPXxJ8Aaeynu09heHY8n8dzJ+eSENcNh4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMsJ69itcpfkywotPoUEtnEUJMnBYAIgSDZL85c3MrgvDq7t1aLeZLcV61FfzyM/1a0vB/wWLMM
 37EVYpHuMKgY=
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

