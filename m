Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB06B481B1;
	Sun, 30 Aug 2026 01:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788053184; cv=none; b=juMPQtyN4zIo1Uk+2qFnWr8readDl2yRcCR4Sdq0GCa/vt3K9zzSZ5FC9P7ZFjX3kuGqox60DavameaP6ya6obt3LPncl52oq2aB16FlxO8PuAPjoJzZxY8lBexIYecmRxip77P3M/qJpFl5U6B0+4CqN4esh8Yumz7QNw90jfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788053184; c=relaxed/simple;
	bh=uOq5HqkisnX5qjEjwDLefYpZEcM8sJhccltua47tc30=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pBJyvZb5LYoraj7fMvRBYXYi7MJizBFIn6XClfG0vPwi852wQIpJvJ1KspgK0VKTAfQvNQMglG5U7HBAL3+tB+MASBKlc4xZQrL0fwpRFmj3+tsKDkb/jBa3zBmZnRTj81J2zp1GLDTUJ3wvvGqgVxjFZMvLTg0mJIkLDwULwhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iZDfcGH/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iZDfcGH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D491F000E9;
	Sun, 30 Aug 2026 01:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788053183;
	bh=cg0O6+JpSBYgYOlgnsZHH47HcBGjkXpwip68bdGKfpI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iZDfcGH/hYQlAic5Rchp4ZCmJ3pm6YMEY7ptQpfR1xN/cvJ9m2KVxwdkmIRL0oA3q
	 lTvqanhFedgBEudJfW2WxrJVMDsX4cdmhAocf3REp+1GXY1zle9a+i7rWNxwSfR+Td
	 HaUxJ7sIhN5FC3JVAh31MXsl3RK3MBMddbor/8wM=
Date: Sat, 29 Aug 2026 18:26:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Konstantin Khorenko <khorenko@virtuozzo.com>
Cc: Shuah Khan <shuah@kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Eva
 Kurchatova <eva.kurchatova@virtuozzo.com>
Subject: Re: [PATCH] selftests/core: fix unshare_test with large fs.nr_open
Message-Id: <20260829182622.401275404893ef640e8c81e1@linux-foundation.org>
In-Reply-To: <20260814165709.513263-1-khorenko@virtuozzo.com>
References: <20260814165709.513263-1-khorenko@virtuozzo.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Aug 2026 18:57:09 +0200 Konstantin Khorenko <khorenko@virtuozzo.com> wrote:

> The test assumes fs.nr_open is close to the default 1048576, but some
> systems set it much higher (e.g. 1073741816). This is systemd's doing:
> since systemd v240 (2018), PID 1 bumps fs.nr_open and fs.file-max to
> their largest possible values on boot, as file descriptors are already
> accounted for by memcg [1].
> 
> In that case, dup2() to nr_open + 64 requires the kernel to allocate a
> file descriptor table with ~1 billion entries, which fails with ENOMEM.

2018.  Can you suggest why we (or I) haven't heard about this?

> Cap the nr_open value used for the test's own arithmetic to a known
> reasonable base value (1048576) and restore the true original value
> once the test has completed.
> 
> [1] https://github.com/systemd/systemd/commit/a8b627aaed409a15260c25988970c795bf963812
>     ("main: bump fs.nr_open + fs.max-file to their largest possible values")

Well, we do want selftests to run well on the kernel with which they
are shipped, so I'm thinking we should backport this into -stable
kernels.  We can probably skip the Fixes:, but a cc:stable should be
added to capture this.

Thoughts?


