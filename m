Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D19D26ED46
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 03:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404681; cv=none; b=bWnd6kUrV1VhQkzaq1LDIGOSq1h/st808YHFrnk3P0/yjnDtT8w2tfxSK/VaESkfZpmBXetwIXq4I02Svt2TxSrf4ZNfCZqPe53auSBzPy+ZTNu6KcxeN3zo791JNcP7Zcy6hZ1fSV/4Rp7ub+st58Ssz53EH8GEkC9PCr/R9W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404681; c=relaxed/simple;
	bh=jZiWYHItaHZXLwaaS6GizSmKCrgqOiwgtX+q1aMZoz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSzZgl1nzAYbiFHo7RmR6HLKfnG+W3HBXmG+XK2jNUOkPEaW81WifouBQDRPew7FwLTEru2klaTejxj172I9H9w3j4qfWz/J28zVlM6MznSAjp59v+mECT64+V38c6gXl7A2w3QHXQkaVEhL11mHbUfzzz8ZsCQQcyq3TWXDcrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKpftsFp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKpftsFp"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caced6038eso6371665ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 20:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404680; x=1789009480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZ5VZbOzOAiIg21alHu3P1D5kKDO/4ea9+shULiGmrs=;
        b=hKpftsFpGZ7SIGCko8LqaAWKV/v2qY/j2EWFzVy0KBQ5a1Ur+YHcjFe4doHk0pRm6c
         GCOdNdRgAYWm93W+y0t2TMz/M3X7MiNYN8plL2Zw5m0Uvd5pWn7b7utP7uXNvbEE+Ps9
         WF3cw1vdaOrIReRdD5sIjI/DUE78HCATsMReoIuzfBvPbozs2HyEfkDTPGLeAvFaRST2
         r7oGCbBMmGsMsHMM6a67LAgh50xfRX3og7FXm3rN9iil7lE+RkoFNesgTblJ2TArEZNH
         VgaKL7mYMTd24IXqxSfJ6uwtu/lHrOS93NcYsGSs0BWbimuSHxKtceKLJLGSMcuxtjFK
         lE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404680; x=1789009480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZ5VZbOzOAiIg21alHu3P1D5kKDO/4ea9+shULiGmrs=;
        b=Drrx4zuex/gR9OSVJ1ZThfPo+Lm1P3GoWR0Q/KQRLgHDZ8AWoNfHsRwHq2kjcv0sAL
         iLeDfkDuDoeuBpW5P5wYAGHI/qRnJXg36CzPbEY6cNu85XwLMxKJwHAdaBb5A5vh6bZz
         bYIt0uzibc/svGrYFflN6w7UqpxiyVji4l4bzCnr0G7SwIgL9tt3KbeNcnExO8l4ETDf
         775uPk680fRWj+RMId3/ZTBZLXgMxY+Aa8VKJasEW4rfg7JF0EB1OUU4Yudkka1o2Q5x
         cwbnbqw7B21ypOu1GgIk7DBXgU+Wmamne06d5AUcefAhAApMalblZLpk0ZCp+6NJ9U27
         MCXg==
X-Forwarded-Encrypted: i=1; AKwUvBywei/XjpglQNeYqfrq7yjYtOt3+iliit3luf0B/RXVYeNG6SjHfbOeXgLhEgY8DBL80m2FJ9pVqYsGm0BJgQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++ngRMKULoYR1L4AdovIRTtlW6Dz+4dkWT/QEFUPcFoQp0Zm8PO+
	cmR3zUn2nWHDtd1jGwGG7knf6NyNOEP8HHp4aN6D3VygpwVnIfLRyDgj
X-Gm-Gg: AYBFou1xynd3OwRnTUBH6zXpNUP5ofg2hnGRLmYwaFvFw2xHxc3L3iB7fqhOXzUUw6Q
	JGTPO0CJwCIb6q47aS9J9pxcxsgL3s+zQZjGd5nOmutGaxctxytVrgVa8SqQ8FfwsGLxbe09aPQ
	iOETiEayJz1s1SpZGvMf8ZR68pBKtqrHFKe5Od55FwH4PoaMAFEuffi1X2pGav5KOvMzsc1Ha/J
	nWvidnVGL0Z4BCswhXEMqpDvmXqTye2soPEw+OjyhCepbfBwtuRwmH+40CytlzGuCBrb/z60fUY
	HMsRB05oElbcGG2EyGQrmybhEBDxxjzxh89wBWqkHa6EceLisizGUF56HQFfo7ZTeSVKzqCVNhq
	oPOWI2rX32xV96JeilGH38Kjrn8NW8I4DnLe4Amo7MkKPJKOpwmXnVldEi4siwSgE9gldPsDcda
	V9U3uB9GizaL103Ay5EpFblNMtayNrEUsAW7MXVDm/4NqxRXbmKDn/bRCSA2skYWW1JwKJNA==
X-Received: by 2002:a17:902:f545:b0:2d6:dcf3:b754 with SMTP id d9443c01a7336-2db020c9d24mr8716085ad.7.1788404679175;
        Wed, 02 Sep 2026 20:04:39 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafec286d7sm2793645ad.51.2026.09.02.20.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:04:37 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH 08/12] mm/damon/tests/core-kunit: test overlapping ranges for set_regions()
Date: Thu,  3 Sep 2026 11:04:27 +0800
Message-ID: <20260903030429.309611-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902054747.99370-9-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 22:47:41 -0700 SJ Park <sj@kernel.org> wrote:

> Commit 954157679ec3 ("mm/damon/core: disallow overlapping input ranges
> for damon_set_regions()") disallowed passing overlapping input ranges to
> damon_set_regions().  Add a kunit test case for the overlapping input.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/tests/core-kunit.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> index 3cbbbcbfbef8f..a4164ac489a61 100644
> --- a/mm/damon/tests/core-kunit.h
> +++ b/mm/damon/tests/core-kunit.h
> @@ -612,6 +612,17 @@ static void damon_test_set_regions(struct kunit *test)
>  			{.start = 42, .end = 21},
>  			}, 1, 1,
>  			(struct damon_addr_range[]){}, 0, -EINVAL);
> +	/*
> +	 * Regions resulting in same region after alignment should return
> +	 * -EINVAL.
> +	 */
> +	damon_test_set_regions_for(test,
> +			(struct damon_addr_range[]){}, 0,
> +			(struct damon_addr_range[]){
> +			{.start = 10, .end = 20},
> +			{.start = 20, .end = 30},
> +			}, 2, 4096,
> +			(struct damon_addr_range[]){}, 0, -EINVAL);
>  }
>  
>  static void damon_test_update_monitoring_result(struct kunit *test)
> -- 
> 2.47.3
> 

Hi SJ,

I reviewed patches 6-8. The test helper extension and the added
error cases look correct to me, including the overlap case after
range alignment.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu


Sent using hkml (https://github.com/sjp38/hackermail)
