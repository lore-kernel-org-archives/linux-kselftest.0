Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D941C84BB
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Jan 2026 07:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769239812; cv=pass; b=DLJOreFWIum/sv4/WvWZP/TBm35cmBL0LPQuu2Ra8EFu6R09BW+Olu4gsTvJV4HbvGQfS1AsIbJzDAh6QVdeTJBaCcVu6/ZHkAVwuJzQOhce0WpSBKaVZpbwzIc0kS7jt5h/yUzUiVwsnRIBO1+qMtnTd4pimBgtkhymwush81o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769239812; c=relaxed/simple;
	bh=e1ixly2/NjoR2aaoEVfMiu/QisgbcNguvOb9Kj2chmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dlOrzoZozYzY+Dn9D+avrIPMoV9cLgNvo/HK+K4Ecun1AfyS1jO8tvTtGt3GW+ui3imOeR+eRiSUVeiZpUoTsoZ+ItH3johhiMnN5pgNyT/FNQxG2c2gAf023bmvxNn3jcYiJruj2iAF3hO1RN9HPDsDnej73tR1noET5IJ9lqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mi3yEZzp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cqmwR/Rl; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mi3yEZzp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cqmwR/Rl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769239810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hTm852yTZfC4kegOsHtlkLTPRpkGn8HmDIJ+Htyp5Co=;
	b=Mi3yEZzp/SA3n5ZFYCjR95HD8VzaJBv1PVnprjh9e7hOmYmyDDFQt4iR7JQNChjEcKrnL9
	5P7BHdfWiN4ulEg+zEZVN20l1iHUVz1w9twW2MQ8+o98Rp95Zve27lz/63777xcY05k+rv
	UkbsenpovGmpH7NLlmUPXNZzRmxhQr8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-Bo6sGc-DNHesV_wR-GUW-w-1; Sat, 24 Jan 2026 02:30:08 -0500
X-MC-Unique: Bo6sGc-DNHesV_wR-GUW-w-1
X-Mimecast-MFC-AGG-ID: Bo6sGc-DNHesV_wR-GUW-w_1769239807
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6581abb27baso3445946a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 23:30:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769239807; cv=none;
        d=google.com; s=arc-20240605;
        b=S/z9PWxI9bBKMCSY2CJaa6T4/EbuHllrsP9qhTzUDCqrew3ERqjB7Wfg1+sUSZmL/7
         QmaueWrujQuLyeLtgFooGZ6WQE8W9xJW1a5xL2MRXI66A7j/uR2m9ZiJBsJ2osUfUI4D
         IMrSahzz0dXO6+T4LO1SJmOXVdQDpNQkiAuENupBiW3zJB3Xo4f6t2+Oh+mcuZPK3dOo
         y59kMl0e/FsyYmntZGXlBnSYGVtR2oZp6Whr1iafeXV8IA3nWLSo/fO+vtbVNkGKd3iF
         +zqCaWIdnP8rwuYBvgpLPNZ0ld2DqPBBgjN59/phQYCV1kDzs2C2eC0oFW7Tg1nbn5Kk
         54tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hTm852yTZfC4kegOsHtlkLTPRpkGn8HmDIJ+Htyp5Co=;
        fh=VrC5DTPS7x1h4ZAmWQiGOT5NdvaQG0GZ6xHdsUtqI98=;
        b=giKGJZZSE5zOt4urZV4uBFa3Hh2lkXwpp1ieYWKnMaiX7rc/yRANBCZOBh3oJBugsi
         2jb9SAp62Vv4HDrVGaALcZXxay+KSlGdLRxMfbxP8cF9H6ewyiUaFlT1vNxBZ9B2eM92
         c9FMY/Ar2hJtndBi/iB/B/pIfI/srcLiibu/vDtSgEPYntfborOFkJF7a+w3BUq1HYkd
         Lff/oMOouTUnIxx2uIQWAWss0D/avwavfnLxCY+kYJT0ejUCNtX5Zm74nb/YEnnw+g9e
         TvfZxJphmVEcJi+lV+UGTYu63KdsrFXvGvpYWTS0jj0e6LRKpa4uoD997fC/n1kzSiMe
         Ax1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769239807; x=1769844607; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hTm852yTZfC4kegOsHtlkLTPRpkGn8HmDIJ+Htyp5Co=;
        b=cqmwR/Rl3DFvSx1DZ8WTR4VjGmM8zjL+Dah9T3wMOdNz3SW9kcPZNMPqL2ruBBIlxv
         aBT5m0otRh8a+bt282X/mqsUayEzUw3ZsE5kNchCM7TJCnxJWho8KEZZzUV1dtXw66tM
         5HfbOxgwv+Agz+Ghwphx0PbOYysFAAGAVMSFVrkMa4Qu51QUqCMS6k8aURri2c+ngy8/
         BUGYEcSAnj5XavoPzn4N/Nnf3ChnzipNEtYPmH2706IJwRu96qQ2syKrpOBDBxYf/DnQ
         5Y8r3C65uP/ur7KU9SPDIK7IbBKtS8jVGkyXncC+/rlEktlez7YjTXGe4MjV/lDrpddJ
         QvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769239807; x=1769844607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTm852yTZfC4kegOsHtlkLTPRpkGn8HmDIJ+Htyp5Co=;
        b=JTmkKLhPz6g85CXwKmxq6/09S3kBHbueT++oL4RB4TnD25BJ0vxY3dlfqi9pva3q9A
         Qw+/ZcZvF1Tuns5OvkTo9PCcbZN93moaI4A9sLOHkYGRYlS43PXws14hCP3bi67NL/c7
         g4mSd6DutvpCE/VM2S7wspaCBNoIJPMPlcOjlD0hsH43rT+y05zQc6F3E5Rq+nQJHnpE
         GmMY5E5Tz0vfuZ0o7X5vTbcN7WgZWK0VOtp1/QtbzRhh6wFSHTI+NCpVMJvtHsigy+dj
         6fGzp97UT7CiyebY+adPCnWqRU8AN2yaRDHtfQsnaqb/7B/2kxT9IYYVgX7Gs731vLjZ
         aSbA==
X-Forwarded-Encrypted: i=1; AJvYcCVDOdHscnxvH/UQYwIayy4gUi25Nqc3yRUvpqYBomMx0wUNVLIndJWoQW0NXbEmJRNPFifCstRzjB+hJKq98vA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUOXwrGn2ZeYYsIiufKJH5m87PkaPJ6xH0hCrPmaM9BMItwhH7
	laR0BRA5Oko6jfGd94VlZKCgyk8173MbhkxeKQa2LMxIolvEXqPc8V1O+SrRzqahY9iykL5TvWW
	RwC2UI7Op9QGcgKRsnQwZJSdGqK9JegSc9giDfDWIlAaOzOv0yr3lDKAHHuOdY8FEBygqS+R4J5
	IykehGGo4Xgoiq41nP7OAb56bAQB2Yx6a43zxMi9Dylg69
X-Gm-Gg: AZuq6aKjYJt+1gYmEs6/2oFDEk4U5rPLWb+5peFhvh21kNJ6g/Gyy3rEbvSjqL54ij9
	ff591XjJuLPV9t7ehCzTlIXDdMJMxsEy/69PGOXPzRd171zBnEKs16PJUIya7P5KI+koAu6QsUi
	qJ6y2KCIhJ8voYlA6U4ob4b8okwdsWnO98WT/cd7fCvfPxPGQRoT6Y7gw3xx3wLvBhlss=
X-Received: by 2002:a05:6402:1e8e:b0:658:17fb:4890 with SMTP id 4fb4d7f45d1cf-65853cfea9bmr2031769a12.9.1769239807007;
        Fri, 23 Jan 2026 23:30:07 -0800 (PST)
X-Received: by 2002:a05:6402:1e8e:b0:658:17fb:4890 with SMTP id
 4fb4d7f45d1cf-65853cfea9bmr2031753a12.9.1769239806628; Fri, 23 Jan 2026
 23:30:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1768979440.git.xudu@redhat.com> <b5787b8c269f43ce11e1756f1691cc7fd9a1e901.1768979440.git.xudu@redhat.com>
 <20260123114312.6f7c441e@kernel.org>
In-Reply-To: <20260123114312.6f7c441e@kernel.org>
From: Xu Du <xudu@redhat.com>
Date: Sat, 24 Jan 2026 15:29:53 +0800
X-Gm-Features: AZwV_Qh186JnYHMq_Dc9JNMDPpSXsLrjlvHGtwp4k7P6haU21KBrdjwoc_oemx4
Message-ID: <CAA92Kx=ZF3Tp9fh3q2sCEmyn_kfemMjMvzPKEqkk8-UJHQXHqA@mail.gmail.com>
Subject: Re: [PATCH net-next v6 4/7] selftest: tun: Add helpers for GSO over
 UDP tunnel
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I'd be tempted to allocate the request in the here, and instead
> of passing the "fill" callback optionally pass in partially /
> pre-populated req. Just food for thought in case you'd like the idea
> and what to follow up. v6 looks good so I'll merge as is already.
>
> Thanks for converting to YNL!
>
Thank you for accepting this patch. I will consider your suggestion later.

-- 

Regards,

Xu

