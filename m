Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB40260566;
	Fri, 24 Apr 2026 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038610; cv=none; b=ji1sRme02ouSMz07pjnF+ur7jFTW0ZoSa0QeItm1kKrvjFLwj/zTRox8PgBLRibO64d8JFEYcAdiLyE1PP+N7Ujq7Jl76x4JsolSIqUvfm3BztbLgTq5kh9JIu1Y1O3YuS9EIPmGQE/ysKUC6S2zeiJDcGZuMc2xuS/oqUeecH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038610; c=relaxed/simple;
	bh=MGl0j903w+i9Y389Y47daupOrHc4r/683a0T3qETTzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZx+mtMzpAL0jIZj5kHbtl+BQwtTGm1iIBSWoUeu0vu6J2ksEJ6+1HLumPF9iQMNp7S/E1jzc41HyiVMnA3LKB4+54iu0dsmvydYEidPZr4dSQ/W77FMdT6Aub0afBl53gq2AEvyIoZe273DxAy4Miy4cOJ0zZtDEmRCWdMQY5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=foOAimJC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="foOAimJC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773ABC19425;
	Fri, 24 Apr 2026 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777038610;
	bh=MGl0j903w+i9Y389Y47daupOrHc4r/683a0T3qETTzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=foOAimJCsCw6yktvneSSk02PdxdoSF2WhhGvPLNs2HPUVBNxJBdoSL0QPUXTJ0yT4
	 kcHqG9Qt7AsNhAGcZJtAbAYvWtZbJL6iCQAoOr/5udi86INe1cQJphWTsENK6TRg6i
	 1niOCdLjbHNaYim/DUOHJjPIJvd8jzEOQaa08t5QohfL9IWiwMfHH7cev0XGxCl5Oe
	 f1J+cmLCCpdDOIbEGt8zzAlnQBiMawXx4cwgMAPVlFUb4GZikcZnka0Wc9WBRzcJ6h
	 yE7xB8jkyglV/08h8g40aNo58acSjYbjKtljAhcMFOmF1yJkLo8jDXwNBYNzwQsOAv
	 sTi/WxnWlBLng==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8C6DDF4006B;
	Fri, 24 Apr 2026 09:50:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 24 Apr 2026 09:50:08 -0400
X-ME-Sender: <xms:EHXraZs8TgQrJtfi-987OWK12sajj_WZnOy8R_kk2xA2EL6VPJcqlg>
    <xme:EHXraRuxo8cWln6LFnBcUEZMKr-ZTx7J9ADiSJTnmQrNk3Oxvmq2KK-_ZkTnz7Ltn
    e3iLT65h7a0XtFd-Ef2hSRBLhTaVxXqJGN_dnbi6Ui7BYCpbzmxcA4>
X-ME-Received: <xmr:EHXraY8_Ff9Dmtnl3SBFgcWwa6lz55F5_UBfMroQz3cZN5Gbonh_KO8__RKOBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejtddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpeeuieejieffkeehfeffffdtkeelfeelhefhfefhudehjeehvdffleeuvddufefgkeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
    hllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedq
    vdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnh
    grmhgvpdhnsggprhgtphhtthhopeefiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepphgvthgvrhigsehrvgguhhgrthdrtghomhdprhgtphhtthhopegurghvihgusehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhi
    ohhnrdhorhhgpdhrtghpthhtoheplhhjsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprhhpphhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsuhhrvghnsgesghhoohhg
    lhgvrdgtohhmpdhrtghpthhtohepvhgsrggskhgrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihgrmhdrhhhofihlvghtthesohhrrggtlhgvrdgtohhmpdhrtghpthhtohep
    iihihiesnhhvihguihgrrdgtohhm
X-ME-Proxy: <xmx:EHXraa_C6-haqQfuooMi1XlfCBdjyfDJGPkVq4GOpwBH7vUK1yXe0Q>
    <xmx:EHXrac_K4zVVesosgupPDLE4JIA03wzpLeZ_yAyifSWUfvTH-C7tcw>
    <xmx:EHXraQFzRjFddaU1h0I0T7lon9E4JFPTR3ZO9v7Obw6XLAWvraCj3w>
    <xmx:EHXrabbj7lVFRLyqHi0rX3eVRBZwOyyplv-J3rk4ERJ6HCKWPyEWEA>
    <xmx:EHXraUPAf2pM9KxV2CpTCLIW4ooX5YE0eqGCX5hEidonSlsWBkZMUv_2>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Apr 2026 09:50:05 -0400 (EDT)
Date: Fri, 24 Apr 2026 14:49:58 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Peter Xu <peterx@redhat.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [RFC, PATCH 00/12] userfaultfd: working set tracking for VM
 guest memory
Message-ID: <aetyhki-UD70dyRL@thinkstation>
References: <aeTnlQUOOh-dHG8z@thinkstation>
 <34f75083-29a3-4860-8a6e-94551d37ac6a@kernel.org>
 <aed6fHLrIdahbdY3@thinkstation>
 <b77d559b-215e-460a-a268-e63b8273ef42@kernel.org>
 <aeorZMvKwu8zKX5i@thinkstation>
 <aeoxnuGKO3uqS2kG@x1.local>
 <aeo5IPpQi7onyjTF@thinkstation>
 <aeprnnccJeyHB2rt@x1.local>
 <aes7b17nG0cXrtEd@thinkstation>
 <aetZUOINzfTXChLL@x1.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aetZUOINzfTXChLL@x1.local>

On Fri, Apr 24, 2026 at 07:51:44AM -0400, Peter Xu wrote:
> On Fri, Apr 24, 2026 at 11:34:48AM +0100, Kiryl Shutsemau wrote:
> > Both page_idle and the LRUs (legacy or MGLRU) track accesses on physical
> > memory. We need visibility in the virtual address space domain.
> 
> Yes they are, but ACCESS bit isn't.

A-bit is not a reliable signal for userspace working-set tracking
because the kernel itself is a concurrent consumer. It is exactly why
page_idle needs PG_young on top of the A-bit: PG_young is the "kernel
ate the A-bit but the page was actually touched" escape hatch. And
bringing PG_young into the picture puts us right back into physical-side
tracking.

> For migration, see e.g. remove_migration_pte() has:
> 
> 		if (!softleaf_is_migration_young(entry))
> 			pte = pte_mkold(pte);

remove_migration_pte() only propagates young-at-unmap. It does not
cover the common case: A-bit cleared by reclaim before migration
started. The concurrent-consumer problem is what breaks the signal,
not the migration boundary.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
