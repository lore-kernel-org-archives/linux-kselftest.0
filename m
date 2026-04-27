Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7898B2857C1;
	Mon, 27 Apr 2026 16:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777308573; cv=none; b=a5hxpTe4zpY/pjdyfQCK4UuoHHczSjFSBGFgovpDpDCfP/+te0tisFS64FnmPy0dsaFvlnITaFj4DgcUdfUdFLof0Z2dMeLJ++YntqIK5d0tGF1ZNtKO90vJZ9GPXdb6vbJtAks6YZF4gSmZtr8g2LMUofpHzim6dELkNYFbzCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777308573; c=relaxed/simple;
	bh=KmYd32L9lRML6KYGHyxIlyge+HcaDt0cRuYzVqygieg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ue+1PIJuG3REXZv7GQ2sTfMdUyMUmTDDx92cIie1th2lofDh9v0pweNrvpDSyA3sfyD0KociS6GQWWPzOPWYI0oAHE4sy4UX50cBxzB6DrNF+jyUNV5fMt04F00u9PygZuooX6OvHwkv/JoZMTZdjox/8EQvxG8PxBi62HQwcE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BspDxyaK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BspDxyaK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21632C19425;
	Mon, 27 Apr 2026 16:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777308573;
	bh=KmYd32L9lRML6KYGHyxIlyge+HcaDt0cRuYzVqygieg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BspDxyaKeYJTsKRjrSO6QFjRG9fuNUKxklQ0QOSV7YkBYz2Ve9kUCFrvBdULpvDfB
	 Awu0dpoWTu7m3ONEsjXiD3xUDkZbj8qwKesrsgNqn88UxU7GChz+dyctQGq7wyFdxD
	 W8hAuQCBpgVKJx3/PH0YbYUfIRaD3AnhsM2myCyHTiixug1/xRkHgdcwVuhy9+faaN
	 jwq85jBcl9C51LjFpK52qhif7IZS4oLcGeNdgW11YvNoFGQfMgK56QUnbh0IhPNX69
	 vVQQfEMP72RZmyiZjHQeifzUxnS8ygO7g50nrL+Hq8tbAxEmaXN/CCnJm/vBwDnBnh
	 iEzPUSeSx6NSw==
Date: Mon, 27 Apr 2026 18:49:26 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Luiz Capitulino <luizcap@redhat.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: Re: [PATCH] selftests/mm: run_vmtests.sh: fix destructive tests
 invocation
Message-ID: <ae-TlsIq_YkQcCUY@kernel.org>
References: <214fd9e4-5398-4c26-859e-c982c2e277c3@redhat.com>
 <20260427091250.61316471db20dfb0852141c1@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427091250.61316471db20dfb0852141c1@linux-foundation.org>

On Mon, Apr 27, 2026 at 09:12:50AM -0700, Andrew Morton wrote:
> On Mon, 27 Apr 2026 12:03:51 -0400 Luiz Capitulino <luizcap@redhat.com> wrote:
> 
> > Destructive tests should be invocated with -d command-line option, but
> > this won't work today since 'd' is missing in getopts command-line. This
> > commit fixes it.
> > 
> > Signed-off-by: Luiz Capitulino <luizcap@redhat.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> > ---
> > Mike,
> > 
> > Maybe it's a good idea to add this patch to your series since the
> > hugetlb-read-hwpoison selftest won't work without your fix.
> 
> Or I can scoot it into mainline as a hotfix and Mike will pick it up
> via Linus, soon?

I'm fine with this.
 
> It'd be good to have a Fixes:.  It looks like a3c5cc5129ef5 or
> 2bc4813622459?

It's rather f16ff3b692ad ;-)
It added RUN_DESTRUCTIVE and a case for 'd' option, but missed it in
getops.

> >   tools/testing/selftests/mm/run_vmtests.sh | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> > index d8468451b3a3..c17b133a81d2 100755
> > --- a/tools/testing/selftests/mm/run_vmtests.sh
> > +++ b/tools/testing/selftests/mm/run_vmtests.sh
> > @@ -103,7 +103,7 @@ RUN_ALL=false
> >   RUN_DESTRUCTIVE=false
> >   TAP_PREFIX="# "
> >   
> > -while getopts "aht:n" OPT; do
> > +while getopts "aht:nd" OPT; do
> >   	case ${OPT} in
> >   		"a") RUN_ALL=true ;;
> >   		"h") usage ;;
> > -- 
> > 2.53.0

-- 
Sincerely yours,
Mike.
