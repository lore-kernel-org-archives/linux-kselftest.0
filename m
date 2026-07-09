Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94DA31F98D;
	Thu,  9 Jul 2026 02:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783564643; cv=none; b=jIBiPVTUQ5Xy4P6hWUnk9BsxsS+HdJbqLvsUUnegO8k6Stfij9BMcI5yd3YHlMrtahkmA7U6FGVm4a1hZB2VrkYpTV8GxGzRYfmuM6MxsHrlnjuIL2o9rDZdi0gEcbM2w7vyU5tBxJ6+2FRpQrO5ipGLZqNoYwAivR9JzR2hb18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783564643; c=relaxed/simple;
	bh=iWH8WL36g7Jew5ErhVc/zRyt1UBfjoKrrzZi5tk3NfQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Zr11R46Di1JgZmExCamlz2eaYZpyTZ60v7lRbVH8v3N5UwwdmcjXnsFRgyDZMpnjpElMYweiy9CDW5vEjfw66MlA/ZJkFJiuSk8SKukfK3eVUoyDqfXN3gwEtcpYgFqDHbR7V0dDSsifcs0dV0IO+qIz8trw3VF1pfxrGKGneN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WajQre9O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WajQre9O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010801F000E9;
	Thu,  9 Jul 2026 02:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783564642;
	bh=JX23oQxCnBnBAcGpq5NO6ntuxDExUTVnrk4WKrffy8o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WajQre9OLvs6mRqXfZYmVtTC4w1/Wvl3AnsS8o/+HCGyI2P6dC/xWlzvAYa83yZBN
	 gBHqZMYCxRidUbGYVHy7z591MvvbfuXU2ZmuDY9x0jbjO+W3hMp8QuhAHYHLl5JO5b
	 1DDN4kpF+eBciN33ilBDk1rPLtjCHGxgCpMKRf5w=
Date: Wed, 8 Jul 2026 19:37:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: jgg@ziepe.ca, leon@kernel.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 hongfu.li@linux.dev
Subject: Re: [PATCH] selftests/mm: Fix memleak in migration benchmark
Message-Id: <20260708193721.5aae192c95bd8c7840e9c1b0@linux-foundation.org>
In-Reply-To: <20260708103705.840679-1-lihongfu@kylinos.cn>
References: <20260708103705.840679-1-lihongfu@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  8 Jul 2026 18:37:05 +0800 Hongfu Li <lihongfu@kylinos.cn> wrote:

> Several early return paths in run_migration_benchmark() skip
> hmm_buffer_free(), leaking the buffer. Replace with a single cleanup
> label.

Thanks.  Sashiko found a bug:
	https://sashiko.dev/#/patchset/20260708103705.840679-1-lihongfu@kylinos.cn
