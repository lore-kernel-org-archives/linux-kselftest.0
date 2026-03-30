Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E323A75B9;
	Mon, 30 Mar 2026 22:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774908687; cv=none; b=LyTE+aYddSv9pqYISmlnFj4BYxoGUKgusbHrJ0KUEsF4dHM1PVj6jp1EuBwHudqZMh6STyCWghcAkfZ+PRuCnXgs6aRrKH9vwSfw+loP+sPM43+/ELDSWxc2JI5ky6xIRp0QlOvCJOuQNNyaNEvpJ+5rW/KBbL7VlHVIocY12Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774908687; c=relaxed/simple;
	bh=8Flcs8wJZzrHI02Mt/eaFqZoitQYdsBAZWuFqX0qmpg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MxRGKZNsu5BRfuKdZqQAg3ay+RU5Cb6LBLjEdH5YC+qn9H6zWN/CG6HXASciq/tBsaVeHA/mWxFuvkrKq/j1ZVUC2YZqawFEOm8GOGc1hMyjl0fsRaGsn3UfiZUCm9QSmpCDv8N4niglv5fE8hR5goBXrxTPVORA7GgpSt/ZurA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HWZGK5pK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HWZGK5pK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341D1C4CEF7;
	Mon, 30 Mar 2026 22:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774908686;
	bh=8Flcs8wJZzrHI02Mt/eaFqZoitQYdsBAZWuFqX0qmpg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HWZGK5pKlAgxIRFuQ2YHfRFgJhoE1bVfCn62Pt4YcDXzAC7xJeU2J3eEJp2rU0xwz
	 3agFaCWBb7dwgLxEu96UIdiuNJ7Ue2JYlROiiVkGnBQYlURszQLspmbASxOM5OLNmf
	 fQacPOncyQL8Vwq9sYh709Z3g6HOm4lXzCmREr+w=
Date: Mon, 30 Mar 2026 15:11:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Ritesh
 Harjani <ritesh.list@gmail.com>, David Hildenbrand <david@kernel.org>, Zi
 Yan <ziy@nvidia.com>, Michal Hocko <mhocko@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain
 <dev.jain@arm.com>, Liam.Howlett@oracle.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 00/13] selftests/mm: fix failures and robustness
 improvements
Message-Id: <20260330151125.d0b6cbb24b273bc963b05116@linux-foundation.org>
In-Reply-To: <09104413-483f-4852-9d7e-71e0f86a1754@linux.ibm.com>
References: <cover.1774591179.git.sayalip@linux.ibm.com>
	<20260327111104.b8bc18be45172639f5b9226f@linux-foundation.org>
	<09104413-483f-4852-9d7e-71e0f86a1754@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 30 Mar 2026 11:27:04 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:

> > I don't want to risk breaking selftests so I'll set v3 aside until
> > you're confident we should proceed.
> >
> > Thanks.
> 
> This line continuation pattern has been used in selftests for quite some 
> time. For example, a similar usage exists in 
> |charge_reserved_hugetlb.sh|, introduced here:
> https://lore.kernel.org/all/20200211213128.73302-8-almasrymina@google.com/T/#u
> <https://lore.kernel.org/all/20200211213128.73302-8-almasrymina@google.com/T/#u>
> 
>   echo "$reservation_limit" > \
>      $cgroup_path/$name/hugetlb.${MB}MB.$reservation_limit_file
> 
> In this case, it was primarily used to keep line length within 100 
> characters. I’ve tested the script  and it behaved as expected.

Great, thanks for checking.

Series is nicely reviewed and an earlier version spent time in mm.git. 
And the bar tends to be lower for selftests.  So I *could* break my rule
(https://lkml.kernel.org/r/20260323202941.08ddf2b0411501cae801ab4c@linux-foundation.org)
but would prefer not.  What do others think?

Did Venkat's report
(https://lkml.kernel.org/r/cf815c21-138e-44c8-986d-d8496503ee32@linux.ibm.com)
get addressed?  I'm not seeing that in the v2->v3 changelogging.

