Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B167A285066;
	Mon, 25 May 2026 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779739322; cv=none; b=KlgS/ImBdARLcfQN02qUKDz7GiDaoP2Q/jxltHuFsefG75DroHKf5LaaAnhy2p1rmOwaZc5xaLVc8Ehlasj6EGPifB8gRDwQoYyjtkXR9kPYSXow242d0mV0hzspY+DS/LefjWmTn2nqKAtKu1HuX23M9r8Cq4RKrqzVYLFVUyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779739322; c=relaxed/simple;
	bh=pAQ/1a9bUwyZY7vxZ0yW0kj9FFkFwXnH/gwoyg/dPfI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CnrP9EcxF7oybuyCM0ncOsq3i2VuFMt9GhwJ23Ccl1n3F7UsKkdHENaJEZQ60cU/ImbOd0+GZ4y4FclUpIBPF4T724wFQ34NGfTBQBabNM4LlmAAJlsoSaa2h2I1LNFTGVo78iQdlaMFSs6gTB58XThEvMju3mkpssnGr+K84rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uXq8BWDy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uXq8BWDy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED19F1F00A3A;
	Mon, 25 May 2026 20:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779739321;
	bh=V6/YknKdEA4x8G6R+IgJTIdlwuQ8G6+RHz4gavhL8N8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=uXq8BWDyNGvkOFFNnaYQbloQHEWzuG3IdaOULAj70Gb1uUARS1DOl1yeXusze+6Ir
	 tnDmAOo7SrmrYQOZXJ7ny11Wnk5kf1wzP29s3okD3OuxDV35168eM1H3Kw2F+eecnB
	 DbiK3inWCrfp3ZxkXfZpLR7Dp7wHYZkrHpShvocg=
Date: Mon, 25 May 2026 13:02:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] selftests/mm: refactor pkey helpers and fix mmap
 error handling
Message-Id: <20260525130200.fa26a0456979d8f1045dc930@linux-foundation.org>
In-Reply-To: <20260525073026.27594-1-lihongfu@kylinos.cn>
References: <20260525073026.27594-1-lihongfu@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 25 May 2026 15:30:24 +0800 Hongfu Li <lihongfu@kylinos.cn> wrote:

> This series is version 2 of the previous patch [0].  In v2, the changes are
> split into two patches for easier review.
> [0] https://lore.kernel.org/all/20260518082120.3890552-1-lihongfu@kylinos.cn/
> 
> The main changes in this series are to refactor shared tracing and assertion
> helpers into a common file, unify both pkey selftests on pkey_assert() and 
> per-test tracing for consistent diagnostics, and add missing mmap() return 
> checks with MAP_FAILED used throughout for readability and consistency.

Thanks.  AI review seems to have found a legitimate problem:
	https://sashiko.dev/#/patchset/20260525073026.27594-1-lihongfu@kylinos.cn
