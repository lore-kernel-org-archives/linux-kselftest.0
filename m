Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865022E7F17;
	Wed,  1 Jul 2026 05:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782883225; cv=none; b=Zt0HbPwYUn63bj4EJ8rsXlnafs39GRaHdOldWGKFxbMPH8xlRAgPDWP4L683Gp2mdBSRudqcZLIqa+5/eLzb7ZjWqiwo+aJKqUB4Bp4ItZOu33zpHNuvUXXW3Z0J5yw2PWd7Lk14X5KE9HQqOcnj41JmFx+Pdp2SY+sjdTPQ8Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782883225; c=relaxed/simple;
	bh=LGbYR/e/HflN+FJj4t3lTxsXUx35eeyQy0mQPEIHVyU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=twPofdzVcdpGBr4XayN7GVILQVRrK5Bk2ImNxgrNwgsZl/qCJgcl+nndZr1+34QSCEYQ7YMZ+rVkcK+mFHqax3Fl+W6RHrd1lObIg5cfMut7No1gTN07C+i8W7SsDBjyjJKxwGgWReIxce9jBxIk9cyIcKVE5FmlJX3Xe0BO5Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=toX5mJSD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="toX5mJSD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9871F000E9;
	Wed,  1 Jul 2026 05:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782883224;
	bh=BiRROp2Ck0Qkb07LLqpzBl/VkKQ724vUCdYfSeyPwHs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=toX5mJSDYiUmElynFgLq3f4b9XllfqQFbjfK23hHhukTmMF9ik0uooWJKpqXTrXnG
	 Zg72KCViAfcmbtkfoRbTpkJBI0ETtVodN/1WL5MtLKkaMbRhSdgXeeQYkBgstdiOKv
	 xWXccyv1k9W19S6znNmndr0pLOwT/wGVXjAUBBqo=
Date: Tue, 30 Jun 2026 22:20:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, keith.lucas@oracle.com,
 kevin.brodsky@arm.com, maddy@linux.ibm.com, usama.anjum@collabora.com,
 yury.khrustalev@arm.com, jhubbard@nvidia.com, joey.gouly@arm.com,
 zwisler@google.com, hongfu.li@linux.dev
Subject: Re: [PATCH v8 0/5] selftests/mm: refactor pkey helpers and fix mmap
 error handling
Message-Id: <20260630222022.60d0951b90af8857971ad10c@linux-foundation.org>
In-Reply-To: <20260630073235.3802271-1-lihongfu@kylinos.cn>
References: <20260630073235.3802271-1-lihongfu@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Jun 2026 15:32:30 +0800 Hongfu Li <lihongfu@kylinos.cn> wrote:

> The main changes in this series are to refactor shared tracing and assertion
> helpers into a common file, unify both pkey selftests on pkey_assert() and 
> per-test tracing for consistent diagnostics, and add missing mmap() return 
> checks with MAP_FAILED used throughout for readability and consistency.
> 

Thanks, I'll get this into mm.git for testing.

AI review read the pthread_create() manpage and didn't like
pkey_assert().  Please take a look?

	https://sashiko.dev/#/patchset/20260630073235.3802271-1-lihongfu@kylinos.cn

> v8:
> - No code changes (relative to v7).
> - Updated Cc list: added developers identified via `git blame` and
>   `git log` on tools/testing/selftests/mm/pkey*

Kevin, if you have the time, please.
