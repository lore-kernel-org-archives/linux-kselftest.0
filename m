Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A357339769A;
	Thu, 13 Aug 2026 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633424; cv=none; b=l4ARRK1ElwmODtqOzN4qnq+1gsYkXyLzSKLjK7emE+3IH6hseCqW0moOGbQgX7HP8I1ZKB9j3a3CC3lUEw7LgfAfll63HnNhe68YwYWJFrXkMXvcaDJuRczCgmtsf55YQuJVll/sLlcvqG8AaxjUvGpA7wOj6tZwQK9Qrxr6TRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633424; c=relaxed/simple;
	bh=XjmwO9J5Lm/AR36fDQ4r6IPdoCMG7WDSvMSGyLUQCG8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=jdhGVRCWhMCwa5JOtQuwsd7lofDfxQHI38UoeWgvBWh8u9m97ABWZqQcCgDvXwmeiOkXQB8UV3KlMVUiIdIa/5uGsVLmhml4R5ktnx++L7Q3oYSqK5BbKYqjn14SwjmVlA1LJJWiB01kFbPDZTJiCgHMTHPHYG8ZDvCUDpQn/cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPsbo6tI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPsbo6tI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD661F00A3A;
	Thu, 13 Aug 2026 15:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786633423;
	bh=B9mjz28DJjf5IdgDz36zYYN/GhLK0GgAYHY7eTWpXMQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EPsbo6tIF7dBPYwKkM2aXPv+v+2K4/ex5ijZ50LyFQVUvEPJWbIpmCFBoMJ7CLgh5
	 klf/sTHwBL95we9BVDtWR5/KhuoerfAjIH745M1jtC1HrdLiIoTehrEzZW2Ix0isdy
	 o0Z1My6PhRrocoJWBOg8NnoJnSqThYMQHPL8KaUK+SHNrSVHef6yJiEZ0b7aFgFUR/
	 ruk09dkfzrNQi0wErGmvVZRg9tWxsglt8VZ+/lmS4zBMxkV76t6AZO4ljC1LDfiyKy
	 RAoh2ax6KbWnl1wcs1jQiYJ8AgXW3Nsj4caH+BtDsrgqC920XjSWjYOo9JZfnG+LTT
	 bL9C0Yk14tO7A==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 01/18] selftests/mm: raise the khugepaged test-case
 cap
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
In-Reply-To: <20260812132304.199287-2-kirill@shutemov.name>
References: <20260812132304.199287-1-kirill@shutemov.name>
 <20260812132304.199287-2-kirill@shutemov.name>
Date: Thu, 13 Aug 2026 18:03:34 +0300
Message-Id: <178663341429.2230969.5576178581449703816.b4-review@b4>
X-Mailer: b4 0.17-dev

On Wed, 12 Aug 2026 14:22:47 +0100, Kiryl Shutsemau <kirill@shutemov.name> wrote:
> TEST() ends the run with "MAX_TEST_CASES is too small" when the table
> fills, and the table holds 64.  A full invocation -- every context crossed
> with every memory type, which needs a directory for the file and shmem ones
> -- already registers 63, so the next case added anywhere aborts the whole
> suite before a single test runs.
> 
> Raise it to 256.  The table is a static array of small structs, so the room
> costs nothing worth counting, and the cases added after this have somewhere
> to go.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

