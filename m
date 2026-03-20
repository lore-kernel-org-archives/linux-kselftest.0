Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307B33EAC7C
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 18:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031384; cv=none; b=nz2AhZ60bBbHttGm4gh7Fxztz0+ZfqC+YgNkHXoled3BZLLpiSzVGROxbN9v0+q2p75fiwDevzvOU2JRNhVoMM0+t1qR7FAj5AYLk63JS1T/Y5fr7XvPh35lxKEksQnNGHJmVy868Ie28f/VvXD/FfWXUYlPcO+okVjbUyffwSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031384; c=relaxed/simple;
	bh=cpG8FMOz2DdVE7NDetULkNb5Rgu46fSihd8mpdjDxpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZ3MUcbIiZ/cOnoubrGDOeFI/bpMSifnSePAUaFXYIzWYWBOEMYwSQ20QlrKqP5oJ9J9M65gf1AHKC88Y8xBC+rockzsbq2sb+s9Nw6yzGj47oqkNkrWeLZ8WF672+YEivJOSpfM9C6+AsQxCXX/aCCQLFVgAgLaDZP3095+AIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KaJFJzPa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KaJFJzPa"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486ff201041so7748375e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 11:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031381; x=1774636181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rA24wnZPGTtYWW5mEcxJWsdXnmz/t11mmo2UtnUImAQ=;
        b=KaJFJzPaLAJf2Wiree5mJFAjBqvzziaRSFucfJvuh77uDAPsvHtGqicBcLKDpIs9N4
         1eKNU48cpHjsrlM2JXCZwV7pAzgnnwF9Z8dFRhmnDc6fokZYtNfYVlgTtBqzqwlLhADI
         g45m3gj9zHcpUrJaX8GuBrcaNPCBpTJ8P5u3MkWbo+Ts9VRrD2QM5VLtHS51GYvn9cQ+
         r3rtWRzfHpUpViGs1wQDfrLK9yXEFolPL1tCejw6lgF0uzXS0ENSMv3WS9+ZZNXVDoe/
         1mY1KQuMfZJnVQzVuMBMViLfxNgeVhTdoHCE0yNjovL+YiTxZ0iD0uRdZOVZaoEKZqTD
         KKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031381; x=1774636181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rA24wnZPGTtYWW5mEcxJWsdXnmz/t11mmo2UtnUImAQ=;
        b=quSpBzqizUpa6w3mYM5DqpI0tFOz+3JwkMsEW6UimEBvIKSUXM1qTX4BWD4ZojLJ0G
         RqW7c2Ub5aD1IGzOmqE/icFWP3OU+wAWHoYw+YLWop31p2tPlzpX04WI0kdRjEXDm/xk
         SAe9V0wqBdmCr0nBEfGJ1mPEogDA7VojPlP8V3PTc5bgJ0UQAOU/iUrdWvjLvs6esfqY
         Kyyxkq88bx7jC5DfPKUhKHpNiN92FZwwdM6qa7Kn05Ogxo1mLknRthD4JYKb8HB6LBt0
         KvVq8d6VHXqaJkvgPGGwFUSxoqH2AQOgiT812biQgz59Dv+ICtbKXe+6hhcq9/gs8fr0
         SfiQ==
X-Gm-Message-State: AOJu0YzC99MJUofi48zR1C6aMfw/9VD5IvGS85/h4/AyCSBNUIfBRESL
	cijpre54ofz/NH/iEcALN3T1x9gI66ZsdlBb4/xEIxsyiD0VE+v3R7+9Q7EHzI9UpEsubWArXUq
	5rwk6
X-Gm-Gg: ATEYQzz3vrQnpEUsSoe7NuvslDVVWS+kZJB2WFHw/8162bDUJ3SwCflSLdXrKZ/MZHb
	O23nHycUca9YvNzIl/SEehJ6TjBgUG6v8/rWPsMH0UohyC0n9H9JbfN0HmOhSc50WJDXNkSPB2a
	l/X4XEHAd+gbIFH5Ax1K9r8meICBJLATE3D5wZ+KhOoMYnUyreGjwSNMIukgaU0O7hcvhH9kJq/
	mmkapPiPqh6UBc7EWpzRoN6/BxCGy7Ec0Uy7Bm/4Kp8SsRvewg2zeMwaMARcxZj4Wzs51f1M8Sg
	aGpI80AgYvSBz/Cm4DcvfYq7BKBk3H0MbK6VvLNlJvAL/q0ABqehfbH5nNQ+CI0782e8VjQE95i
	7AFDovF93o7NN+vUpfTd/Ypa72YOR/pHXhQQGgPFlKI/t/uV4+Q+bG2S71wPQL53punxl6pt7uK
	k8/c3OzPBarA==
X-Received: by 2002:a05:600c:8710:b0:485:49c5:8eb7 with SMTP id 5b1f17b1804b1-486fee049b8mr57609475e9.22.1774031381174;
        Fri, 20 Mar 2026 11:29:41 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9054bee1sm19590707b3.32.2026.03.20.11.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:40 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 20 Mar 2026 15:29:20 -0300
Subject: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031363; l=1910;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=cpG8FMOz2DdVE7NDetULkNb5Rgu46fSihd8mpdjDxpY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDMVmx6RaJvh6ZDL3DpDxYeaGitgTI1K4JwSL8awdClLmxe0/DS5gSxplARYMTz0tTK8EUb7pLb
 TUpDgbMGFWAc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Track failures explicitly in the top-level selftests all/install loops.

The current code multiplies `ret` by each sub-make exit status. For
example, with `TARGETS=net`, the implicit `net/lib` dependency runs after
`net`, so a failed `net` build can be followed by a successful `net/lib`
build and reset the final result to success.

Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky, so
the top-level make returns failure when any selected selftest target
fails.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 450f13ba4cca..0949f370ad78 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -209,14 +209,14 @@ export KHDR_INCLUDES
 .DEFAULT_GOAL := all
 
 all:
-	@ret=1;							\
+	@ret=0;							\
 	for TARGET in $(TARGETS) $(INSTALL_DEP_TARGETS); do	\
 		BUILD_TARGET=$$BUILD/$$TARGET;			\
 		mkdir $$BUILD_TARGET  -p;			\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET	\
 				O=$(abs_objtree)		\
 				$(if $(FORCE_TARGETS),|| exit);	\
-		ret=$$((ret * $$?));				\
+		[ $$? -eq 0 ] || ret=1;			\
 	done; exit $$ret;
 
 run_tests: all
@@ -274,7 +274,7 @@ ifdef INSTALL_PATH
 	install -m 744 kselftest/ksft.py $(INSTALL_PATH)/kselftest/
 	install -m 744 run_kselftest.sh $(INSTALL_PATH)/
 	rm -f $(TEST_LIST)
-	@ret=1;	\
+	@ret=0;	\
 	for TARGET in $(TARGETS) $(INSTALL_DEP_TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install \
@@ -283,7 +283,7 @@ ifdef INSTALL_PATH
 				OBJ_PATH=$(INSTALL_PATH) \
 				O=$(abs_objtree)		\
 				$(if $(FORCE_TARGETS),|| exit);	\
-		ret=$$((ret * $$?));		\
+		[ $$? -eq 0 ] || ret=1;		\
 	done; exit $$ret;
 
 

-- 
2.53.0

