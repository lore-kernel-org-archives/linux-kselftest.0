Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6D825782D
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 06:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774419472; cv=none; b=lEQ8bUA8i1y9sjuP/+0nhkDhQSkvLaXPICwM/3ao5TMltB8vPbD98Ka/Do+RhJBHN7TQoQnx6EQcede57jlfYFKxQL/5V9G1eyzx/gobxV5lcV7j1sy4dSMwUjcYGaCCNyutSrKDDrudU0HrLUDjwcdQAYPAioKSCIUEgDANPPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774419472; c=relaxed/simple;
	bh=qyJSMK0g3MooT8YAtw6pjeAMjUldLUNmCLoMb3ZtDME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVJjeIx6PUY327P/dpMok0XqXMn9+hLrzjEEgXVNp89G5AkmNtroUqiAP214YySgUHkkoAo/EWHq8DM8y0+cge6dhYHR1AT66f0tVfcxkI5ELszz9yUVFX96TM6xTO+jvkC2WmUaqox279AuQFgqWEb7GVbX/UtBhcAFFwYeRa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ekG5lc/E; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mARacOJd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekG5lc/E";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mARacOJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774419470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VlCMwKIUU9wAPzYOWKF+fKVc0JKvXu6eJCtdVRvcnpM=;
	b=ekG5lc/ErT6Nm9HC/fj7Lkv5ovtm9QEkw4QFkZuHYToxEqRr7AUjBXZHeyiBR3qFjJzbLF
	qBwNzXJhfJ4unP17pCGN5ATib433An7L3uMOc5KKUzRq2iAU5G9ewqyvN/1twTJ139xi1k
	IgnnGPHOrJu9wvWSMxVDdJA26MdzQzk=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-d0g6Fv4aPMyMGFNI0Z8IbA-1; Wed, 25 Mar 2026 02:17:47 -0400
X-MC-Unique: d0g6Fv4aPMyMGFNI0Z8IbA-1
X-Mimecast-MFC-AGG-ID: d0g6Fv4aPMyMGFNI0Z8IbA_1774419467
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c6929bd26so2470510b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 23:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774419466; x=1775024266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VlCMwKIUU9wAPzYOWKF+fKVc0JKvXu6eJCtdVRvcnpM=;
        b=mARacOJdhZUqJeBQ8WJRwxIaDAJFGO8EAzmrXy7doK9PuDcRKRhM83Hn90hGN3jOQ3
         FSFS0u87Xk/D5sGIN1n+Entqm2jwqAg2KwD6QBZJGzeMeraBDZahecMKtKPyqNHyihNG
         wHqWfLesYzVuEVTKTWgJApHBAFqAkqG3mxHPQCddlakIoRA2TY3FLrAXGFpv/qJmbC/+
         8xtldgOf1/ER9jHP76YTGHZHOCaPoQDCHGS2qizEIcANAAFkThHuCKBK34+uyFy59fTS
         l5w43IMP9d2T4t+6wuy+DNXotHLqaoH0KVZLE3/Q9RK683dnOHJH/V/+3PwSv0yoBK3H
         fprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774419466; x=1775024266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlCMwKIUU9wAPzYOWKF+fKVc0JKvXu6eJCtdVRvcnpM=;
        b=P2Sk9UzYwbAuW6Hw3tKyzH9nZztiZruyiw9yXTCAp10tVEeZ7Lzgc0ABx5e0zBl7YH
         wj3urduMrT5RKY9Aa4jHf15TvhHcGau1uWRPwxy8FGhqw8qiOPG87mL1ucQggeucYrIO
         Qz7mCyqbg3Gat+g1eJlFbEvp3BE/UMp2T3onVu28Wj9gf5i2R55WkuItiGMbcz1FthD3
         E5ldPHsbXYRvzmjWcEJPj7KacX9kmcN5LaCooul7Buu7F+k6NHfwUH0iwvAvhSCEy+FO
         J7Tvw2FQUadNaJo+Z563a82N/fvDwUAwOEdeUYVW1luw61KfrTpa6gvGbG+tlm1tD9z/
         JTwA==
X-Forwarded-Encrypted: i=1; AJvYcCVq+WfuuVJCkV6MlqJXl4Da5ZdMlRUaZ8tkbYiQRjFe1bozOfBbqnvgKpcIIICvTSMYDQ1iJAbmIUQQbwzdT/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywle/vC9IbdRvUjeYGdfsmLREyKONP9gTKpTcc8+hVBUKyKV0GG
	Tr5SEe2KXLgXd69nuXI6nhusf4iwviQ1ZFNdagslB0lbcyRbzNKfljfMzvo8QuPAfcoik+67Sav
	EIBayyFUsokdKxhOD1GlhNFH/c8Hr1PDTqBjG+FhOMNHNnNWP9/pU2tn66GR+PyQBUba27mhfYu
	Tyqg==
X-Gm-Gg: ATEYQzx1hsqL4Fc5LVz2kjE9tKrpBO6ti5SGB6AIsEUNu2nGRR4PpyzE7gmsc7dp3jH
	RLH6QyIEsZFJKdE9zwU/tQuiPUGBnDVLoRhy7FQh7TF5zGxBKg9AMdsZngGjN4N8OIu6lvGXrRd
	ISmhXIAG1cnJXtvQMj2dUhBrEctnB/ofia4iZHhFQtSEHxz92NiiUGgMOTHwO4+oXqmwAt0eECI
	aYIx8AJ6xZhIvn14C19/vTXFINSHmMmM/qq6XTJG/UG/MLGUnA3J87PjtzG2z2qgdYuTTHAw74W
	bQp4Sahl59cznwLvoMX2TC4shtLHk+VwiNtML3iVo0cNqkbSy7yIj1snKGxDalq2nFoelgMTh3t
	6Ib2PtNr+/mzLvT8LWg==
X-Received: by 2002:a05:6a00:4489:b0:82a:899b:d804 with SMTP id d2e1a72fcca58-82c6dfa883cmr2410548b3a.38.1774419465984;
        Tue, 24 Mar 2026 23:17:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4489:b0:82a:899b:d804 with SMTP id d2e1a72fcca58-82c6dfa883cmr2410518b3a.38.1774419465494;
        Tue, 24 Mar 2026 23:17:45 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbebb2sm15843054b3a.14.2026.03.24.23.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 23:17:44 -0700 (PDT)
Date: Wed, 25 Mar 2026 14:17:42 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, longman@redhat.com,
	yosryahmed@google.com, nphamcs@gmail.com, hannes@cmpxchg.org,
	mhocko@kernel.org, mkoutny@suse.com, muchun.song@linux.dev,
	tj@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 0/7] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
Message-ID: <acN-BsPf0OR50sTP@redhat.com>
References: <20260322061038.156146-1-liwang@redhat.com>
 <20260322091851.e965d3a2f0d6af5bd985407f@linux-foundation.org>
 <acCyPNCBoTGAJjfs@redhat.com>
 <CAO9r8zPxUv5V+VKEBuyacJUsc-UWh7hGc06yNQntY2GcUJLBPw@mail.gmail.com>
 <acKAr0TYzuYPxH4A@redhat.com>
 <CAO9r8zOCGWSX1+t8-5qe+04UZ6i4mChPJ8hkpiS5Z8pAPZ0sZg@mail.gmail.com>
 <acNH6C6Ay7As4y60@redhat.com>
 <CAO9r8zO2Nq=8dGBuJ0xpQTEr4EM2iJ=WNULtCU5FLLj4a23dYA@mail.gmail.com>
 <acN8tN4FhuoxCxzs@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acN8tN4FhuoxCxzs@redhat.com>

> In summary, the problem is that 'zswpwb' does not update when zswap is executed
> under the zstd algorithm. I'd debugging this issue separately from the kernel side.

I forgot to mention, this issue only observed on systems with a 64K
pagesize (ppc64le, aarch64). I changed the aarch64 page size to 4K,
and it passed the test every time.

-- 
Regards,
Li Wang

