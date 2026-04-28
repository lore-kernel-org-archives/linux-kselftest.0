Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7698534CFD0;
	Tue, 28 Apr 2026 07:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359943; cv=none; b=InWaIbyM+mYalRIYzkfXWnZDwofBQRWNO5yBBijJG9tektGmPN1liz0+mXlVJb8OA3RnI1t4ZQ2nPBpPyiZ8dsisRJx/CHdFZDKhzMR+Gk2ojIcOc8zC1NHs/mAk4y0ei73GeuRYbefhZFKBeSSBlmILWgWvoAyV77a5EuWxRUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359943; c=relaxed/simple;
	bh=uEVl32vWRjlM+o7OTG78llEQbH/zUi79r9Un5rZBKBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewnQYaDNnHoXqBdA0XOP3Pei0kIxuVPowJSREOhxCrI3QJuBgTzgMHTkczFLids3GBgSsRay3puL63OYmzK313pC/z6cfnRiguQTPMjdewajPJVkAXd3Tj34nAlTyx+l+sGA75gCeVD+0zDkRbhSvd3jcxgUedEzYrcU/q9GAmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ben7krCh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ben7krCh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452E1C2BCB7;
	Tue, 28 Apr 2026 07:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777359943;
	bh=uEVl32vWRjlM+o7OTG78llEQbH/zUi79r9Un5rZBKBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ben7krCh0THkzCMVVV2ylnzeyZI/4YGyA7Q2FRiI7+gS2eeTZnCZID3/WHojpaAQq
	 iAER84V/LqodDwx+nS51n4m2tkTw4SornZfSiYXa4kOaXyMarKZXx/UpmnmuoYHBuD
	 tXN3WWa85HklI4nlSgTdSxCs1r3AOTsQdZsxsUSw1+GtDqcItIPcgsBWviyi1Hh0w6
	 i78g8WCUVrUXh34IU2TcFhR1dvOptEJ9Huf3zIUk1reB4TVfwRYJtr6hB+Tnkb+b4m
	 vIvrRe3UtxRFqoCfjnPU+cOOC967VxyGqFVB3wMqBE28pSLvE/XBu5j8st3cz5J81V
	 O6FKgoiru8bKw==
Date: Tue, 28 Apr 2026 08:05:37 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: fujunjie <fujunjie1@qq.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, SeongJae Park <sj@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2] mm/madvise: reject invalid process_madvise() advice
 for zero-length vectors
Message-ID: <afBcEkWg8UUsX6DY@lucifer>
References: <tencent_98F3571EF9236437E5165F5C08CF258A9E08@qq.com>
 <tencent_BB588C2CDED859A873093DAF28B2CC1F7B0A@qq.com>
 <637208e9-9d1c-4e7c-8428-9c3d36e2b7da@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <637208e9-9d1c-4e7c-8428-9c3d36e2b7da@kernel.org>

On Mon, Apr 27, 2026 at 01:49:46PM +0200, David Hildenbrand (Arm) wrote:
> On 4/27/26 11:43, fujunjie wrote:
> > process_madvise() used to validate the advice while walking each
> > imported iovec. If the vector has zero total length, vector_madvise()
> > does not enter the loop and can return success without checking whether
> > the advice value is valid.
> >
> > For a local mm, such as process_madvise(PIDFD_SELF, ...), the remote-only
> > process_madvise_remote_valid() check is skipped. As a result, an invalid
> > advice can be reported as success when the vector has zero total length.
> > This differs from madvise(), which rejects an invalid advice before
> > returning success for a zero-length range.
> >
> > Validate the generic madvise behavior at the syscall-facing entry points
> > before any vector walk. In process_madvise(), do this before the
> > remote-only advice restriction so unsupported advice is rejected with the
> > same priority for local and remote mm. Then keep the per-range helper
> > focused on address/length validation, avoiding repeated behavior checks
> > for every iovec.
> >
> > Valid zero-length requests remain no-ops and continue to return 0. Add a
> > selftest that covers invalid advice with a zero-length iovec and an empty
> > vector, while also checking that a valid zero-length request still
> > succeeds.
> >
> > Fixes: 021781b01275 ("mm/madvise: unrestrict process_madvise() for current process")
> > Signed-off-by: fujunjie <fujunjie1@qq.com>
> > ---
>
>
> Next time, please don't send new revisions as reply to previous submissions.

Also this :P email sucks for all this but it makes it easy for me to miss your
reply :(

Thanks, Lorenzo
