Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7272A333442;
	Mon,  1 Jun 2026 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780294923; cv=none; b=VwgefdpVUKqgoR0Brfz76/cAqxb7miBxP98feVsnSAKsGE9HC4xe3kn4PIALHTiDG5hnCfYXUx3S/4j514dYt1WPDb4AMb5jOvPy11eyT3iPg6cl33LTmCQJiyFIjlyr8BY2dZ9xP8wRinu7lqMh8LQFP+AD7TifELo4e4vRNRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780294923; c=relaxed/simple;
	bh=TNW/wuOL1demcupUwf+ru4aLjbj67g1FmfMBtWndEEc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=O3SMBxOwvXEcUsrnCTdr4esoYkYvkCy3n+ECSuATQ2W18FXfuKwcoJTYhZPjWj0Bl4bNpe2TFZSXDTnCKHZHltfZPq5G1fBKOpmDIxQvehwiL97w8SY4AhuWicTQxCz03SKgkfeq+PIDQmrKGv5HkfrSz82i7u4eP1pvmrf1G7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fW0n2LvL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fW0n2LvL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6EF1F00893;
	Mon,  1 Jun 2026 06:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1780294922;
	bh=JC8ooVvP2VP/aGda96PWkp1u1gfkWKF0V7K4OvYMrQ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fW0n2LvLA05tb2iQ906w0acukFZB8rLE3cTd1M/E6TWaNZTa7efwKjZR2iJ/XTWtD
	 AfsMdMqXq0uzEb+suh5q0lWPl5L7N40QUUeZM7mMmFZ+mWQdCXweHKjMUM4MaZtfCa
	 a9cfW5u2ZJd7OM7vWe3vuxhUGSm7LI+8uJL4Tss0=
Date: Sun, 31 May 2026 23:22:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Pavithra <pavrampu@linux.ibm.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 ritesh.list@gmail.com, david@kernel.org, ziy@nvidia.com, mhocko@kernel.org,
 osalvador@suse.de, lorenzo.stoakes@oracle.com, dev.jain@arm.com,
 Liam.Howlett@oracle.com, linmiaohe@huawei.com
Subject: Re: [PATCH] selftests/mm/run_vmtests.sh: Fix protection_keys binary
 name in run_vmtests.sh
Message-Id: <20260531232201.7613f20b850f0bff4f133f3b@linux-foundation.org>
In-Reply-To: <20260601061314.898388-1-pavrampu@linux.ibm.com>
References: <20260601061314.898388-1-pavrampu@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  1 Jun 2026 11:43:14 +0530 Pavithra <pavrampu@linux.ibm.com> wrote:

> we have protection_keys_32 and protection_keys_64 tests mentioned in
> run_vmtests.sh but the binary name is protection_keys with current
> kernel,

Is it?

Makefile has:

VMTARGETS := protection_keys
VMTARGETS += pkey_sighandler_tests
BINARIES_32 := $(VMTARGETS:%=%_32)
BINARIES_64 := $(VMTARGETS:%=%_64)

hp2:/usr/src/mm/tools/testing/selftests/mm> ls -l prot*
-rwxrwxr-x 1 akpm akpm 117792 May 31 23:20 protection_keys_64
-rw-rw-r-- 1 akpm akpm  48448 May 31 21:54 protection_keys.c

