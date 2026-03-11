Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB3719046E
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234927; cv=none; b=r0xBTpScZC8+Ck06lQm8pjvB53BXVPgI1T8QdpVmtt1RyLcuHUePCdYLeMmppGBuzSSoL08Dr2uDkPIYGgOcj5WZxgQOtG4YOGb6jLuk7d8LGz6qh1+bVE2DyjzS0adXkJqe2/+FqTdCsNK3l20XQVJtUmiKunrigLtPXSvHRcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234927; c=relaxed/simple;
	bh=sM8sWCWyfxfWkraNbQY+CNP5G8vS4Cs+vWDjTm7OQG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTqF5Mhyf3xgia1lYW1aFzZ7j+WOMsMQnvEx9/Oy0e4lrJwOWZsp4ACduXhekz+6lTk7q5795S4hzaN+ZlFuVcupCNrwtxlAZkfxQKB9buvDTpYE8Uxpp0CnKicQFI8+yoQamcMsoImFRhZVkHFEAMj95wyYymWSYuruUTg6dOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iDQdcv7j; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q4qms/Kp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iDQdcv7j";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q4qms/Kp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773234925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MDulTWN6uxyFsZIlXHpD7hEvveDQhSXIzocA83Bdsbg=;
	b=iDQdcv7jUftWijAcWWemv5uERVM7yy9lhQ0LjRKcURQp0ufhhIL1mVs2lQU8GL0S0oCHZw
	4yhbfcohUyRoFgw/+aDr1cOImrb+9t8kiSUYdHS8qsmsk2ZKEG1CZ+Gr3d54jxga3uLdzK
	NIOqO9+Y+8vzg4tSk8Km7WbD5XhM27c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-kb2POi0EMH6LAommjYmz6g-1; Wed, 11 Mar 2026 09:15:24 -0400
X-MC-Unique: kb2POi0EMH6LAommjYmz6g-1
X-Mimecast-MFC-AGG-ID: kb2POi0EMH6LAommjYmz6g_1773234923
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48542d5aa9eso16707315e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773234923; x=1773839723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MDulTWN6uxyFsZIlXHpD7hEvveDQhSXIzocA83Bdsbg=;
        b=Q4qms/KpI8KSyhGdFRDGVLPNBKIn3aGWc7+LX4VaxxNc0mGYpbcg7h+sb+/CIzptik
         I5h2ZCS7+eruollEHJpiht1NJ/OooieVxo4ipvJ5cdQQ83lR/GvFnVkGBtmYEUUONXYm
         VvAFWybiZbQMcReU8IUjbUoX/5lBRH0q24stP4Q8cU6Z99SbvJbipoms1lYTlJnHklcG
         Eqo/j7znYn9Ilb53oc6hhR88MqGfUFiLDkBmk+WlrE7TtofraZpCXM9R3iEOcMvsW/hF
         OtVWME0VVU++LM3zmuyDHIb8OuT/3/xBUnxwWiAydftEPToxPIQcXu3trRVzz14Cw3ca
         TZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234923; x=1773839723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDulTWN6uxyFsZIlXHpD7hEvveDQhSXIzocA83Bdsbg=;
        b=POK5e9IglGDWikKvFNsnfpY5UbcQITt3pUNteMzsHeZYuLFTEcaskvKfA4J/CO7tjn
         EdOxkH3QxZV5x7S7ZaL5LCjd5mloDIOhdLUSswoeleNtfJzKhUlqnvkyEsaE3ZUux6Hj
         j89tTzSwagdOCU7fC0HMqQUmkOXG4efb4ZUOiH7ENWGuvBcd4XN1EQoOlTDEEz4WIXdH
         3oQ9US1bk+5utBcgN/QJMHpYpLkCivP/upWEULe3gb4i6LwnZuDF82dd9b2jdt8VDfzX
         rE1HibzqjbKHyhNxGZCl6thi5mjA5rMJRDXNv+JsHjJ8C2c3RtbH4obFs6PVFDbQyz8F
         O9/A==
X-Forwarded-Encrypted: i=1; AJvYcCXH+hvg2g1xwpV/qQXoutBBgVImFIVlvBlMlkIMx58MWlpatOWeKNjlMQB7eWlb/lUVXZOfiC07S4yRmAo/dMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW1ujnUVTIUO59Mi6CQZ5050H9NslpE8KWG+WrmeW7q/X+zqhN
	s7Z6cCvVj6IyGJccSmz4ScETy4k1JlM9Q1snQGXULmQODkXXGbuI2jpApRJE9vwl1btpAS7Pz3m
	CLESqCWKp3Hs6R89tSMM0gfj3e9YUEVOoNX6S6Wj9cNkqP4mk61/ZFle0hoG6MqJ0MYh++w==
X-Gm-Gg: ATEYQzz38H+Tbn6HoIgtLsr6R3J8J+SLNVycBwX9ltFkt0i3oiqvfKsg3+tlG6tZK/L
	WfjVc7EC9a/6aZnM6aH4fzSxlpqN7n/TylEDVLqj4fFsKRN6Uo1tmg5MJzylUQJbpKOh4IL5CYc
	lsPqpNhn3enKIkEZQgTtr6TTWzjGYiii1fAnQAU5Bqb1hUPs1hGHq5018CxF23R/us8kLFUTJg0
	dyLxPR/1lj02XHqMeAC3DrJ0qkmcfBL4yVDMevdimwYNcvPB/gyJ2rQIVhjw7/x80gmKjXKdNn1
	UKc6pl8ygIW6fu4y5a+c7dgTCRakODsLvnwyUSOzdBA/ryQnXlTdwRdKBIoEF+2stHYQcPDpS5j
	DL+Y4sU8IhY66hMyt7qWQC1DEhkwLYPch5WsKzHXUkgVTMLGg+xQ=
X-Received: by 2002:a05:600c:4fd6:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-4854b0a6b99mr46583275e9.1.1773234922826;
        Wed, 11 Mar 2026 06:15:22 -0700 (PDT)
X-Received: by 2002:a05:600c:4fd6:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-4854b0a6b99mr46582735e9.1.1773234922296;
        Wed, 11 Mar 2026 06:15:22 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.82.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818e9eesm8133718f8f.3.2026.03.11.06.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 06:15:21 -0700 (PDT)
Date: Wed, 11 Mar 2026 14:15:19 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 2/7] selftests/sched: Add SCHED_DEADLINE utility
 library
Message-ID: <abFq55y4gINhxvUW@jlelli-thinkpadt14gen4.remote.csb>
References: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
 <20260306-upstream-deadline-kselftests-v1-2-2b23ef74c46a@redhat.com>
 <2d14e8b7-a7c3-46ba-b1d2-6bb6404c08fa@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d14e8b7-a7c3-46ba-b1d2-6bb6404c08fa@arm.com>

On 11/03/26 09:39, Christian Loehle wrote:
> On 3/6/26 16:10, Juri Lelli wrote:

...

> > diff --git a/tools/testing/selftests/sched/deadline/Makefile b/tools/testing/selftests/sched/deadline/Makefile
> > index fd57794f1a543..ea3fdfbef459e 100644
> > --- a/tools/testing/selftests/sched/deadline/Makefile
> > +++ b/tools/testing/selftests/sched/deadline/Makefile
> > @@ -1,6 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  
> > -TEST_GEN_PROGS := runner
> > +TEST_GEN_PROGS := runner cpuhog
> >  
> 
> This runs cpuhog as a test as well which prints misleading timeouts.
> 

Yeah, will fix/remove.

Thanks!
Juri

