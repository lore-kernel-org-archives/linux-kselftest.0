Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2843914E1
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 21:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298523; cv=none; b=U8UFCCxPXuKdydkm8sBWyOqZQJEb05k74z1sEf9Qs5wvcpzE1wG5oVbGFHEw7YlkEILL9mqYovhONgYOrhUQt2VeYQnor4SYpQuzcjDE3jFPaSfZBecapHUwnbjWuW+7IGbri4Cl4dponLs+KGHcuPFv7au0h1br7yLm3kw2ZXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298523; c=relaxed/simple;
	bh=NIl2SpJoXWgkNOAN+Yj632DNwtSCaFq/3Wl4BgGWVdI=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=ef3LWPyC+8kcdMbfQsI0mKDYJLduLNUCC0I3TWCSAgCBwAH9ds6oPgAcQHEkpg2uZrbxdgg3RclepR74+DvK4Y9iZNDqlFjeBWfeUL6outtJOJfNn6wSmeLPh8AfeToFb+nKqEo1BVXLYhZM5ttW0NblHOl1qYSKBfoFch/GW80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=TZTTbXNV; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TZTTbXNV"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c2a449c57so3095241cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 14:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788298519; x=1788903319; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGBMA70aQ29OFSgQVpxK2CgFIHiB2+n9s56OX+rPnLo=;
        b=TZTTbXNV1GBoLhQzNVVFAqP51wY2bVecRAu/Yb72azxgkJAbxLMUH192k4QN5oijne
         c8LcljnZk8CfGjLc8LXxRXMoH+ftB7q8IYCqm2BHDc8NdfWo9v/baQUyO/2TWbsTGeDp
         lKg/Nkj6JWGN/xi3QnSWPoUabrw4IzZnTMglp9HYwZLlH/3d1bKhbeYj45o+3We0uiYE
         2V+94SQzePAZCIFNT1puqsB75XZdpOvGqrPQx+ZcSsGnvctUdUhAp5PyEWauiwD+k/Iv
         MQ1gO/PUOfPD34q063J68CmxhH5yppR/IwyWMVK7AfWK8nv8X/Yk3rpzyM2MYh1SiHr9
         n9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298519; x=1788903319;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGBMA70aQ29OFSgQVpxK2CgFIHiB2+n9s56OX+rPnLo=;
        b=ClsuIwsQrxQ5xVXk7tH1El5S1auKvlOyfQ5Ic/gJ1l2vWlUWCqZWG6u4HSAUYLC8Zp
         e7NLrzPvif8braA6ME1mBkEwM9WDO/zdrJT5XwVUoh9GUR7M4XT4NUZMxMVx/QCtx4Mq
         8dzOX0K73+CbnjW88R+pSJwHCbUjw1rWj8gIvPmeaLwNMIMPO33zda35MwFojpszHBFs
         eNEAb83DgCWdxmjbQBELdFAH/Wkf8KUxm636zSXPsILWWbwpfFZ4AOneyWg9uMYAK46H
         yxiRmfZdnaFP76+ZH9naiEZJJ4o2Rfseav8DAPFoxabxw4YXvfaJghyhIq09+u3KoBnP
         36MQ==
X-Forwarded-Encrypted: i=1; AHgh+RowbZp+TQ3RlzHqBzC/PEYCNVnN6AJ1WSEi9Y9ZFkSN/oxaApBnjd+SQEOdPQJ5zS6T9/auoWTDyweug6hhgj0=@vger.kernel.org
X-Gm-Message-State: AFuF++n2PE9jEQ4w8UL42xABGi9RiIsPIe3tJPir9tinGf9NGSwkILK0
	2D1av2R5GDW5ixtZthDVEttulOwVbh2GiPdofBvdCHWMLzOz9DMsFVn4Zkn8CLfMQg==
X-Gm-Gg: AR+sD10kMkz6rPPVkJcqJIMBGZdqUxRqIBPGDhsXjI1v1TPBXbBuAtCHFLoNycdpyIt
	pqbDPH9biosY4yPcnRlqMbNoQ9qLU5/sm0KP/nv5Wi+mX2tiNnYySJkRMeF5+1BNaFyziyviBUy
	/mWoOb2Pg+HF1yg7p91+guULr1Tpya0z1Kt2Es1BCNulGV9L1HeQ3FK0/j20yDLLj5I7DWatTTd
	gUG5a8YjJxy93YEg8dyyfCGl3DclgEBWJNZvM6LwwEqvfG3J5zueYCG34+2RHK0C9fshB/1qFba
	LVgLsmtH/RK8Kks4KgokDCutZZ9EmwuIcghsUJK7PbD7Jm7AsnvOUA3Keb6FMlY3eex/Kj6lP8B
	+eYyxBNkI1rsWo5+pNlms4IDPL/OLt0gpF2QyXyw7ILxVTsgM4v+3eB8mLYellrhmhRj8whUJmg
	dgBDLZJ76XbmQ0ttivYt2/y+O8FV3yAFG4eJWUCr6++TDz0Z/+koPlSPpzYoeWof0loiaYHqau3
	3h4oKs2L6h/CtmQi43VDmA0wXA7BYA4U2LALI90p0Ck
X-Received: by 2002:a05:622a:259a:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-53021c76193mr177282351cf.25.1788298519454;
        Tue, 01 Sep 2026 14:35:19 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331dc455sm5474491cf.15.2026.09.01.14.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:35:17 -0700 (PDT)
Date: Tue, 01 Sep 2026 17:35:16 -0400
Message-ID: <23b54475e31ed2c5248650d5aca830f5@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260901_1121/pstg-lib:20260901_1604/pstg-pwork:20260901_1121
From: Paul Moore <paul@paul-moore.com>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>, Shuah Khan <shuah@kernel.org>, Eric Paris <eparis@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Amy Griffis <amy.griffis@hp.com>
Cc: Stanislav Kinsburskii <skinsburskii@gmail.com>, Frank Hofmann <hofmann@deshaw.com>, Noah Orlando <orlandon@deshaw.com>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, audit@vger.kernel.org
Subject: Re: [PATCH 3/3] audit: Skip exit filtering for syscalls without rules
References: <20260806-audit-v1-3-ddd0d94ff0b6@gmail.com>
In-Reply-To: <20260806-audit-v1-3-ddd0d94ff0b6@gmail.com>

On Aug  6, 2026 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> Audit walks every exit filter rule for each audited syscall, even when no
> rule contains the current syscall number. Policies with many unrelated
> rules therefore add linear overhead to otherwise uninteresting syscalls.
> 
> Maintain a reference count for each syscall bit present in exit filter
> rules and derive an aggregate interest mask. Update the mask through the
> centralized rule lifecycle helpers, which cover explicit and automatic
> rule removal. Use the mask as a lockless rejection test before entering
> the exit filter RCU traversal.
> 
> The mask is architecture-independent. Syscall number overlap between
> architectures can cause an unnecessary scan but cannot suppress a match.
> 
> The aggregate bit must be set before list_add_rcu() publishes a new rule.
> Otherwise, a reader could observe the rule after publication while the
> aggregate mask still rejects its syscall. Move audit_rule_account()
> before the list insertion to provide this ordering. Rule removal already
> uses the inverse safe ordering: it unlinks the rule before clearing the
> aggregate bit, so a concurrent reader can only perform an unnecessary
> scan, not miss a rule.
> 
> To measure the effect, install increasing numbers of distinct statx rules
> in a disposable VM and benchmark the unrelated getpid syscall after each
> set is installed:
> 
>   for nr_rules in 1 32 128 256; do
>           auditctl -D
>           for uid in $(seq 1 $nr_rules); do
>                   auditctl -a always,exit -F arch=b64 -S statx \
>                            -F uid=$uid
>           done
>           audit_bench
>   done
> 
> Without this change, the same unpinned VM produced:
> 
>   1 rule:
>     median=55 ns/op
>   32 rules:
>     median=71 ns/op
>   128 rules:
>     median=428 ns/op
>   256 rules:
>     median=791 ns/op
> 
> With this change, it produced:
> 
>   1 rule:
>     median=55 ns/op
>   32 rules:
>     median=55 ns/op
>   128 rules:
>     median=55 ns/op
>   256 rules:
>     median=55 ns/op
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  kernel/audit.h       |  2 ++
>  kernel/auditfilter.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  kernel/auditsc.c     | 13 ++++++++++++
>  3 files changed, 70 insertions(+), 1 deletion(-)

We've had similar proposals in the past, and I'll say the same thing I've
said in the past: I'm not certain that our answer to filter performance is
to add additional complexity and filtering.  It may turn out that an
approach like this is the only option, but I'd really like to see more
effort put into improving a singular filter mechanism (either the current
approach or a replacement design) before we start layering on additional
complexity.

--
paul-moore.com
