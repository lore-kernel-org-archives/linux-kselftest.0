Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFEB3B8922;
	Thu, 20 Aug 2026 08:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215268; cv=none; b=QeBcOcF09Igzq1WU16OObiViJv16Pf80p5KdgLNCBzll79DB0a0RCYZzycqjkDWzd83sR/5zaNo0DWcusuKcn6KnpQtymwRdPvkLirqN7VE/p9ZcToN6xR1Z7lWf7b/R9Bw/xcCfhhjAkhK5RsQQg057C2dhXHzUKGi97qXyBpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215268; c=relaxed/simple;
	bh=VqCamQGFQpg8ry1p/EY/0NezgQSO9B6ObU4wWQWvQyQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=rS1lylnznsDiv/BygXPZPNTq2Il2l76u1j9qvidrSkWm3S2XLbXopchNZQqrWq3F0QFJoL0+n6DdDuW/I3+ONHHfjm0IsC+zBrbHUnvchIgU5uHY2bP6rsEnMFYuK9fZIRZ9ErGFG8Juau6dHfOZTwbwz9KO2GJ/y9GobOrUq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTdSs32a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTdSs32a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333E01F00A3A;
	Thu, 20 Aug 2026 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215267;
	bh=UnOsjCzT8FatZVzeDDeSf/TrI74b+ugTGSwDGeyDOH0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=VTdSs32a+XsCHLsKQDFAxn1Q4xMFCqPu8wOBV2VOJjmTnpsDcjIdwnma3y8fK98/g
	 b9T4/ZWtWmTAyS37Faaerold6f2+Aa/ANT3Y4v31JfQhkWU5MeFOpfMnW9sFZA4Ak+
	 hCffh1Aijc3IuxQJVANMJMUe6nyep6YvJt4GWy+unT/JgiTsbExUu7KjAxnbGPZWNo
	 S/wpprXP/R9om9YyKCXBd6ZKnjym+BcW++N77Jqgw9PPAP4bLqYNGJCMjtDK6hcHE3
	 mnnHBblnosN3uf4RT4p+bjno0Q6AbRo6XyfquLo1lbWarvw9uMX6SGnk61AIvf1fYm
	 1/1z/KEsF3Xlg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 08/19] selftests/mm: add folio-order check for
 address ranges
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
 dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, 
 liam@infradead.org, mhocko@suse.com, rppt@kernel.org, ryan.roberts@arm.com, 
 shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
 vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, 
 agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kas@kernel.org
In-Reply-To: <20260815015901.1236937-9-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-9-kirill@shutemov.name>
Date: Thu, 20 Aug 2026 11:40:35 +0300
Message-Id: <178721523517.2799959.17945598969161889516.b4-review@b4>
X-Mailer: b4 0.17-dev

On Sat, 15 Aug 2026 02:58:50 +0100, Kiryl Shutsemau <kirill@shutemov.name> wrote:
> An mTHP collapse test needs to know that a range is backed by folios of the
> target order, and that they sit where a collapse would put them.  Nothing
> answers that today: is_backed_by_folio() classifies the folio behind a
> single page, and check_huge_anon() reads smaps AnonHugePages, which only
> accounts PMD mappings.
> 
> Add is_range_backed_by_folio_orders().  For every order-aligned window of
> the range it requires a present head PFN at its natural alignment and a
> contiguous PFN run across the window.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

