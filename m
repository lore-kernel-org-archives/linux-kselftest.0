Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8B377EAB;
	Fri, 27 Mar 2026 18:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635725; cv=none; b=jP1G9ytnyIlb7fLWmUgF5zYahq+EPSF2GCLxSu3cNi4hce0sy3vEDW0JrhU+zeBeMQ056p2BKuH/cAQH+TZ5mJiyQKeDEtt/Edg5ygMzU7Vd7Z4YxatzICk3KmywZZFu5iavKGCxNei/N3yZI0LgtDQT78NEpd/EuFDQJRTxhHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635725; c=relaxed/simple;
	bh=9nrzjX+RfZq2NXx9Z701F13ljmtIrJ8sgnxURhGXCF4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=G8tM8aK1lZpDHXTI4kXoCV523enqxhRVlraNuUcDU68rOAA2WW2PGvm5LTcjk+PRe9z4NzfDBD5SIjXJUVatgubFJmoxFxijIINJUxv5Gk6csWhfNA4ZUdPSYaoNfH5WzQuPtXizjb0uuM9AX86zLFRtL3BNYoVuJRi+9j398H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=d0yJnwHy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="d0yJnwHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6398AC19423;
	Fri, 27 Mar 2026 18:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774635724;
	bh=9nrzjX+RfZq2NXx9Z701F13ljmtIrJ8sgnxURhGXCF4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d0yJnwHyvkASWO5RvqvKD5X0aSWKVub4PWo6NocFTvFwesHiWVo6zhzjku+EYUxbW
	 CQplrWiH+QYK4mG6vG+I7hqIhNwSVTF3KbRMy3udR/6xdvkVHNyYcHOKldhz3JNOvT
	 GxWY/v/7drvJghEE3gUZfBmP8YHPxVzHhfRd5jjU=
Date: Fri, 27 Mar 2026 11:22:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Wang <liwang@redhat.com>
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 shuah@kernel.org, aubaker@redhat.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: skip hugetlb_dio tests when DIO alignment
 is incompatible
Message-Id: <20260327112203.d168f23504a998b2febe150b@linux-foundation.org>
In-Reply-To: <20260327031243.15903-1-liwang@redhat.com>
References: <20260327031243.15903-1-liwang@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Mar 2026 11:12:43 +0800 Li Wang <liwang@redhat.com> wrote:

> hugetlb_dio test uses sub-page offsets (pagesize / 2) to verify that
> hugepages used as DIO user buffers are correctly unpinned at completion.
> 
> However, on filesystems with a logical block size larger than half the
> page size (e.g., 4K-sector block devices), these unaligned DIO writes
> are rejected with -EINVAL, causing the test to fail unexpectedly.
> 
> Add check_dio_alignment() which queries the filesystem's DIO alignment
> requirement via statx(STATX_DIOALIGN) and skips the test early if the
> sub-page offset used by the test is not compatible with the alignment
> constraint.

AI review askes questions:
	https://sashiko.dev/#/patchset/20260327031243.15903-1-liwang@redhat.com

The glibc one is worthwhile, I suppose.  glibc-2.37 was released Feb
2023.

I'd ignore the filesystem-doesn't-support-directio ones.  If someone's
running a dio test against such a filesystem then Don't Do That.

And yes please, %zu.

