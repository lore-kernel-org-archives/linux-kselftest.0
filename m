Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D30284B25
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 05:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933796; cv=none; b=BYRHiaj1yTeXsawcwFLx10njy38ilRTfH2LozqtTWD3ISaQvhuYhr8Culb60zMdOWXAuLtNhWY6QsO9mh7MydGvA69LmX5lHO8p78fpyctVbZpPwSpVl8zaxVAd6AJAy6wX8/0j7V1P/OoiXWFtkHpThoAWxyrswdgcpOUj8pig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933796; c=relaxed/simple;
	bh=VqI0qmMA7x1ZQDTkGxD/iMgv7r7uMkbJZHvfiWsYZ2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/RC3BZm6H+jmxvGK1BrSTDOPaB5e8zX2IIiuvPpq7DP4McGlWxayX4/J4C2qlIYK0EmTPqrYgZkixvc+S6qOfRytRYIfrVJpqA2MysTURYjBYYz+FrOEFnOjAil9XxJJb0KPSUa/xFaWC235/pw9DyfkSYRPlFzHPxaYSAJjVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eUU5gM1k; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e5zfqKpp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eUU5gM1k";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e5zfqKpp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774933794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FW3IFPPj9g7rG2hQNdFw4endj2uGmuszkMfYA6NeQeQ=;
	b=eUU5gM1kQD9T/NRrf8LWwJYqZvr525kibfBMIjFmFLo+rQnXGz4wadWQelwgtapA770/9t
	Cyj4FOs+0CJw02paUcA3tzUWevJt6N1amZNOOIenZtwcJHCd69DVRzRQlGmeTiwrg3cGrz
	LGz15s89Z8yFo8FAdyGeE2QU87B1Iy0=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-nHW_NeiEOoGE_frPG1ckpA-1; Tue, 31 Mar 2026 01:09:51 -0400
X-MC-Unique: nHW_NeiEOoGE_frPG1ckpA-1
X-Mimecast-MFC-AGG-ID: nHW_NeiEOoGE_frPG1ckpA_1774933790
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso3931716b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 22:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774933790; x=1775538590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FW3IFPPj9g7rG2hQNdFw4endj2uGmuszkMfYA6NeQeQ=;
        b=e5zfqKppRfUQmBF4/UUmVCKfygpUMmSwwfnhkDJ007tTTrwj8kyi6TieLRC46yjpa2
         2jxXgpD+xSQWxXNDkkDtED1THSzNTAf6OABpuE8T4zMVzXgQKmIrF66Oa7rccJYNNJZg
         CXRJ8zpFoJXBvnPvy47nN5ik1gLzIvRlN2PWCVRJv5B0mDEXuscNFOhuubwVC7z52a/B
         VsK06cHssthS/b36+m/+jzOKCFsOiG6Sqc0QjZLGa18LnudatXqgOrAbJacSl3YgiuBF
         sGs0kk/gOMtnDFipyN0N38QlijFHaFR4P7Fs1/ibU4dEQpsPh4LThkiICyHuEuAChqNp
         87Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774933790; x=1775538590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FW3IFPPj9g7rG2hQNdFw4endj2uGmuszkMfYA6NeQeQ=;
        b=nVVxLOaNWsbO+mHTlJbRzxlEs7lxvG/nEozBNIoQLBM2TnBA0QGirruUCaIbRdPkhN
         Kca9L4Lsbnhqlqkc7Vhptw/bewCudA995E+7T058LpmNgh11cGD0G4iv9X6PprotYF6Q
         q9YOI5ihrCsWk4/03rpWiE5EciOmJwkq65DM9v/jiEvsqjU5Z0g9Yz2I3MtUGi+E4jkl
         NW+I4twOJCtw3FNM3M4g4fy6OtvgokVkuQa2ZGWekuPVBtteqkhs4dJ3tfiXterU50+r
         X0Xw2CYE6Raf0vDk1kKvnFokNRwUHuJZ5dyM6Wg5b1ruZTkGddma7+cOmfsWYL68MQeI
         Jxdw==
X-Forwarded-Encrypted: i=1; AJvYcCXRKgMYBnMovlTUoh+rYybF87DcCG38HBsKno/10iNMT6gydAAESAeBfsVZ3ZYXYBLjmcgeUKOt2jw1Ca9mHak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5L5L7tskPpVlLSvj0nMP9hBbW3hnyv8hSPm5g7fyq4BcnCmMr
	WlfJsQlC7bmUweynUil1A1fUsOALPXhW5QB5SWJxUld4PotZeim4nD/OithbM1iQnDugBVoB45L
	uBpeKw1owYV4c2uBCAevKGhjU+Rg/NDBkY6TrVacFe09YQED+vIXjKFirq0lM8PGId5jW/w==
X-Gm-Gg: ATEYQzyPYp0os4u/M8FXq/f5T8Dqf+RGFt6jahUGnYYJRI91YzzPH2erp3xcRbKxwbM
	PxgcvCgsRMq64FGDXBgQqlDG6uGLOdWgWYwTbeDLF60Fb7kw3gr2llg1ti8LSo4BAwOXlP40oq1
	2nX7N6yNLLC0iVDb5ZytonvT6v96pInUQ+9FqrNdluzQdxbn2WEry/nOzZaOvSVhLYnvzFIil9y
	Hamzmb4dpLcAIkUzlPO/W7rRsYv+DdUuNmO0qR4q9LV8M0NMrykPN9B5TrnI6lm5s3VkzWBtUmk
	RUFjsC6mpLwcbL1DGJWy6nhqKwwa6WUkiCyHk5twKY7k77Oyu/vudDZKRorIh+YNOtvOHmeIVXv
	0q2BBm+T3S7JKCEBhtw==
X-Received: by 2002:a05:6a00:10d5:b0:829:88e7:c88b with SMTP id d2e1a72fcca58-82c95e6983cmr14635710b3a.19.1774933790281;
        Mon, 30 Mar 2026 22:09:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:10d5:b0:829:88e7:c88b with SMTP id d2e1a72fcca58-82c95e6983cmr14635686b3a.19.1774933789804;
        Mon, 30 Mar 2026 22:09:49 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d019dsm10517195b3a.29.2026.03.30.22.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:09:49 -0700 (PDT)
Date: Tue, 31 Mar 2026 13:09:47 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-ID: <actXGynAOer5tCeu@redhat.com>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
 <acc49s7jbI9Q3a4f@redhat.com>
 <20260328135650.435b415f8c00835b2fa471e0@linux-foundation.org>
 <20260328140311.d6ce99302f93923b0cffb441@linux-foundation.org>
 <acj5RK3lze7o704Y@redhat.com>
 <20260330170954.47dfef29063afe9ea502505a@linux-foundation.org>
 <acso4-02tZhFBnKI@redhat.com>
 <20260330204941.de4ba3fde700e669d33f054c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330204941.de4ba3fde700e669d33f054c@linux-foundation.org>

> > I have created a patchset for those build tiny issues,
> > let me send out to you to have a early try?
> 
> Sure.

Patch posted to:
  https://lore.kernel.org/all/20260331040156.119158-1-liwang@redhat.com/


-- 
Regards,
Li Wang

