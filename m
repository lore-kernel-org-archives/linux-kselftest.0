Received: from mail-qv2-f11.google.com (mail-qv2-f11.google.com [74.125.230.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C12568FB6
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967547; cv=pass; b=Yhe4nschXK9y1s87xCou07DZ43ptcA3cj26HwvXY7MOwlGOJOaYWFO9OGxJyk6BQEj/kttyd+0r1yZl8awSG5GvyIyOY1DcN4edf1IqME2f4U9M26GCHO3WmdEr64+E6zlVH5O1poEDeJvwPNGFLntCU2msB1vB2jSRunBxc+yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967547; c=relaxed/simple;
	bh=0/Jm5DAY3AamN+rYMx+HuqizbAknGGFn26W9uqNpDbc=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2ePGtJWCn6nuK3LaG6yU7Tg3xDfFGSGeKUw8GkYzWqOy7AV4BGeIhcst9aveGx1H8ynrwyXkWxZMyhWegROGhzciHaX8nqf06bCXKBMClB5ASZt74BHB7RJbP1ckYVREGwGhFh8ohEyBPA2hhOcW1jaeZf3ehcKX8oCE2YhIi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIEbJ3tU; arc=pass smtp.client-ip=74.125.230.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIEbJ3tU"
Received: by mail-qv2-f11.google.com with SMTP id 6a1803df08f44-9105342b2d3so25964496d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 08:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967545; cv=none;
        d=google.com; s=arc-20260327;
        b=M6WRo/gzJgNvHmqIzCcWoEkXQ3lhF81zhnZZxaYlzecVsR7o98maoMCNIQYzmdPqga
         bgghaYWY4AEE9d7C8/x+yDp93aopq3PGvh9YL5MNDRcjnVRqHKMWOqhkG6eFyJ6pZg1s
         aX7nKL6alia+Z8ypOZIufNj9RcOIDukRAjBvDdOzB59QPylG9obIBgDSdorK5axRW7io
         IJuHWs4oDr9Wteqkj90gO3CUCLsoh2s3GVoxeiMqf8r19yC7o7/xVoqunHUgIV6Gz+Nc
         B1b90TX7htW46kgckUooJg2TngTVVikGsgozGYmH4rt6C9+ruqZGorz5JAonOQRwty4S
         lCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=0/Jm5DAY3AamN+rYMx+HuqizbAknGGFn26W9uqNpDbc=;
        fh=FDnpmLWJKiAhShWYCLMwVf3XgVQAdbZ9ZkfIuDLOEMg=;
        b=TYdFYMUpPBjbD1OrN8uIojxRCFQtuHuXypSpaXMJQAtP9UQstIVXieSp9y6jp7dpEQ
         XcXJVf1uDqasLR7Vus4YvX5tVOLHImzylq7cfcnfdxam7w37qs0K6szL6KMItikMgvqm
         qasrDZnPirvmZ2maoj8l8vwlUWwdPUv88ZRCvvDHD/apZODn2vgMjH3QIpP+p9cBJET+
         88CZUuBVO3q71eZccYruOrHJ/9UGRc9tHcte+VsNQSiTqkyAdsONysTenlabsm7JjjXl
         bBDIiE9Vz85rehGMs2fiI/Fn8LcC6IpEdje9lW6jPV5a5fFqFcL6u+A/iBk+T7nlO1zO
         y0kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788967545; x=1789572345; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/Jm5DAY3AamN+rYMx+HuqizbAknGGFn26W9uqNpDbc=;
        b=tIEbJ3tULppdr2+syxuOlfIdUs5O59slsP7c1p0TUBt80qrIVX+FykF2VS3ukP6iw/
         zuBHCzALAh+9l/QqqPphFzIWHNhF1W/sAWPdthS6/UUUyLVfumQ3sXz7N0y8QjwWq1Pq
         Gu+PxDdXf4M7xbhOgx4Wdj0k4kZYPPM6esb0FjBMPFvjsE/a5110DG+C41zwOhLdfXcL
         NQmytweFASB7ltcbXWSSjAS/cc9nV5WqMRq/QzkHPEIauEmpb5GAPv69WP7YukB5JHDz
         njd8fXZFh0IOf3qYw+DOe6eCTSHUSyKDN7k1V4HIduQEbiUWP5oCjUtAmQxswtr1y3Sc
         0kcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967545; x=1789572345;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/Jm5DAY3AamN+rYMx+HuqizbAknGGFn26W9uqNpDbc=;
        b=pOJTpri9YwRlOBoN7l+F4R7bAKM2b6f7DxH/L+mKWEm988K/HUhGOFn+pbViYvMdpU
         i7GIIkxzl7pAIjwQ8FSFsr3wwo6IfZtkOoosUTkxwG8k+DWdsUiGSxQ7DGmatF0uNwd+
         YCK++04v0pRARNKoaMP4Kl8lI9Jwx2TdDRbwegD36DrAoT8XV/RGoVhdNKxMcbj6EbEL
         dFsuHj6fAnnlQEwkhw3L3muZMxK7XITw+gr0vDx4PueFHSbvSWg5wHWKGHKlARWg8jDL
         I36TvVtg9qPDSmqC/j5+Ak8AvWtyKDeS1Up+5XeeI5J/z/R1M6yIicTk8kg354uAQ9qi
         5l5w==
X-Forwarded-Encrypted: i=1; AKwUvBw4r1wr4nYhIwGplBBLqalc6K7VUzeqnBJWJeG/8bknS+UE2ga+9X0JVzz6kmzraG0ujgEJIMtuPqUk7nCJ9/w=@vger.kernel.org
X-Gm-Message-State: AFuF++lRv7ozXOHSbYA/ETn4iiBbu7C/bkiDHCm3lw3gKQA1mN38mPc/
	XI2hxyG3ySGDR0PcFf9Rbfs7EYrCEa0oBqCpi2AzyDo7DNwf3Fxg/tFCdXF8EPS9yo76LEyqdwd
	54ASMUIHvXarOQRjhcQTSVyb2vIJV6ag=
X-Gm-Gg: AYBFou0yFqRvkaP7+5KCILdso0KQnEWBtcWDp5lszNKks9YAiNx2zGpVF87g78O8jbz
	yPQNdwglowl+0pS7zeGfhCVfYWmGY/yqFL1eqtkLiRNIbukE13fqQNlvcAC00koU3SslmilE7J/
	/i2WizCl5u7FEE1/ImgKfdqC4v2Eo0ecK2LDl8KW1Bj1XMqj3/T33C2CdiQaO3yM+YQlb4bZleT
	v6WSqAPZmGvWkEYiQwmjfIt6Ub79spY+DRoMH9lUtpgR/M4whWdRylJza703zbdkKFmeDZAuoxC
	M3tQ9Xf2TApQF5FhG5VeciYSS2Wr16F7wurclLMKkljEs63nuGHA8Q==
X-Received: by 2002:a05:6214:3f83:b0:910:49d1:3a7d with SMTP id
 6a1803df08f44-9106b371d12mr101320656d6.3.1788967544656; Wed, 09 Sep 2026
 08:25:44 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:25:43 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:25:43 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirQ-xfWymbY9Z440sjbUseLRuaPFT17mBAwddeN7wqVi-w@mail.gmail.com>
References: <CACGbirQ-xfWymbY9Z440sjbUseLRuaPFT17mBAwddeN7wqVi-w@mail.gmail.com>
Date: Wed, 9 Sep 2026 08:25:43 -0700
X-Gm-Features: AcwNN1XbctJykLIajwUrOJ8N0MtuRTsipdzh4r2QkiO3ZZ9AV0_gzwQwPujw2hI
Message-ID: <CACGbirTmyi0LHZEr4xOwg_WgFALarFVPMm7JhHBbXwG10PF3KQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] selftests/sched_ext: Validate select_cpu_and
 mask constraints
To: Tejun Heo <tj@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, sched-ext@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tejun,

Please disregard the previous Gmail resend in this thread. While
investigating the same delivery path for an MM series, I confirmed that
outbound delivery wraps long lines and damages patch whitespace.

I have resent the unchanged v2 as a text/plain attachment:
https://lore.kernel.org/r/CACGbirTEtYnxiZW0EnOCHbZt66=t-A_Nppp0ChRfM9G2ZD5+aQ@mail.gmail.com

The externally received attachment preserves the patch and applies
through b4 and git am to the prepared tree.

Sorry for the extra resend.

Thanks,
Tianyi
