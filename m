Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1330A3EBF24
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778662511; cv=none; b=Jlk668bsWVztgCsSeS0NKJkateBJyF6B1C8+aFC/yiVMfNrqxzpKlidHHGpT8AfxkV+avBQlxR32oTE+OILPIhWUF25JVu24HxgrdGHo1D4uQ2G0MJyW3BMUSHXBGe5ZbUwDBRbytsxSCtElE7js14lkPtw5kALUES2IgGjM9ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778662511; c=relaxed/simple;
	bh=kJbZ5JOXagVppsXc4ZdddJ+mu91Aj2bq7j6nNsU0ZhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCBkFI2JHOGht5lBYCTYk9hDyER6bpqAiupepjUgBOMzE+J2a4aAg0SS4n4rgGCstlBaKxGXKisj+LR9tguAZ0eCAso7+BPDBfHKX0MSfH8uMPsEmtMC5feWUsP701w/76wchU0+PcDugm/dDR0VEVH6Pa1V9a5So7grDp9xjmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfIQbId7; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfIQbId7"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso9945084a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 01:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778662503; x=1779267303; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOzITOOB7eZcMbWT9yiOWFw0EJuWlsY59IFvhncuQ1E=;
        b=bfIQbId7m2H2G5AoK2z1C5MfxcT9+TgRZVpGmBLAVgxCebdcQVwhyH7Vl85XFr7B4L
         U1eoWEoRN9x6zqXnSQuFPanCWKFGW/i3mXtHwI+VZe5QBDm8Y4kAe8TgteNpiNqFvpGt
         p99qVRXpkDOI2imUWEU5azv1eralGqslmzttyQp0Z6mQgMRefywZBDBJHYhh13+0pSHo
         R4ejZVfo54rrVvARGSJoRiCMpVHDFTrPNuu2sAPjX+oBEs8IW9q6r6JxKkPk2455r+zq
         vZ34eiDR3pvU9dnTO7QO/fkYvGVbSQ0WevUQMePaeetJnhbcdM3ederc0XsbGIvfFRlc
         /zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778662503; x=1779267303;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOzITOOB7eZcMbWT9yiOWFw0EJuWlsY59IFvhncuQ1E=;
        b=aFwBWrPg68a+oNaOaNoB6Z+xEk1bxeb3nTmEShWwYC9oWNCtuFK8oAkR1pFzMmhFLL
         fXdG0CNNZN/knwUmCS3q0M6klM+5MkosgBwIOrCO1+Y2ieP9SIwhlonm4A35NVAd8Etj
         FxWLQqld9HA07u30KYI/4hY4HdNJGSssC6zfLrSL8vSlL06Io3U9KUQnZPiPuY5YU2mr
         5nHicZzh7sB5zEKlq+6ks7EPTvSFlx7c+UvnjYw+mnhHjS3BdF5U7sCedfVk7Rp8e5ZC
         ETOSDLt9KORUVBPIgLFJOrYyR4aCwYfUuXx/uaAMBWVhImJZuVks6a+l8SJIzIEmiZxE
         JByQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BUkrhieVQFrKp2Op4ETaQJb6JoxW/GI4cwuWBrhSQe2gV6g3OG0w/nETQEihSDDRF3kIYDu/J+hTGAZUgg8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPiPHfdVAmfAf8gZVhHiCkVG4bxxMHLhNHk7vQ5f5UgbifjhXM
	py9e1F2GfsuNmCwOat8Xmdcs5N2vSUSakFNDR2XkL9O2fxZrqTY+vle4
X-Gm-Gg: Acq92OGxI+kdAp7UuArQ51iQbvbFCi6arFPWg2aOc4rC+Bi9272SzFETCKLfLh8QYDs
	YDSZuBJtQQu6BDF1L96JFZgpJhYYtcPcOjfpbgfPlMJuPUDaPM5n3TY3rKiJPaQUVy6/7uU1bZ3
	v0aaT4KQzsqNBoBOya2HzGHdhJ7FcaqcWoGKpbS9Aws50y+S1MwQu1vU5axOO0sj5VLFkbVxDxg
	xKP+T7OO8FrIiZda2X1ZFUC88O7NcVG3G5gjR1F94nS7E7npu1Ft1BUUHiMVTfAxtC1fnkYDG6y
	D7V65vIQk+tbD0T3ILCsNWihNSVmItzD/bjKNPA5EU8SdxxsY/1n66OhaONbmWLOUPTiFek8630
	N2Jt9dP9CKHrsgruhCAjJ43kTgCL2gqINHZsGECvoaivRW08MkJ0JnasNw4BUUL/UTR2+3QXuy1
	PxpqwYEHFGABYugb5zG8o9hA==
X-Received: by 2002:a05:6402:a0d6:b0:67b:7d11:7589 with SMTP id 4fb4d7f45d1cf-682a700ac71mr782684a12.7.1778662502578;
        Wed, 13 May 2026 01:55:02 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0dfd35csm6047568a12.15.2026.05.13.01.55.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2026 01:55:02 -0700 (PDT)
Date: Wed, 13 May 2026 08:55:01 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: shuah@kernel.org, akpm@linux-foundation.org,
	reddybalavignesh9979@gmail.com, richard.weiyang@gmail.com,
	mic@digikod.net, sj@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/perf_events: Fix mmap() error check in
 sigtrap_threads
Message-ID: <20260513085501.lzljqdgzwanbqtr4@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260513025838.594945-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513025838.594945-1-lihongfu@kylinos.cn>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, May 13, 2026 at 10:58:38AM +0800, Hongfu Li wrote:
>In sigtrap_threads(), the return value of mmap() is checked against
>NULL.  mmap() returns MAP_FAILED, which is (void *)-1, not NULL, when
>it fails.  Since MAP_FAILED is non-zero and non-NULL, the condition
>"p == NULL" will never be true on failure, causing the program to
>proceed with an invalid pointer and segfault if mmap() actually fails
>under memory pressure.
>
>Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Ah, looks you are right.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>---
> tools/testing/selftests/perf_events/watermark_signal.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tools/testing/selftests/perf_events/watermark_signal.c b/tools/testing/selftests/perf_events/watermark_signal.c
>index 0f64b9b17081..a84709cabd8b 100644
>--- a/tools/testing/selftests/perf_events/watermark_signal.c
>+++ b/tools/testing/selftests/perf_events/watermark_signal.c
>@@ -102,7 +102,7 @@ TEST(watermark_signal)
> 	}
> 
> 	p = mmap(NULL, 2 * page_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
>-	if (p == NULL) {
>+	if (p == MAP_FAILED) {
> 		perror("mmap");
> 		goto cleanup;
> 	}
>-- 
>2.25.1

-- 
Wei Yang
Help you, Help me
