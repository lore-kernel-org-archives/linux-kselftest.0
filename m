Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578866;
	b=C/+iKIJOgWKDpamEkZ+QrMZd0iTPX61K+DPhdxvcZTRNtnaDpBs0d/xVyD5OK4MSzsdC
	 aZYQes91PrYb4EailRXgjSqujC5nLUwYgmPMkpG+2QAY+XcfaWOpd99sFzoPM2Ofx9Jup
	 Bgp2DbgLJkMqLrUKjg+59l88rNnur+KoKrfEAg6RNcLn7WIdZRodBRmzxL565o1pigBET
	 qJN8ptLM1ajexNeBVC6Z7pbcNXf76+ZI4XbNGSQL9eRlrFKm5wKBUJGttJxR5tlvILerP
	 KMQAK0tgVUxNK7tIxrrtlI67pVHjkuUIMge8MtbfNqYh1bSXcRmkwurS+Ar7TC4cirQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578866;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=y2v57bUWAG26s2bm1BoDK2qEh8HhgMjugrP4Ic/x+w0=;
	b=VYYxsg7/GOTxzFr/nE0IQPz2TFHRNN3KXDy2TPS1XVghmU8Uvh1wMA6JE3T3I0QQ8U5C
	 nRbScbA6E73dpL3wJjWg31vVNshPY06YyU/RMUCgqYqnAmeE4b+2caB1Jkm436pYsMRNK
	 wnxt9eIyuVGyT3+9KHa8akmAVKhdklD62oGYsUq9Ndx6BTeR7aegZcFyztHYUUMGq6ihS
	 TDQ4KcFkPkeEEzNGbbjsisWxcBVNwr92UgMSvhRyqmLJVdEgnxFJo+4Ez/tCUMALgHfo4
	 5fG9FD58czS0J89Q3lq/3YKcqdp5vb59gwqK/su+QrIa2lFOtpo3caPomtYXIyGTsyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkHKS07S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36413606A31B;
	Wed, 21 Oct 2026 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkHKS07S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BB21F000CB;
	Wed, 21 Oct 2026 10:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792578865;
	bh=y2v57bUWAG26s2bm1BoDK2qEh8HhgMjugrP4Ic/x+w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AkHKS07SreEz44Ef4ECOlzOb5mnzP9iJk7YT0+qqP0xIFFHOlPZnphtCXRGztYfAq
	 qvuTG5kksnxWd6wmtukEXn3W4Bi1Z/sh4PcmQPLBmEBCqaI29KXc2F8HoAJfhwjANl
	 u9lO4OIKSlKv2Zb9hhS+4jUHOY/wMC8qsjnR1wfOGgLVrDs15QS+fUNc3RSGGwPk2E
	 mq68vp3vBAHIROeSLvcSEtnc+4N1kNMYrnaM1lcBkxK9+0F8yeFMXbWkcmwAkXyfoU
	 vh0PrK+yzlzEgHwlrQ9+RTsCdkQlgw5iW/i0abyKid8g8Wg/brLKmcQLcpenLi7OD4
	 5TexAVkROVpLg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 91E29198003A;
	Wed, 21 Oct 2026 06:34:18 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 21 Oct 2026 06:34:22 -0400
X-ME-Sender: <xms:KZXYap-B1gdwwfApnDe96FzTIIISa4dxNma1SHwQYQt7uxZ-8Bm4zg>
    <xme:KZXYasM08_wpU5LkFYXYcHzCfKFMAJ7WQjGe1RwK56Fxo4os8ZSMEYTD9u5Rg-G88
    SUSAOl2YAaSd7hWMd7uA4AmvoElK-byuHUVADO6n7byjAqbdPAJMs_E>
X-ME-Received: <xmr:KZXYah3QKPZaSBtpYFY5KUUNTd1z2Bw39JqeYr7iYE525tekLHR7lzTE4vw>
X-ME-Proxy-Cause: dmFkZTFQXCLhgM1j6Uol95BZ6fYJcKahMN2vJQx7GcVvkHkXemtg13fKccd2t/ueNjJM1R
    NZNDI4Gh+RldPGTb1bpmZejKabh2JDquyTm3SXJ/srOft1k+cpto6f5YKWNDAQFuIJ7ff+
    qQWH455eQHrQF1lsqcQvBmZn4xyB4v+poc3u9QnXsJ6qRNPfCIDd8yV7fbhTXFgHvUzpsG
    SKDwbvYu1qlrIXYGiSHoxu9xNNJCEKRtsPuXelRWYRCEtvWD3CgaRD2lyuw0MMIHgO5r9+
    QhijrY6ZhmtL9PQUWhLSIkqUi6Czh066+c2VSkDAhDkzsmqHcpvQWWqmoVAuBOSEen2IEG
    I8DRubFCdnteHWcaCg7+ep2GmCV6a1jAygX7y9kBDDwtZox33QjkNDf89pfnetl5BFphag
    esd6Iv+6E+XFUU5a7adlxlJKyfbeOFFX8yHu6SdKamKUNU0hZgDKHalndbHtyq3+LEb62x
    Y8+X5Z7xk48UcOEHntNXppBaLzSeoD1M5mm9z8M/gu8fpTer3OE62V2mnqdvYet/j4fOhA
    VzOL8tdmklPthIG33/HCqULQeuHbqhaerqtfo4myPpP3qcxdkvVfKyzASxaTnikmGpx311
    0eSuN4plxEUs3JjUKHKxQQBKybUwylz4/QGqFAXTXmK4Rg3qtoNFogtp1WfQ
X-ME-Proxy: <xmx:KZXYajo2jWD3StK13oUCJD-bGc_sbcHvNfCY5u_rCvtEr6pN-GzdKA>
    <xmx:KZXYaps7lW8jncdcwOVb7MM6OQebOJocgq2ri3h-HpT1YcojzLb_Ew>
    <xmx:KZXYamJdmolfEHZ4N9B2f3rCJtpC50qh_FSaAdT57208BdoilWH_-Q>
    <xmx:KZXYan3cSU_fMf1efCGtB0ld1kj8lPH2JDBXx9fkIFzQzBz41yU-gg>
    <xmx:KZXYatoOQIPIzFknbNSPFv0KFOSG5WppE3zZ9dp0DwcE0SJbICUTLnjA>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 06:34:16 -0400 (EDT)
Date: Wed, 21 Oct 2026 11:34:15 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Usama Arif <usama.arif@linux.dev>, 
	"Nico Pache (Red Hat)" <nico.pache@linux.dev>, Zi Yan <ziy@nvidia.com>, Barry Song <baohua@kernel.org>, 
	Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>, 
	Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
	Michal Hocko <mhocko@suse.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, kernel-team@meta.com
Subject: Re: [PATCH v6 16/19] selftests/mm: add khugepaged race harness
Message-ID: <atiU94VjdEsWzdBr@thinkstation>
References: <20260919002451.496763-1-kirill@shutemov.name>
 <20260919002451.496763-17-kirill@shutemov.name>
 <85b3725a-6dde-4a57-b303-4ae2b53b60a5@linux.dev>
 <6e3c298f-9b93-43b2-840d-65c5ffa3bc36@arm.com>
 <248431ea-4bbf-4a48-a80e-72287ffbae22@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <248431ea-4bbf-4a48-a80e-72287ffbae22@linux.dev>

On Thu, Oct 08, 2026 at 10:23:22PM +0800, Zenghui Yu wrote:
> On 10/8/26 4:18 PM, Muhammad Usama Anjum wrote:
> 
> > On 08/10/2026 8:30 am, Zenghui Yu wrote:
> > > On 9/19/26 8:24 AM, Kiryl Shutsemau wrote:
> > >
> > > > +		} else {	/* madvise */
> > > > +			while (now_ms() < end_ms && !corrupted) {
> > > > +				for (i = 0; i < nr_shared_areas; i++) {
> > > > +					madvise(region + i * hpage_pmd_size,
> > > > +						hpage_pmd_size, MADV_COLLAPSE);
> > >
> > > I got the following error when compiling it:
> > >
> > > khugepaged_race.c: In function ‘main’:
> > > khugepaged_race.c:506:23: error: ‘MADV_COLLAPSE’ undeclared (first use in this function); did you mean ‘MADV_COLD’?
> > >   506 |       hpage_pmd_size, MADV_COLLAPSE);
> > >       |                       ^~~~~~~~~~~~~
> > >       |                       MADV_COLD
> > > khugepaged_race.c:506:23: note: each undeclared identifier is reported only once for each function it appears in
> > > make: *** [../lib.mk:225: /data/code/mm/tools/testing/selftests/mm/khugepaged_race] Error 1
> > 
> > I've just tested with and without make headers on linux-next
> > which has this patch and I've not received such error.
> > 
> > If your system headers are old, running make headers can help.
> 
> I forgot to mention that this can be fixed like fd5295afae91.

Right. Would you like to send the fix?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
