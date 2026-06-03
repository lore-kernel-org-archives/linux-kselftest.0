Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368FA41C30A;
	Wed,  3 Jun 2026 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780480887; cv=none; b=uYyKzQ25xJnrrveKalw/gG4V0At6x0/l2eCTeorYVmust3QfKAQyWSOXH3uR6mZZhHW0ktKcZIq3qJS9+a3Dr9QiCDsT29EQkSzIjc+LRYwL353XLFy53MpTM4vHQVIjXM7QCKsk8taJx0spzjSgiAiBm8vLpQVenCYFlEjlwoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780480887; c=relaxed/simple;
	bh=WuK/tTXXRfQfzR0os4Uf52HJC3ngO5lYJQYa1wcv65Y=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=CXoxabBEuSfbOjtz6jfh5AJZNod2M0Vk9VJNZL6+mXFIoTh7oJhfP9VMn3hiACAfKSWHmXW7iQ7RL3rN3ICRQ2eS/KC2OodN9LYnwfKAqila/eIIqBsBaIzVVx4tofbOkUaF6vI48W6jVkb+cwPLyZUSQlGbqsR66ynRG3xF4jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyifO2RL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyifO2RL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4731F00898;
	Wed,  3 Jun 2026 10:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780480884;
	bh=u1CTZ7oc5S2yw/byDNkdoYymx9kciSIu5go090hsMMI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SyifO2RLgJot/0nMvhvebvZ/j/IRFCanYUIghVG+LecIPnvv31bTofLbYJCdFR5jR
	 eHUL1BEW1bYQYByZpVEHqkS/Nf7pH2oFgN1tnCQhh5NztHp6xik7J33WIaVohaLpZQ
	 e2D0siiXHg0zYu7oYW/3nCF23tX2dexeV1fmEbT4TGYJeMB04JBodaLk4UZrzyfChY
	 +c1D0j+wr6/L5xTUEKa5BwPmBI65fQiwTvy4YCMHynUuGLLrkMhyVSFK1Zq6LDhx3b
	 EVJpVA3U8rY3NM3t4yrMdWg4Yh2Ivu7Dh9PEMjVNfnGDdYoZZNo7GOF0JB+uSKXMKA
	 4ZIDapTzVijkQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/5] tools/lib/mm: move hugepage_settings out of
 selftests
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260527142432.230127-4-sarthak.sharma@arm.com>
References: <20260527142432.230127-1-sarthak.sharma@arm.com>
 <20260527142432.230127-4-sarthak.sharma@arm.com>
Date: Wed, 03 Jun 2026 13:01:08 +0300
Message-Id: <178048086822.472368.16880248677532938003.b4-review@b4>
X-Mailer: b4 0.15.2

On Wed, 27 May 2026 19:54:30 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:

Hi Sarthak,

>
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/lib/mm/hugepage_settings.c
> similarity index 97%
> rename from tools/testing/selftests/mm/hugepage_settings.c
> rename to tools/lib/mm/hugepage_settings.c
> index c2f97fe97e58..c75b9c8f4a74 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/lib/mm/hugepage_settings.c
> @@ -419,8 +424,8 @@ int detect_hugetlb_page_sizes(unsigned long sizes[], int max)
>  		if (sscanf(entry->d_name, "hugepages-%zukB", &kb) != 1)
>  			continue;
>  		sizes[count++] = kb * 1024;
> -		ksft_print_msg("[INFO] detected hugetlb page size: %zu KiB\n",
> -			       kb);
> +		fprintf(stderr, "# [INFO] detected hugetlb page size: %zu KiB\n",
> +			kb);

ksft_print_msg() prints to stdout, let's keep it for now.

-- 
Sincerely yours,
Mike.

