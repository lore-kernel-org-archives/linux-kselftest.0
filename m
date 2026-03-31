Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C003EDAA6
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950657; cv=none; b=mdazZWIPfE4wnsD5FkAh1YEfSCjO0/wMA/cA3kG84T721NxM5+Kuo/1IZnJL6lfR/7KFM4/JU11s+xiTgfTWd+6Ix1TQ55KxSCoe+HjSbNxZ09aOYulz5VUaSScW6YWPME+J+2Z621jc0RoYLkUiPxiRHuudCEJW/ygLX9b3Snk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950657; c=relaxed/simple;
	bh=HLRRb/A1VPkCgMepDwjYd0fDVGpLpik1suWmqwA5r+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRQ0F1iBSATqNyEJ0r7HgzuOMlseOo8wK8gkfXVyvGy9lxXE28uuD21JS0rQa2cIjGmvPNdYBRpWlPw42VSiq1ouv9xyOgPY2nM40iTlC66PrOkVM+Tu6di4vKQM3ukmrm/9dgeT3tw/bWUppWHmvclSmHa37oNoZy2h8TJJQCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P5+/6GuW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GLcuRK8H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P5+/6GuW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GLcuRK8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774950655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZUnMNCPUch+nJ3/cZQxbUv/pjvJWtkozyvEHDR71gc=;
	b=P5+/6GuWEIyUsKZKusBPkjdHzNKiPK6suWyRZatYnX1Cn6lHEKymXHmSl5WmSDr5lciUXk
	KCBH3/OIlC+HcXPanB3cf0zfBrU/My2OEHdcn12zfdE23NMCPDyISXcL5HaA0023HbkFlD
	nwHrm5X+onlVm/SnauItO4lqGCo/veU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-7hKxzN7CN1m271TDfLW5Rg-1; Tue, 31 Mar 2026 05:50:53 -0400
X-MC-Unique: 7hKxzN7CN1m271TDfLW5Rg-1
X-Mimecast-MFC-AGG-ID: 7hKxzN7CN1m271TDfLW5Rg_1774950653
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24611696eso20684425ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 02:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774950652; x=1775555452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZUnMNCPUch+nJ3/cZQxbUv/pjvJWtkozyvEHDR71gc=;
        b=GLcuRK8HaHr7SIpLXhnb/zMaKaSHIz5ztNAIn95omKTPryO3XifumFBiUzzdoxl4VY
         ef4Yl8EojTtiGt7mJl+zVpKUwwQESE0hCCy3eOO2S8fSAkY8GfzPFY4oDRBC/GgyrQIV
         iI/HvCavYoy/ayVrX29r7bKZ+RDFbg6N0gj0c875Pz/hnxWe5pwbDKPrZqVSHCgOy0kV
         9sITjVH2GFQFHBWI+D5rQ8oEuqL00viQrZtM9PxWvKCKUJUHP4ghJAtXFhqVCxjPQtt7
         eSScNV7MTPD2t6PKHocjDnIec+ODmAxWchQS4xmFd13V2OouWl6a3pufiuf1tknZIID7
         31dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950652; x=1775555452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZUnMNCPUch+nJ3/cZQxbUv/pjvJWtkozyvEHDR71gc=;
        b=KUqNtcgoUaFxJUeWY98SbVGK8UcyJk+kppLaVEkpbsqdc9aH3eT9J8ChYeJo2thWff
         LOj3P13hH/B9K9GE9rfYp8EivhcDLr4PoO75EVLzG8RGs0U+QcrNZIfXXKF3ffR2uhYL
         gF8g1FAgLayAWfgMjfbQdkjL1dMPGSh2rJnG2MYwbhNK1LeHDxkDoB0659y5MDj5dazX
         z4du9ucdABNIingtpHRDObgCY6/wUXqEXwI4SBcCvOxRgizF/fdQK/mHmI15M6QPMStF
         7MMqYCsVoKUTFDML+mi2cQpmcMVGtGbf283fD+m/qPh82NQhsy+aF5kOva7bqzRO3kPu
         p50A==
X-Forwarded-Encrypted: i=1; AJvYcCXSVARo2MIF0SatPnl+fNC99xppCTeAWP23euiXAP98YLXz6Euv/8+rxOj/kmOFmR7RFiWGJNEcEwo8hj3ttVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR4OJZtsQEMQyL3aeX+uVW3JJP+qDl4tnFzsdLuTJOtsDtvqfV
	PZb9alMPipIdZgIjMeEVZtGKocVoDL9OXbK8Oc1sYBiIkWOo+ikwREXmYit2J6eB6OvOC7LRH9L
	szQH0ykRe+m8p1/R63bBHjyOxUJ3fODRyO1zm02GH1xoB1UZKyuB5697bdQu7pXG6f+/04A==
X-Gm-Gg: ATEYQzweJRWKrXVQFQ+o6bnLklyU5lxGeY1OmHbgSLABO/qdkWLZDBUuTP/tm9OR1cZ
	3KcMGaLXUNmZc9zK82vqEmAhde81x8X14Ghytt6Kbv0MG5PlHDawUHfU4l28DufNnsU68rfHqLZ
	kdghkL1kb9b/bBzn2tOdTJL/VeaWlUREw85Rbbg5S54TfrDPNXl8qC0EtXzqM6cQa08YJeC+AzI
	mmZQZgVTaAd5RJHpAjAJ9SOV2/xgFOLDCKP4ObIoi2tqjjH/JKd+L6QnEqI3UBSRINnc/EoDTwD
	e6OEL3sS43WvDo0TWO8Dqo2mIsSIAQ7iHncrTcWboolLPnTr3Grgq5MEuY5FoXLXjUgNqXBY9a5
	1CYPjmXMXBVbcPdSCEg==
X-Received: by 2002:a17:903:32cb:b0:2b2:57f3:8d07 with SMTP id d9443c01a7336-2b257f39949mr54098015ad.7.1774950652633;
        Tue, 31 Mar 2026 02:50:52 -0700 (PDT)
X-Received: by 2002:a17:903:32cb:b0:2b2:57f3:8d07 with SMTP id d9443c01a7336-2b257f39949mr54097695ad.7.1774950652197;
        Tue, 31 Mar 2026 02:50:52 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24277fb50sm103515325ad.56.2026.03.31.02.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:50:51 -0700 (PDT)
Date: Tue, 31 Mar 2026 17:50:49 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/4] selftests/mm: respect build verbosity settings for
 32/64-bit targets
Message-ID: <acuY-biDCExbw3aR@redhat.com>
References: <20260331040156.119158-1-liwang@redhat.com>
 <20260330222932.a8c10bb3ea3e86581fcea8a0@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330222932.a8c10bb3ea3e86581fcea8a0@linux-foundation.org>

> > Reported-by: Andrew Morton <akpm@linux-foundation.org>
> 
> wow, thanks, do you want my credit card number?

Only if you want me to add a Funded-by: tag to the commit message. :)

> Tested-by: Andrew Morton <akpm@linux-foundation.org>

Thank you for testing!

-- 
Regards,
Li Wang

