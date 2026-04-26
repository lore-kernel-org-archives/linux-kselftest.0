Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EC919E819;
	Sun, 26 Apr 2026 19:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777232504; cv=none; b=IKkH7QMgExwmio+2BpmKcb8adt9iIAIs1OHIP17AfIMl1W9nxQRns5PCKhXZiVhW88L0CtGEOQCxAuDh3/SbTJkZ6m6ArTLT4a5gx+gR5QWYtnbRR86pt2WUXJCoQb3jCosh6ls3Uc/UnBkSiMdb1lYoPxIXDVUJfsWT5/f3GAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777232504; c=relaxed/simple;
	bh=6ylthfcwXRh7SxD3w3Z9jcNLLkkLnMxa2weTYXWJZOo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=U4jXgn5hweoElBgWnNSHjZi0UZR4T2QJcl4tNvmi2C75AssRbYP9IVPNR++nQImQoIIqTuRVtxLsDPNZKg+4MfIgLiEscO4xxsQcmL4HLZud6GxcWSTA+1o1qaARosPI3GSdmiJl+EQTxSnMBeEuSHuM56H6iw5GJ0xqaXhQh6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rsn2tNLa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rsn2tNLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE97C2BCB4;
	Sun, 26 Apr 2026 19:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777232503;
	bh=6ylthfcwXRh7SxD3w3Z9jcNLLkkLnMxa2weTYXWJZOo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rsn2tNLaJCXfMA5ar7pg+cQueVeG1MI5FeLgvS3HPNOCMNiZPPOINCHk3ywYwjZTS
	 se0RCG9yhFZkgK8TaiqkWpOiwYHLipvcbcqO4+l/hxcY5NSO5FeZm9yPKT/O0gBeMn
	 z16PVlZ0rmeKYIxF2ngQ3NydVbcH1IamE0ClskKI=
Date: Sun, 26 Apr 2026 12:41:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: fujunjie <fujunjie1@qq.com>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes
 <ljs@kernel.org>, David Hildenbrand <david@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Shuah Khan
 <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, SeongJae Park
 <sj@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] mm/madvise: reject invalid process_madvise() advice for
 zero-length vectors
Message-Id: <20260426124142.88cbda0e6695522d95ef6e24@linux-foundation.org>
In-Reply-To: <tencent_98F3571EF9236437E5165F5C08CF258A9E08@qq.com>
References: <tencent_98F3571EF9236437E5165F5C08CF258A9E08@qq.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 26 Apr 2026 11:08:22 +0000 fujunjie <fujunjie1@qq.com> wrote:

> process_madvise() validates the advice while walking the imported iovec.

Seems inefficient to be checking `behavior' repeatedly.  I wonder if
your change will permit us to remove that madvise_behavior_valid()
check from is_valid_madvise().

> If the iovec has zero total length, vector_madvise() never enters the
> loop and returns 0 without checking whether the advice value is valid.
> 
> For a local mm, such as process_madvise(PIDFD_SELF, ...), the remote-only
> process_madvise_remote_valid() check is skipped.  As a result, an invalid
> advice can be reported as success when the vector has zero total length.
> This differs from madvise(), which rejects an invalid advice before
> returning success for a zero-length range.
> 
> Reject invalid advice before walking the vector.  Valid zero-length
> requests remain no-ops and continue to return 0.
> 
> Add a selftest that covers invalid advice with a zero-length iovec and an
> empty vector, while also checking that a valid zero-length request still
> succeeds.

lgtm, thanks.  Slightly non-backward-compatible but I think we can live
with that.

My process_madvise manpage doesn't even anticipate bogus `advice'
parameters.

And grr, the manpage calls it `advice' but the kernel calls it
`behavior'.

