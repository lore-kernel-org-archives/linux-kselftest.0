Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811386;
	b=oJDrf7AwJFigWKHae+ZMA0GJ+4MnkYoR2dKSVNoZWVFEDDhOzeTUw6cKJGuUFk13DRoh
	 RS56tzxdY6cXqHKPodY92P9WdbAB20lAbcePHo5aXu2XM7HPmVSWGEcSTdFIB+RVm+3w7
	 lzPhEapNEuYQ6Xr4q29pWnwlrFbIoaHq50nhOVv4tWj23hWpnzNViLlrKbD1SCUF37SnM
	 zqDjU5ObpEuHindkA5+My2K4zeF5pq7S/tusfPHkQqA9a41kqnPN1USVlxYNrmn6OQP18
	 MLhOTGAmeh70Bg1OaJ2z0XlYIKKpex3/vGXaVArfig9c8WgQKHFPSXtZhbAuTdWD1xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UXmgooCun45H9nlbuiuwQFHR9S540n6oe4h3LrE1mlU=;
	b=DlJu+y+0toFirRUDf1JuGq7zW+VUZwYLcAHAKZl28k+Nh3fyi8PTpNY0ymU+dY9x7nX8
	 3TxLcUrctw4TgNuIjYlXo7m7QC01xSoWZTqe277WguFZJ1pRPlqC85WDs/JYmlD8SXDdz
	 tEE6TFxlsSkUCeUxVqDJZ69v1yKd4Uw4oJgjKqIa4a0m10/ksk/DfsnL+dtyUS+0Gl+tO
	 nT+aMz98gmL3Jc8QE6UAwmFcvcKcVzY6vBXq3Dxxjv5nTE84gc17nFeV5YuroKWGBlLCI
	 idDFVF445oiQw2CRIoCK3h5bpfEN6h2o22jGt85jjLwVEXOmS7vLIBAVs2BifANlyOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ds9ImoNF;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07284606A337
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07284606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ds9ImoNF
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so1761919eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811385; x=1794416185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UXmgooCun45H9nlbuiuwQFHR9S540n6oe4h3LrE1mlU=;
        b=Ds9ImoNFnqIw6Qw1Xrge8SkX9ej0FZa29MRVRM8wFsA0dQhuXWwqhtoYP7h4kad5e+
         CujAQIMvVoW8e/ktVA4RJkhE4uKZXGsISnstiGMOLDEmO9nifwT/0JQRpt004gFRJZka
         aEN6hIa6lRyLDyjswYqiyD8FDsS/G+5MA7geCMPJHINQ1V8ZqZdDIveb0rMC984y8KI3
         eR95uJTOaQOkLl/fbaGQHrdaL5TBwFQZNwuQsEHOhhRuT4aizhsDX+zooDipclNZN4so
         bW+qgoLjH1gb/KVmb6CxV62RY4uS8XAiAEaBZKn2+qXwuceGSXYh9D9dKoNtagpVAIhu
         D+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811385; x=1794416185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UXmgooCun45H9nlbuiuwQFHR9S540n6oe4h3LrE1mlU=;
        b=f97dcPxtZOllnHlIPTvhAsJc3yvruj8N+T6EVbg9XwdXXfag3qcSdkI2E1rrOgoTXj
         Ys7QySBY6DI6ZI3CiQFElLVjE0+XuexJ4stUx1F3+XsX4jY1CCQ/6UnlBoFcmVpzy5IU
         6ZFY8/dZihy7fY8RALM/3xafXLi+jHwmHmQzfucSdamTklTmSrNK7cZgXExrSbq2EmEV
         w282doSILvW6ECA+xuUjZpNCKfC/SstOCdvS5rTXAYTEP/B+QEmEtNWosPb4IVr40j41
         d5tqSTZug7qoVKxHTvn4U3OdVgtJSMETNYOBXzBncW2XL1kxNeCK1/rY/oY9vQoz09xl
         dzXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvajX4Z+Tt+7L6bc5qtRDYxhPOWeqqsinrOaXh4YYiOuZ9UY2XEcUniHbBXWlRzaeTF95riTq2wcmPXk6p4Yo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kcy+PJnumoMzRyKx2YHjgS1isq1oxPeGTJXHVCtVOHS4lghtm
	oMj3ka3yGi/5czIIHSaxeix9LVFRXelTU4CtMu+QwJBgCh/+HoUtGjCI
X-Gm-Gg: AYBFou3BAddbCJ1/cDGyTcgnF8dujw5enkqNxGx58wSS+rL+wIiAohUvTIwVP8d1uaq
	0RSvyG3qwtXAdvas17zGH48iZb8UOqDCeXdGf7OlcEkkmuIIL/Upmkb2WYN5UH2bMrS9dhjkpMM
	jbf7Hss+T2/1x7NU44WYGlhn1HJWtc11u0AMc1ZbuCf5m1ioTsBiSl4H6vxM4YX6GB7omUSErwo
	KE/w52PIZaBVrI4WHt9vmxHFjSVIToflvO/WdwEqvJdiQQemYvluyexlHryUgvEd37IuWZ8ZA7T
	9zyTaW15kkLkDKHw7r26PsqhaZGOh1wKb0pcwT3OZOIshELUOHtUqtg55kVmQsuhsT1GVi7JlyR
	gSSkqIeRlnCZ4sFyuKaYsS1lvi+Jv64q5EoLmoQ3YCJ/ksylpPIWco4FUyEjEA0G+P4ThJBQDfs
	mmuoB7JpVNUgjkCi6Tx6UaR/7IH0E2I+KyG3ztZe51jznsH1AA0PO57KHdijTJoaxWe0v0GskFL
	GL4dfoTzk08dQ0LFKM5mtUv2/n+OeaCPWHNHRtB+zSJG+LEJbgNmGdVLd2k0TqiQFz+ri6e/NtV
	34LAMo7t/RlZhFE67o/y6ALl1txNuCq1a/ro6Hw=
X-Received: by 2002:a05:7301:3d06:b0:358:eccb:af7c with SMTP id 5a478bee46e88-36a42404840mr36237962eec.33.1793811384606;
        Wed, 04 Nov 2026 08:56:24 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:24 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 07/28] hazptr: Fix kernel-doc of hazptr_release()
Date: Thu,  5 Nov 2026 00:54:25 +0800
Message-ID: <20261104165504.2430480-8-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second parameter of hazptr_release() is named @addr, not
@addr_p.  It is the address passed to the matching
hazptr_acquire().

Fixes: 17969a0e7f7e ("hazptr: Upgrade kernel-doc headers")
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/hazptr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 299ad8a07156..0fb48518525b 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -315,7 +315,7 @@ static inline void hazptr_release_debug(struct hazptr_ctx *ctx, void *addr) { }
  * hazptr_release - Release the specified hazard pointer
  *
  * @ctx: The hazard-pointer context that was passed to hazptr_acquire().
- * @addr_p: The pointer that is to be hazard-pointer unprotected.
+ * @addr: The address passed to the matching hazptr_acquire().
  *
  * Release the protected hazard pointer recorded in @ctx.
  *
-- 
2.43.0

