Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B577E380FC3;
	Tue,  8 Sep 2026 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896464; cv=none; b=aXst5THhMOxyCEQ+c7VzS20DT8avLLWV/NCVPgC7BmMvYhJVMVY4blKdnZ5XXCJJMMAfS+2jcvgGKXUpRi1vvN+o85pLnjk7sPj2lBay4J6Y177Vsu/cPSYwnN662phCjd8SsD81KRwUSqxS1Zp4P3BjhHJLBa5hy5DwwBEzD38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896464; c=relaxed/simple;
	bh=NOkVI7RSBsqyuoeHCJKht8+VsNNhnsAk07amprzr3Ko=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FXWx9oWQvd6T+ySepHIAiQkiUYGcYH82IcIeQ29Y99COL3LgzyZWAvmRbV4IDBXNSP2wKbiDV1clyo4OBkHokr86WZfkSJeU3VYzXwlqWv3DhcpzP5zLTZTK1sOa4Lh4aUGBmJ+3X3zQXl8eD0YCTTeEZ6M4jnZm1xWa+uiL1Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JCnIX7pG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JCnIX7pG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BACC1F00A3A;
	Tue,  8 Sep 2026 19:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788896463;
	bh=JMIyNwi4mOEbrPioPuMzsrrfZiDIVseBoMCefJk2aEQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JCnIX7pGgvk9cNWaMNZY3FOn+byzKD3xZYjCqrE/ydXMNjBtitB1WdqVWc+YdUdax
	 5HxL0Gf09cPK7vx/GnHTS9XAGIkZ3cBEA9Qr5OfLGRYskxvueM+Ndo3YQ78j90b6hO
	 ejyg8yqXbqWXqRn7uqX+PZjqQoZsoTqmXjQ2Q/34=
Date: Tue, 8 Sep 2026 12:41:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: david@kernel.org, ljs@kernel.org, rppt@kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 usama.anjum@arm.com, usama.arif@linux.dev, baolin.wang@linux.alibaba.com,
 nico.pache@linux.dev, ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com,
 hughd@google.com, lance.yang@linux.dev, liam@infradead.org,
 mhocko@suse.com, ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com,
 vbabka@kernel.org, agordeev@linux.ibm.com, jgg@ziepe.ca, leon@kernel.org,
 kernel-team@meta.com, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH v5 00/19] selftests/mm: improve khugepaged coverage
Message-Id: <20260908124102.4c874a8a63e50a1cc90e4bfc@linux-foundation.org>
In-Reply-To: <20260908125105.1510704-1-kirill@shutemov.name>
References: <20260908125105.1510704-1-kirill@shutemov.name>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  8 Sep 2026 13:50:46 +0100 Kiryl Shutsemau <kirill@shutemov.name> wrote:

> khugepaged collapses to mTHP orders since 7.2, and 7.3 added three
> selftest cases for it: the generic collapse cases run at one order named
> by -c, with the result detected by counting folios of that order.
> 
> That leaves the collapse path largely untested.  The suite does not run
> where a PMD is 512M.  A folio count cannot say where a collapse landed.
> Fixed sleeps cannot tell "not collapsed" from "not scanned yet".  And
> nothing exercises collapse under contention.
> 
> Close those gaps in order:

Added to mm-new, thanks.

Sashiko asked a few things:

	https://sashiko.dev/#/patchset/20260908125105.1510704-1-kirill@shutemov.name
