Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53B73A3831;
	Thu, 26 Mar 2026 18:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550318; cv=none; b=OoCArNfGKB70qVLhdpr6NsKrpOqKLJJu15QMj3ftyUCj5lZgqSvA9g2OknLnvE+igfevDTlWPJh8a/G/4C8hH2G6HRv9pyKWjlKEsOPLIwFb2OFDqn4SmAqyA8ppOrI9jJ1qVCJDaJFF87DUfeOaVVaQ2DLAAtTV3hiz6fCukDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550318; c=relaxed/simple;
	bh=ndiHyXCoO5k7Iqu/6caxL41+ed9KFd/MkCx3xUWmsEc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IkXBSwwfOOH/hf45onRhxfEr831C8pjo3B5U9uCxGuq6S3MmyMfBKQWWFuK5sgblCkLRCRnpZo3zZyL65A6Hl3I2Y+K36Vs0kH4XHOU5dxwfIc2kkaOxpa+Fy1kv8Y1zfJdWOaMfXC+dBeTyHmYn3z0GdfV7G8x5GHk5DLW1BGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=taNmqBfM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="taNmqBfM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A040BC116C6;
	Thu, 26 Mar 2026 18:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774550318;
	bh=ndiHyXCoO5k7Iqu/6caxL41+ed9KFd/MkCx3xUWmsEc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=taNmqBfM3BLswhWl/RJJAoUFuCiAqubMPHWGGMR3UdxU5KJrs8LMM7qcXQRrWVVpw
	 gJFt3VEicxOzMPC1XI2z5MNJGEAaclq1nCkD/zc1lZ5QXVXtp5hg6xhnKLTJn3wcS9
	 elOgQXcAU4TsAUSpKtEoqf8YzI3FpzELGjqsW4ls=
Date: Thu, 26 Mar 2026 11:38:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Shuah Khan
 <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Ritesh Harjani <ritesh.list@gmail.com>, Zi
 Yan <ziy@nvidia.com>, Michal Hocko <mhocko@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain
 <dev.jain@arm.com>, Liam.Howlett@oracle.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 09/13] selftests/mm: skip uffd-wp-mremap if UFFD
 write-protect is unsupported
Message-Id: <20260326113837.b2a030330adb7dead8acfeff@linux-foundation.org>
In-Reply-To: <e6f03352-4f09-4238-a47a-6d4e84101a6c@linux.ibm.com>
References: <cover.1773305677.git.sayalip@linux.ibm.com>
	<ed23ff57a80881c9d087d22709862af40addf49b.1773305678.git.sayalip@linux.ibm.com>
	<457dddf1-04ec-4d1e-8640-b04997fac4f1@kernel.org>
	<0e9cea41-7c49-446a-b67b-256584960516@linux.ibm.com>
	<20260324165606.d75200ac0e5458a5ffb83d5d@linux-foundation.org>
	<e6f03352-4f09-4238-a47a-6d4e84101a6c@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Mar 2026 23:31:10 +0530 Sayali Patil <sayalip@linux.ibm.com> wrote:

> >   	pagesize = getpagesize();
> >   	nr_thpsizes = detect_thp_sizes(thpsizes, ARRAY_SIZE(thpsizes));
> > _
> >
> Hi Andrew,
> I have some updates to [PATCH v2 04/13] selftests/mm: fix cgroup task 
> placement and tolerance in hugetlb_reparenting_test.sh, as Venkat 
> reported failures with the current version.
> 
> Should I send a v3 of the full series, or just a fixup patch for 
> hugetlb_reparenting_test.sh?

A full resend is fine, thanks.  I'll prepare a diff showing all the
changes since v2 for you to double-check and for people who already
reviewed v2.

> Also, if you prefer a v3, should I include 
> above fix for 
> selftests-mm-skip-uffd-wp-mremap-if-uffd-write-protect-is-unsupported as 
> well?

Yes please, integrate all fixups.  

You may choose to track those fixups the way I do:

[avagin@google.com: fix lock leak in mfill_get_vma()]
  Link: https://lkml.kernel.org/r/20260316173829.1126728-1-avagin@google.com
[akpm@linux-foundation.org: update mfill_copy_folio_retry()]
  Link: https://lkml.kernel.org/r/20260316173829.1126728-1-avagin@google.com
Link: https://lkml.kernel.org/r/20260306171815.3160826-6-rppt@kernel.org
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Andrei Vagin <avagin@google.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Cc: Axel Rasmussen <axelrasmussen@google.com>
...

Other people also do this sometimes, usually not.
