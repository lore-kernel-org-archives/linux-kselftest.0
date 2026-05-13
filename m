Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D404123741;
	Wed, 13 May 2026 00:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778632980; cv=none; b=GXkAkJtYMpBomL+1pz2/Xon67EBZePb64lhuI5OiE5HGTGUyGPS35z8aAM6hprt1WQqW/HEc6yLS7yCa2F6PnYG9et+biyuEEsQhX/Z/DgYM2USjipWlmvkwbgwqcWzbWBpZBqIOV1/kEFpkR7SWT+7HjnG09wT2C3tlkhNCz8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778632980; c=relaxed/simple;
	bh=F67x74zQHDavInVewpEn45XQx3OuQF+BwWkBzVhar/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQQPODgagLzToyL0RHveNtMyjWGJ2ti90awZMKi31qiql7Pvl2UiiunT5eTN3qp015dytX6KVzPZMvM/NGIx4YB6Lfx699+O+VUe0mBxZNwmGwhbUD6kslyUIob4QzFD2II88okFSICSKzv4qQXidWwlugbKZ76f0xv0GCRLna8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJ2dmddO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJ2dmddO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16C3C2BCB0;
	Wed, 13 May 2026 00:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778632980;
	bh=F67x74zQHDavInVewpEn45XQx3OuQF+BwWkBzVhar/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJ2dmddOQdMDLftsFFJcND6nRRMR1+HtKsSZc3SxDbKf+/cdldMq5ap3SZ6pb75wt
	 lB5WpDIQEkLKX051okiB5uFRqVHDFM/PUHvfTaB4yHyEHRwB7aGJBcEQ/eukiHbLUg
	 oEgZ5+/f+DPlYQvY21MRaHtpmYYZ6SRn0sjX4EPBX+BjhpuqX/0cOJo3Z55JS6sgJW
	 FdzUp+QBd6gmb4CtSlIjs+A+y3l193N3X6rghhph4qS7Y2asFhU2iFNqpTZ3aKFPnR
	 fyDwNHb38Q+SmLVW68BiZS0Pjmst6yFnnOzKyKzwYGVtyl7BA4bc7Q/vCvs2ZIzYP3
	 wos4kr2I5IilQ==
From: SeongJae Park <sj@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: SeongJae Park <sj@kernel.org>,
	jgg@ziepe.ca,
	leon@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix mmap() return value check in run_migration_benchmark
Date: Tue, 12 May 2026 17:42:51 -0700
Message-ID: <20260513004252.118855-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512101305.139509-1-lihongfu@kylinos.cn>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 12 May 2026 18:13:05 +0800 Hongfu Li <lihongfu@kylinos.cn> wrote:

> mmap() returns MAP_FAILED on error, not NULL.  The current check uses
> !buffer->ptr, which evaluates to false when mmap() fails (since
> MAP_FAILED is (void *)-1, not 0), so the error path is never taken.

Good catch, thank you!

> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
