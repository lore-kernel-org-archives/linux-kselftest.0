Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BAF4086A;
	Thu, 20 Aug 2026 00:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787184848; cv=none; b=c7Q5Djx/48zA8yYz7ZTYsKVVkjMn721vYTVn1ssAH2Kta1RVuJ5Zxma/kW+9ZzRF+AxwiVlEQXv28SqopowvCPEf17LBi1l9V9PalEbIbN/QVMKr8bDV3oCtCBmkCuUqN3lB7BcWstNFb98x7DRPQLSOfnKplmVK6fjWCAOqg18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787184848; c=relaxed/simple;
	bh=hGpmloiCLdV24MFQD7/AXId11ujp9dU2vYxXpAaxRZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBL8m4EWdmJw5Y4hAkEnEMLyK33A5yM3/0H9EBrzW3IOG5/LXcC7QXYlotkMrQB91qFq+TqYLTu+UIoga0WaZhWswpH9n1NF6Sh4GyljXfZb2Y8mj0h9B6Uqi9hrosrt7cgxruuIWfbKDgo0GX7c4osvRXILtZP/nK5Z5IvP8P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAcEbQSR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aAcEbQSR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39601F000E9;
	Thu, 20 Aug 2026 00:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787184846;
	bh=HrAZoFB2O4ijHVXZLxifKgZ8fU8/Rsiq/ZvJdgv6ZAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aAcEbQSRvUAdr33zTA4FXccyAXg1kygJsd4ah3MBPqCNU7I+IgvLQhsrZY0AUSjvC
	 4nlgQSrhQZlXPxhekgLQSirgnqyqvkBgyAg/f8tETcCmz3tSISyr60zD1MjjwzpPT/
	 lFnei0Wp3GVXDjUGhk3F7IZO10YADXCYMu19p81phqAZ8eckNmxoTTTRjKj++er/oW
	 hVrhyFBXowh9pJc6ftyOkd8H+yoRnwz5kU7RJwEzQe4nAjoIbq6DwTQqUbvtxAmK5q
	 eS8NgTadFlgfiwsn/kRP06Owzd4gBBkKcgZgtVd85ktUAKGm/1XDi4oyKMLab3/hVn
	 z9wBt5zOf/jxw==
From: SJ Park <sj@kernel.org>
To: Anshuman <anshumantewari123@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH] selftests/mm: check stat() return value in khugepaged get_finfo()
Date: Wed, 19 Aug 2026 17:13:55 -0700
Message-ID: <20260820001356.87221-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260819121426.49500-1-anshumantewari123@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'get_maintainer.pl --nogit --nogit-fallback' suggests adding below recipients.
I added them.

- Zi Yan <ziy@nvidia.com>
- Baolin Wang <baolin.wang@linux.alibaba.com>
- "Liam R. Howlett" <liam@infradead.org>
- Nico Pache <nico.pache@linux.dev>
- Ryan Roberts <ryan.roberts@arm.com>
- Dev Jain <dev.jain@arm.com>
- Barry Song <baohua@kernel.org>
- Lance Yang <lance.yang@linux.dev>
- Usama Arif <usama.arif@linux.dev>
- Vlastimil Babka <vbabka@kernel.org>
- Mike Rapoport <rppt@kernel.org>
- Suren Baghdasaryan <surenb@google.com>
- Michal Hocko <mhocko@suse.com>

On Wed, 19 Aug 2026 17:44:26 +0530 Anshuman <anshumantewari123@gmail.com> wrote:

> get_finfo() calls stat() to get metadata about the target directory,
> but never checks the return value. On failure, stat() returns -1 and
> leaves path_stat unmodified, so path_stat.st_mode may contain
> uninitialized stack data.
> 
> The code then checks S_ISDIR(path_stat.st_mode) against this
> potentially garbage value. This can produce a misleading "Not a
> directory" error when the real problem is a nonexistent or
> inaccessible path, or, in the worst case, the check could pass by
> chance on garbage data and let the function continue using an
> invalid path_stat for the rest of its logic.
> 
> Check the return value and fail with a clear error message if
> stat() fails, matching the error-handling style already used for
> statfs() and read_file() later in the same function.

Makes sense to me.

> 
> Signed-off-by: Anshuman <anshumantewari123@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
