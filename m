Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB1042E413
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424412; cv=none; b=KYM/ES+6VAA1mhuAd4mYz+2KxAox12yXiE/aHLTXYzXC6bwyCDAWD/oUyaKmBvbmfbxqgcy4i3MjiWt/avfesB44TJw+WH9MuhWkvMXJ/t//9n/rDKSS9Ac/XEO1xKHP9TjqGW6LOH16QT+UzCMQcA0LdlKJgN5TRSqI9LajqxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424412; c=relaxed/simple;
	bh=D6LEF5qrYz6DbFwcjMxDSZY/iZagbFXt2muTMD4vUes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNQYNrSOH8s16jFduPQ+lkHU40APEAzQHiUM/qlBL2lxxZ3CS2RhZaiSxm2SG7zTbezjlrM4b8n4/5AVnL+ylYjESIZMR9gnExRmH6R4qxy824WRzWLePvz5Hyz2RE4oceRYlxBAtjKNrQZ7jpKf5jJ60ozA6jmjf0xi5/wzpZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5t8ubOs; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5t8ubOs"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-395cf2535acso845073a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424410; x=1789029210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OociqrsBmV/E6a5jpk0qDALr4bKhrSE+A8mgKI0tJ1g=;
        b=M5t8ubOsX6jeEy4gU7oPAUeJVi7f+V9euo3pYU7IgkCvU7XTCjpajBwqPZ2Jn3/p5/
         7Fvr3lMNi1sR+VRMwI9vwKYtCsmXQOgcBrpjdB2cxRRd20Yo2fkMsyqCzRkAy8nvw0Pd
         SdDnNaZEiK/udGXTBvlmqzx1AjSI5WkFnjAPA3A9RkW0/MMb0srbLnV3oSmqeq7N6gbg
         3yj8vZ+RkjOR8UUlEjc23eWAO00IiS1WJbPiYnULvFB/Onjm9H3Uur9ksXqku1sRq4ix
         vQoAxmy9qQvxbMbAb7kjHJ1nWCzLuqNLyx+GHT/z/TyvBcryFaNByA0HAFzUjKKHVXHF
         EoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424410; x=1789029210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OociqrsBmV/E6a5jpk0qDALr4bKhrSE+A8mgKI0tJ1g=;
        b=AFFOSYcSNGUlm1gaHgg/Qgpnme1PfUoLoiXg8KGKr6TOnx4uhS5XWuAsyceLDWuYzr
         oIzLUed/RetUMxpYul4ez35s+dCi0nKmLz+TDfHmVX0QqEMWQQIRl7DO+uTep+uMFLr5
         7teaVFx9EUcHQNfvVTWroa1zo+8AaPMXSTuTR9wyWBy0NlXHelOVKOO7007PAjd8s7Bv
         FX/1NId+rfhX6ID7u4o3P29vCtUrkawBlmh6eAK5u27TbIWsCrzqxexLZ8B/2nR1OjyJ
         CxjLYm360gNTEHvrVqoKzzJB1VjXmMZLXFsEpu9yZWpmPCJVGmHn8awUm7puuw0Ru/QA
         2prA==
X-Forwarded-Encrypted: i=1; AKwUvBww73MobWylw847p6zkgSGHjMLx+RDmbyMQQbDgsIvqAI+lE/tFtQUD2AriFlh9OABQOhfSb4mhgZiKbHpVYko=@vger.kernel.org
X-Gm-Message-State: AFuF++mvptlXFvbzXV+dVWdRu8BBvgeg4S/OIZaHZv5m9S/MpxENvcNU
	1u+hp1mRyTD52SWHWaz43C2eUimWNNgjYePMLSFOwTdGSax3gIHbWD1VvvRp3w==
X-Gm-Gg: AYBFou2jEIAQz4PhIfwVnu5jF6Yj/Ce0eDE5LF4GdP9fICA/VtH2S5O4zBDd9ENuM6T
	jtirg1AtH/TsSm8GUBfqMKHk0fHDBpEOLxDk0zWHaau3etPvdW9hTT8nJS157lyyn6hQRiJ3rYY
	pV2HFabgYDYzTP+yDe4eEQERrWWLSrx1zdyKIf4gl975bxQ1U63mkU/yalzVUSmwm24joQP61Vn
	1ararI8U39uinCNKnzhGuK/HNm1cZvTrwB0Jnyk60sYJHenVAr4+v4SPfDxld3dz15M0+NXxpu7
	RdSlLp/z/m2lG3/HgdB4E1T+v4Pgd9QgB9PRdGnr0bykFcaDTbMBGfzrx0GMQWxReS4ve7mz/pw
	ed+CrT9uOcPM18L6qwM1GbJKaApRpHdgZnBsxpAF1TGjldGlw0Lrob9pr5aNID7o2I7XHxhBBJR
	tgBz6ft95tfTmprv6RUhHrtHzmXuj6jQdwaxBYEu9u1eAxWiPuO7srTFzcikJLZSZIqWrQHDqB
X-Received: by 2002:a17:90b:3cc3:b0:398:9bd3:d6d4 with SMTP id 98e67ed59e1d1-39b132d819emr1843780a91.14.1788424410133;
        Thu, 03 Sep 2026 01:33:30 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm4001175a91.1.2026.09.03.01.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:33:29 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	stable@vger.kernel.org,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH 1/4] mm/damon/tests/core-kunit: test committing psi goal to psi goal
Date: Thu,  3 Sep 2026 16:33:18 +0800
Message-ID: <20260903083319.451754-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902002725.108635-2-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 17:27:20 -0700 SJ Park <sj@kernel.org> wrote:

> damon_test_commit_quota_goal_for() is set to test committing a new psi
> goal on an existing psi goal.  However, damon_test_commit_quota_goal()
> is mistakenly not covering the test case.  Add the test case.
> 
> Fixes: 99f89debafc5 ("mm/damon/tests/core-kunit: add damos_commit_quota_goal() test")
> Cc: <stable@vger.kernel.org> # 6.19.x
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/tests/core-kunit.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> index 7071ec277b007..f1e11548c771b 100644
> --- a/mm/damon/tests/core-kunit.h
> +++ b/mm/damon/tests/core-kunit.h
> @@ -793,6 +793,13 @@ static void damos_test_commit_quota_goal(struct kunit *test)
>  		.last_psi_total = 456,
>  	};
>  
> +	damos_test_commit_quota_goal_for(test, &dst,
> +			&(struct damos_quota_goal) {
> +			.metric = DAMOS_QUOTA_SOME_MEM_PSI_US,
> +			.target_value = 234,
> +			.current_value = 345,
> +			.last_psi_total = 567,
> +			});
>  	damos_test_commit_quota_goal_for(test, &dst,
>  			&(struct damos_quota_goal){
>  			.metric = DAMOS_QUOTA_USER_INPUT,
> -- 
> 2.47.3
> 

Thanks SJ. The added case correctly exercises the PSI -> PSI commit 
path before the existing tests change the destination metric.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu


Sent using hkml (https://github.com/sjp38/hackermail)
