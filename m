Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BA34854E6;
	Tue,  8 Sep 2026 21:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903259; cv=none; b=W0CTFFepDRRoi6GrX37IwM7i5SiSjUGRiLflF8rmC41mveWtagE9PF1BqaBcVp4U2KZSZRHr21wt5UhCQsxjxT85J7Mg294zMDVRSni01TLwSMRaei5AZ+IWClHVL2xf2ZGAd3YISUOwvX+GLC/lfih5fQRRpzXCVVgZ+RXuAfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903259; c=relaxed/simple;
	bh=xCQ8MWi2wEUG15ApDe/Wb8ASN6Lc5h0YduQNrT23Ibs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKP5avy6qQS3brunCqar+9ogl3/LDofav9c72xy08p1XdEvu6DFdZEuq/e4zI48b9X3RFjXzWRvVWpXd76x7mYd9icxc9V1WI9dm4W2bWSa4cKbV95E/ZET9yIAkkMl/SE3YntIYMLzEkGdwJjmJBMVbc4pdGlj+9JUeE61jK3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFzo8BRD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFzo8BRD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D25B1F00A3D;
	Tue,  8 Sep 2026 21:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788903257;
	bh=GtOJUKKq1jpadgFWEDaPhCFzpzv9SFpwe1VXJg3VB0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XFzo8BRDbgtNiX+dR3OcDuWLER8t72A9JcFS0olSyJR6CBEcK0yLqR+hB88pZL6/i
	 +UYhGNhKHNyvZB1xRib7IUCA/ym7/+horiqEonjhIJgQ/tJalPgEu6EXlbzQr+coPL
	 e1YfXX1EqhBCGiIxAXqpgMu6Pb/swGZQvYw4nmlMkQZczJkj0dLQkjHvk9Tnbpy1GJ
	 UIicFM/I03TNJXg7W+7gfy/eZLWo1MywwzriL54h9+3pyK03npOCfeReRuwk9exgmF
	 fzvDeaWZQiUxa19yMHidrpO3tJtmvjdy1I4Yzo2wIcQNZsFAsy/JjeHTwj4SMXD31h
	 Z4+EHG66YaNwA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 906FE198003A;
	Tue,  8 Sep 2026 17:34:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 08 Sep 2026 17:34:14 -0400
X-ME-Sender: <xms:Un-gapFhB61ADkoccmhw5zm3p4L_-s0gB7LN30qyJbomNicHe_cW5Q>
    <xme:Un-gavDcwOJrFBXjr0l9ZobFutjRQJGWLcVJQMfUiyoBt3qE3WMRLfAp--Nck0wXp
    nUvvwLve7fDxhaAR-1eFujtdfg_xeP350twh9Sq8It4odAYP0Ra1CrW>
X-ME-Received: <xmr:Un-gamMZ1c5IzQpPpSGXsw383LIVg6OhQXIy4ZWSKhikfdO7hMPJkpD7bW4>
X-ME-Proxy-Cause: dmFkZTFzOLvDypeviElLWOuzJgTrjQKb2l067aPxJf+6YK6KiDCLqa/rTRQ8/WwYVcIAku
    BIqGuq5zN2G8/NEnmldE7QhtDwVEldJdgjTrBf1xzQ/16VTQVQleGitKJ60xXK19fSeF+z
    hccMeomwHSVgp5FuA7vNQIIbZInDXfyOrlXCbtPyZog+XbW/Ig05+azXCR4lassCChfm9X
    f3I0SW/NRHWzmqxX8y7cQRLObB04isVipRyfkuwy9HFXjZbOnYzPvRiDENMBw4svEUJkna
    QO902UB3k5TIGQq2HL+A7pk0VJDbGSiMPbKds126VhPC25WfX460vT2nXa25M4xcJbAfH2
    FIANWinp/UUzAZK5wQy+sUiaMHVvoTNcUkuhMXUxZ4/UqSjS/ozIWInevk3vMMAflOq5iu
    RdkpW80h1DggVoHGTukKCRonQPGHUVSBxhCY663KmePpSZ1dLHOibMQEyMLyehzMotgwlw
    D8SFHPHbpTShehmaQ/Ceg3zkTXXB0mFiUmG7GmAgTBICeLnJ+mTbc2HKKKBlnXThJi8vxt
    YmNkHGczK7N7/pp+qrJqumc5Na+ykqNsRfSp1F15MMU6ajXj9lIztD74FCw3+oWpVSreop
    DqmkjYI8B/43ktuBE7/Jx5r+sMp11Qbqklo7104vlX2VaAHhqPjCB+q0/iHg
X-ME-Proxy: <xmx:Un-gavGSnym1vVk21acKtxemQTjXHz05a_LuwK-cz8irYvPyYaF9dQ>
    <xmx:Un-gaiSgdJ0a4mSbE2mzi02WlFf4JZYOGp5ze04iN2mt2WnG4X9RFQ>
    <xmx:Un-gaq2S_bIQtHBqtkYFxGP9Grv9lWKfGJdBTN9JCNChIIJAVDGQcg>
    <xmx:Un-gat4FVzjedHcbzMxh90GiCnxo9prb0-glfobOJgdr6IKDwPe5PA>
    <xmx:Un-gahc0Q7_251V2quE8Ln8nIdWTysNGIYrb0eiRIuscT1MyJf5_WE2b>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 17:34:09 -0400 (EDT)
Date: Tue, 8 Sep 2026 22:34:08 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	rppt@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev, 
	baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ziy@nvidia.com, baohua@kernel.org, 
	dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, liam@infradead.org, 
	mhocko@suse.com, ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, 
	vbabka@kernel.org, agordeev@linux.ibm.com, jgg@ziepe.ca, leon@kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v5 16/19] selftests/mm: add khugepaged race harness
Message-ID: <aqB-ycE8MlVwZJ7I@thinkstation>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-17-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908125105.1510704-17-kirill@shutemov.name>

On Tue, Sep 08, 2026 at 01:51:02PM +0100, Kiryl Shutsemau wrote:
> +static void *mremapper_fn(void *arg)
> +{
> +	unsigned int seed = (unsigned long)arg;
> +
> +	while (!stop) {
> +		void *p;
> +
> +		p = mremap(mremap_area, hpage_pmd_size, hpage_pmd_size,
> +			   MREMAP_MAYMOVE | MREMAP_FIXED, mremap_scratch);
> +		if (p == MAP_FAILED)
> +			ksft_exit_fail_perror("mremap() away");
> +		for (int i = 0; i < 8; i++)
> +			mremap_scratch[(rand_r(&seed) %
> +				(hpage_pmd_size / page_size)) * page_size] = 1;
> +		p = mremap(mremap_scratch, hpage_pmd_size, hpage_pmd_size,
> +			   MREMAP_MAYMOVE | MREMAP_FIXED, mremap_area);
> +		if (p == MAP_FAILED)
> +			ksft_exit_fail_perror("mremap() back");
> +		usleep(rand_r(&seed) % 2000);
> +	}
> +	return NULL;
> +}

Sashiko pointed out that mremap() freed scratch area and it has to be
re-reserved for next cycle.

Here's fixup:

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index c3478b5123e2..ccfe655b3ddd 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -209,6 +209,11 @@ static void *mremapper_fn(void *arg)
 			  MREMAP_MAYMOVE | MREMAP_FIXED, mremap_area);
 		if (p == MAP_FAILED)
 			ksft_exit_fail_perror("mremap() back");
+		/* The move back unmapped the scratch address: claim it again */
+		if (mmap(mremap_scratch, hpage_pmd_size, PROT_NONE,
+			MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED_NOREPLACE,
+			-1, 0) != (void *)mremap_scratch)
+			ksft_exit_fail_perror("mmap() mremap scratch");
 		usleep(rand_r(&seed) % 2000);
 	}
 	return NULL;
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
