Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E5539184A
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 18:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499752; cv=none; b=bK8yOMGH68O2SQh7sySM036pkZYHMJq7+byVyfF6yFyvuQ/p2f5G6/lLR7Eu9OMc17KaZLnTMWvsL83sPfCHGdai6mFKSn40Cb4adgJESxEOiOX49YKW5NqrKEZcZ6+kJC/jGkxQvJVk9m5JekV+S1pOTcR1akqTHgIjZNAgSR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499752; c=relaxed/simple;
	bh=aUpES7Gc9kEPXxJ8Aaeynu09heHY8n8dzJ+eSENcNh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfyN67PHQ4KbKATwf2K7MRAmgFd4sflD3M4xA45OQ1ZULX48v4n8CIZGTDgvbOtt3OE0ye8TfKTqZJZCzegmTO2w+5+u8qQiEsltt4F7Rr8E9xtWRlqkUOUO/nl2RO+GszVdbQTjArB2yAr197lTORLhpDQSPmo8J5H6/5sHD2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VLhK4ban; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VLhK4ban"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488afb0427eso13301185e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 11:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499749; x=1776104549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FH31e8AWCzEljZIdx40WqHOE1eMjOl08QVJ0UOLH5y0=;
        b=VLhK4ban5SB0EjBzuTaxNxWTq/Cf0Uc1Cmz0G/tyjHjjEKLz1z8XdZulv9VPDf27TE
         GCZSR8H7iTvJdNtkTr78xhtEWtqBQmPDqXc6rQHtuHX28i+X8JesW+/68n3AZy4SZOTL
         btKJoUc/QASudN5r6dY/Hz49gUuKnF3tSr5A5k1F7KdRAr7AViWWZizHsTOa/0jCLpdC
         TXON7hF/zc+OxpE3QVjWZGxvQrnTAOzquwFabrRikVb+MH+LD/tcHFVBMtOvzuTp5rME
         +h12nXGJnSkTl3KYxVTeC/MO4FFDj5s9WYu9oTzo+GyQ6/U97kxsC//+B10quuAl+2Mh
         JUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499749; x=1776104549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FH31e8AWCzEljZIdx40WqHOE1eMjOl08QVJ0UOLH5y0=;
        b=OaZTY0Xg2D66H0Dy8FX2FT6S4KAmesuGZRfrj3GVPMu8n4GWl5W5rfbXlc4WBW+B4X
         kFwtIQca5GP7UCyEL248qFPNDya/kjic/xbyELFIuaR5E9V3kknw5Mo9aIoXznrabqjx
         uUKheeN9fXndGazuSabrhKC83bdvtYBDe+mVX4zCMkJiyzmLVOmXVkrRFMnzvJApBLX8
         CXGXkeWly2tOgkLhqL/YCKNnp2spa+j5m49RuxU02ad8a+UAk2stKcQU54FMNOuZEj5l
         XnWBhoAmrkGWXhKtbaGah+tXOfJhBGRXgMknqHHtaCwzvBkmb+X7O48MXQKIqJaFXd8v
         v6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWStpevXiXE+oqgRyGWLxpJhpN1uuEquCj9VUoj0AQkHlu7/vMIUKUTVCskYelociC6LvHe68O++33FwFVjzUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YypoCJL9pv6hK3v75YXvtrQ/mdh0A+InA40ehQn9TVhQYzrnrUD
	zIpREDjDeN7xLMGN0ZgHdNg1Sj42ZIAt+kZVyGK82cuPTmiTLeoV83+pKXUTEnsOvpY=
X-Gm-Gg: AeBDietfPEbSdc9fNcHaSKweEIiDMeXm9IfATcA+QEowlLd9AjrS8HSvuOA75RyH9H1
	p1vb9y2B4UjeFyy/x4P+gX2pPye9EjDfll7FTSVPlymv7FBiOyYYfrDCtoj5DCiHgcGQcrkLdEP
	04xJno6lnpJASODzn6I4/Kz3WKOsW1e9ni6bhHP7fle4/jBg2Am4m25mVg1IH2RFSpdahwQ0c4c
	uHEojzKgLgjqFex9OJMEkMZyOvY9PSAfSIyfiDZkGFaXwc6OGxPSH9DxSbFFDhwaMZAPOnI3IgT
	5z1aF2ILLiCHFYOvxSFcqnzniL/tPXlB4jZLPmHBEahAHLfiWHuHkAR/pXedkdRxbTS4Un7AzRc
	kihqVWICOqPz2oxaKRouovb6O8zyOk2Bd8L2Um8UZNLc3cTfbwDGJMv0V6JOf+Ku81Ww8WLpDbv
	qPHNnzMEXdBHZGn4wD+nxJ2vY=
X-Received: by 2002:a05:600d:a:b0:486:fc3b:3e61 with SMTP id 5b1f17b1804b1-488997d1788mr158558915e9.18.1775499749438;
        Mon, 06 Apr 2026 11:22:29 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9bc41sm16853202e0c.11.2026.04.06.11.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:28 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:15 -0300
Subject: [PATCH v4 03/10] selftests/bpf: Avoid rebuilds when running
 emit_tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-3-9914f50efdf7@suse.com>
References: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=1031;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=aUpES7Gc9kEPXxJ8Aaeynu09heHY8n8dzJ+eSENcNh4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHxdcziFu6PN48z0Fxo285Wtd1vV/o9yNXb1hgsHpGglvB7hPLWkf6rVvug1UFkNyMTLJB1G2lH
 gBI9xF+/Nrgo=
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

