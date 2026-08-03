Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267163CF1F9;
	Mon,  3 Aug 2026 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755103; cv=none; b=M5DftgVlZtMpD/gIwNRkO113aKP/EAikDy4tc4xLf8HMg/5HdkWClJhXaGdklus7nJpD+FpIwjdzFg6eXvnsVsjluvwV+1fIS1XyWRZnA2PXnq/c3/A2p+haY2F2hJd5mQyGIdBblQ2ZYUOY/6+CEYKxxp5C4z4bJ9lYB2mLZ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755103; c=relaxed/simple;
	bh=t1hCgQEmonDhy1HhYvP6t7yLSol9f3lVc1YwrHIMUcM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ONk0wgRtjJcl0/Kx+noMfAnQTZPjwqtK0UuNI0hBJGkURDULaBDPSNWr1Sj4efQrML/hAQPQHf13dZErtWuFM/t6Fc6vq6dhI3HvTgdV5sQTP0voF1b3B1gIPpgEyaBUe9SEp1uB+Cr9y9jMh4KWzISFci7BuM9gXMxe3dR9/bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+nsVYnU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+nsVYnU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2641F000E9;
	Mon,  3 Aug 2026 11:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785755099;
	bh=CSclC3PexhFyC24ms1bFI3qAAPSJzj7fNSSmbcM3kdc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Z+nsVYnUwqIylKDUiKbZFMu5IoWyM+rHGKWzwxhVTZ8be2ctWc+ho7BRpcm2dKCNO
	 8hMepafUAxfkEECNtSqjgjCk4342A+R+vf/0krTVFmztk50mqcnSvo46uToQHs3lJP
	 ZlnQfGtzHrhyWiMQnp1estwur3gL6/81q5JVuY+VY77mM58mETNeoh+vj2dxnJnN2S
	 TE0rhi1+4tZz7uqYjdeaoGa8+Su2Nv6cLTkYDBsnmFbeL0PWoXS7ntTFblpvD4A/KF
	 VtThhPwcMhv/jloqOxxAcUfcnFnPOHAYsPDhxKWNKAXaF4uggOoQU9jjx59cMX+1Kg
	 shrICogUvxqsQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 04/16] selftests/mm: add order-parameterized khugepaged
 collapse cases
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>, 
 Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>, 
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
In-Reply-To: <20260802195254.1937477-5-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
 <20260802195254.1937477-5-kirill@shutemov.name>
Date: Mon, 03 Aug 2026 14:04:23 +0300
Message-Id: <178575506331.1561566.14498717581313061864.b4-review@b4>
X-Mailer: b4 0.16-dev

> All khugepaged collapse cases are written against PMD collapse: the
> regions, the thresholds and the detection (smaps AnonHugePages, which
> only accounts PMD mappings) all assume the PMD-order product. The mTHP
> collapse support merged in 7.2 has no functional selftest coverage.
> 
> Add an -o <order> mode running order-parameterized anon collapse cases
> against khugepaged. The region is faulted to order 0 first (the target
> order is "inherit" under enabled=madvise, so pre-MADV_HUGEPAGE faults
> cannot produce large folios), then one full khugepaged pass is awaited
> via the full_scans barrier, and results are detected per aligned
> window with the vm_util folio-order helpers:

Having options is usefull for targeted testing, but I think that the
default should be to run all supported confugrations, like e.g. cow test
does. That's the point of a selftest: check that everything works.

Can we refactor the existing code so that simple 'khugepaged' invocation
will test everything it can before adding new options and tests?

-- 
Sincerely yours,
Mike.

