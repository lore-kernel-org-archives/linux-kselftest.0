Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8B53A5440;
	Mon, 24 Aug 2026 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558385; cv=none; b=II4yMySBKyfyPJ1MiOGnTx5VsJC9AMVEiwQOUqMcLkDgvYYLNnV9Jb+1nINliyG83Yf7omMiOvSxzqL6WLxiuKf6amUOsqKB20UwUevUcW0/tjbMaSKC003+5k1RApY39/BpLAJjHfWqsmHNGbacZHCthtOzN2NWvpQqOndbMMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558385; c=relaxed/simple;
	bh=1gOUUkGPUJ+u3gy+WPXhljpJInt5miNq5/P6ha10rWk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=LNJ/D6b1Ww5xtoezw5XTmG7jdaQnoDqFik8cCw8VpGH73A5g0M7kSnBclbUb8cVxCG2pd8YpF4l2Z2vXlgTD5hgq/K4ZsGElC8DjhybmuGwaGXaKb8x3iZc18U/rxu2aqh7V4iDiea3OsA277ZA+lwvjYZmTzN1ThCl5uKEQ/6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uf8hkcQg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uf8hkcQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924EA1F000E9;
	Mon, 24 Aug 2026 07:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787558381;
	bh=WJoYfBFszVnClToOHHH2o5hji7ont+MTpRkHMfc8KdE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Uf8hkcQgyJKXdHugZsCiBPziTvMAXJnVifz9UyTjgD/eZWe/nknUlm8s0O/JoBeMM
	 zOTkqWmeWZJoTGQP8oT3O5tOnrzFTgNZzN6nujVMzarnsU3/FVXrUGlzZyltG425B5
	 +5CNyoVrS40s3VYr7n2RcGZGU5qjozmZEVplpknmIafNO34dtivWT5sK2bzfFJDyyV
	 kN/9elDd4dQ9pMZ0j2E/SN1bucrC2Xn49rRnACE3FdS8FH50U310+gFa3RXS9JS0RQ
	 AGounwpHabWZsDoQJkpU7yulG7y55O16IuZkiR899OWASWOlCEITvxYxu+obYmpqy9
	 pYkqB1Wm0371g==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 5/6] tools/mm: make gup_bench a benchmark only tool
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
In-Reply-To: <20260813181230.483746-6-sarthak.sharma@arm.com>
References: <20260813181230.483746-1-sarthak.sharma@arm.com>
 <20260813181230.483746-6-sarthak.sharma@arm.com>
Date: Mon, 24 Aug 2026 10:59:05 +0300
Message-Id: <178755834511.3606540.5889183666243190319.b4-review@b4>
X-Mailer: b4 0.17-dev

On Thu, 13 Aug 2026 23:42:29 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:
> Remove the functional modes (GUP_BASIC_TEST, PIN_BASIC_TEST and
> DUMP_USER_PAGES_TEST) from gup_bench. Drop the kselftest dependency
> and use normal diagnostics and exit statuses.
> 
> When no arguments are supplied, run a single GUP_FAST_BENCHMARK
> with the existing default values. Let users select other
> configurations through command-line options. Report ioctl failures
> and handle errors without relying on assert().
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

