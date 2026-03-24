Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88543161BF
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 06:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334779; cv=none; b=JbehDfd6+1iA8ETkPeqII8Tup7YGm9/wBPpnSDnE92IjOe4j8hiRwlHNWxeCGG7zD4xIy1CI2qt3wvQOj67CtOxn+GH+cYp8uBBwFMxaznIkGFAQZdoqFInnEHUiVQcgDdOn2uFvXyA0hZUVTMLFLV4sLnyXzF+hafsCUc3n7S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334779; c=relaxed/simple;
	bh=mOHx/rCKtv71iKHsfZ7xYKsBrEpSb0ifY8iDdIzfUls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMHyKmrXWOHsT8K0AAUCi+o9R5zwjCEt0ji39pGIF5f2y1MVO5Wgz0l4UvP4WTQ0JfvatPyE+xlfr85jbxOzD6LOyEL7Fw79mPx8k0bCUm3LKpcp+k3S72+18QSuttkHkrd8hqZT2MASzrT6zQR2nUYsBJR4PDXcfSZgK5PjDeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BGyCUf9k; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=agQntXfI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BGyCUf9k";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="agQntXfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774334769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HZ8xVYWaHSz/DiDizdbC8TysAumrqF9ybkeOEPMtddU=;
	b=BGyCUf9kmLeHSM9wqCD9gx/mNNtsU6kmDMmsqglKsEiur9WOpn6UDd07qOWDPXW419j6o8
	ThrwYWuBZU/y5c9bnBLk3uULnbD3T5Vo5VYLCIA+RvxaBV2Fp4l8GsKOq5BloL600OCNQI
	MuTF3kPUtTiijHoS8VUsYGdkrRmodNY=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-yaSodXS8NuaDy3915-rnIQ-1; Tue, 24 Mar 2026 02:46:07 -0400
X-MC-Unique: yaSodXS8NuaDy3915-rnIQ-1
X-Mimecast-MFC-AGG-ID: yaSodXS8NuaDy3915-rnIQ_1774334766
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a6906e35fso6491440b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 23:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774334765; x=1774939565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HZ8xVYWaHSz/DiDizdbC8TysAumrqF9ybkeOEPMtddU=;
        b=agQntXfIaN64IGHNar/ajN2GcnURhbYZV5j/UPyLCEfVreGnzhwGQgYiBCZUpPdLQE
         I/ClxJQPDnwT+0iY9lW5BDjx1RzI6BQaGNMlOgjw+s6Ytv/YYXuK/9T8hBLtLw4yHw7d
         fiyL9Dh4cf/N6uhuzzQ3TJywZvaNGeUMmFZ3S89nyHZVGMeZc8BxD+z0bHquCR5944mi
         phjvCtfjsdjpu59RjfUeQezdM/A2xJfcne278FCMceRBJr4bp3FBXY/WVNe+SBfEQ687
         L375tgTYDVEhpuMoVyVF9Di7+XWlcUDOuOEfKgOP4/IbJlTp39ZXFgeEUxXbENwwNQXE
         U4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334765; x=1774939565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZ8xVYWaHSz/DiDizdbC8TysAumrqF9ybkeOEPMtddU=;
        b=JYaZO89GXhWTW1NYAsSduUdLB4b/XNZcM93pEIcpXX8DDcwVDKOieHxEPrImKB1rYh
         8LMaGkJvv/WFbllpJtF5qVPz3YXIIFn7P9lsLFLHzsTVf/65xcREkyLZoPU3JJvtJ3u2
         nBlG3FjwPIfkOXvMIbBDxOzn0/6waPG6jsprVzOxWLRLEE24juyuYaDkuSzOhHfdqTs7
         QQ/KnfeCjbdRiEa7EjiK57SlqnRw0kL1cXQpNtW98D3+dj39Rjw/26cxuCb21NgLNv2u
         jwp7f2fGVNzgBDxAHoteVcmkArcZM9b0a/r2TCqccc3ZY7yDCFOKwMSoImSSpGUiQWko
         D+pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGSE7C7GB2g32mO0YGjuzuTM7J3c43fxeZKZyUQbgI3cKkOeFnMuXF2VAQeOPOBpt8hT1bzhB5+0ZocPU+QQg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvt5wi0LCWHAGa/zxzILRldHTdFT2kC55NsyscSoDJ9vDauY4S
	B1+2ogKAejtF8BCCtHi1voWJPr+8v406sByr2DlGlZ7tH+pVhYQBtb7SibeUYtJnjEGqrLNbAg9
	mixIQZ9EdHFgZrxxcAcbj5tG6VADMHkQON025+RXV9s+IX0cLqSsfdNCwEpXU9yvFhUWupc2eML
	ksrAgD
X-Gm-Gg: ATEYQzz43QboundxfdY2Wl9nnl+ZWg5DZJmGxlAugL0SxS628kVf+HZY91AgmtdthFR
	BNuLh7ch6d/WFieUzgFlz7vgTCAZdKsXemKM21jzTqOP4mtt1UBMpvqdcWksDJXqdkCGyTndDdc
	JsIHo70vYgjwD+VE+cGy3Y5yrI+JhOUNlV/zTBjSHydeN5m902FvUTqjdCbE144c2URBswoMyy5
	9yOaHfkh51fuKAIOumvTsJZpezCbaIgt8gOby+PI5vBrtvxDiBYnVG+iQLd+qjI91iCijILCQUw
	2uW5kb1Fj7JxlprIaIGkxoMe9Z51z5+nWel/1yGzAPIe+oQL6gK4L+/U9uChRN5xRPiBzbES0aE
	lvmbxeBjQljHdsAE95Q==
X-Received: by 2002:a05:6a00:94dc:b0:82c:20c2:81d4 with SMTP id d2e1a72fcca58-82c5bf386bcmr1893830b3a.30.1774334764954;
        Mon, 23 Mar 2026 23:46:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:94dc:b0:82c:20c2:81d4 with SMTP id d2e1a72fcca58-82c5bf386bcmr1893812b3a.30.1774334764600;
        Mon, 23 Mar 2026 23:46:04 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc1e59sm11954332b3a.13.2026.03.23.23.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:46:03 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:46:01 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, yosryahmed@google.com, nphamcs@gmail.com,
	hannes@cmpxchg.org, mhocko@kernel.org, mkoutny@suse.com,
	muchun.song@linux.dev, tj@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, longman@redhat.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
Message-ID: <acIzKTax5hpvQUkT@redhat.com>
References: <20260322061038.156146-1-liwang@redhat.com>
 <20260322061038.156146-2-liwang@redhat.com>
 <CAO9r8zOwPnP9_AMX7Z_w4jLMYP=Ujs3BxNLWVXHOEAKVGFGfmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9r8zOwPnP9_AMX7Z_w4jLMYP=Ujs3BxNLWVXHOEAKVGFGfmQ@mail.gmail.com>

On Mon, Mar 23, 2026 at 05:13:14PM -0700, Yosry Ahmed wrote:
> > diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
> > index 64ebc3f3f203..e69d845d3592 100644
> > --- a/tools/testing/selftests/cgroup/test_zswap.c
> > +++ b/tools/testing/selftests/cgroup/test_zswap.c
> > @@ -589,9 +589,21 @@ struct zswap_test {
> >  };
> >  #undef T
> >
> > -static bool zswap_configured(void)
> > +static void check_zswap_enabled(void)
> >  {
> > -       return access("/sys/module/zswap", F_OK) == 0;
> > +       char value[2];
> > +
> > +       if (access("/sys/module/zswap", F_OK))
> > +               ksft_exit_skip("zswap isn't configured\n");
> > +
> > +       if (read_text("/sys/module/zswap/parameters/enabled", value,
> > +                                               sizeof(value)) <= 0)
> > +               ksft_exit_fail_msg("Failed to read "
> > +                               "/sys/module/zswap/parameters/enabled\n");
> > +
> > +       if (value[0] == 'N')
> > +               ksft_exit_skip("zswap is disabled (hint: echo 1 > "
> > +                               "/sys/module/zswap/parameters/enabled)\n");
> >  }
> 
> In the next version please put "/sys/module/zswap" and
> "/sys/module/zswap/parameters/enabled" in macros to avoid all the line
> breaks here.

Sure, I will. Thanks!


-- 
Regards,
Li Wang

