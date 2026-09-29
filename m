Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9BF42BE95;
	Tue, 29 Sep 2026 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670780; cv=none; b=HivbtjvWy5WcqoWBJKTFbOqD5XTj5IprpcaXxkGQhmwvZOQAQzCS3fHM1G4FgiQvDE9T16f9RosWZ6vlQzeRy6YRL7vAlYhyNWp50gZt91zCq2h80sUI0vzrnLpPaIdVgqYuOFGyyG4AUQlBwXBgVZTua91P51+CrryB0I5DDOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670780; c=relaxed/simple;
	bh=WKNtmCHIci7zBwPLOmXztUDNmMOH5kzgHNAurcRjU3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0aaLW63htCTMXJZ21m1yHLLnCVT6KB6PRMP5uSlyFtP4JjgHTJuuGP3U4ekV77oBSTIqQwYfAGL/2vbZIjYwbNSot+Y91awcUUtjcJezf4y37qXcGH2MpdNCKew3ZU/zTDMS0RHZ3B/ZLK/bOa4BH8flmi8mGBAONU9AvtrA3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omxEZyzD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omxEZyzD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544F41F00893;
	Tue, 29 Sep 2026 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790670779;
	bh=kWgQ7PY++KZOODIaGPn/6f7fWLLF6eJjFXK1cuplJqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=omxEZyzDwbTL1f+vpJPwUGu5x3lHd9zjhTmd0ryL+3e6loQf5WiX5DwS1z7MMgsyv
	 fTrf3/ndS/R0PA14bGgvxLxv0SbwcZNsewFfrnwsrqYHBqy4W7DgI2jh+g+Z2sBENM
	 WSDsjjnimLufz3POC8dGk49KDEzfFrokBGbTqCXS/ue9RoO2fs0X5vM5rD+7AgxmWo
	 3+vGXK6ZoYpXJjs2G+5U7ZsfALTGTteeIsNzul6a9ZRdahZMLHcs8lXurzwnHnBx7U
	 frDhAgEr6gdZO7mpoYJEyxvtlDGjveQPqybu+3A8RzsoRKomv8UXAycN5tiftu2R9D
	 iPbBIn2flF0Ww==
Date: Tue, 29 Sep 2026 09:32:50 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v3 1/2] kselftest: mm: return fail when child test result
 is fail in khugepaged
Message-ID: <art3m_g5OLBTrE4W@gremlin>
References: <20260923-fix_khugepagd_fail-v3-0-b387e92fe1a9@arm.com>
 <20260923-fix_khugepagd_fail-v3-1-b387e92fe1a9@arm.com>
 <1246dd4e-b2a1-42e6-8fcf-7e6b2514cb87@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1246dd4e-b2a1-42e6-8fcf-7e6b2514cb87@kernel.org>

On Tue, Sep 29, 2026 at 10:21:53AM +0200, David Hildenbrand (Arm) wrote:
> On 9/23/26 17:29, Yeoreum Yun wrote:
> > Although the child process in collapse_fork*() or collapse_max_ptes_shared()
> > reports `KSFT_FAIL`, the result is ignored because the test only checks
> > whether the parent’s page was collapsed into a huge page.
> >
> > As a result, the test is considered successful whenever the parent’s page
> > is a huge page, even if the child test fails, as shown below:
> >
> >   #
> >   # Run test: collapse_max_ptes_shared (khugepaged:anon)
> >   # Allocate huge page... OK
> >   # Share huge page over fork()... OK
> >   # Trigger CoW on page 1023 of 2048... OK
> >   # Maybe collapse with max_ptes_shared exceeded.... OK
> >   # Trigger CoW on page 1024 of 2048... Fail
> >   Bail out! Unexpected huge page
> >   # Planned tests != run tests (26 != 23)
> >   # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0  // child failed.
> >   # Check if parent still has huge page... OK              // parent hpage success
> >   ok 24 collapse_max_ptes_shared                           // considered as success
> >   ...
> >   # Totals: pass:26 fail:0 xfail:0 xpass:0 skip:0 error:0
> >
> > To address this, propagate the child’s failure and skip the subsequent
> > check in the parent.
> >
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
>
> That test implementation is rather messy ... :)

Yeah, I wish we could just convert more and more tests to the harness. Makes
everything easier...!

>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Patch LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
