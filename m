Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6F53A4F50;
	Mon, 24 Aug 2026 07:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558382; cv=none; b=CyzzqErOrVSywc17Ve1ckGXfM1x/L7epwQIg3dC6e3Pi02CLr49pK2dfSiXgu24ptuXt7prSc0aoro2oev/BuZ6FPX00mMOhi1K6Xk6ihPlZIx57QQdrVL511g37qHq6+v66SyAvsPvqJCAnqYHYORQ9tSODbEwCFZKnDryP2h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558382; c=relaxed/simple;
	bh=6c/yG0w4MwAhWeivV16ZvevHSZ8OVjajpMSzU1BVN2E=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=dK5aziS/+reRDoOTzorGyQ4u/0qj3+wrbY2mO73JBVVUlORKEGIO/pQp7G2u3N2RYuN5IJvE/QXKKy5x7AF2fh/DuMGqNxa4TZuESWPX6Yj8/VHY8PTzUT2XIVwQkuKXlSBH1ofvkCHu0zGSOefw/0ubyJJIT6JEbeAZr2/LF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMFV9AKJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMFV9AKJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93F01F00A3A;
	Mon, 24 Aug 2026 07:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787558375;
	bh=QESuUejoif21xpk97k6427Fvu+YxzkM7GDXWk9VgdKE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=lMFV9AKJpUzgDR2MoMR0GFxbAdwyj8PeKhtFdvRKi15qNTh3y5ASPNf3oi/I0YyTr
	 /anHzyDhj+8le4BthTbUd3SpUje00DSuPpnmfW0Yuxl2+3DrR2gZ/X2Wp3EVaRKb1R
	 5bacSFKuBovrNvUyL3+KWZHbjoNkesPD+pQ+uxJ9FsTVuToF6nsPM7/UWpCSolXN7M
	 0MZ6YQJjHuqmTcL+A0wdRV/M3Y/QjsoyNwo6Ux1F9+5XRgy2Hlta7FaI8UxRZybjy6
	 vjuEHHUwB1nQaY9wKR2dgUIhfMQVQCP6P/G5m2GLHZzFJsQszYKUxLjp8ydW3IGmDJ
	 s26qZPlp7WTpQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 4/6] tools/mm: move gup_test from selftests/mm to
 tools/mm
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260813181230.483746-5-sarthak.sharma@arm.com>
References: <20260813181230.483746-1-sarthak.sharma@arm.com>
 <20260813181230.483746-5-sarthak.sharma@arm.com>
Date: Mon, 24 Aug 2026 10:59:05 +0300
Message-Id: <178755834511.3606540.11386137708509292188.b4-review@b4>
X-Mailer: b4 0.17-dev

On Thu, 13 Aug 2026 23:42:28 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:
> Move tools/testing/selftests/mm/gup_test.c to tools/mm/gup_bench.c.
> This is the first step in separating its benchmarking and
> functional testing components. Later patches will make this a
> purely benchmarking tool and introduce a new functional selftest
> under selftests/mm.
> 
> Include hugepage_settings.h directly instead of vm_util.h and
> use getpagesize() instead of psize().
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

