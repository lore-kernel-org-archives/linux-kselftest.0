Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE8F47D446
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945285; cv=none; b=W9iVZ74GL4BLRnJfsttHDwJi0fFblTrEjrKHvwC3G33GDxl7jApZfntsMy3JuoK+IZgSWzRdaqBqMvNB5g05S1WMNiHSVbCtLZc9lYcvRKWSuHP21ySE7XGQVinGlsFgvP3kguSXEPZ9pKXR1rRxD374wDSwVQFsgHtUSMzitLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945285; c=relaxed/simple;
	bh=rZdAOZRrlWJDlWCV6+LShKvadlRsq30zPunO2V/Grcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qx18tdodL0niE3gxuyMc1fsBxIFZACaYImZGiRpNELNbMF7cD8P8WEpzycvhcYEAphsf0rJMKzV/x8sAU0dpY/ibvbFl+V+DD4IDjFdaaXyATlZe0X3ldgBhAz4HXbmPRTZIUzilQUH1JpGTEUng91lVMpOxjDOt9hQvj305NqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fldv0WhK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fldv0WhK"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf27856f9cso14694855ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 05 Aug 2026 08:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785945283; x=1786550083; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SiDL1RzWS9KxGO4Do/pBrGufTQ4ZH9KDIw9xKfe1s38=;
        b=fldv0WhKjLPQHzjJ+A8uDyjAi5ZQrt+aoSeqmyozfvny2K6jp4H/XBq4iTfHJ8LhX6
         9wXJZROGfbEdrDcZZS6mguwnxgUKFkgdHHS/pL0w8G4x+HcDbLcll/85WrP/jOvLsJux
         aTbnNO4uOINQE2LlXBBwVGo09YZdLePaXoRQ4DwdSv2ehffA93U6mD6BRuoIj9wJcgUB
         SdCpio78d4Yoaq94c8Wcx3KDItu/Lrrd1Z1wvjLN6p2De5z684VmJb0B4V4dL+soRlY2
         KIL6/NjbtK8LaJq0JKtPgUNxNsVo0uuSnAwHMUqM0xi2bEA7JfAWUQ/xAa+s//2BcyrE
         WOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785945283; x=1786550083;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SiDL1RzWS9KxGO4Do/pBrGufTQ4ZH9KDIw9xKfe1s38=;
        b=e3YSWmOX4XI6E5VvxXWqt8ZzYhM5+E9ANAlRXsSippmnMEq2fRL6Hhzg+3EZkFqibD
         8gq1uV0fRyStlnqpe4FAQ/fnKYilyWpvwWmu6HAZbr8PHDdXor/fAyB1ei3m7k6NyH4p
         UPy9KZNOgC+uJ5t6Bc1fE70BWaht/ut3j+5H/3LLobuyU86ZAAMMMmwKSSgHTEvTo0H2
         zfaNBEwJHCesbnk+7J5vSRB1EMcnJSJbVM+HojrW5Er9ysr7IkmsAuQD20qqPKXd0jZA
         VUSVmsVMWOmvCeDUWOINjcIolQ9fMfw4lUqsuTjp2xqXFln15s39Ygd58to4p8iMkASJ
         MTug==
X-Forwarded-Encrypted: i=1; AHgh+RoPmyxbCr9/yDGzPgNBVTcUWuiSHZLxrgqAQvYwOyE836bOTkeqYHFm7+iCwWLSPf/hsRaaQslJjEWvgfGb6B4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrJrrYZOJaDgKo1Ba3BcCvRBGbVRZiLMukM1eYgXpgK9M3KplL
	3gVfwS2B3yG/QPfHYuhIZkGV97znBsDazaQZu2OafqRrpNC3viV0yev6
X-Gm-Gg: AR+sD12/l19abCRsNS01xeArkIka09bBa9FS+L+KhyASPAdCq0oxd5hPDqFDRvwvEwW
	CCn5ofEylhQVs9K/venxKgMvBdzf5kFrdhKIZEvFs0cKoeS/fZWrhz1avJM2LDOH0JvU0KM21h9
	URZLiUPb+m6EMo/o+L/g3ohsq6NRsTWPePusTIqPCAZKOQIjvhUTbYoRjJC81RDER7vgnqQ7Xmf
	Hj1RpyG3Tj3VNXIdHaatJ7iwBvK11/2Fv9l9rc4klj/CsEsRB0TyeMsuVBnZk3G+CcP5LqW7cK+
	02DWxBDMdu61CvD+Ibdi7mIdQKYUKoc5dFxz82IMw4F/x/As6WfB5ghwB/Yc4xD4kT2T0QGW5tU
	VhuJOUyZSKUedXTEgiJqiBEH9bIwhoP9cMFcLQEOgSnk4B51xyLSDz4ihat/uRqYZhWWuOSYUsI
	8mqICeaQM0t6NGkes2axDoXwwGu/kYAFWNntXFywEB20QRBS/5mEKKgIFpBED2Tp9vuLvWGR44U
	7DFn5HQepvoPQSYLwGBXFH6
X-Received: by 2002:a17:903:3201:b0:2d0:401c:2ebb with SMTP id d9443c01a7336-2d0ca7125cemr99090365ad.4.1785945283158;
        Wed, 05 Aug 2026 08:54:43 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4ba225sm18570705ad.61.2026.08.05.08.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:54:42 -0700 (PDT)
Date: Wed, 5 Aug 2026 23:54:34 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Shivam Kalra <shivamkalra98@zohomail.in>, 
	Kairui Song <kasong@tencent.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Nico Pache <nico.pache@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/3] mm: support splitting mappingless swapcache folios
Message-ID: <anNOroQdjQh7xmU9@KASONG-MC4>
References: <20260805-b4-mappingless-swapcache-v1-0-b1d78ba257ca@zohomail.in>
 <590B3189-5B66-4ECB-84CD-7B7EF18C0E54@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <590B3189-5B66-4ECB-84CD-7B7EF18C0E54@nvidia.com>

On Wed, Aug 05, 2026 at 08:03:33AM +0800, Zi Yan wrote:
> On 5 Aug 2026, at 7:18, Shivam Kalra via B4 Relay wrote:
> 
> > Large shmem folios lose their address-space mapping when they are written
> > to swap, but remain valid members of the swap cache. Folios read from swap
> > but not yet associated with an anon_vma can have the same mappingless
> > swapcache state. folio_check_splittable() currently mistakes both cases for
> > truncation and rejects the split with -EBUSY.
> >
> > Implement the longstanding TODO for this state. Allow mappingless
> > swapcache folios to use the existing uniform order-0 swapcache split path,
> > while continuing to reject truly truncated folios and unsupported
> > higher-order or non-uniform swapcache splits.
> 
> Thank you for your patches.
> 
> As Kairui (cc’d) mentioned in [1] (see “A bit more details on this”),
> we might not need to implement this split. I will let Kairui to decide
> how we should deal with this patchset.
> 
> [1] https://lore.kernel.org/all/CAMgjq7CHDG8JhesSPMkn1kzG8jKb0BXO756BvxMQC_MCn2eTyA@mail.gmail.com/

Thanks for the CC, this is actually not hard to implement as shown by
Shivam, I just found the code more and more hard to follow and fragile
as we add more logic to it. And we don't have to reject higher order
split either which can be seen easily if the code is cleaner.

Personally I think doing some cleanup first is better, I haven't post any
code as right now there doesn't seem to be much user of this. It will be
needed if more clean THP swapcache begin to show up due to things like
THP readahead for swap, which isn't here yet. I think I can send an RFC
tomorrow just for reference. I'm fine if we prefer to remove that TODO
using this smaller change first :)
