Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E1332EB1
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 01:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366621; cv=none; b=iGnoN0fOEP2xEldVXq0rwZL0Ahs3POKynXG9mmgYQ8YkiRmTWrjZHqqbvVDzq6FZA/FVWj/X47iTFRAImMSfHu7phC+NuaWcsXZJ27sC6VeG/li0Vcf+fSAG1xjBOhZLkx+1Fy51+MWOgTqh8+LPizrz6RDiJLnGyj3oGH21hVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366621; c=relaxed/simple;
	bh=5+oh1fTVx/qCGTJzIUo21LMERZnPTfVr3BOQL3Ul/e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3eWrDaeQBrI8LodDjkNNgpLnD7SuvmQErgu9cuPY0/lOi5HlbxEILfVAbFB4TLuT5JxvbRGlSb4dyf4kc0bceQLrpozarM6nvXrT2vnJKzmpUOOE83M8TE8FgI01cJ/dDyb6P9oWjyPZff5DfpTPWf51vM5iF8QeKCnEjgqCwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f6iO2DxB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hiE8Na3J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f6iO2DxB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hiE8Na3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773366615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+8qvvOJTfwWE8tG5TRMJ16Dwr1E/YePgvm9DgBu+yJg=;
	b=f6iO2DxBbSdtR5un4FV57aN2TTWj3mxJgS0+AkMERY731nYm5a6afd9pYaN3dzUMUgQ6ob
	N6e4vyD0cJv1CGJaItCel80+Hesjq0ycclIBTeDlcReot9EX3erWp6FKj+R1Ob7yvcEcK3
	lhmkaicbSKLWWoLW+/JS2RNK6LpvK64=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-7MIQ87hxOHigMfRW31Pu9g-1; Thu, 12 Mar 2026 21:50:14 -0400
X-MC-Unique: 7MIQ87hxOHigMfRW31Pu9g-1
X-Mimecast-MFC-AGG-ID: 7MIQ87hxOHigMfRW31Pu9g_1773366613
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7380305a9aso1548148a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 18:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773366613; x=1773971413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+8qvvOJTfwWE8tG5TRMJ16Dwr1E/YePgvm9DgBu+yJg=;
        b=hiE8Na3JFZVKHeBGrunaAM4xguDFKSiJzZwJPeFoaN1QtGsyuE3u0EhyuwwwwzRzhH
         zswoXfn6/jDV2/QhAnyTGx8cAElsy77pAoWFewpDdIV0hb4aIUTEPo3G3lM4UCZl8NAO
         l4FPdoGhoRhzjfPAZ738PyQvz2OdIEfUKMv55LXOYaUdLJBSs7mC74YauHPiQJY5Pu2D
         9I3pk93s9Nw3VcIboo80rv9ldMIua9qei9QW/MCf+ar8YSIg2WcXvhzl5BVggSuKlCOF
         LJFRICZE83Nxi0gz2eh1FKIUxgpLA6DPn/6kBr/ovfziE+8IZDWZB5Ca+JI/rbqRovy6
         H5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773366613; x=1773971413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8qvvOJTfwWE8tG5TRMJ16Dwr1E/YePgvm9DgBu+yJg=;
        b=HbXwUHMG6EbIwczglPWbT2ftuEaGD6nHxCvb4twaHKor9aTT9fkCkVB/qskeDyTXtQ
         vCOqarHXQpJaZyOsYyMRivi0UKBE1fSz4/YNJCWg7txOlGrrqthCx5lnnOdZPugytXSx
         RmcfGMAd98iAejt1ozDJL74NhT2371+gTfxharCDCQWnECVMqSlSShSWO4rDKHWzID5g
         A8j5Aq4bcRGtwTD3NqotIfdD4/mqmxTk0hJzOvGSFSPghOUibNT+yh33B7jgSmhGex4h
         lt6QuHYvxF0/lgocr9xhoHuAt08mXlfpYfnOHHrDzQiI4vdoL7RVbAych+Espj2SizM0
         pUpw==
X-Forwarded-Encrypted: i=1; AJvYcCVMr+S4X7sVFf3k6UVgPrvI4nS5wU6NkqLEmihZYr8YKKajCV8xuoh3XC6FhnUmI7/vhXSNMhbUuVuETaXIsh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBB3oZ/POuEkRN78pZpeXvXlXHCmRrXoEmVFlHMouqdJBl9saB
	+7ZouZqX34boDuH0smZ2aWofY3s2OTd/ZQcbaD742Xr2/nf+hI/fU+zW1fqRF6RfQ4Kxm3/XygQ
	UKqQSQNxMMM/Z8IwSubik28FqpdYSaHRuwFRs/XI1LvLh39yGKl/mk5ceBkug7qGnv0Bwdw==
X-Gm-Gg: ATEYQzyEZDCpiy2f7Pa1ZGKXafZZ50NCPovoPgfibTZoyQ5p/0XubqRraf0s8c5M6CB
	WcADKmoFcqD2MPs9TvwXVSqb1PXpRU1lJRJgRR/bLem+XgTVvDdjZYXjGgmtvAJeA+Vx185vFwM
	YZvGPdv+kYq6IGepyhMyAFzn2wymgXq09u4fY48xMtmA1vTj5Jd7UtmrRWk6aNOStTYKPEuC/3j
	sRV8bi4vRRnV4aU8QhS9y1TKgxAuHyQh2MmtMZHR+BjLOupCIx6iGFNGfI6rPAChmn9bflbQQCf
	iovjdj76Bxmx4OT30MANjmJzszyZc1DeiKxI3svsgPb7ghqeiCn5+48WZeg+sOrMiWGg65FCfXC
	bKvKAiWbw+CUgNjzKow==
X-Received: by 2002:a17:902:f542:b0:2ae:5628:a180 with SMTP id d9443c01a7336-2aeba5594c1mr45919115ad.25.1773366613153;
        Thu, 12 Mar 2026 18:50:13 -0700 (PDT)
X-Received: by 2002:a17:902:f542:b0:2ae:5628:a180 with SMTP id d9443c01a7336-2aeba5594c1mr45918945ad.25.1773366612701;
        Thu, 12 Mar 2026 18:50:12 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56c2b9sm3981305ad.18.2026.03.12.18.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 18:50:12 -0700 (PDT)
Date: Fri, 13 Mar 2026 09:50:09 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>
Cc: mkoutny@suse.com, yosryahmed@google.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
Message-ID: <abNtUReAUHT6j9Rn@redhat.com>
References: <20260312040627.55257-1-liwang@redhat.com>
 <CAKEwX=MqyGQSMuVCSWmhKfHju5uHBe3ySQEgK9XuKwCvpL4x8w@mail.gmail.com>
 <CAO9r8zPmV8v0tiQvn2xFqX8F2oU23mfbVK67nxMO3QKt49kJeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9r8zPmV8v0tiQvn2xFqX8F2oU23mfbVK67nxMO3QKt49kJeg@mail.gmail.com>

On Thu, Mar 12, 2026 at 02:09:30PM -0700, Yosry Ahmed wrote:
> > > diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
> > > index 64ebc3f3f203..ec64daaa2f5a 100644
> > > --- a/tools/testing/selftests/cgroup/test_zswap.c
> > > +++ b/tools/testing/selftests/cgroup/test_zswap.c
> > > @@ -589,23 +589,41 @@ struct zswap_test {
> > >  };
> > >  #undef T
> > >
> > > -static bool zswap_configured(void)
> > > +static int zswap_enabled(void)
> > >  {
> > > -       return access("/sys/module/zswap", F_OK) == 0;
> > > +       char buf[16];
> > > +       ssize_t n;
> > > +
> > > +       if (access("/sys/module/zswap", F_OK))
> > > +               ksft_exit_skip("zswap isn't configured\n");
> > > +
> > > +       n = read_text("/sys/module/zswap/parameters/enabled", buf, sizeof(buf));
> > > +       if (n <= 0)
> > > +               return -1;
> > > +
> > > +       if (buf[0] == 'Y')
> > > +               return 1;
> > > +       else if (buf[0] == 'N')
> > > +               return 0;
> > > +
> > > +       return -1;
> > >  }
> > >
> > >  int main(int argc, char **argv)
> > >  {
> > >         char root[PATH_MAX];
> > > -       int i;
> > > +       int i, state;
> > >
> > >         ksft_print_header();
> > >         ksft_set_plan(ARRAY_SIZE(tests));
> > >         if (cg_find_unified_root(root, sizeof(root), NULL))
> > >                 ksft_exit_skip("cgroup v2 isn't mounted\n");
> > >
> > > -       if (!zswap_configured())
> > > -               ksft_exit_skip("zswap isn't configured\n");
> > > +       state = zswap_enabled();
> > > +       if (state == 0)
> > > +               ksft_exit_skip("zswap is disabled (hint: echo 1 > /sys/module/zswap/parameters/enabled)\n");
> > > +       else if (state < 0)
> > > +               ksft_exit_fail_msg("Failed to read zswap state\n");
> > >
> > >         /*
> > >          * Check that memory controller is available:
> > > --
> > > 2.53.0
> > >
> >
> > Seems a bit convoluted. You ksft_exit_skip() for one case in
> > zswap_enabled(), but return some value in other cases. This value is
> > checked in the caller (main()) and then used to decide whether to skip
> > or fail as well?
> >
> > Why don't you just consolidate them in one place. If zswap_enabled()
> > has no other callers, let's just open code it, yeah?
> 
> Hmm I actually like having the helper. What if we move all the
> ksft_exit_skip() and ksft_exit_fail_msg() calls inside and rename it
> to check_zswap_enabled()? We can also just read one character:

Yes, this looks more tidy than open it. I'll go this helper in v3.

> 
> static void check_zswap_enabled(void)
> {
>        char value;

read_text() requires string but not char.

> 
>        if (access("/sys/module/zswap", F_OK))
>                ksft_exit_skip("zswap isn't configured\n");
> 
>        if (read_text("/sys/module/zswap/parameters/enabled", value,
> sizeof(value)) <= 0)
>                ksft_exit_fail_msg("Failed to read
> /sys/module/zswap/parameters/enabled\n");
> 
>        if (value == 'N')
>                ksft_exit_skip("zswap is disabled (hint: echo 1 >
> /sys/module/zswap/parameters/enabled)\n");
> }
> 

-- 
Regards,
Li Wang

