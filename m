Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F9A4A5C41
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361734; cv=none; b=skRFCVT/hsY2XA/MdM9ppD5skg8CJ6OHHAo0UwD38LtLVzLvwH/YLWclC66aYvVGvCZAPI/ZBSPnRyFsNKiqu+bl6KtOx71hBjz9z0uzu3Z/y0hxXJ+YnnnRs+y4OLX+jWFlGBRqWAAX6Ah2zIjN4HTFOUVjP7YlbB8rUgu5UR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361734; c=relaxed/simple;
	bh=I3mYKVGTKqP/H3LNKqz4oW31/g3MR2FuJzgjMuRu5I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crzTkyxwSHqeVYhDipiCwgnIKQI0WLjhWnzqQeHNc8MhZnuAf4u2mPhHBVK1i4Ueyw9kqmKK7MlHN51kuhs4ce4gDgTbqGVZfJzSQep2YKlqRdaUxI5EQ+PGbRnQ91e415BLiexwM/uWgbr7CDoeDHBI9bsJgfi2C1fbCERo8sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dd2O+JSr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dd2O+JSr"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d942c7cc2fso9933415ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361732; x=1788966532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIdbnMs2RBr+E/C3ONkDjLCzcgL/LziyquabNv/nyLY=;
        b=dd2O+JSrI+Pwg6yAIH2N8NSywBvs7n/y9wwtKMKhyxoIkY3QT5s+5QtFzyPbp7ncyK
         YB3TqyrybZmLD14twJFpiNJRvU+9yNnmHmYH/fBjED3t/M5upLKjySQ+Kcf/GI5zVsT3
         vQldSzvT0aNazu5XqNyc2puRltZo6OpddXpPvtJ0gQUDCyYyvtOJcHn8s0XxQR2v4dK+
         Z8kkwxlkIu3mK7qWt8U7xDFVSHQ6l0sWGbUt4huao/KsNfX03a0IjENr/OFn/XGTN7va
         atkfScCOEN2YdlYEVoOostxumqSNpc3UvY/FwJeyJw/Ixa6xG2scrC+WzBPVtaZm0RFM
         j5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361732; x=1788966532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EIdbnMs2RBr+E/C3ONkDjLCzcgL/LziyquabNv/nyLY=;
        b=kj8t5LhjvJFNGSG2bjNx0UM47U24EAh3hwfkGhzCYgF3wh3G6mjld9//kuRhIb/GN4
         1e62P2cx634I7ioIwoCrs0VAoT84ttgrnUmL06mlph/wGMy5iHB9S3PyIoNVbv5OcOkY
         YsnbXfIrJxFyMfNAz/kjl4Edb7qZy7StvHFr+jeGWh3GUF5AKIp832m1iyZoqKpPnJLr
         PMDyDRdO/6kFTEM6YAqc8qyVaUywijhgo4itt7OrOhDYhhEiCR3JGlmWk4xh39wawQ+i
         dEYjXIwY1+F+XRUVeeUAB2WoD4A7RQBia0DPvm+nvcMyEBxT6kLyv6Q7Y5ANMhHDoKAW
         5wIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzb+AjfQWHvNUMu5z04OAzdBGYbl13WfpnLLeef0+SbjFeeT8rYus/zKQpGul/p+Qr73UJvYTvs0uGuLIzfLmw=@vger.kernel.org
X-Gm-Message-State: AFuF++mOWYHamfOIz1VXLlNFF9+KRRz/PKApB26e0+9o4I+BSpfSVYuO
	SnUTmS+eIfa9hHr6gxuOmhBjI7tlk9DshpCDukwOdnSXryTZNHxJOy39T9YUDpFH
X-Gm-Gg: AYBFou2Xt0owujGoFO1HCH9RR1VMRf2LclxS1YuDukJK9g1fnH91rmk4JyML4iZN3Og
	V4nXzG+Iw9WJ1VaaEnhFp9FWKtjy05ZAj9VcEI2nlhizQWmWbVZcWJZSJbBzR2vDsqPZFmSxB07
	7z71HzyMFwTaazZrpCOiGnOGA6bguh4AfxsPv6EbwRYpxhzM3XuOvSCwN9HlVqA1pCO9wN2481T
	HKkGKOfaFhhKxZg6oVS8DtHMfrTBNSGdACv4lyfATf2ajzBvL8UC/4WLC1rG1Gdx0dHEQP4r33K
	xSyRY7QPRJPI73YAbvt4OlPzAphJpvfWMPEdQ8bo6C+CabuFFjDfviZxTVQvQwjbRtiXHpGrkJz
	I4dTiWeV9aMPe0L+qgWn5kKk1i/A96xKkDXbEy1BDGDQ/RQwSw8p9FSU+AkTddvsnmiUuxYkF9C
	BULrXpJQx/EcSrz0mBUgKS3cb2xEwVmzMiwD8Fbq8/AJ9J3uUuIdEwnOXrNAof
X-Received: by 2002:a17:903:19ec:b0:2d6:e4ff:9cad with SMTP id d9443c01a7336-2daec5ab9c5mr86317615ad.3.1788361731078;
        Wed, 02 Sep 2026 08:08:51 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd488d18sm15030855ad.45.2026.09.02.08.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:08:50 -0700 (PDT)
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
	linux-mm@kvack.org
Subject: Re: [PATCH 09/12] mm/damon/tests/core-kunit: test damon_nr_samples_per_aggr()
Date: Wed,  2 Sep 2026 23:08:41 +0800
Message-ID: <20260902150842.4033320-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902054747.99370-10-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 22:47:42 -0700 SJ Park <sj@kernel.org> wrote:

> damon_max_nr_accesses(), which is a previous version of
> damon_nr_samples_per_aggr() before the renaming, was wrongly returning
> zero or random overflowed values for extreme intervals setup.  Commit
> 35d4a3cf70a8 ("mm/damon/ops-common: handle extreme intervals in
> damon_hot_score()") updated the function to return correct or more valid
> values.  Add a kunit test to ensure it is working as expected.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/tests/core-kunit.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> index a4164ac489a61..d0bed01a5b7fe 100644
> --- a/mm/damon/tests/core-kunit.h
> +++ b/mm/damon/tests/core-kunit.h
> @@ -625,6 +625,27 @@ static void damon_test_set_regions(struct kunit *test)
>  			(struct damon_addr_range[]){}, 0, -EINVAL);
>  }
>  
> +static void damon_test_nr_samples_per_aggr(struct kunit *test)
> +{
> +	struct damon_attrs attrs = {
> +		.sample_interval = 0,
> +		.aggr_interval = 0,
> +	};
> +

Hi SJ,

A small question about the first test case.

Both `sample_interval` and `aggr_interval` are zero here.  Since
`sample_interval` is the denominator in `damon_nr_samples_per_aggr()`,
would it be better to keep `aggr_interval` non-zero when testing the
zero `sample_interval` case?

This would make the test explicitly cover the divide-by-zero protection.
If the `aggr_interval == 0` behavior is also worth covering, perhaps it
could be tested separately.

Thanks,
Kunwu


> +	/* Zero aggregation interval doesn't cause division by zero */
> +	KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs), 1);
> +
> +	/*
> +	 * Too large aggregation interval on 64 bit system doesn't cause
> +	 * overflow
> +	 */
> +	if (ULONG_MAX > UINT_MAX) {
> +		attrs.aggr_interval = (unsigned long)UINT_MAX + 1;
> +		KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs),
> +				UINT_MAX);
> +	}
> +}
> +
>  static void damon_test_update_monitoring_result(struct kunit *test)
>  {
>  	struct damon_attrs old_attrs = {
> @@ -1736,6 +1757,7 @@ static struct kunit_case damon_test_cases[] = {
>  	KUNIT_CASE(damon_test_split_above_half_progresses),
>  	KUNIT_CASE(damon_test_ops_registration),
>  	KUNIT_CASE(damon_test_set_regions),
> +	KUNIT_CASE(damon_test_nr_samples_per_aggr),
>  	KUNIT_CASE(damon_test_update_monitoring_result),
>  	KUNIT_CASE(damon_test_set_attrs),
>  	KUNIT_CASE(damon_test_mvsum),
> -- 
> 2.47.3
> 

Sent using hkml (https://github.com/sjp38/hackermail)
