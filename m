Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5484B3090F5
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 02:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773367329; cv=none; b=tmTr8pIgS+U6ftuxrfLfzD8o8mfMEk+FDi5yaTbedRhj59E0OO9zOrQZyFqXh2kFusKPtgkAWlTHYueQT2KGZQGIr7mIvAMCqNmqdWXuvbRWe2ZxJVbt/wHdkrVmwAwuz2MbTH3HpgHzxS4+13AXEnlMRonOL1e6TLIdwYsEI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773367329; c=relaxed/simple;
	bh=3iI8YKcll+/B87H17WLmZJZ1SjoiUwup1pAGRWaJyp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avCd7y6VJ7QEmHeeuhYH1lW5/JrjgqBQsk7/lRQ3EwRsI9nUip+Sxro2yR4qfTjmTVkN/Reotbdid/hxscLPf3fY8RYdqs9vhAHODjjg/kDKx2I+YEDUhxtjm7LWu9PiT3qVP+PRRonop8km+6XOgvDDi1eK9fqHbMULrYIrVs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xx1XSjtX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CrS50L61; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xx1XSjtX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CrS50L61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773367327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAyhRnlNpUnX5VzPdhg0Qd00rbCwrg1BNtte72JRAqE=;
	b=Xx1XSjtX6UaTqrO0Qm5B6zBhSXKgwQvPGybz52Pj2IWVLUlmX8GStoobOieqidcwyANWEM
	Zzq4DwBeRNGRLkTDa81A1T/xkSrshQd+61u9W25sgM0dAwzZUHpX8PCW2Zf2qYuRjWEae2
	xgZSv0dRaQ012Xav9e8KYKv1Eno6Hr0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-xzgsrN4LOaKpRMFxmjqtTw-1; Thu, 12 Mar 2026 22:02:04 -0400
X-MC-Unique: xzgsrN4LOaKpRMFxmjqtTw-1
X-Mimecast-MFC-AGG-ID: xzgsrN4LOaKpRMFxmjqtTw_1773367324
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829b6b22dabso669507b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 19:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773367324; x=1773972124; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UAyhRnlNpUnX5VzPdhg0Qd00rbCwrg1BNtte72JRAqE=;
        b=CrS50L61clml3/pls68jPvWYH8LjBF7Tty/rgkz40Mg+qqhqJgo5aZ07c+czihWM+g
         7BwP0xura67Hk/mqOVMoYUwM22HjZJoNzLTppn+tZMWLPdqPB1iWIHDrF/p9H8l4hy2P
         e95INCYKsu2+wxDWRv2y9wkLoGZtlk2QoZd3HYjYqBgO5AyJx9bJ70gYo0wmhv0bHsnA
         YTA1+2hplGCjHb/fnkSg+PLopaB/U7kydJxU34jYs9x4esrMx2z3dXXRpIFxiflBxSyE
         PEklufPR0u48oh53yuQ1meAp21I+kCT2wkpYKxmG9y3R9p81JL/nyZJS05HTJKFF2C5+
         Y5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773367324; x=1773972124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UAyhRnlNpUnX5VzPdhg0Qd00rbCwrg1BNtte72JRAqE=;
        b=lkfZ/ljJQCW4jNoYw4xBBtEVeIMljoB+j/27aRjytGb4UOxiOVxGOJ6zMKMab9am8p
         ajY7Pmdmfc2Tvs+8Ca+wZErxF7c+1p9x5hbp8aeoLW5PSGsEwm9nhz5gcbA3/e81Lmlp
         7I/MmR74jSSg5zBE/0QUFrvLt4gcbKLYpatcXC+wUnXA5RvhgRE1PeEq1P/DqzHBLkcP
         VBv6YgdGUrEH+hDnGgStxJgPrNgUFucZwgtoN8KTq3L7wbed/S/y3a7glqaIiiBZZPbe
         SUZyqyoZpUpJUIYee8xIE/mxygul2rgX3GqJAy7FDeSMGexJ8fIP/SGqzeKoQZuP1/Cc
         kXsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjeMCv5FLO6wTQA0TZM7ZCPVONK1OYDxPSuu9yJJ9/TcsuU+DsfsLDHa7QIq6xIYnWRQykzYIMLAW7OGIA0rA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbmPhIdgXVJWL2Cgkn0Xal4H+UJgp9SVdJ3cKum5+hr21t+x0d
	m6r63c5dvb6ojhkW2GTGs3xedMtbws9nXNnOb4UISExJfwUM07WqzeRf2ISfG+sRtKG/bV4ojOD
	RhhcLTDzOk53RcI23eoH4VtOe0uYrrKjt47SM1IzjRDA4JAYsSTN1VpC9AylDhqAsKALQDg==
X-Gm-Gg: ATEYQzyZcpsLUTc64l4SiYj/NupfkUokSttmAq7hs213lbiEOeVi1JG3tFjpspy7qLM
	U/PTpbK6iFvrsFbT/kVzzvwPGP2qrlsbgGCJuYC+OK03dSbfCT1YZZ2OjufRw8n3pM9VgTWJLgp
	Ikb05swPNwPt1xzS649Zb5yU/5BJdZruapGHu1+ja4B12Chb99L8/XangTz9zvqjtcvtsr+jeD0
	guAovEA5sKM444HZwumxMOIPT9CtUSUYxWP6H/io1sgmPZs4KvOh1VrQMSDCtdOBFZultqcAqS/
	RsG7LAPxOv5kuE0+bcrzdpboF4U0d7UOVEokbAGPFcCx7o4sL58rY6t+waP4hwoP/38B2utO7pI
	HuL2MCF3UGMSS02vs1w==
X-Received: by 2002:a05:6a00:a04:b0:829:809e:897d with SMTP id d2e1a72fcca58-82a1972f06bmr1306954b3a.26.1773367323681;
        Thu, 12 Mar 2026 19:02:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:a04:b0:829:809e:897d with SMTP id d2e1a72fcca58-82a1972f06bmr1306911b3a.26.1773367322868;
        Thu, 12 Mar 2026 19:02:02 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725e0cdsm4299766b3a.16.2026.03.12.19.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:02:02 -0700 (PDT)
Date: Fri, 13 Mar 2026 10:01:59 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: mkoutny@suse.com, yosryahmed@google.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 6/7] selftests/cgroup: replace hardcoded page size
 values in test_zswap
Message-ID: <abNwF8sZaGEda-XJ@redhat.com>
References: <20260312040627.55257-1-liwang@redhat.com>
 <20260312040627.55257-6-liwang@redhat.com>
 <CAO9r8zNfR5Z3g=SkU9-eEeA-DDY=rp0Tcw8sXKYDpkZtJtQ0sQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zNfR5Z3g=SkU9-eEeA-DDY=rp0Tcw8sXKYDpkZtJtQ0sQ@mail.gmail.com>

On Thu, Mar 12, 2026 at 03:44:09PM -0700, Yosry Ahmed wrote:
> On Wed, Mar 11, 2026 at 9:07 PM Li Wang <liwang@redhat.com> wrote:
> >
> > test_zswap uses hardcoded values of 4095 and 4096 throughout as page
> > stride and page size, which are only correct on systems with a 4K page
> > size. On architectures with larger pages (e.g., 64K on arm64 or ppc64),
> > these constants cause memory to be touched at sub-page granularity,
> > leading to inefficient access patterns and incorrect page count
> > calculations, which can cause test failures.
> >
> > Replace all hardcoded 4095 and 4096 values with a global pagesize
> > variable initialized from sysconf(_SC_PAGESIZE) at startup, and remove
> > the redundant local sysconf() calls scattered across individual
> > functions. No functional change on 4K page size systems.
> >
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > Cc: Johannes Weiner <hannes@cmpxchg.org>
> > Cc: Michal Hocko <mhocko@kernel.org>
> > Cc: Michal Koutný <mkoutny@suse.com>
> > Cc: Muchun Song <muchun.song@linux.dev>
> > Cc: Nhat Pham <nphamcs@gmail.com>
> > Cc: Tejun Heo <tj@kernel.org>
> > Cc: Roman Gushchin <roman.gushchin@linux.dev>
> > Cc: Shakeel Butt <shakeel.butt@linux.dev>
> > Cc: Yosry Ahmed <yosryahmed@google.com>
> 
> It makes more sense to have this patch first, replacing all hardcoded
> values, then patch 5 doing the necessary changes on top.

Make sense.

-- 
Regards,
Li Wang

