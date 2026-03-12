Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C834336ECC
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 01:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773279696; cv=none; b=a9gBrI0bV6apRcPx3+v/7WSMjlkM61rXEs0kH5oVvvQHkvtE0+tWbtVOLHEcvwKjSAdvtdoIILKQhdHLhvn6Ehzize8MPJl/1DAwgoyJ4w3zUZGi5C3jTk/yARbOAQwYLG08k6texdoCBXr+ghQcVYapGIU3fBX9odGeb09MjkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773279696; c=relaxed/simple;
	bh=Kjpe0bufYsY03//k8j5lZt5tgyKrAJyQTr+PAoPzhsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYMgkGzusWtx2L0HgOQJdE76Bh1Z4eOugLpRAj3OuS2ZAxl1EbMuobmjIAk+dMDFG8QoOcRy30geqKNL+Hqr00RPFld/xbrben1K1ZbiICO1awF2kWTCANQjIigkwpM6QlbBF03OAwpCCUmiZCICxiRcIn7D6GNvuBvgVZcnjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hyvPjs6z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nC/xzCAc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hyvPjs6z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nC/xzCAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773279692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UPGfLKT3oSZ8YEaztiojC78G5a88HSzUeVHYmBe+bKs=;
	b=hyvPjs6z2VEh62cMtLYAheUYXVV6Kzi4FzC7LjJrDpKx0WzcQFMZ6MCqvKVxl2/sGDZG44
	R12jGF0v20dZx1EtcemEucmiRLwyDpzTzSaAc3ZaLUvviUimsZC0jcS3yQsPCbpPqxYpWd
	ZuTGe8NeBvs6eEY1QVM0bklmdYoHQWc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-_CgJVFcAOeC83On_D1YzNg-1; Wed, 11 Mar 2026 21:41:31 -0400
X-MC-Unique: _CgJVFcAOeC83On_D1YzNg-1
X-Mimecast-MFC-AGG-ID: _CgJVFcAOeC83On_D1YzNg_1773279690
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso2784757a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 18:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773279689; x=1773884489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UPGfLKT3oSZ8YEaztiojC78G5a88HSzUeVHYmBe+bKs=;
        b=nC/xzCAceSNqBZbC0k8CyTHkiImx32ax6UlWxjbQKQmsu3ppKLUk4xiNT/9fz+4veh
         CeFFH35uac749lz5wMEfqUZ4cc+rs6TiIobUJo94YaK4/fRdQZBVqKm3nCYN2bsSVCGg
         +iOIb2pEB7NkFlCT4JPwSEj1VULbBxiSiV8k+xQOdDdkc6XWYUzZUHBQ3Pv2+q/bkiES
         3Ui4YPpK//6e6q8UCs/4e+8YFRfT/nftPtH9VzIc+P/z8KdPryf/Og+rcxoMctml1Hkl
         h7A+5MnRLzWS1l+eKBEs9nnTMoHiYKVyaJH4r/16C31JVTQHO/hsXKIs+VGNsHFKlFBn
         HmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773279689; x=1773884489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPGfLKT3oSZ8YEaztiojC78G5a88HSzUeVHYmBe+bKs=;
        b=L6145EoKnZ4JkftXMRMu9TMgOJcERBZJRAIi9rUSYSb5FBWU8irUicno6X+4whaNGP
         yJeTvZepHX8B2h+82oWjvzezUflEMyep3Vhs3QQfoIV+WzRs6jBubuUG2R35U/7kIdFb
         r2mNnFWIjS7yPnK62Z8C1A4Nuc0wZH54wISHOp6uTzBmOarrKG2wSp4yiNG/GDc7N1Vk
         MHn1wKZ40XB1qkLirMUe7Pi50I0tzGQmSoK8hR/YA+RGj4JO0of48OkPcUtull0UvNpM
         c+wreHWuiMFnTriujnnwIpSo0j6y12QsMbKSeyOxbm5ERYTyuD6+tDabkzZXpw1nRXeO
         8VhQ==
X-Gm-Message-State: AOJu0YxdU6Wzz5FddoT2ZsJ9vVAYuv9+Gj4q/ODWJz0TY0fCgxmeDqS8
	ZH5XH9SsYl5+V0KC2+e3UdvhXLUhgn36qwaFQ3xbQ9Q4pE0zamZuvlIQfWKpVtHVHkCi96HUscV
	BCk6/P5d85HxjeEqryfOwK+3LL1y8uKDYjisfBRC4n0iU197n4KrRMNmYwmooj5APat/RUEG8Iu
	SrjQ==
X-Gm-Gg: ATEYQzzmu8Soz6QLkYvvtRR6kFNCZPFJ60S5MpxqO9JKUMPniogoN4GVY7dD/SYm5R5
	AeKxv1S5jEJkct7ffPXATf77eLTBeG+QYBFFrTEdaJC6vHFPu5g9D/fE3dS7ObWYpj01LWu5cZJ
	CHUZkptRzp/xL71ztV9bRvLdmGvbOkzCKqSjmMHqKGgylB7rUwjJ8YZC4EnIRdsPs/GzZ7B+CBi
	v2kOZ3ghR+9fr9Tfg+OCrhPfsBaw5Px/UNsxJKMcnqeu2XvyCT3k3E15fSvTWI3+ptad0tqicUA
	QFF5KDxyA/PFspF+8XF/kKdiu+lXFlbzyjY1IkCXgoJR7RMHhpys+uVN3Y8opg81OPHYfBGluuo
	LJyb0vGl8kcpOtZcMig==
X-Received: by 2002:a05:6a21:682:b0:398:b5c0:565 with SMTP id adf61e73a8af0-398c60e592dmr4152605637.39.1773279689500;
        Wed, 11 Mar 2026 18:41:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:682:b0:398:b5c0:565 with SMTP id adf61e73a8af0-398c60e592dmr4152586637.39.1773279689116;
        Wed, 11 Mar 2026 18:41:29 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf2725csm3476355a12.13.2026.03.11.18.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:41:28 -0700 (PDT)
Date: Thu, 12 Mar 2026 09:41:26 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosryahmed@google.com>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH 1/5] selftests/cgroup: detect and handle global zswap
 state in test_zswap
Message-ID: <abIZxqi62VPec3W2@redhat.com>
References: <20260311110523.26624-1-liwang@redhat.com>
 <CAJD7tkad2Q5Dt4On91tgsXDcmORYQsBAB-CbM=EY270nJ5y_Pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJD7tkad2Q5Dt4On91tgsXDcmORYQsBAB-CbM=EY270nJ5y_Pw@mail.gmail.com>

On Wed, Mar 11, 2026 at 11:47:22AM -0700, Yosry Ahmed wrote:
...
> > --- a/tools/testing/selftests/cgroup/test_zswap.c
> > +++ b/tools/testing/selftests/cgroup/test_zswap.c
> > @@ -594,18 +594,88 @@ static bool zswap_configured(void)
> >         return access("/sys/module/zswap", F_OK) == 0;
> >  }
> >
> > +static int zswap_enabled_state(void)
> 
> Just zswap_enabled() is good.

+1

> 
> > +{
> > +       char buf[16];
> > +       ssize_t n;
> > +
> > +       if (!zswap_configured())
> > +               return -1;
> 
> Return 0 here, zswap is disabled for all intents and purposes.
> 
> > +
> > +       n = read_text("/sys/module/zswap/parameters/enabled", buf, sizeof(buf));
> > +       if (n < 0 || n == 0)
> > +               return -1;
> 
> if (read_text(..) <= 0)
> 
> > +
> > +       switch (buf[0]) {
> > +       case 'Y':
> > +       case 'y':
> > +       case '1':
> > +               return 1;
> > +       case 'N':
> > +       case 'n':
> > +       case '0':
> 
> Can a read really return any of these values? Or just Y/N?

On my side it just returns 'Y/N', but I use more chars only for
safe/compatiable consideration. Maybe we don't need others.

> >  int main(int argc, char **argv)
> >  {
> >         char root[PATH_MAX];
> > -       int i;
> > +       int i, orig_zswap_state;
> >
> >         ksft_print_header();
> >         ksft_set_plan(ARRAY_SIZE(tests));
> >         if (cg_find_unified_root(root, sizeof(root), NULL))
> >                 ksft_exit_skip("cgroup v2 isn't mounted\n");
> >
> > -       if (!zswap_configured())
> > +       orig_zswap_state = zswap_enabled_state();
> > +
> > +       if (orig_zswap_state == -1)
> >                 ksft_exit_skip("zswap isn't configured\n");
> > +       else if (orig_zswap_state == 0 && !enable_zswap())
> > +               ksft_exit_skip("zswap is disabled and cannot be enabled\n");
> 
> As Michal mentioned, skip the test if zswap is not enabled.

Sure, that would be simpler and we can remove the enable/disable_zswap() functions.

> Assuming zswap_enabled() only returns -1 if it fails to read the
> module param (and zswap_configured() is true), then we should probably
> fail instead of skip, as it means something is wrong with the test or
> the module param.

Absoultely right. Thanks for reviewing.

-- 
Regards,
Li Wang

