Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CA1356A09
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 02:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283114; cv=none; b=jw/9ui5bV4R3Dcd0Gl7ROQdRkK+TBR8i8hA+Ke4plqN1Kp1S+EC0HzeQpoA1PIsKaa+EDyv5sRZRKujX1E1Oqi9wX8cNHMVP/xnlw50lweqX3lqijLlQgIrnwOsVRZko8e9mYs+OEy9yTM6v74KmRMu1PPhZawV+WAo2G+k7KPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283114; c=relaxed/simple;
	bh=ibTj7/ogzWNpT8G1KdOKKA2OkIgEQv1DtrkfMweq/BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taBMRyPPxdPSMxYnYOSOlydWgxE56TduW2MZUYDrQozP1Qx7YZZu/YW3OaKPuqSn440+fGX7pszChhTwFT91V7rKsb4GIlYhXZ/0VIVGuOcsBl9h61/Cj17x/tuVq3ix2za4fV2Yp0/DOhu4U6U5lkWd00AbrfE5p4Gjl4sxr6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HmObMdae; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bywfVLu9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HmObMdae";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bywfVLu9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773283112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fHllJATiTNFut0Nwy3S3Va7raOdDGK8jrsU6m5odn3Q=;
	b=HmObMdaeWXz3dLAIYTQFOmkfAIAhLFH8r9Tzf+d8slq7ksDDHfIcREf0+8OWIQ852cUmai
	0O3SFJoIhF0Z38PzrgLNSRhAblV6JHa17aid8EgRBXHR/eUy9sxA4QnzycgkhQXjbSJ2od
	7kcVBosV85d7AharwnF/QO+y+UIvWm4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-TYZA9S-wNJm30JaSnzuUhw-1; Wed, 11 Mar 2026 22:38:30 -0400
X-MC-Unique: TYZA9S-wNJm30JaSnzuUhw-1
X-Mimecast-MFC-AGG-ID: TYZA9S-wNJm30JaSnzuUhw_1773283110
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so3708966a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 19:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773283109; x=1773887909; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fHllJATiTNFut0Nwy3S3Va7raOdDGK8jrsU6m5odn3Q=;
        b=bywfVLu9k4dDwDZbZElCEwx40abgkasYXEyTzEWmxpBhpyftf9qLUv/LuRv4TqmGBR
         zvY2Vmu1cpvtabxC1ciGUSIvZ9T91+MgNIf7KmNB/H7dGUgKt41OudCyRGQXf/aH6QDY
         B5FY/0+Y6Swl2yWI/VMCr38Osvjjih0ZxBt/yZ1omg32/OVQQEW/VpiOsV+Bve18njyw
         uqEXrv3JrE1jamvhFcTHhq3ptZgoGR4DlN0vjOvMbNIdv/Mszgd8ipzrix0GL10y8Y3T
         PpPikQrrS4/Q6zqoyGsZjx4glx2FgLQ1Z3Stimy1hw9wD4gVJCK53f7GtBOGmSMIzMCt
         aXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283109; x=1773887909;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fHllJATiTNFut0Nwy3S3Va7raOdDGK8jrsU6m5odn3Q=;
        b=bFcoHqfvcXDySFaj5vj+BXIPMO0juJoV0i2RTvidulrvYYlyfLacqorga6gnCqos1z
         vCYO7MSPJo+mEj6b8MlyJWn49z2wFRHVPqUgCth/cwWYGj0Rl74sJG72ZqGXpnhlgXno
         YHUpTJZFf/LQFuAXbZw5ffH/79r+i5CHmzXeTyUvgmx7XMksK597KNxTsale92QrmigB
         SOy26dL7knJ3noNJUAUq/4hmrcLhUct5pT/e4AqviioYLReXLXV8rNTZtq0RSzVtTTUY
         fnx5E4EeuWU9eUIRWAwQzhCscQl2wdcB1S+i1k+l9RuEiON/qDNcmYDNUWCTj6WsEHRr
         7t2A==
X-Gm-Message-State: AOJu0YwoVUnCk/lgtQO166F4cKofcsvyqesRUXw5+y3lspVAuCo0+7PM
	bk9tbMz2wtcZzvWQP83Mjajxc1D36qF6viufTg6xnW6uYgxhpLMJ33P+HOPfJjD9vbK6ctCMnmL
	meMg+ilK1jMniS5XAtp0QLEFw2dtD0MK9aUt9YzVr0QW2Lkc98HDCC+/Lbtwg4oatGZt8Jw==
X-Gm-Gg: ATEYQzwVlwg53PO9Q+ZEKYukZvPXAvKXF3bu5UZWE94fQ6x01jjJESAqUnrcGm/vJqi
	h+AuIBkOAG9EKZltBl8On6Uzj54wIAjJ9d2oU/KP4vlf6wNipa5l+4cddgdORXy3rvuP+AEYUA5
	UTnKZpaFbBf3tLCY5bONVRJ+LXoFHV01E9adx2iokbZTy6dNXeAiBt3LLXKJfF0BtHRHZ3NLr8z
	kdjRi23kptwaDpiOZIpfeAQ+twW3vx2juo+Sb4/ME7T4kAHWAEGZaUi1k7uTqr8ADhAaJD+IXKN
	ZOZPIAVFRh9r6a4W06TwCkmpQJZFiBqFZaOaXeAI0OADgAdS+TWMyM3NAVanX4YjLrl+EN3etM+
	fsWiF15MsRq3pKKiDgA==
X-Received: by 2002:a17:90b:3d90:b0:356:282e:7eb7 with SMTP id 98e67ed59e1d1-35a0121eddemr4409712a91.12.1773283109567;
        Wed, 11 Mar 2026 19:38:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3d90:b0:356:282e:7eb7 with SMTP id 98e67ed59e1d1-35a0121eddemr4409694a91.12.1773283109239;
        Wed, 11 Mar 2026 19:38:29 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf0e99dsm3151428a12.7.2026.03.11.19.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:38:28 -0700 (PDT)
Date: Thu, 12 Mar 2026 10:38:26 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH 5/5] selftest/cgroup: fix zswap attempt_writeback() on
 64K pagesize system
Message-ID: <abInItp8UXRjTrTt@redhat.com>
References: <20260311110523.26624-1-liwang@redhat.com>
 <20260311110523.26624-5-liwang@redhat.com>
 <CAJD7tkZ8nrb75a7UWGif-Z28ByRPv0tS87hacuyf4L+xDjJ6sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJD7tkZ8nrb75a7UWGif-Z28ByRPv0tS87hacuyf4L+xDjJ6sw@mail.gmail.com>

On Wed, Mar 11, 2026 at 11:58:34AM -0700, Yosry Ahmed wrote:
> On Wed, Mar 11, 2026 at 4:06 AM Li Wang <liwang@redhat.com> wrote:
> >
> > In attempt_writeback(), a memsize of 4M only covers 64 pages on 64K
> > page size systems. When memory.reclaim is called, the kernel prefers
> > reclaiming clean file pages (binary, libc, linker, etc.) over swapping
> > anonymous pages. With only 64 pages of anonymous memory, the reclaim
> > target can be largely or entirely satisfied by dropping file pages,
> > resulting in very few or zero anonymous pages being pushed into zswap.
> >
> > This causes zswap_usage to be extremely small or zero, making
> > zswap_usage/2 insufficient to create meaningful writeback pressure.
> > The test then fails because no writeback is triggered.
> >
> > On 4K page size systems this is not an issue because 4M covers 1024
> > pages, and file pages are a small fraction of the reclaim target.
> >
> > Scale memsize up to 64M on systems with page size larger than 4K, so
> > that enough anonymous pages are allocated to reliably populate zswap
> > and trigger writeback. The original 4M is kept for 4K page size systems
> > to avoid unnecessary memory usage and test runtime.
> >
> > === Error Log ===
> >   # uname -rm
> >   6.12.0-211.el10.ppc64le ppc64le
> >
> >   # getconf PAGESIZE
> >   65536
> >
> >   # ./test_zswap
> >   TAP version 13
> >   1..7
> >   ok 1 test_zswap_usage
> >   ok 2 test_swapin_nozswap
> >   ok 3 test_zswapin
> >   not ok 4 test_zswap_writeback_enabled
> >   ...
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
> > ---
> >  tools/testing/selftests/cgroup/test_zswap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
> > index 30d3fbf6b4fb..2d065184eea4 100644
> > --- a/tools/testing/selftests/cgroup/test_zswap.c
> > +++ b/tools/testing/selftests/cgroup/test_zswap.c
> > @@ -264,7 +264,7 @@ static int test_zswapin(const char *root)
> >  static int attempt_writeback(const char *cgroup, void *arg)
> >  {
> >         long pagesize = sysconf(_SC_PAGESIZE);
> > -       size_t memsize = MB(4);
> > +       size_t memsize = pagesize > 4096 ? MB(64): MB(4);
> 
> pagesize << 10 or pagesize * 1024?

Sure, I will go pagesize * 1024 which clearly shows the numbers of page.

-- 
Regards,
Li Wang

