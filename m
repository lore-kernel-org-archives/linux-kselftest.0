Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0F4312807
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 08:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388810; cv=none; b=CCy7cf27q0uXuOgti61TGoNw5LmorhD9qJHzPV5OuluKZXUh2GmG/6qslvwbmtcfjBsmH+GqI+We/3/ZKXDWv8hvTT4B/M7kIa1U9+ViCsIypE23mto0/0Yrsw3evdEUTvim4b21MxRQ8wsoP1DfhFB71npT7Wz1qPFg9aG8+KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388810; c=relaxed/simple;
	bh=dhJ7PMyw4LBFr7hpUOj8aPlDG/Pq+Tfywa8ZaPivs7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCoNfZqJst6X/2B4k2Fo1Fbabgj49FBBtoh/qPLNi/f2WvljPZn4U4DUGl7wrLB4Px20oOdrdDByydtirZX2zZZ/0cdsQ270XGVJ8BHSpG7ZJORq7YcOdOe4kgGvYA+pny4AC5KsrED70+xMzLLP65Q7r4cztnFesjOfheJQlBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GXmgzWNG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iOb9tjJz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GXmgzWNG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iOb9tjJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773388807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lUt1gcYqzrYknbcgM6G0CiCCOogoU5FAXbp8MqBc1GI=;
	b=GXmgzWNGxXzyJjaJCuj9fecNkC6c8VH9AXNbNCpIEwXq+N+t/dEEIlo//HiOSHwJ4IIHIR
	OXGL6YNRatnC/gbCGSu4K+Dz6m2dwC6p39dAJUTA+xsV/JxtgDUlNyouSYuMwOhuu1TT9I
	I5/yDpXI+a54hr3s+U/7A7PJppRVME4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-v4lgW4wJMjmH02bX8PmLHQ-1; Fri, 13 Mar 2026 04:00:05 -0400
X-MC-Unique: v4lgW4wJMjmH02bX8PmLHQ-1
X-Mimecast-MFC-AGG-ID: v4lgW4wJMjmH02bX8PmLHQ_1773388804
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae669a8ff1so123412515ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 01:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773388803; x=1773993603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lUt1gcYqzrYknbcgM6G0CiCCOogoU5FAXbp8MqBc1GI=;
        b=iOb9tjJzGu35XsHixsnMBjJ9R1uXiIqFuxKPTyB10EY/2UmbkZ/eFx+a7elTAoJfEJ
         cifTH64I6NcJFzbriIRjuFGt5mu42V5F9zsOTLuwlhNy9BHnPK27G7DDtmhNafHgkbkz
         59ikEMXAPN7geqH4/VbewzBiSlWduTYgWC/XDAGScBC4De8Wax0N0ImGDH4vJjAGvbmS
         mki6ZFtdg/fZALW4jZXJlouvkvWJ6hHPaNziY5d1jt1wJLugSAA+HN8rEIQKpNE9A93N
         2PjGYMVL6CclZjMLm5HqgxKZK34H/YjvzOI6FtXjRIMgs6foZNG0qxP/Ku8MobehrNtm
         /t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388803; x=1773993603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUt1gcYqzrYknbcgM6G0CiCCOogoU5FAXbp8MqBc1GI=;
        b=X0/99B1jb1LSImdHT57aScbllP6p68+OV1jD5RrtQ+hRs7VXzZTntZKwHh2aBaZzu+
         xDGDyJDxUgHUiXsDnk9iU3mDGmAdusgLrRnIAkH5DxLYep+ZJDFZM2L8EgcnNpsHVoD4
         9ZEJcRiAN6kefh5S3H7O5G30F63qZue66Y836i/LXn+A/zyEgK+PeUPcN1qBv4WOWoua
         VwasYWr+gMSEme7NrTnfCpnubq54a/19c5R/PyWEPUoV17ZK9ZiPG+poFmralN4xwxTB
         BtJMxW0CaY/N4gbDfo5QuqJ/HTvEQeOjAKdxSXI05wtoS7iwz/bifL5LH1USj69N9iIq
         2F1w==
X-Forwarded-Encrypted: i=1; AJvYcCV0yR9EVxFq+ZnWN4E+MybIjTSohPcvdcOT/6XMc5jkPicSeMjWeQL10K6SjeoonXnvs2QFdmdw/vMRKma//qk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX4+gkntKGo/LOItD+Sc7863HXEXdnHAOJ2IYwFq3ThWNcQGVp
	sP5exoDRiADGn4wkSCwFpaTBMQBmfK3NgFpdFFJk8+oyAbffjFq1RaDBIQkWO7SbJQg3N9crnV2
	xO1XI0JuKphsmxrJ0gdTB33YVF0MvMVgDIhxkrj59QsIluThdMUDkzTCWz4LAhU9S/IFe3jilkb
	PFwA==
X-Gm-Gg: ATEYQzypUj+GFSNR2Yvo7wRiTNFRmHfkb6we+LwBMyGC3aYch+0slkt4nS6nwh9gAHW
	bYQO7nFiyM1AOd1d9WMPt1tcIE4sCDYtorUgG2iNvOQhCPXbHNWF6KrD9ZtrOWNdZsM3/oVKtu6
	GcUetUxXLv93oaZ93srTW6sEKLdmscvgsVGxH0Bn/icFey2YKyGp6ulGTYaHJBl7jhwbPCo8/pj
	UY6wbFBde98UQus+W7SwF1tLV2aL2A5Pq8GU/K4+Sxr0IToe7ZXBJvxpEnEhxLjIHCU+W1f2ymz
	3EaVbClMQSRHPf1cvVrSAmlYn7yAukmzRoLtlrXlGCFI32Yo8JG3wQ5ENm4IPmWbRR19hZeXzYd
	f+20zIyPRI4FDCZn1IQ==
X-Received: by 2002:a17:903:2ace:b0:2ae:ba41:55 with SMTP id d9443c01a7336-2aecab1f315mr23815215ad.26.1773388803691;
        Fri, 13 Mar 2026 01:00:03 -0700 (PDT)
X-Received: by 2002:a17:903:2ace:b0:2ae:ba41:55 with SMTP id d9443c01a7336-2aecab1f315mr23814895ad.26.1773388803242;
        Fri, 13 Mar 2026 01:00:03 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece825aaesm12117585ad.73.2026.03.13.01.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:00:02 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:00:00 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: yosryahmed@google.com, nphamcs@gmail.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v3 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
Message-ID: <abPEALhYmtBnEULi@redhat.com>
References: <20260313043532.103987-1-liwang@redhat.com>
 <CAO9r8zMsbVHKnCzfQcdtomRMWTNFgTGY4XALxwm+i9m1SUPPvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9r8zMsbVHKnCzfQcdtomRMWTNFgTGY4XALxwm+i9m1SUPPvg@mail.gmail.com>

On Thu, Mar 12, 2026 at 11:34:41PM -0700, Yosry Ahmed wrote:
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
> 
> Please wait for discussions on the previous version to conclude and
> give people a little bit of time to respond before sending the next
> version.

Sorry for the rush. I thought that I had clarified the issue there.

> I think this can just be be:
> 
>     char value;
>     ...
> 
>     if (read_text(.., &value, sizeof(value)) < 0)

This actuall introduce a problem to the code, as in read_text()
that achivement is:

  len = read(fd, buf, max_len - 1);

When 'sizeof(value) == 1' pass in that makes read(fd, &value, 0);
read zero, after that, the value is set to '\0'.

With your < 0 check, this is treated as success, then value == 'N' is false,
the check_zswap_enabled will report wrong status (enabled) on disabled.

-- 
Regards,
Li Wang

