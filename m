Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795676620;
	b=JUZUjCo/PJAnMMT2zHKxMRlqUiipLwIi6CizCipJecZ7xIfck5+HJlVeUfPAwiRGQWhj
	 aIvxvU9NoGLxgj4P/57Dc+pPnWC7rDDYEmBB9opXPGKWFqGnqLkpsvBgBGcfrV+ytYjBY
	 Xe9/R3l+qZbJHdc4XYNIVcy+6+DumRAWmbWZM2okW3OSFzgazeLt85dagoYq9sh+BjLZ1
	 ueklTjssJXS5orIB4zZ/iJ4WDxDCBDWBMFMmP7icR2nE0V0K+vpquaMSRTb2hYF0GA3jj
	 iGvlq8HZKAGLZJKp/usFa74+J+AU1SE8c2hKYVLWKTZK/ACBzF3tu/iXYNrjKQs4JVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=D8z4X9d7XTdPtdZKUVI1Q6jRe3rMzFKexJK1WGJD7qk=;
	b=Aaw9mKoItJcoFIEFCcyplxd4o7uVy0MNAetoR7Xu/XEbv+ihbAIRCWoR9qIxbJAw0hU/
	 ytmQ3lmqVnPqUZ4G90QRk1n/Bs+Dd0ZcoMCbPkNINFwNNbNU29MkqYcoOq1a4dkgs/BrH
	 L7CNuf08i/e1/LWYWFMJK04YhlsrObtBnS5KaAmmslyCnE2l2TCHAh1hz3CLKkUU+BigA
	 //CYMcNWyU9jo+SvFWwcUhAbQTXsJcokp0MaBAHrzbSRQT4RghXH1XsiJsgU3m6G0UXfE
	 O3auZmbBcn0qc4XaflHwVQl+JQg8Tz13IAA6SWFXiWCC5nrjyz7JxeJKSpF8NABunRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiIYrwvC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.139
Received: from mail-dl2-f11.google.com (mail-dl2-f11.google.com [74.125.229.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A80606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 07:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A80606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiIYrwvC
Received: by mail-dl2-f11.google.com with SMTP id a92af1059eb24-1b345449fcbso310821c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 23:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795676619; cv=none;
        d=google.com; s=arc-20260327;
        b=pDGFIXzYoV73XyBRIdHByFa0k7CtKPbtwh0h1TuS+OeeNb3gHhDz2uV84JYjOl7O9d
         P+9RkqGOW3HaAo56lEB3ItoDW21z3HglVZ5X+Bbli9ndjHAXeBkkDKDFgM8AK9QjgvP1
         2GnjcGXDgrTTu8twjU8UIMvfJx74qWFNtZGKKAk2A7/lBmQ8a3ygCpQsFbNBaJV5PlXU
         oDZX2m+JzgSCa1Bf3htsG5fH9If6dDV5oIwPgnl1z1RkxdfnUDavFIWNj1VehORKpFXY
         q+lybBwFilAK1eH9iXEGHHoXqmtwfH6mkTYQfubI/+8s18hrQpd4EDTHBhz5hE//JKpB
         Yv0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D8z4X9d7XTdPtdZKUVI1Q6jRe3rMzFKexJK1WGJD7qk=;
        fh=ghINlHudOMz+yC1VwJ32875UmLObe8B5U6XAWrjZ1Y8=;
        b=T0FDiYbYjr4w9fuFW6DAmg0gn1L2UiiK/7e6L2cxZ1AIYuSiibtPD9y3FPtcGETm3Q
         XDjwrTlRl1GgBCoBpqif+JmfpHpFPwALKifPl5rDDrQqFcCJ8LGHLvw6YILaiaeK3v7L
         3rNHT0pfKD8LOfXNnV/AuP0BkoWCzC1ILDCplkW1bC8CFLJrSa7LlVsYq0cJ9yZbijBv
         10SUWnerpvPDteqP/7NtCBngNI+K3o8sHLLDrQerlMdbzXWxPzFPeiDrz8gkPlCqetwK
         35S2KFYk211XYue8YgPZN36JmLPvLrHa8sJ6v/2w2Wdm1Xo4CgfQEAX+mlVxVeb/cRWV
         rm0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676619; x=1796281419; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8z4X9d7XTdPtdZKUVI1Q6jRe3rMzFKexJK1WGJD7qk=;
        b=fiIYrwvCBeZKrYtTaJqUYvru4zXLx56SFmsyIIeLyqI6bBd/eZuJrjH/8vUJlyqSeH
         2WvxKxC5xA3jcMB05Fq8ZbZwTwuY9JFfsRVIOx/0yHz5FzGfM8zSQ64YLA6GTbnTk0Bp
         PFHUDxyf5ZbUULgQAEXyD8tTOhGellvjT1GGiCW1McfPoDs4j9cEmzISdp+/VAuqwfH9
         O5VmU0TYYlgOtHRNVRmgCjHv/pgXICsHD3vvctkRl4C+1Dii84GI+1jouEhNTcjAjwQI
         JuVIrMMFTpNAFAY433XxzAzcCH9fXRY6JFdWyixnHVBQGpZoyEWR6reYIqlVYmx2uOTa
         PjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676619; x=1796281419;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D8z4X9d7XTdPtdZKUVI1Q6jRe3rMzFKexJK1WGJD7qk=;
        b=Fei7GxxsNd+7WPKLw/FmLEzMIwXqJwxHtUY5GYTyHR5zmRnZBU/03K1bDpp7VG4Vfn
         I1Cf6xfMGWdTcnpu9JGJBMardp90CPOyqpYI32GR+0wmJ0ERiXdlYY3zQs8O1463yi/x
         eGth+bjCsRw1qqfFlFwImHmjVBYTJWgWPC6ztUC+3IUJ3AlY+fPm0a5PL7BMnSKSbHiI
         WQH9zEJLA0YHTNlmpzvp0TAHeezMrNQW1q/u3CEpPdYj5Ob7PRnXi0RFNZZ8ACHyrbbv
         xx1RxJYk1VMvBjed8+UnQanyzC2m+G4yybUJkCKBqreEpjdtviPqGcLvIRO0HkloyQBf
         nJCA==
X-Forwarded-Encrypted: i=1; AL+hErHy1DwrflIUNPZAzKJ7sK5vFeun5imRvYJDHWg66i4oN3j9pOg+prgbgXnrHLq9EKj3smoYYiqBAq+T0l271L0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9II5IRXbKmXLb5789EtuFMKdKp4dRJ8hMCQG7iFWVhgomvlKNI
	2fVGT83Joa3CFtPyGlV4K4X3aGsbnk1ufFmpA/sXBoinuFFClur23aWjgH8NwPLIiDKIW9csrQ8
	/i0/n7S0H/sg7aaOFHum5LI+lyLz/1w==
X-Gm-Gg: AZFdTZe3NHEnf7nN1g9rSB9GK44+psbhn6c83HljbFQXbT2/8kwK2nT0bmFpkvbQuD/
	leM9eK2kfb4sjfFTJo8jByRD+9T12vYKAtBiup/S81UYxVn2HlvP2fOZmJS7kB3Id7BmX1tZD9n
	i0NE/H3ObOIQifcMZLPH8Oj0u/BP37BXXZvz4BzfsnJHXAyt6WRImLBtEsDQyrQYEIxdLIflfEm
	XD2UMbSbys7CFmBSzwkJxSRTF6PFCysSGjFhXrDOdccgXuRgMudZMrcTgIevx+RttlQUujQiTl7
	ZoumVqb4jbnJKPmtoQYcIiSRLNE06sgcOAYb1ii9F6TMlCP0Xc2q0Pntb6sBWCOvo1ncQJdaVZ5
	ZG1bC+uZ+6I+5Q02e/DphFdjyRxQad+7jfwQ/
X-Received: by 2002:a05:7022:23aa:b0:1b5:23e7:3387 with SMTP id
 a92af1059eb24-1b55688dd29mr28250607c88.19.1795676619107; Wed, 25 Nov 2026
 23:03:39 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALa+Y14BNfdWH3yBY+ky1+Sb0YvRzW=gRcKKyGWWaBQkysPUkA@mail.gmail.com>
 <20261126020416.87656-1-sj@kernel.org>
In-Reply-To: <20261126020416.87656-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Wed, 25 Nov 2026 23:03:27 -0800
X-Gm-Features: Aa3M54pr7zZt1s4Atym5UQrDZXCPmYeOf41IBUKmR70FxfH89wL-58DBqEGqTME
Message-ID: <CALa+Y15wc4bgERo_FEwxL4m-NUjx=_o0yPipUN+ymv7HTSUL0g@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] mm/damon: let users report their data attribute findings
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, damon@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi SJ,

On Wed, 25 Nov 2026 18:04:15 -0800 SJ Park <sj@kernel.org> wrote:

[...]
> This is the expected result.  The implementation is more strict for type
> matching.  If it is unclear, it says the type is not matched.
>
> For example, if filter type is PGIDLE_SET and we cannot confirm it, it is
> treated as not PGIDLE_SET.  For example, DAMON could fail at confirming that if
> it was unable to get the folio for the probing memory due to some races.

That makes sense, thank you for explaining.

[...]
> In my humble opinion, , the user could work around this issue by not submitting
> the report too frequently.
>
> But the more important question is, if the user really need to do this kind of
> frequent report submissions.  I have no clue at the moment.  If it turns out
> so, we could improve kernel side.

Agreed, user reports through sysfs are unlikely to be submitted this
often.  The main reason I tested at high submit rates was future
hardware samplers, which would produce reports much faster than a
user would.  I was checking how the queue holds up under that kind of
load.  I am happy to discuss this further once this series is in and
you share more on the next milestones.

[...]
> I agree this could be confusing.  In a sense, that said, those are working as
> documented.  There is no documentation saying addr_start should be less than
> addr_end.  DAMOS filter design documentation mentions "support of the filter
> types depends on the DAMON operations set".  And the probe filter design
> documentation says "The filters work the same as DAMOS filters".

Agreed.

[...]
> Good finding, thank you.  Maybe we could ask Andrew to fix this up, but this
> might be too minor thing that readers could easily find out themselves...?

Agreed, it is a minor nit; can be ignored.

Thanks,
Ravi
