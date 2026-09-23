Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6AC476CC4
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 21:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199126; cv=none; b=N2Dqgt7oknOuHxF2DM6Ms01SQw7kY/iH4BArSE4uWMp9RVX6gDVVJj/Pfr5acse+eVTL2bozyoJ6Eg8KB4tkZan7kvyp1ZtejIlDZwGewP6R8U8qlYxOebqnihaLkbbq0TUZJFmXlvXJUQMqxsaIKCFJPdpISmi8JJ9KuPI+Qjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199126; c=relaxed/simple;
	bh=yqwWpK4N9YeYAJC00jfG/KN04unxyF4L4b45axRv0cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeDDvOr4iYV75i8HKShY1l8j+UY4ZzyHtVVHbZmPYRyWTgvchn4kOn5TqX1CVyjvxvVt9u27jEMnsnm/tklIJ7NcvoX0qst/qOZpNuHi0xNmXnCgvPJcorrVxdxl5KvuOIxW8V6Y7zLj8wgqQkwjccs2GHpNBfepqWqs0UvmU24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=rS/+wDoP; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="rS/+wDoP"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8a45b788a71so15232247b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790199120; x=1790803920; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDp63aNNvlo+CbPC5AYf50weUXwD55oicYAOt2YPLqw=;
        b=rS/+wDoPYolig2FICJsL6XwXIlKtMB5Lunw4Hx6BWlj0fmGdUF4Rr3dj09iX2IZRL3
         J0rKAB930jc6NPDnpFIUKCYXIOn5kzKwi2wpSBWcmGa8iTGY9zmvjD6+YueUktxbZDHI
         usbT+MDVDJfJdWVkh3ZK94GqQ/odGH+G2D2/gskt1sEGc0ByD1Pl0hmlBqUZLVJ8YElt
         gf6nmO9n8C5eTdkTjiZd2jVd9i1XdAMVXX3pt0dO65R58xp1VndkhjaYJj3/txSaMgYf
         07hu5Bv2nmoX8gyTinaqcUecDDJ4ulYErQxFrUyp20KI7IKUk8mNscb2ftmfByaYLNPS
         yhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790199120; x=1790803920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YDp63aNNvlo+CbPC5AYf50weUXwD55oicYAOt2YPLqw=;
        b=kBJCiBym1xpvtV5kYeyu7yduw31Y3qaHy0ABcPhndRsi0aKRoBuYGy6Sr7s4kG1RQ1
         gaosV1RCyjFT/mbFlcfT+ovCd7jH7EQx3GREoc3N45/VwX46zQDX6RNrBQItJQZDPCBd
         hWqHbWc+kZzW7FFywqJvda82ajZLbczgP0oW8XcR5d8WfgqJoHIzvGSm9+KGZQk1xztN
         QKXfi+I7oWNiM+a62uOt7ELa5CaX9z3Rdpz0Lb4SKmssYRroDZpRhKZFSsS2PP14tXPP
         BocNBCWOwo1ZQ9TxQRJeGFh+09jaeF+zn5rmGpc6SPc0kvKD/x0ZTVQhj/4xv8wVxa4X
         9a2g==
X-Forwarded-Encrypted: i=1; AKwUvBwTMFqAsTaKgHgcJ+hxpGk6sliOhciGCkrxnsU0izoVKMy8GMmg67FTswKO+OTsk8CPWgQ+RvR7cSnfoFw9fiw=@vger.kernel.org
X-Gm-Message-State: AFuF++mGRLAyFpxiCDjqgXXTTCQg3A8efMaotw/DDnzSkfLAX5bnTt8x
	aqrrwYliK5ecKOrk+lEFJRevc7WO+dgyOQi31y+oQbBB/4GLX7VRJDcQK+hksI6TYzE=
X-Gm-Gg: AYBFou333lFRa47T2+mZoVSz51cV8jHoZtKKEO8I3QW/oZHImrSn0gALToMHOVshhhJ
	/tAIkdGGk/rllIpDNE9NMZsotH/qXcZIOxy50h/zhU/QRMzZLMdqdlBLN6EFTXlXB1vicEzArrO
	1U19erSzKH5ZsyggWstgDXZR/BQmkaETTbqIZEwR7B2iCpIY6B5TSmMkaP7X3Kc3cf4P58e3/Dh
	Hm3nYqqu0058Rto0xkOY4vlnX98yvzirRaYbf1zc6hvWuGaONcWSjh76CRA4Td8yi50dcXxW9im
	2rOIXqoN2RwcWHG29THwqKEn+dqSdpkPLKCq4dalBlwtrtedlDCO2cfhhz25DTzQ52xAzN/DA8a
	851oBTjh6WQL8bk5b5SU/YTQXz4qN3MVUiYKUgHgv+vlPkf9kvlpRRKvSQiLAQwz/Dqb26RoKEP
	N+04n0op4pKTx+tHaN8zFtw5cWmBM6/0HsmHou8QzIPK0cZitnjvessw9yD4E1Yaq24ULWlf8ba
	P9DZe3SEuvGqfxOpA7FbHJWxhwcvcoM//ZfdopNM/84w/wCuVgEt30ilPO/AxQxDA==
X-Received: by 2002:a05:690c:c507:b0:87f:c20c:67a5 with SMTP id 00721157ae682-8a649d6750bmr4124377b3.29.1790199120690;
        Wed, 23 Sep 2026 14:32:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2474fbb3sm319077785a.6.2026.09.23.14.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:32:00 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:31:58 -0400
From: Gregory Price <gourry@gourry.net>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v3 1/2] kselftest: mm: return fail when child test result
 is fail in khugepaged
Message-ID: <arRFEKD8hmzTKFNC@gourry-fedora-PF4VCD3F>
References: <20260923-fix_khugepagd_fail-v3-0-b387e92fe1a9@arm.com>
 <20260923-fix_khugepagd_fail-v3-1-b387e92fe1a9@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923-fix_khugepagd_fail-v3-1-b387e92fe1a9@arm.com>

On Wed, Sep 23, 2026 at 04:29:51PM +0100, Yeoreum Yun wrote:
> Although the child process in collapse_fork*() or collapse_max_ptes_shared()
> reports `KSFT_FAIL`, the result is ignored because the test only checks
> whether the parent’s page was collapsed into a huge page.
> 
> As a result, the test is considered successful whenever the parent’s page
> is a huge page, even if the child test fails, as shown below:
> 
>   #
>   # Run test: collapse_max_ptes_shared (khugepaged:anon)
>   # Allocate huge page... OK
>   # Share huge page over fork()... OK
>   # Trigger CoW on page 1023 of 2048... OK
>   # Maybe collapse with max_ptes_shared exceeded.... OK
>   # Trigger CoW on page 1024 of 2048... Fail
>   Bail out! Unexpected huge page
>   # Planned tests != run tests (26 != 23)
>   # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0  // child failed.
>   # Check if parent still has huge page... OK              // parent hpage success
>   ok 24 collapse_max_ptes_shared                           // considered as success
>   ...
>   # Totals: pass:26 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> To address this, propagate the child’s failure and skip the subsequent
> check in the parent.
> 
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

