Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8899439EF0C;
	Mon, 24 Aug 2026 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558367; cv=none; b=R2ambpCx0KpeKqrYpG+dXqQJKIuxo1PxzKLWJoHqFZmqnnSrqUPU3PoqbxYpMbAqhKM0bhM5VUG7hnhrklM99OhGnviNHDtOfH7/A2ePxjblhx0uE+WBV3ef1bJyklDiNCJD0qz09zMjY7ZcA/b0HYpszI/lqVfjpJel5OUBHeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558367; c=relaxed/simple;
	bh=q6g2p8+49hC89ktOrXqzZssaIZyYtxbcfBpT6i2As04=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Zz3RS4PSl/RBHdFD18xoG9VQPwo+4YPqVjimVOOigpztuoLyV6hPbggGaI0xVP+qIv9cqB2EL1PiU7mp/vqdCoj1nyXMduAaZmtw0wDZ/OKRVaM54P9HA6Ba/bfIIoXHpwF4OD08WXeLr1pKh+VrZ7JywZD7XEPDr5HisTggUBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFwF93wY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFwF93wY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FE61F00A3A;
	Mon, 24 Aug 2026 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787558361;
	bh=PV74/df/6K/umiQchKGTehfsFy4nUqFci6FqJy9u/3s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=cFwF93wYiV3OddpWnmPqUL0m/ahsJfxZg0SmP+4hPTildsFPx5d2+/E83lgtNX01n
	 DFsTZUeGwyPJ1W2hsU+H6oRdz59hwazzyXIdcf5desgkPtj7PyS2Me9k2Q8kLUgvvo
	 eYA4OrrbFKuMYYXLUImJtbuAOgd9Z/Ooe6uNPutg4Hsai85BcXLntdjJ57V7q0YEOm
	 0NWi1EhUZ4CVa6zbBaTWmkDQe/LSanqmLgrp65+AATfViBRInl3LKdvWzNX1DbXbjE
	 ToXde76qZXN/l53PTLaolipBs1qyCyjuDo3e7mJV2sxYbtOEY62swuxhc+CW++Gdkz
	 2nji9G6Sw84hg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 2/6] tools/lib/mm: add shared file helpers
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
In-Reply-To: <20260813181230.483746-3-sarthak.sharma@arm.com>
References: <20260813181230.483746-1-sarthak.sharma@arm.com>
 <20260813181230.483746-3-sarthak.sharma@arm.com>
Date: Mon, 24 Aug 2026 10:59:05 +0300
Message-Id: <178755834510.3606540.13456191565962471975.b4-review@b4>
X-Mailer: b4 0.17-dev

On Thu, 13 Aug 2026 23:42:26 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:
> Move read_file(), write_file(), read_num(), write_num() and
> write_num_ignore_einval() out of tools/testing/selftests/mm/vm_util.c
> into a new shared helper under tools/lib/mm/.
> 
> These helpers are used by mm selftests today and will also be needed by
> shared hugepage helpers in subsequent patches. Move them to a generic
> location so they can be reused outside selftests as well.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

