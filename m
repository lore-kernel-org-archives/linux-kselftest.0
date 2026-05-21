Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8137327BFB;
	Thu, 21 May 2026 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779400491; cv=none; b=HMazQzhrNkawpQU8jmL9OB6eZmr/yGKl/bCHpg2Alt2EM0aERruSZajGIF9iieH7Iksv2mV749qWHve5D23Fcome0ZzQlJ251JvFWW57p6Qd156wo7xLloWVWMhD+GhjQwt4q00ntlarcFjse0j4NPTByDTH3pLWQQOn9LEa7aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779400491; c=relaxed/simple;
	bh=DRCYlsepsK5VDShkMcJKOZZSAAgSQzNrj8ob7FPSMFM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TtvwpjXb2mWMae5/zLErDsIAg47EjxBjUEWMSCYTlRSGbH2SrPwalpPWO2GB+OX7eO+QS7Fdmk5DF9k0fvBfzHXOVNqH8wpt8hjryMqkmFoNK4sU0Z/NBjmpBFXJZUbEzRstMMZvVbUuCHjeLieEFtN3n1caRWqX7TuzG2KQWGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lqbCa13u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lqbCa13u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189A61F000E9;
	Thu, 21 May 2026 21:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779400490;
	bh=Nq2To0QuY4e7vdPARpZ8ihBrwwym+9Z/ywa3n/yj5WU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lqbCa13udxE5HS+7g3+IdEidtP790M7oIPY27BNI0jhTG4rd9X0On4XXir20YE9K2
	 2SwG4ZPh3ENt4oNC3COhZrRGEpo84MdcGCwaSzLYHO0tuVvULVd0kpDGSHhG3o7CKj
	 RNDilYoy/hqzHsaArsqrJy+2+E03yKpf6ea86IKg=
Date: Thu, 21 May 2026 14:54:49 -0700
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
Subject: Re: [PATCH v7 00/13] selftests/mm: fix failures and robustness
 improvements
Message-Id: <20260521145449.ff6b050527ca494a7ba66e9c@linux-foundation.org>
In-Reply-To: <cover.1779296493.git.sayalip@linux.ibm.com>
References: <cover.1779296493.git.sayalip@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 May 2026 12:03:26 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:

> Powerpc systems with a 64K base page size exposed several issues while
> running mm selftests. Some tests assume specific hugetlb configurations,
> use incorrect interfaces, or fail instead of skipping when the required
> kernel features are not available.
> 
> This series fixes these issues and improves test robustness.

Thanks, I've re-added this series to mm.git's mm-new branch.

> I checked the AI review comments. Most of them appear to be relatively 
> minor.
> 
> I have sent one fixup patch ("selftests/mm: use ksft_exit_skip() instead 
> of KSFT_SKIP in uffd-stress") for the comment in "selftests/mm: skip 
> uffd-stress test when nr_pages_per_cpu is zero". The remaining comments 
> were either already discussed earlier or can be addressed later if needed.

Cool, thanks for letting us know where we stand with the AI review. 
It helps!
