Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D551D63F3;
	Wed, 13 May 2026 03:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778641841; cv=none; b=YUfMbmlA6Jdc40pq5ILa/knGcs1iHlz+KQbktdtsYaHBW2Bka8YMtpvn57LtN1mMqbPRra6ELHjn2m6y4j3MOExGC12PzOOS2lxEkdDAEBv2/pKxh7HUvOe962nzRJP6GzFpCkJjX09PXYHk4BH2l6LWl/P9AlVHX9cp4QYMET8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778641841; c=relaxed/simple;
	bh=vu0gwBDBN0+TJsY5BEup/tyag+dQOp0HKz2GTXrJUmY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=L6HYlSVOYhyXNXD8SxYf1RvFwlM+soXoJxcLH6vRMVO9FnKmJBA1zdGCfY2eZLrhzslDcT1i68cVImCQPrWhXdvFfqAJvOzzxf677l38UtjB1En+9AWTM7AQuEdKwoNSATZqDm4Cy4mbrM3GO4BuxeoNhqqfTdXItSPZxxsxLLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=s5pS0SgF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="s5pS0SgF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F97C2BCB0;
	Wed, 13 May 2026 03:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778641841;
	bh=vu0gwBDBN0+TJsY5BEup/tyag+dQOp0HKz2GTXrJUmY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s5pS0SgFgTsKMvZSlWIJVsVVNwwQLETV3CkqJebs25P0NP6SKTAlrMLogWJ+5F5Ie
	 9bK7BSPaefeZ5fYVVhK4hmY8J3zk+FkHacbQeWQOl4NGtBQ/EMKPKFu6W6h6ZfNAAM
	 BwToAu8ocE3Dp5rVkVmy/sB0rxwHnSDeO1MGgKsc=
Date: Tue, 12 May 2026 20:10:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Ritesh
 Harjani <ritesh.list@gmail.com>, David Hildenbrand <david@kernel.org>, Zi
 Yan <ziy@nvidia.com>, Michal Hocko <mhocko@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain
 <dev.jain@arm.com>, Liam.Howlett@oracle.com, linuxppc-dev@lists.ozlabs.org,
 Miaohe Lin <linmiaohe@huawei.com>, Venkat Rao Bagalkote
 <venkat88@linux.ibm.com>
Subject: Re: [PATCH v6 00/14] selftests/mm: fix failures and robustness
 improvements
Message-Id: <20260512201040.5783a643a3ba23f42777debd@linux-foundation.org>
In-Reply-To: <cover.1777877814.git.sayalip@linux.ibm.com>
References: <cover.1777877814.git.sayalip@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  4 May 2026 13:54:37 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:

> Powerpc systems with a 64K base page size exposed several issues while
> running mm selftests. Some tests assume specific hugetlb configurations,
> use incorrect interfaces, or fail instead of skipping when the required
> kernel features are not available.
> 
> This series fixes these issues and improves test robustness.

Thanks, I'll add this to mm.git for testing exposure.

Did you see the Sashiko results?  It all looks fairly nitpicky to me
but perhaps there's something you'd prefer to change?

	https://sashiko.dev/#/patchset/cover.1777877814.git.sayalip@linux.ibm.com
