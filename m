Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B51F30567A;
	Thu, 28 May 2026 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779966937; cv=none; b=QR5C2HRPQsHSRpQORA+rB6RJF8q/5u6c8a0mRZO/AZBn2J1CEtmR91l7ZVTslStFPqN3+n82n0KfJwl8ia4AvD7OJUB4F11bQUCqZn/qNr8KFxZStZ3PTaR4HCQEhUxvbXbrEApOXUpH5Ikgwy51U5XkMBJBMUr3QwsIRYSByfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779966937; c=relaxed/simple;
	bh=cD41UtULvg61kWalVyxUccfhsZQtZtMTO3y0N4RXkHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SL64vzubu6XvbQ0JU83KqhCRnXObJ4oshyhF8mtunj8iB7PMEFUJye9B+4D97N4g2MiZLXMwwfB5yc5OdnoSsgcBNlEhL3YPjp8u8MEQ+WisAvZex5HowZr7RzOsxnw2Tr6GSVr8cM9Di+aJK7epevvkUzKjfN0mqmf0aBMKHeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9gTPEnp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9gTPEnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE3E1F00A3A;
	Thu, 28 May 2026 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779966935;
	bh=7zV4gfGEwj44JvYr4gAp+WyM/CgxIcYNiSsNnztrTu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i9gTPEnpoUAWn6UX5ax1swc7U+APE72wFtIEm6NRyMHpk4xeFbOCEtuQUI/R6DFsU
	 ejMmPqHdGDM7VjucNzaCepG3gpJYw9ovSQ2s/FgQk1a9gST6jpn+LXLEJr62fiH0fz
	 JO3ve7HHkjKZCre/8Tfj44lIjflYgBR41EdkJ+C6Y1wF3XKEMkgq4sC5XezSoO5+iL
	 K0SNDqd+K4hvwblJg9+InNqGNP+aFLepDdRo7l7Hw/yWXKV5x1uGWHZsZ1I2MrIZZF
	 fdYrNwww/POpPDzbh8XEWxmI5jyqnoUIEVfvs89VlYytGvxxRD4y0yllf85CAhlEfr
	 aVwp5CD5GmT8g==
Date: Thu, 28 May 2026 14:15:28 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, mhocko@suse.com,
	shuah@kernel.org, surenb@google.com, vbabka@kernel.org
Subject: Re: [PATCH v3 2/2] selftests/mm: add missing mmap() return checks in
 pkey tests
Message-ID: <ahgj0GlE32AzNq3H@kernel.org>
References: <ahbXTqLLLcYmeTp2@kernel.org>
 <20260528085746.2076957-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528085746.2076957-1-lihongfu@kylinos.cn>

On Thu, May 28, 2026 at 04:57:46PM +0800, Hongfu Li wrote:
> > > @@ -1693,7 +1694,10 @@ int main(void)
> > >  		printf("running PKEY tests for unsupported CPU/OS\n");
> > >  
> > >  		ptr  = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> > > -		assert(ptr != (void *)-1);
> > > +		if (ptr == MAP_FAILED) {
> > > +			perror("mmap");
> > > +			return EXIT_FAILURE;
> > > +		}
> > 
> > Just stick to pkey_assert() everywhere, it already prints errno and exits.
> 
> This is a pre-test initialization path that runs before the test loop,
> so test_nr and iteration_nr are not yet set up for pkey_assert().
> 
> Should we just use their initial values here directly?

I think it's fine if pkey_assert() would print the initial values.
Or you can use ksft_exit_fail_perror() here.
  
> > >  		test_mprotect_pkey_on_unsupported_cpu(ptr, 1);
> > >  		exit(0);
> > >  	}
> > > @@ -1706,5 +1710,5 @@ int main(void)
> > >  		run_tests_once();
> > >  
> > >  	printf("done (all tests OK)\n");
> > > -	return 0;
> > > +	return EXIT_SUCCESS;
> > 
> > Completely unrelated and not needed.
> > 
> > And you may want to base your work on mm-unstable to get up to date version
> > of protection_keys tests.
> 
> Sure, I will base my changes on top of the latest mm-unstable branch.
> 
> Best regards,
> Hongfu

-- 
Sincerely yours,
Mike.
