Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A2C439F84;
	Tue,  4 Aug 2026 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831894; cv=none; b=FFHNYq8p8thQGTVOEx6+CVpxzKlYo9kctXzZ5rpCG/2cHI9tAyprkOEwwXVwF2zriVW2AHSnqtzsPwezRM4znshd+XnjXfNmTnp90ekhsg/HdErJ0DHL053yVXWZIRg4TisqJjR6nix4jkFjpiMGD90kLCbjZo+kDcB/4ONmCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831894; c=relaxed/simple;
	bh=k/Uo9nUDsuGqyMprPecxOtanzkEQIUDXKYOQTdIxhHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPr6etI8cEy0YzoP88+Uc0kLABUmYmEEFwbho18+AdvotbjPytZmKfnYAc/LwFlbNY7JMk/3hGbvgVpkj3wkN3D+yNowJrcLjRRXFUXE09RdEVPevxh/fnp83Tc0NpRR0HlE8udP3u7SzxuFqUOTnkGuraeKWIpeUWC+Cr/8N/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GoLPTM+q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GoLPTM+q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75381F000E9;
	Tue,  4 Aug 2026 08:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785831892;
	bh=Jhc9X36O42LnT0eRhoNdwvkjjeuUnWrTJJtvjnpTIYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GoLPTM+qC2VulFZbipC649Hs0AAu5/EatDB9v6OERgR6gFwlsRj6xsve0Rpq0s5Rz
	 HZGqZfb2nhBOlR3DOcl9MBoHyucN3iAVbVpq6syGpL1g9vCh9oFKmJImxihswE555c
	 Jm5J6JUs9TjGzJPwLXljabGGLCkQ3XFeokEFj7cS+JVE52/YNIZOfnyz1woavoYTaF
	 Y3HKdvegDvTHnw1G1vrlnYHaFv+MEHRY186jmGYLDcTnjm4DllGI4hHMKekH6L//zO
	 EvbWLDGQjUOE8O4B/cmVsUdC0e3nIWZresI2jySXclHDyFADsSGV64f3DHZTgOPRI4
	 QUZK5FtZCTT2g==
Date: Tue, 4 Aug 2026 09:24:34 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>, 
	Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH] selftests/mm: Drop duplicate
 test_seal_mprotect_two_vma_with_gap() call
Message-ID: <anGhWZPDaTP6M_FH@lucifer>
References: <20260804062440.58666-1-hongfu.li@linux.dev>
 <anGgp9cKiDKDhCpi@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anGgp9cKiDKDhCpi@lucifer>

On Tue, Aug 04, 2026 at 09:20:37AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Aug 04, 2026 at 02:24:40PM +0800, Hongfu Li wrote:
> > From: Hongfu Li <lihongfu@kylinos.cn>
> >
> > mseal_test main() invokes test_seal_mprotect_two_vma_with_gap() twice.
> > The second run repeats all assertions with no benefit. Drop the
> > duplicate call.
> >
> > Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
>
> :))
>
> LGTM so
>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Sorry Pedro mentioned off-list that you need to update the number of tests
specified, e.g.:

-	ksft_set_plan(88);
+	ksft_set_plan(87);

In main().

Update that and send a respin and you can attach my tag to it.

>
> > ---
> >  tools/testing/selftests/mm/mseal_test.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
> > index 93c2e13094d4..babc217d9dc9 100644
> > --- a/tools/testing/selftests/mm/mseal_test.c
> > +++ b/tools/testing/selftests/mm/mseal_test.c
> > @@ -1913,7 +1913,6 @@ int main(void)
> >  	test_seal_mprotect_partial_mprotect(false);
> >  	test_seal_mprotect_partial_mprotect(true);
> >
> > -	test_seal_mprotect_two_vma_with_gap();
> >  	test_seal_mprotect_two_vma_with_gap();
> >
> >  	test_seal_mprotect_merge(false);
> > --
> > 2.54.0
> >
>
> --
> Cheers, Lorenzo

--
Cheers, Lorenzo
