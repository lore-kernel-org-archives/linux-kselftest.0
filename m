Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776A53C10B3;
	Mon,  3 Aug 2026 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747627; cv=none; b=Yhcki/XPd3Z5DDyebKzI3BGbvpH/UWQf2xj0aJHAgpqthiw4QXxrorZ85H+q3Mbs+IDUcrcIBymbb0lnv31E6WRipC5LK9s6Tt2HwcWa5hETNfGzusJMNjoo6MgF7JpKGd8xk7XhmVg91cOCvOMgBqDldxTjaCK3n5yUcP46So4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747627; c=relaxed/simple;
	bh=ugv2TwzVSNsb0lpHWopBYX6bQ44ySF6EINaaV/xh3yA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=s3DdqcBNLjAEsTUtToJ2kK4O+Fy1xyl9wiCJtLig8xVF4o7qM+XeuTajwsRsVJhuKmqp8RoCSbfT1WrE/ZrFcPZn3nOzeEEOiUvTXUy4USvDLkPfez1jMx576r36e/bCbxtq8rjClr+wRzni34QwCIaOhogFuKkwRiZDl8kO9Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JX/ujSHQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JX/ujSHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F561F00A3E;
	Mon,  3 Aug 2026 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785747625;
	bh=8ENSxpDdo1N9dYuP9eJusu5IRA5To2LtlzCwfm9J0k8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=JX/ujSHQtZFhxEiv11F3bAOveZtfwWNeoayNGrl7Hp6JkAJDKZjfst0Uik+TL1Rmk
	 t4/5UfIBaC+rh6BMkgYdsn5Y8K14oYv7AUGwKUiVORX2FpqrFv8vfYv2E+bgTr/ID1
	 BCklATGLFSNYiw4iOU64B1INmZZPHk9ZppzQYhh3CJ2NDIz4limjSSQgmgp+jQHt1h
	 pOpOBoZVsrqUPSZcYWSToMR+4umnRxavcFaw4TEzOnSF1qvdBKoBJewyHdAr3M0AoV
	 KgcG0h/fbtCVnGfA+gwCSAWdX7ZQ/GmkOBC0pEme/3HVISDzKugKYoTSDRwtJqDYOo
	 9MfXeoGKzrU9A==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 2/6] tools/lib/mm: add shared file helpers
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260730140825.238130-3-sarthak.sharma@arm.com>
References: <20260730140825.238130-1-sarthak.sharma@arm.com>
 <20260730140825.238130-3-sarthak.sharma@arm.com>
Date: Mon, 03 Aug 2026 12:00:01 +0300
Message-Id: <178574760161.1561566.15822401997260524037.b4-review@b4>
X-Mailer: b4 0.16-dev

> Move read_file(), write_file(), read_num(), and write_num() out of
> tools/testing/selftests/mm/vm_util.c into a new shared helper under
> tools/lib/mm/.
> 
> @@ -187,8 +188,8 @@ TEST_FILES += write_hugetlb_memory.sh
>  
>  include ../lib.mk
>  
> -$(TEST_GEN_PROGS): vm_util.c hugepage_settings.c
> -$(TEST_GEN_FILES): vm_util.c hugepage_settings.c
> +$(TEST_GEN_PROGS): vm_util.c hugepage_settings.c $(top_srcdir)/tools/lib/mm/file_utils.c
> +$(TEST_GEN_FILES): vm_util.c hugepage_settings.c $(top_srcdir)/tools/lib/mm/file_utils.c

I was too lazy to change the Makefile, but we should do something to
compile those once and link to every TEST_PROG that uses them.

-- 
Sincerely yours,
Mike.

