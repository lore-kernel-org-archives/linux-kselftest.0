Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2094C77C1
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719148; cv=none; b=UrqwJYcg1c1DpK7neqMjRP7wpT/FrVN+duFU1aV5Vhe8peh4LnFMnSJ+f7zz5cGNrti4rqSSdqamuZT3c6Mwq29pwmy+aABlpqV3vydIgUGQo/+Hn+Ew49hXB/Bl0+ahusOoYtRbIzfkoC2ED2bu53/+DK5GPaUovGYeEETCheM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719148; c=relaxed/simple;
	bh=K0lJdomABA220xXQvjPrABsUyrol06jwDg0S6PXXfsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6b5Je6Lu3a79YLxk69S9L1xlTEYz0WI2KnLlPmt0tA6s+gwtq4ARb6HWu17/VZdpNkpUhjT8WXMHVL1gl/gd1XN9HAPdTsCYOfcIbXL4lqFNQMe4frhOpeLJib/519z4Xwjy3AelDPqdrq1tMR7CzDWlTjnKlSUDiykeQC/ljo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=oh6xSitz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="oh6xSitz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954d383e64so28937745e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 04:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784719145; x=1785323945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRmXc9ZZ35HbKO4lnkGdwQFDA/KG04ApnL+4+6Y1E0E=;
        b=oh6xSitzv14cXiEehnSpN/lNNwBLwRIos7nCfJe57HvhwV3Miu90A81J+FmVquFNeg
         WZnf8kOuLCwtrpALmFC30uyKE36wRSwYfzjjcEIK+85FnFPpEgKTrlESpGNO8E93IqWT
         iihMO0kPefOqHw7l0c+5fhZeMkKP20CON2O6UFEulprF03uO0lrJvBQrX/QYK3//ajlj
         ECSFmXjhGAVuhRgrWYcsh9X7nHkCtxk0itlQpc0DHkrcqEFKmBKnEBeBIh6ZVWPI76Zv
         dZq0q3WNs9FFUeopq+8FxcJKGS4CsiPB1bV3nq7jGX2rhhM7xBBVWpVP87+EnTxph9Jn
         Tc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719145; x=1785323945;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRmXc9ZZ35HbKO4lnkGdwQFDA/KG04ApnL+4+6Y1E0E=;
        b=NaZaIvnR5dt9RnbVpfedUER4s4Q7XgZK8H2c2Nim4C3NRbFr37c73OAPpOVT24fU+l
         Pn2jl/nsQomv6RdGBlC4O8PVJ1JHG8KLCO1jrsn/gZ80k6GKYvOsDlZIRw6uiFL1Xe8T
         Zfwqw4u84ABL/V2sP2cGPbQYVLKXWUW0pDTuON4gyURulvXR+/+74HenHhQIBbubITGw
         2e3ddZdom7D1sj4de5zB+6Hbb/ku118dvZZPZdCsaf0q+eiENfmnCPfnpnZ3vrrWh1DQ
         t5O3P7/Y/2oYshe1tLWHnaLlgoOc5mUZdj7eZfohoRoMSXfFazYEOhOmFXPKf2jsD5DN
         Hl3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rosy5MZdajauNmvAcE6RrLQrYVCHIvNY5FOuZ4chiUI/lJaFW9cOMsZVW1zER5oUeteqT/gLij8VmZf7OJHL/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHATgBZXvQzY/s69a/fSpwseIcrgcegNJIQhoWyLJfmjCPA7+g
	H9qMFqVctUD4Yd4VA14/AJwtWgDOPR3BeQRrZnI09YQsAa8aytAYZhHTtvKOtYhcGsc=
X-Gm-Gg: AR+sD13OZXX0uxf4upgm4xHEeUEVdH8n4SwYp90RZ2KkpcZMC4eGhiQAzKSZi0wuepc
	a8IwPaBZ32sDCbzi6yRI7HVVRvepk2BgG28wgYARg62NDpbwEpfluFYodtY1Nw4X31KvnN4gSng
	0MOjsS+6jkLZrTHHa/NrKugt8Lhh1HhBd1IbJbplCmFkWheTmXr6kczdcwCOzH0PBQe9cgE5E50
	Vk+IoT2JlxvxGbwg0elykqNAarWTVnHxFTOYxx1+mi2KU3XbCRBqGSlQHn/33GFbp2KJKnxXwCi
	bEfZqea/pU7wMEWquHkTIGt6mXz38BEDCdAfuofLkQJSSTJN57M2hzu0LSs76gOCTay0YEsBtsX
	eXqQ2veDV4vf49oGnb+r3RyeKYcxqdfMo1flvUEkNS2QSZmgbwwG/RLAQhSBOwJZOoiDwqRf7OS
	Uzis6j5OD4D6O7PmDig3dyAw==
X-Received: by 2002:a05:600c:4ed1:b0:495:6485:226b with SMTP id 5b1f17b1804b1-49566a820aamr70694565e9.22.1784719145296;
        Wed, 22 Jul 2026 04:19:05 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b72fac1sm43347075e9.1.2026.07.22.04.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:19:04 -0700 (PDT)
Date: Wed, 22 Jul 2026 13:19:00 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: linux-rdma@vger.kernel.org
Cc: cgroups@vger.kernel.org, netdev@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, jgg@ziepe.ca, leon@kernel.org, 
	parav@nvidia.com, mbloch@nvidia.com, cmeiohas@nvidia.com, roman.gushchin@linux.dev, 
	bvanassche@acm.org, zyjzyj2000@gmail.com, shuah@kernel.org, tj@kernel.org, 
	mkoutny@suse.com, hannes@cmpxchg.org, alibuda@linux.alibaba.com, 
	dust.li@linux.alibaba.com, sidraya@linux.ibm.com, wenjia@linux.ibm.com, 
	yanjun.zhu@linux.dev, cui.tao@linux.dev
Subject: Re: [PATCH rdma-next v3 00/14] RDMA: Make device names unique per
 net namespace
Message-ID: <amCm6nW8IttsHGgY@FV6GYCPJ69>
References: <20260716132316.1495242-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716132316.1495242-1-jiri@resnulli.us>

Thu, Jul 16, 2026 at 03:23:01PM +0200, jiri@resnulli.us wrote:
>From: Jiri Pirko <jiri@nvidia.com>
>
>RDMA device names are unique system-wide today:
>__ib_device_get_by_name() checks a requested name against every
>registered device regardless of the network namespace it lives in.
>A device in one network namespace therefore cannot use a name already
>taken in another, even in exclusive netns mode (netns_mode=0) where
>the two are otherwise isolated. Net devices have no such restriction -
>their names only need to be unique within a network namespace.
>
>This series makes RDMA device names unique per network namespace,
>matching net device semantics, and adapts the users that assumed
>system-wide unique names.
>
>Scoping reuses the existing rdma_dev_access_netns() predicate, so
>behavior only changes in exclusive mode:
>  - shared mode (default): names stay unique system-wide, no change;
>  - exclusive mode: names only need to be unique within a namespace;
>  - CONFIG_NET_NS=n: everything is init_net, names stay system-wide
>    unique.
>
>There are two users that cannot be made per-namespace and are
>documented as known limitations instead of changed:
>  - the rdma_cm configfs tree: configfs has no network namespace
>    support, so it cannot represent two same-named devices;
>  - SELinux ibendport labelling: endports are labelled by (device
>    name, port) from a global policy; distinguishing same-named
>    devices would need net namespace support in the SELinux policy
>    language and tooling.
>
>Tested with the new rxe_netns_names kselftest added in the last patch.

This looks like good to go. All Sashiko findings are false positive or
unrelated. Care to merge? Thanks!
