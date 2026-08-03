Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9431C30648A;
	Mon,  3 Aug 2026 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755085; cv=none; b=EKKlUe4m2V61IAMQ9ADk59o3OiNq17HiVpeFgINSuieceVhCsFzoqgJUxeLuvDyAHIb3dR05bk02lp3QPnkO2EPTcX+XLbMSPQR7mgbs9uBgLypAcAXVXCir6cv66OqQSXmm0nFgslAFx/yqIxMhwQRP7hVM7rsKUBi+YXT0dHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755085; c=relaxed/simple;
	bh=PJntqppVv7TG1Tp/dFNyZOQ2Usyw0o3+Ymljatdxwic=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=gVLqsSvncChiYHfu8og+GzWN0/CX1M8qt+jCCdqB0eJbjTawnQ9uRlkFeV18f7IwQdTJrskliSAJXKGDfx0hWOT6tO+INVINp5suZQhwkKBB3mnJM68NCSNpKaAl6R9Iy3yuXVBoQnzcS/Z996NOd4uelOHCyj1dKIvWQET559U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbnvzZMl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbnvzZMl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6591F00A3A;
	Mon,  3 Aug 2026 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785755082;
	bh=Eljn8Ny6rhPTzrLYH+abslck/G8K3E0nYOeGDjQhH0s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SbnvzZMlM/voSC7+sBfc7otUzGuJs5uZzzFTrVXzuurPl1aDwibu4lf+ckuMsBoHu
	 z3zd8CsNBXdKp83z/0oGh6x2tuGeO9ZyWyT2LmgH7d5vkBov167h1XwmHYyoRbkAce
	 aPYiQd8Mh097JYBn1YrVEmVe/KOmpd37QeZ5VJu+Y30XkltL5iO1zFHZ59I5EkCK5W
	 SitiSkw/jA1JlJeGPikvUrKqZgqtUrrl7fP+8K4Rji0525a6ZPrzKd1sO3qMDvpm1X
	 7gelXVBLkh+wS2A2lbDkftGdUYiLEi/BmKS7QJ9J8s/RlA1BEKn3kQwCTqcTrXzdgG
	 YG5How9yhG9tQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 01/16] selftests/mm: move is_backed_by_folio() into
 vm_util
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>, 
 Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>, 
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
In-Reply-To: <20260802195254.1937477-2-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
 <20260802195254.1937477-2-kirill@shutemov.name>
Date: Mon, 03 Aug 2026 14:04:23 +0300
Message-Id: <178575506323.1561566.15724813374821403024.b4-review@b4>
X-Mailer: b4 0.16-dev

On Sun, 02 Aug 2026 20:52:33 +0100, Kiryl Shutsemau <kirill@shutemov.name> wrote:
> The khugepaged selftest is about to gain mTHP collapse coverage, which
> needs to verify that a VA range is backed by a folio of a given order.
> split_huge_page_test.c already has the building block for that:
> is_backed_by_folio() classifies the folio backing a page via
> /proc/kpageflags compound head/tail flags.
> 
> Move it into vm_util so other tests can use it. No functional change.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

