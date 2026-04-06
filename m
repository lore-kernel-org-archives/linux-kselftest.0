Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF6138CFFA
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 18:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499778; cv=none; b=D3rAouBhk4vPa0M/HTNcABSGSYP1iQLRL5q9vQwSwzR+59ZPJ/+Wi7DbzrsoEGKHXAolhRG0i5BBHbcoGZhM5TlriNypdl2NgoCaDcRLzRQHGBGF+97mwbBkhLI2MHZIrd2haLIKeze+VVzYheRZOh11oHrqaLjbC5gBryFqg7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499778; c=relaxed/simple;
	bh=oPNoWp44Ch8dIaWH8jcjnz5vhr49jgxtCJBbGnfyb/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IroAO4sn4jTqlnzdZOIfnmRnFjSp5lxbyT+D76drtpcBN3Dh4Ub6/Pvl7zsqxdcKdGFllGOLemR/oCLV6wYkNJxEjst+Z9FGtptYHa6hVhokbOsI6LpCA/rneHd4s+ij6SGMPoMqsok1SFA7BlDG5mkhjltY8FklBJmdPHchYQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WJkIScop; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WJkIScop"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so23800545e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 11:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499775; x=1776104575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lG9XFANpBIri4ZwFlF+9G0jzztKra84hF5dQuOesbq8=;
        b=WJkIScopo1LPAPd2jPZsoBs6xJ+U163ffmOhmbABTfTNNAg4iCHVR/O3kANFG6aBud
         FCzwItlgu6nvaw+kgS5E82cHYJ+Ov7JYx1DRfJLw2vtjmIWApwqrQfLyx07np1jRzyEc
         YQkqvIqeyQtpMikcLcm49Xg5tNjUUm2Z9r86thfwou4zGRCv3gDGrDAHHoDyt42z99uw
         YwZ8QvlIi26fLVk6HH/l3X+anrDDZHWL4pzDOtga1qRJ/fcVWCu9nKCVr3oThfNf7WR+
         zclHU8znAwaQ453AIq8QNJxBe37lBhj9k/6/JGm1BOriZXznbp+rx1YCiIN7Ne35+AfP
         CghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499775; x=1776104575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lG9XFANpBIri4ZwFlF+9G0jzztKra84hF5dQuOesbq8=;
        b=VQTmBrJ+KQ+XexXIOpGtD+IRPhsM3Ji6D5Ou6Z/Ioe1nvuaY8XuiBSTXzOuhDiCcll
         ayvrbCisIyonOM/HUgFwzluwdEqUkj0xeYqk1C7klhtfWIWyJNvd/HcO/5afsjjtiMIG
         3C9HiFt/zw1VuTu5Bgn76RrlswNyX0ZsvQg4OjWRqCRTSevtdPPsr5BIstQ+ISELnas/
         Jv2n+mE/N2pG3lc6WE+VprkDl7rvmbwCxAXq+rMiasOt1+kABc5SBdTAIXoGbFF3KIQq
         oqWj9s8/BeK4scZkxs+izHX23fOcBhqce0greAhHZs+xhZ3cT7TycUAdz0h6tCy+H/lr
         9X+A==
X-Forwarded-Encrypted: i=1; AJvYcCXOKp+azOXd5JENAIYtx/VE4v0erhGVuJFnK80kmdged5UuujfAKHHSwlvyI2mnkey05nL1QQyYwCTPYHs9foQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMwQW6F06vLa7uxpslepXmbmm+MQNoVXZJb5eUX+9u5157dFrd
	uKq7GqfptRwhMU7S3JREcnCgZRYTh1FPr4sPwUt5MBsMfRAbkGNFbJCx7S8kR0gcpVM=
X-Gm-Gg: AeBDievFJ+sx3Hi0/OIvZMU2d5pCA8eqwNPVawBNH7drDXJMfgqGZyPeTXWfm6PhjBO
	lL/9aP8uiIIO7fYQRbZdFQoDHa+iiKVnnAmaLUAwWK7QWhfLOlE5nKg7sbPbBDb7NtSvRZRPuE+
	qlRPrIyP80GgiOQHtkNX9mA0kR5cR2VapNfRmPOvXf3bdNbDjjqajY1eD7Q1n3DJG+mWaD1wO1T
	qDjvKqULxEqtVla8Iseu4f614MOE8u6eF53bZOGkTvVYVrTY8SZr4CyLORllEcJn4kL1mIWq201
	KqdrQ3P3YQOsRniAp+rTyopKn/ZEYt3pJ9v/qXMxwxoVFQpIRVWMwlOHy57zqGxfbJs7HbwO1o2
	QN30J6N8Vgp4dtqqPLC74FJ9DJL0En0D13rn+Cf4GTL0W+UPH8nU6MNns1BBU+1YBIezsGcbnj3
	AKWcq6Fuf+j/+N
X-Received: by 2002:a05:600c:8b03:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-488997d3188mr196188305e9.23.1775499774791;
        Mon, 06 Apr 2026 11:22:54 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9b75dsm17165582e0c.12.2026.04.06.11.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:52 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:22 -0300
Subject: [PATCH v4 10/10] selftests/bpf: Tolerate missing files during
 install
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-10-9914f50efdf7@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=1301;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=oPNoWp44Ch8dIaWH8jcjnz5vhr49jgxtCJBbGnfyb/o=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO32X2js1+9VB98RLm846QzI9EOnFxUKUrv90O3Dev0b04fK8r/TKh5q6VGB9RgJWYffoVNlFQP
 fnluA++pJhgw=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

With partial builds, some TEST_GEN_FILES entries can be absent at install
time. rsync treats missing source arguments as fatal and aborts kselftest
installation.

Override INSTALL_SINGLE_RULE in selftests/bpf to use --ignore-missing-args,
while keeping the existing bpf-specific INSTALL_RULE extension logic.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 2b0747604d5f..e1c100f1ef36 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -953,6 +953,13 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
 # Delete partially updated (corrupted) files on error
 .DELETE_ON_ERROR:
 
+# Some generated files might be absent when only a subset of BPF objects
+# could be built. Tell rsync to ignore missing source arguments.
+override define INSTALL_SINGLE_RULE
+	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH))
+	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links --ignore-missing-args $(INSTALL_LIST) $(INSTALL_PATH)/)
+endef
+
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)

-- 
2.53.0

