Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8A1255F57;
	Sun, 22 Mar 2026 16:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774196333; cv=none; b=uCqgb3eooWG8J4vdIceL+UA9fymW3SK/JvQgFmBkwrh//e/T/9FeA+gmyo+hHvGw2ozgOSHTnYnibTWTxfuyX1WL9Q7njXg1yu+FBqmnVkc8QOecGNjwyQaCdflxr7pVTIscdz4FZoqjj3afWbQ1Rf+nnG1G7vGFOAu3JIT6cnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774196333; c=relaxed/simple;
	bh=pP5uNcSCgG45MH4/HYNrgZLlyFOBkKviWCQd4I+JIkE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KMmhAWSr0TM8PAIJZDxM7V1SiSHuHTS0vegx5bK1EPMA7+sB6gfZbPJJk2wq9XmuP76QymHHAdY5MCz7Rc2GiTqaOJve7sqt0y+Xm/ZP+ehEffTEocJJ784fEXRB4Sjv8noosCGv/0hig5jp48ijXBJpLP3imvt0cjVS1E7deDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fLv/fglc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fLv/fglc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A1AC19424;
	Sun, 22 Mar 2026 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774196332;
	bh=pP5uNcSCgG45MH4/HYNrgZLlyFOBkKviWCQd4I+JIkE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fLv/fglctIByfcRHnORg/XrxwdIv0B/kVJnimOKezsybG+/3MrwU937EbpZ3tijLv
	 AyMmCWWqOc7/dvDj0XN/Vg4lom/rQRMQ4xBMhtNDWNcW5MFQOHmBLPk8yClDDSL1K+
	 X/2WfOlQJvR5TRZuCJizMs3MfxHsnT5HlmX87yaQ=
Date: Sun, 22 Mar 2026 09:18:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Wang <liwang@redhat.com>
Cc: yosry@kernel.org, yosryahmed@google.com, nphamcs@gmail.com,
 hannes@cmpxchg.org, mhocko@kernel.org, mkoutny@suse.com,
 muchun.song@linux.dev, tj@kernel.org, roman.gushchin@linux.dev,
 shakeel.butt@linux.dev, longman@redhat.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v4 0/7] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
Message-Id: <20260322091851.e965d3a2f0d6af5bd985407f@linux-foundation.org>
In-Reply-To: <20260322061038.156146-1-liwang@redhat.com>
References: <20260322061038.156146-1-liwang@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 22 Mar 2026 14:10:31 +0800 Li Wang <liwang@redhat.com> wrote:

> This patchset aims to fix various spurious failures and improve the overall
> robustness of the cgroup zswap selftests.

AI review has questions:
	https://sashiko.dev/#/patchset/20260322061038.156146-1-liwang@redhat.com
