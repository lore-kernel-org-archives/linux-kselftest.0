Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F2F3CC7EA;
	Sun, 20 Sep 2026 23:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789948467; cv=none; b=rUaZU6Nmv8sDOrfgrXIQrXWeZNc9gwrpr1NqxmCXttP+HOIvDpXhiT4v0airpb3GXkwViV81MqKtGnxzA3f69Y+CWeLN2bGxy/jiRc2S/P38gVhjqctEpCvE+AYPCCcLLDNtIjMDvUE8IW51eiASOP81wCkDAaSaM11J8DZ0o1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789948467; c=relaxed/simple;
	bh=28ZjMnGUiJvaUgnYDfqrqJS5aHYgCp0mAXN26FU/aZc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=G3aUcB6aaslNWElpBFyUoydGQa2+APTwRK+S2NddWab3Q88U1C2t4WtepZNolbFbU1QsQwqeAa9WpRaPqJlG5GQOmhKn5c0oMFCpcGh5X9lx1Il2R5xbGboVNkpysmYUBrB0JFqZOrfBN+zTR1N/1XSUa6ZMcA2VLXNBFoG3FO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VCCAtqw2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VCCAtqw2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E221F000FF;
	Sun, 20 Sep 2026 23:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789948466;
	bh=iS4LQFnsJmlvJPHkPjXPa4amCgBnl2XHspJTXkSxb8w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VCCAtqw2MeukxIzYrka53zfuZGq0IiY7H/UF9D6LJhE5JQuxgezRG3Oxq+CZDlEkB
	 kaW3KpymCyJSES5Ri+Xi0+v4Ex6Tac3CSrpCT6cNgsGgKydR/0T89LCU/NnFAmf36i
	 nA1LJTwBGecjbDsaVD0QzqoXA7Nw3dbGMruqxSbA=
Date: Sun, 20 Sep 2026 16:54:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Muhammad Usama Anjum <usama.anjum@arm.com>,
 Usama Arif <usama.arif@linux.dev>, "Nico Pache (Red Hat)"
 <nico.pache@linux.dev>, Zi Yan <ziy@nvidia.com>, Barry Song
 <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>, Hugh Dickins
 <hughd@google.com>, Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett"
 <liam@infradead.org>, Michal Hocko <mhocko@suse.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, kernel-team@meta.com
Subject: Re: [PATCH v6 00/19] selftests/mm: improve khugepaged coverage
Message-Id: <20260920165424.adbd45ccfc6162ffb0e4b424@linux-foundation.org>
In-Reply-To: <20260919002451.496763-1-kirill@shutemov.name>
References: <20260919002451.496763-1-kirill@shutemov.name>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Sep 2026 01:24:30 +0100 Kiryl Shutsemau <kirill@shutemov.name> wrote:

> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
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
> 

Thanks, I've added this to mm-new.

I'd previous added v5 but it never really got testing exposure due to a
messy interaction with other changes which I didn't get onto fixing.

