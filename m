Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178AE48875D
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401462; cv=none; b=jKjnHa4tfLhxH4e3uNHfnbX8cHr+UBOSwVpVAFFDyTZwk0vKo6gqfdASWwI6LLTelKW73/sUG5Pu3eKlew1Gjou1OeV4ytR0ANfvsdEpJKoj9jdPkaNIS2qLJz/W+tUOpaW2wVjhSxl/g0KfMBDkYuWujAm9CnQVtemfgRr4vHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401462; c=relaxed/simple;
	bh=5ZiwVFQlAD3lG8hrfLGRLnNhI7uqv5EcZ+cUO/c5qno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+IU2Iu5A8iJ24gFgXAlN19oOz7aIghMwfJ2nH5D6TgCAW7429fjzWpv6U5tIyPF/hyOCYTsw4Ah5QXSDGriX6kJDyM8W/PDK78LL7jU+CW8BkeyVdiSFoQEKCR8sYHBmeII8mnHRf0PJdxOQAY9RX8DNcYWjpYsS1dwHvhidi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5crcDED; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5crcDED"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso2326563a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789401459; x=1790006259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLQyzx/jS9wKpt8k6euuDCFOGH2TJfuVVKt6HxhJ5XY=;
        b=s5crcDEDrEGinEphgbx+6WdcNDsc6gC8hMTl/7FH9Q1YhEZPrtEF58M5ITFiRTTf+e
         Kes8XSMUjtysT+ZzQ6ZsKdQ58MMNXie9NaCP/atQmeyazWlLf0Cevkvjl9l04IIIrUqU
         3yoaywlItCpfglxiWv7NC+MdqvjtWEV0GWGaEcujo7yWy2xdcHJacwHCgFGjhUkNrOb2
         eOmmcq+UCfE7Zt7uDaTgRUeM5yko8xn6AABQwhCodhM0UyJ4JdnHpjLjUKqpPx8u84lF
         Y++PNXXxcXrYw0bwf6OcBUIZunx9VAWGQgfGNB+lwlZziQPEZNdk0ZoabuF04BKYmK9z
         zMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401459; x=1790006259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLQyzx/jS9wKpt8k6euuDCFOGH2TJfuVVKt6HxhJ5XY=;
        b=Fpb5YHA31JZwturI8c/UYOOomtgUc6IJoW8hX9iIFTkBmPtF2wJuVNNb9+KiUWBHye
         yT/2SCjbrfFjO9I+9KO6A9nI8PeuMID8m7RFYTg+Kpg9HWXf6mH7IPdPetcLwxFh5yQf
         nqMXuW/ma4H7LoLgStSmaAgefWbMaIsfOsQj6PEjawCtJyzL8IAUGSuXiDK+HW9z1Sbe
         IWXXzIR6Ka+OrTobjLGYXFfih2PKU3PlCS+bWYEvGmFR/G+7sroEJGkV6knULlJs8P1e
         TE6DN7uYkgZfScPIjRqzC1xLHThfjhkJzwD4ooqQP0aMaL4RTdqbtlqG+7OzlnqVsyPs
         kqJQ==
X-Forwarded-Encrypted: i=1; AKwUvBz067I301DxyXeASl0kSgTmUWnJYwjjyFG+CnH0EjIp6tTNdNKzjt4LAxBcyPAF5dMWhBK61rVPfiCE+d4id18=@vger.kernel.org
X-Gm-Message-State: AFuF++kWKwS6GPebGaKy/ugqOUsPXavBaSzlfnI1eRwWJrB36ErEwm2P
	4Qon9l/T3w0NvJa2t4E05nQ/aOaMiV3qic4jiNX5RwliwNr93zkXrb31
X-Gm-Gg: AYBFou1pff4395szPeSBi5nOGZxPCqrFPo9cXa3E8Bh98OxpFyGrS6u5/k27mnlo6R2
	5bBV16ptjhIvOmja7+pfZO29O6IRqXH9ZzklAtFaBNSW0NZzIusxvX4rF2Z2uhIKCnNlED0SDi2
	wn3fSG6JNalB3KRbzdOnz9DrD6NBx9mAngeLiorpe4LDGER0SrABlAfJrHbJDVpR2gUxdzYfIj7
	rl3MbEdJyB2fsyDR4DM++/ojrTnN4N1VAqtjXrNuQ9u6u4dDp9RU4j7UpapwS2bi1oSjqnykXDy
	nCeVpEfEnwMUv9HDeApZDY+1QAOciIpcsVXQYn+vDJtPWLEFtGTsbLvEAyIkCOw5pKsCHR0rh1f
	+3/hRkAaJmWHV+qxBCDjQMlMw91ttBQJT3NDxPMNHu5egpWMJdolk3TYGXPHA1I+Ki0R/LOENDF
	5p5L6rwfx121Ms5eK5mlXOGIAOn2dzdP3I8Nq/kRC6WEO6J3dodQi1+SzgR6LZazzqmwd4dg==
X-Received: by 2002:a17:90b:3c47:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39debf8d92cmr6628202a91.6.1789401458739;
        Mon, 14 Sep 2026 08:57:38 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda8bdf4sm141419a91.12.2026.09.14.08.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:57:38 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH 8/8] mm/damon/core-kunit: test invalid damos filter commits
Date: Mon, 14 Sep 2026 23:57:27 +0800
Message-ID: <20260914155729.1518105-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191807.138502-9-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 12 Sep 2026 12:18:06 -0700 SJ Park <sj@kernel.org> wrote:

> Add test cases for testing the validation of damos filter arguments in
> commit time.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/tests/core-kunit.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> index c9941f3bfb42b..5da84caf4124d 100644
> --- a/mm/damon/tests/core-kunit.h
> +++ b/mm/damon/tests/core-kunit.h
> @@ -1195,6 +1195,13 @@ static void damos_test_commit_filter(struct kunit *test)
>  			.allow = false,
>  			.sz_range = {.min = 234, .max = 345},
>  			}, false);
> +	damos_test_commit_filter_for(test, &dst,
> +			&(struct damos_filter){
> +			.type = DAMOS_FILTER_TYPE_HUGEPAGE_SIZE,
> +			.matching = false,
> +			.allow = false,
> +			.sz_range = {.min = 456, .max = 123},
> +			}, true);
>  	damos_test_commit_filter_for(test, &dst,
>  			&(struct damos_filter){
>  			.type = DAMOS_FILTER_TYPE_UNMAPPED,
> @@ -1208,6 +1215,13 @@ static void damos_test_commit_filter(struct kunit *test)
>  			.allow = false,
>  			.addr_range = {.start = 456, .end = 567},
>  			}, false);
> +	damos_test_commit_filter_for(test, &dst,
> +			&(struct damos_filter){
> +			.type = DAMOS_FILTER_TYPE_ADDR,
> +			.matching = false,
> +			.allow = false,
> +			.addr_range = {.start = 567, .end = 456},
> +			}, true);

Could we also test an invalid PROBE_HITS_WSUM range here?

Patch 4 adds the same max < min validation for
DAMOS_FILTER_TYPE_PROBE_HITS_WSUM, but this test only covers
ADDR and HUGEPAGE_SIZE.

Thanks,
Kunwu

>  	damos_test_commit_filter_for(test, &dst,
>  			&(struct damos_filter){
>  			.type = DAMOS_FILTER_TYPE_TARGET,
> -- 
> 2.47.3
> 

Sent using hkml (https://github.com/sjp38/hackermail)
