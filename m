Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509A23B4EA4;
	Mon,  3 Aug 2026 21:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791366; cv=none; b=NqN9JfSajHENDVuIN6C4k8q1Na+GuCFy3iHzb2rNPQ89lrRwcV1RENfWgo/aHdha1yh6gamZa4f1CO3qenWyvpVX60CUnA/A/mMFukSXcCeJlqogIekxm8fc8MPGORTcOdBE2eFyVcfJgp7rrx8WIKvUE4raQ2WMue0O3BqHpR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791366; c=relaxed/simple;
	bh=pQj3XhRbGQlE6oYhFYSAWtd+u2u4afuthWdC5XMgUXI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jAHdV9zPJGbUL+Cs6KFvzyQ1zfZf12fn0tV9BVZI5p7l6/0JHW2O6oIBIWzUW6nL1cm9SBEgETYjs80ff5aedlArl7KFNEXftJb6OwNLincJIsr7xlMvgTisrX5WYw/W8TPWc4+n4Eyfie9D8RKernH23thvY/MuZtbwGuffHd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rsG0RJWz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rsG0RJWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8811E1F00A3A;
	Mon,  3 Aug 2026 21:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785791364;
	bh=E3d4/jTY8p0Y3bMO1IERG+admOXATFRUOPIYJ+olYXA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=rsG0RJWzLYU81HQfd3xnSHSI9xefv4MJ9QELZYw9E7IOp9dg0fkS5Iy05vuboBQp8
	 P/aPm+mUUq2KRsKRv5BrPdTFyFiW6nVi/E9mhva1LQTmL/rms5acPPB2bsCMsFUdtL
	 OGJHH1VbjzUkoB52v7FOeQ1VzhPbFi0RN7q+P4ZU=
Date: Mon, 3 Aug 2026 14:09:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: shuah@kernel.org, richard.weiyang@gmail.com,
 reddybalavignesh9979@gmail.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/prctl: Fix non-anonymous VMA mapping in
 set-anon-vma-name test
Message-Id: <20260803140924.31bf563743a73653f65e2258@linux-foundation.org>
In-Reply-To: <20260803103046.14324-1-hongfu.li@linux.dev>
References: <20260803103046.14324-1-hongfu.li@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  3 Aug 2026 18:30:46 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:

> The test creates a non-anonymous VMA (ptr_not_anon) via mmap() with
> MAP_PRIVATE but without MAP_ANONYMOUS, using fd=0 (stdin) as the file
> descriptor.  This always fails because fd=0 is not a regular file,
> and the failure was hidden because ASSERT_NE() incorrectly checked
> for NULL instead of MAP_FAILED.

It's remarkable how often code assumes that mmap(...)==NULL is the
error return.

> Fix by using mkstemp() + ftruncate() to create a real temporary file,
> then mapping it with MAP_PRIVATE to obtain a genuine file-backed VMA.
> Also fix the mmap() error checks to use MAP_FAILED instead of NULL,
> and pass fd=-1 for the anonymous mapping for clarity.  The temp file
> is unlinked immediately so it does not persist on disk.

Thanks.

AI review found one glitch which I don't think we need to care about:
	https://sashiko.dev/#/patchset/20260803103046.14324-1-hongfu.li@linux.dev

and one possible pre-existing issue which is kinda related and which
you may choose to address.  Please take a look and let us know?

