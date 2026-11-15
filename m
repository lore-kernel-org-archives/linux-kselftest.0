Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794761106;
	b=nQ0EqXbernqKrhFH73ybhOMmCKudV1BzTRQZsLYDw/ycwLenKf17wYfq8MoslGJ/SttQ
	 KgTPr0MJOWRzGc+3y+KrqLgW8XgFqpK62COFOc2FpPyw/x46jMDYDvh+VgV7dIlEW6tJ/
	 NsgnE995oFWxuyrpZpl7Rk9bAgXxiFneFdCMatqVs/+70XbklCfNeEDwIJh41B7jOIbfX
	 zLM+1ON+4b38kT1Zqq3uu7MfMdQoVVtUGDDNbGdLhRQoSy/ifzClS2bx4RPo9fpi1/gfw
	 TyKKwrRSy5+LSDK1r+FCtZHx29EmQzjz253yGkFcM5J+Y8nztnv8t2EdVVsQv0o9piQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794761106;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=h2dUULBE1fPGIekm815tBT/QYZpp/zRW5skbIJlMXnw=;
	b=NBUKreyuDjJfwRHfyB5I/EMVr6E/2kei2OfZf0PTAonFppiLNhcDtbYcgnuD/47k6g/a
	 xpyuG/Tuf37hXI52cb+qEqlvKadESn3qCKKb6FEe1GXvwRl7FaHaIMFbXd5RAuT+/0y3g
	 hGjaxX5zMJVsRlxpjYcNe/f01jvDArekVlJdGPsUA7mOYMZNMShj8iMkqYsBZ82GRAc0V
	 BO+w7sumTt92pNcEIm8zAO5eVrdZKPsrtbMgdIsLsJfmyyYO1vXQVCE4XACkvbBuo+gDd
	 u17X/PVsSB5CfBtk3i+rpIEaYIi7+jWqb87VuBzUIw+aP7zyssHm9dokiwJI44XoTlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=Rg+JF0Sp;
	arc=none smtp.remote-ip=195.121.94.185
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B9F606A31F
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 16:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B9F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=Rg+JF0Sp
X-KPN-MessageId: e486e84f-e113-11f1-ba8e-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id e486e84f-e113-11f1-ba8e-005056999439;
	Sun, 15 Nov 2026 17:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:message-id:content-type:mime-version:subject:date:from;
	bh=h2dUULBE1fPGIekm815tBT/QYZpp/zRW5skbIJlMXnw=;
	b=Rg+JF0Spd1onVYeE7iMkR5M+JR5jtt4bRE9BsFXXKi4GTW5v3bCSN193XJZ/X7iN2/T9hoLoY6Hyq
	 Spexo3lPPalUI1wvNaEc6KxxwZN7E/Kz6QD526WACpxbR7Y/QrmyLbLftwy4Tpi0zXVkX09miVMYRF
	 7MFTy/SQnOLKKnRh7XGA+A7dbwVc0Itc5AM9uZwBSY99UPEavQju3CG4CmJg0UJFVmO1Sm64QzGKgI
	 QeFlZZ/PRUErTF5y4aZsCUo4xiECRisJ44EATJcL4G2iWadqXXnksERjisPm6oVoN4t5d5T5Pb89zY
	 62CS8VYwRCb6GedUDD0LMluH8t1n6QA==
X-KPN-MID: 33|Zchs13G1FNViE6xx8diQCs1AxB0hlx+VudxQKLkze6qLPmykgfj0KUinO5g9KBC
 Ap7dGeTW56WO7pNxaRa9D1bT8mUA5Fl+1ER3z/tmjtvg=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|mNRwOOt81JwsHy18bHVSWwY4TKhzhhFc4B16lvpE8/ER8eur5fpTdMxX0PiMYBw
 lDJnA/YexFUra9p12gPgBMw==
Received: from [10.56.187.180] (unknown [83.172.175.28])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id e45f3b6e-e113-11f1-9bd1-00505699d6e5;
	Sun, 15 Nov 2026 17:44:57 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Date: Sun, 15 Nov 2026 11:44:48 -0500
Subject: [PATCH 3/3] selftests: allow wildcards in TARGETS and SKIP_TARGETS
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-ksft-targets-wildcard-v1-3-7512a50d0976@xs4all.nl>
References: <20261115-ksft-targets-wildcard-v1-0-7512a50d0976@xs4all.nl>
In-Reply-To: <20261115-ksft-targets-wildcard-v1-0-7512a50d0976@xs4all.nl>
To: Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
X-Mailer: b4 0.14.3

Many selftests are split over a top-level target and several targets in
its subdirectories, e.g. filesystems and filesystems/binderfs,
filesystems/epoll, etc. Running all of them requires listing every
subdirectory in TARGETS by hand, and keeping that list up to date as
new targets are added.

Allow entries in TARGETS to contain a '*' wildcard, which is matched
against TARGETS_LIST. The wildcard may also match '/'.

Allow the same in SKIP_TARGETS, e.g. SKIP_TARGETS="drivers/*".

Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
 Documentation/dev-tools/kselftest.rst | 11 +++++++++++
 tools/testing/selftests/Makefile      | 17 +++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 44da142a67b8..3413f59f5c3a 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -118,6 +118,17 @@ dedicated skiplist::
 
   $  make TARGETS="breakpoints size timers" SKIP_TARGETS=size kselftest
 
+Entries in TARGETS and SKIP_TARGETS may contain a '*' wildcard, which is
+matched against TARGETS_LIST and may also match '/'. To run all the
+filesystems tests, including those in subdirectories::
+
+  $  make TARGETS="filesystems*" kselftest
+
+To run only the tests in subdirectories of filesystems, but not the
+top-level filesystems tests::
+
+  $  make TARGETS="filesystems/*" kselftest
+
 See TARGETS_LIST in the top-level tools/testing/selftests/Makefile for
 the list of all possible targets.
 
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 4c223bcd2449..f2b779f7afba 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -156,7 +156,20 @@ TARGETS_LIST += zram
 # "make quicktest=1 kselftest" from top level Makefile
 
 # Build and run all targets unless the user asks for specific ones.
-TARGETS ?= $(TARGETS_LIST)
+ifeq ($(strip $(TARGETS)),)
+TARGETS := $(TARGETS_LIST)
+endif
+
+# Expand '*' wildcards in TARGETS, e.g. TARGETS="filesystems/*", against
+# TARGETS_LIST.
+ifneq ($(findstring *,$(TARGETS)),)
+	TMP := $(foreach t,$(TARGETS),\
+		$(if $(findstring *,$(t)),\
+			$(or $(filter $(subst *,%,$(t)),$(TARGETS_LIST)),\
+			     $(error No TARGETS match '$(t)')),\
+			$(t)))
+	override TARGETS := $(TMP)
+endif
 
 TARGETS_HOTPLUG = cpu-hotplug
 TARGETS_HOTPLUG += memory-hotplug
@@ -173,7 +186,7 @@ endif
 # which require more effort to install.
 SKIP_TARGETS ?= bpf sched_ext
 ifneq ($(SKIP_TARGETS),)
-	TMP := $(filter-out $(SKIP_TARGETS), $(TARGETS))
+	TMP := $(filter-out $(subst *,%,$(SKIP_TARGETS)), $(TARGETS))
 	override TARGETS := $(TMP)
 endif
 

-- 
2.56.0

