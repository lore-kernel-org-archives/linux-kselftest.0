Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4377E13C9C4;
	Fri, 17 Apr 2026 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429221; cv=none; b=TW4M7aoadEfAOcEpcF7xMO/rSzL8wN2fJtghoe74F4/SQ+qNT1cLMvhUohB3ga/an5KSOGO8sF3uxM/N4QnIJ7tdvcXDz0XMI1hEjkgl9AgKlhcVKuHdlL87G7muIt7Kid9l/+3Px6Gyk5wTa8SmqbO42FZwW0/NKzkqZT3dXk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429221; c=relaxed/simple;
	bh=Wsq49SzVrd9M5pMBi3guh4m0X172usecXFug1UEbII0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8lRxutIFQpB2qrzKTVNsAYYDicDBn4KgOldAZYFLZUU2gA8A9TqFy6rrs4kWtQvacBNmwqNYi9jYhF/ZHJsXxyZIn3LRyckpLMjzH1matWTuCYa0PSG0j+Rshm2Y38YCqSgHIUhPD4yPjk8pDa70ZHgtUDmBT8GTAAImkvqEMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiHFQsFJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiHFQsFJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2159C19425;
	Fri, 17 Apr 2026 12:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776429221;
	bh=Wsq49SzVrd9M5pMBi3guh4m0X172usecXFug1UEbII0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NiHFQsFJ0JSQH92aJZGAJjmwTvmp/lA9hLkHsMmeXEd0LGYrnyK8jqjqOq69LASPO
	 n9I0HsFk/komPoc4QCYRarbGd+dlffjTZ0Byx5fMQ/u+/Z0fGFUnZ+/KaCRhM6WJ+z
	 VJGLdWC+/JjnLvihVk8ts9eg4qGGv1nQwbPunKnF8aRcxEDAEUE1HZ6TLx8fJZnjhr
	 BFghOIzcXt6S1iO4G0HKWA8hKvm5rEI1cpmKQHYCoN7FxUnUtZ5aHuchwpjC/B4lV/
	 vFLqOuQh4EjNmtKmCcG5R2XBl0L7rpFXPrx39mioKZJXoOkpmf+yvBMXf4LuZQYmtx
	 jEBe6zjDMA4Wg==
Date: Fri, 17 Apr 2026 15:33:32 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Aishwarya TCV <aishwarya.tcv@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Specify requirement for
 PROC_MEM_ALWAYS_FORCE=y
Message-ID: <aeIonE2r89VdTJZt@kernel.org>
References: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
 <17ea54b2-d43f-49a9-9dd4-d2330a8daa92@kernel.org>
 <5357ef55-15c0-4c66-867d-898fa7f51414@sirena.org.uk>
 <aeE4XSuXY8RfphVs@kernel.org>
 <8260f624-7ed8-4766-8f80-0d0d4dbb5cb1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8260f624-7ed8-4766-8f80-0d0d4dbb5cb1@sirena.org.uk>

On Fri, Apr 17, 2026 at 12:24:25PM +0100, Mark Brown wrote:
> On Thu, Apr 16, 2026 at 10:28:29PM +0300, Mike Rapoport wrote:
> 
> > But sure graceful skips are better than failing the entire tests. Would be
> > something like this:
> 
> > @@ -622,10 +621,17 @@ static void test_prot_none(void)
> 
> > +	mem_fd = open("/proc/self/mem", O_RDWR);
> > +	if (mem_fd < 0) {
> > +		ksft_test_result_skip("opening /proc/self/mem failed\n");
> > +		return;
> > +	}
> > +
> 
> The string reported in ksft_test_result_*() is the name of the test, it
> should be the same name as is used for pass or fail.  This is used to
> correlate test results between runs.  The error should be logged with a
> separate print, in this case ksft_perror() is probably a good choice.

This should be probably added to kselftest.h because it's not obvious.
 
> >  {
> > -	mem_fd = open("/proc/self/mem", O_RDWR);
> > -	if (mem_fd < 0)
> > -		ksft_exit_fail_msg("opening /proc/self/mem failed\n");
> 
> Yes, this is a preexisting bug in the test which I see there are more
> instances of :(
 
Do you mean that ksft_exit_fail_msg() should also print the test name and
the actual failure message should be ksft_perror() before?

-- 
Sincerely yours,
Mike.
