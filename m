Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD053C5857;
	Thu, 20 Aug 2026 08:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215291; cv=none; b=Cz9JJ7OaMUID6q0AihNMLcMNh+9luzgCNpCS6y03vtGT7r3uHC6kwZzrk2GRrFcighdkg7XUMBSMPhMOntzHKh4rW240tZH4uJyoKuTX97jvRXWwiW0faKlcA6XePXnba/C/Wfe9+HcBEniH7uMqR+RyXIDUkGiq0JLmbds6Ex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215291; c=relaxed/simple;
	bh=Ux6SZUAAliM58mdiYhvHFf2lStkU/EwSIDfY4fr+2Yc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=qxhU88t1JR/Mlxius1aTRyeLL0Im7jUESAXWt1AbPcdNQ9vpCeCQ826n4LFy8LT3s3L1dQShFvJbOCTQlQgTSeBW4lJ5HxhdWvPSKXtwsMnocVce6ymQa0vB8qiZfaMNLfX6JAW9pcJm600xUQ8+NqjtzFOLqlHzC979kfChgMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3DHjbZn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3DHjbZn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336321F00A3A;
	Thu, 20 Aug 2026 08:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215290;
	bh=Ks9IfuMNaPCSCunGbgsmYYPVdpXTwtkZPOYnvZRqNR8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=i3DHjbZnskVCnWn9XFXrqflspNOID0xnw3yzoGnE1LsfpNK39Qg6qDAVJwbwuOvz/
	 Ug/DHley0rZSz9S3mZAoobWB+67wddiSdi+zUA+undCCVOETU/P1tJrFIR5lZRstUT
	 Exr/QIE13Npj+cIdwXxlJ/k5S1QvJ+U+bRUIAlB8X53fu/W1L8D4VNp+z33U7D3cYI
	 U3Qxkzv4ieGdSs7v0oyPXsFrEQmpqQACNkDE0A7ow9pmPJR+bvEMD4Lmz13dAL+Bcl
	 rZRgdkHJdv5TMU2VUVXb1hjUsNNzWpHoKOkwLEvRF1U0v0keskznJZaUNTKHwr/+dW
	 Scqd6Pba4XtpQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 12/19] selftests/mm: parameterize the mixed-source
 collapse case by source order
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
In-Reply-To: <20260815015901.1236937-13-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-13-kirill@shutemov.name>
Date: Thu, 20 Aug 2026 11:40:35 +0300
Message-Id: <178721523517.2799959.8628888160176030191.b4-review@b4>
X-Mailer: b4 0.17-dev

> collapse_order_mixed_sources() faults its region as order-2 folios and
> collapses them to the -c target.  Order 2 sits below the contpte threshold
> on both arm64 page-size configurations, so nothing in this suite unfolds a
> contpte source on purpose.
> 
> Let -s name the source order alongside -c.  The case then faults at that
> order, keeping order 2 when -s is absent, and the source order has to be a
> supported mTHP order below the target.  The other mTHP cases are
> unaffected: mthp_push_target_order() enables only the target order.
> 
> "-s 5 -c 7" on arm64/64K then collapses contpte-mapped sources into a
> larger mTHP.

I'd fold it into the previous patch.

-- 
Sincerely yours,
Mike.

