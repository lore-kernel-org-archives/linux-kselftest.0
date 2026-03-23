Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F91F38239E
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256041; cv=none; b=CAjzaBNqVsjKdSoH72f2crVTTR3dYvqfX6SyomiVJjBqjwUaLmlJNbP30adEkd1lZwTC5oCtB2dtlfAp4jY9mS7B6W2r9y+PNxmu2z/5H/Ty1oX5dXg46sVb+I9TJc6fOdaNds4G3SynCd+FIvAr+yxf5CwAqWrVU8uEWgax1x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256041; c=relaxed/simple;
	bh=hThO1A1C8Xur/ZEGkwiOiLhsaE2lKnkvWmC7Eh4azQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMxcnfBfhJyMupteMrM2gy5Dy3310MrPqN9/6igGKJLslRO/dCYusplg3ea35Eit344i+boaPAc9Z4xt2Rfnc7KUgiZrGFN2mYHyaQooK948M6FLcPMzixWF9RPohiXiYg0lBGCKibo/ThORF5m1fCDEcDGagasUFlYKflANKQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VrRxfKj5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mPCSK96q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VrRxfKj5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mPCSK96q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774256039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ogcl2ZAquuYNoAzauwvXFFTaynrHJWtFRV3iycnT4gM=;
	b=VrRxfKj5UFbJU/dhj/ZQwQN/Ec9FnakNUXBcNCibgDRmjzgq03kdXSQ/TZmC0Fx76dSIp0
	gdrMV9HSBqy6zOqtQ77xpMrIPezLX5UP3QMXjEPi50KrwS6Us9XYgeVDLE2+AJjTQzk2bc
	PvlFHfjREawMfCwjvGBWtf/XymGen/g=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-Vi2OAp-9NSKffzB0-HKfNQ-1; Mon, 23 Mar 2026 04:53:58 -0400
X-MC-Unique: Vi2OAp-9NSKffzB0-HKfNQ-1
X-Mimecast-MFC-AGG-ID: Vi2OAp-9NSKffzB0-HKfNQ_1774256037
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358f058973fso5707967a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 01:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774256037; x=1774860837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ogcl2ZAquuYNoAzauwvXFFTaynrHJWtFRV3iycnT4gM=;
        b=mPCSK96qYFs307uVXfmXc2YWal8UYRqhCsgm780ZuH+wG749Ke6GcOs+vG4NwMXzyn
         j8/s22LJqxVdN9xrPIrwoCjpmOeZvHma6n4xk8Eha20A1mx4Zxl5WYN64tCO6Julgdfr
         VwsXRcBwN0gmjNNeknBgMwFzjgLYnSBSxxbamExjTCXvcCJEBI17snT7HsPYWjSQp9dw
         h84pIPYi6rd0fRhmYeUlaRjyoO0LevwyOXUU/4B6AOrXmT28Orj2vWv13TfdlbqurV/P
         MFYovqwBJSlhFzPppUiwySvxE9CTZgQ3ooUMIeBJ1KnljisHjWLHzLe+Bq+YMAO3OIOA
         RQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256037; x=1774860837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ogcl2ZAquuYNoAzauwvXFFTaynrHJWtFRV3iycnT4gM=;
        b=AdwWVBH2YkiVA3svdNULpWPLSU+e+uMvqo4b0eI/pEjXp+O0J5UOp4i32FvbEYmB4c
         tg8cxt+UufUUFJVQtklFfC7Kk5Dbyfffydykfw4AWOeMwl0mox2sZ8NLRc33NEA1FXRt
         DdwMeTdXAFdjlsOxxSEx8N4U3/t2bOzJ/HGshyXEU7Sg8j0eLi29KU43DZ5lKRk8AE7v
         DrHmXdnKS5CAbUM2sv0n5qLr7prCOFgrs9XvT2QLxpqncs1kB0ilAHqvHsgNtW34DCk1
         48hAiEbqL92870qCdgYgBQpKXfAEa15Ivq7l6RikYTGHI5r/v1bS1L338oMKBjUzYuHZ
         KBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWxSdyOE+pa8pL4Vfl65KodKU3kIO8QcqFbVLbZZQZtSTbTgVpV4fq7xyFbrRwaJsPkEBS87RZrhsT7FxOHmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwePOU1UZQFm70vtQ0hYo9s+NJtjrAgyjvvhqn96NtvaJUjU1Z5
	MbDh4uCHiKkMbVi6iMnMAp38kEu3j6k6xX0vmBkp4dVDAqvwRM7Js8Kh+Q9vFqXHcYA+geMbTNP
	4wbeyyzmo28PDyvQikAZTkg7EgxahEaK3KCbZSqbzL8qXQzReTo2yrteyrq+rbjNeASLAvg==
X-Gm-Gg: ATEYQzxTjFEnXohvnygmb5TIBeCDIfMwAoaGpqSUrxIFN59iPoud8nkDbep37WJgx12
	516X5W+ptjJk+Y8hdLgue7RfrIIcumK1m0H+j5nWmjGr2wmRnigYt+sluWfecwtsDLyIpkvSwiA
	6uOMOfri7zPHtp7WCUTvJfwhEOpVyBplEXI1+2dB4wfKbNysg6unLgEtpE22Mr2H3eAf6v1BC9/
	itEXLeAjkdqcxco1bmZra7Jay3ghbFhu8qj+JEtizPVovykEc8AWNl83f7X/cRsMwqdOlNwponn
	c6TsPC2N4mPxeT9NVCYPY9N4w5ZC2zKi8mKrQARow5+kosUH6oLb5EN9hGbOa1V73YDVJQFEq6N
	I4u4GN4Sl/AVkn6Nk0g==
X-Received: by 2002:a17:90b:28c8:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-35bd2cb1ea5mr8848388a91.16.1774256037064;
        Mon, 23 Mar 2026 01:53:57 -0700 (PDT)
X-Received: by 2002:a17:90b:28c8:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-35bd2cb1ea5mr8848368a91.16.1774256036672;
        Mon, 23 Mar 2026 01:53:56 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a7ff529sm7219812a12.2.2026.03.23.01.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:53:56 -0700 (PDT)
Date: Mon, 23 Mar 2026 16:53:53 +0800
From: Li Wang <liwang@redhat.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	James Houghton <jthoughton@google.com>,
	Sebastian Chlad <sebastianchlad@gmail.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>, Li Wang <liwan@redhat.com>
Subject: Re: [PATCH v2 6/7] selftests: memcg: Don't call reclaim_until() if
 already in target
Message-ID: <acD_oR9CmOkQFBZL@redhat.com>
References: <20260320204241.1613861-1-longman@redhat.com>
 <20260320204241.1613861-7-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320204241.1613861-7-longman@redhat.com>

On Fri, Mar 20, 2026 at 04:42:40PM -0400, Waiman Long wrote:
> Near the end of test_memcg_protection(), reclaim_until() is called
> to reduce memory.current of children[0] to 10M. It was found that
> with larger page size (e.g. 64k) the various memory cgroups in
> test_memcg_protection() would deviate further from the expected values
> especially for the test_memcg_low test. As a result, children[0] might
> have reached the target already without reclamation. The will cause the
> reclaim_until() function to report failure as no reclamation is needed.
> 
> Avoid this unexpected failure by skipping the reclaim_until() call if
> memory.current of children[0] has already reached the target size for
> kernel with non-4k page size.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

