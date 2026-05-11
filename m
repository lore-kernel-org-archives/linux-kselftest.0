Received: from akranes.kaiser.cx (akranes.kaiser.cx [152.53.16.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C6A3783C0;
	Mon, 11 May 2026 13:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.53.16.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506147; cv=none; b=m4J44C2JRpgAp1DDzv5g6BxPVyPCi+hd4Rl/G6vD24O+SUAV/JyYwcHK/Gorzy7Rn74prcELoe0OhRz+Gl5WeXzxoFcWHCS4LqAJAIA47mqhJMoez2lhQcRWcXIdr85A6kGyPue/I1cbNX4vU0Df30yNN0dor+fGYxGjoiaIn6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506147; c=relaxed/simple;
	bh=l2HQ4UvNPAN5tkvHbJUkN03xRNX3ImkavsZOWtTE+f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDhUsW8HghB2HKQSwTXGwVp+/WxANYc2BWwhhLGDQfiHJki5UO3M78CDaxhx5XqvRzUKMaXxsYXOr6+hssxdDy8AN+OY6E5Lbdn7IHh/1evXJj9OO2wtQ5ebX8FFv5/479+fyucTWxtovHcAZpKTC9vuG71b+CWKPPeeqhN/yvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kaiser.cx; spf=pass smtp.mailfrom=kaiser.cx; arc=none smtp.client-ip=152.53.16.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kaiser.cx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaiser.cx
Received: from ipservice-092-208-105-007.092.208.pools.vodafone-ip.de ([92.208.105.7] helo=nb282.user.codasip.com)
	by akranes.kaiser.cx with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <martin@kaiser.cx>)
	id 1wMQgp-000000002Y5-1S68;
	Mon, 11 May 2026 15:28:55 +0200
Date: Mon, 11 May 2026 15:28:54 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Florian Schmaus <florian.schmaus@codasip.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kunit: fix use-after-free in debugfs when using
 kunit.filter
Message-ID: <agHZlskzguX4X7cj@nb282.user.codasip.com>
References: <20260507084854.233984-1-florian.schmaus@codasip.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507084854.233984-1-florian.schmaus@codasip.com>

Thus wrote Florian Schmaus (florian.schmaus@codasip.com):

> When the kernel is booted with a kunit filter (e.g.,
> kunit.filter="speed!=slow"), the kunit executor dynamically allocates
> copies of the filtered test suites using kmalloc/kmemdup.

> During the initial boot execution, kunit_debugfs_create_suite() creates
> debugfs files (such as /sys/kernel/debug/kunit/<suite>/run) and
> permanently stores a pointer to the dynamically allocated suite in the
> inode's i_private field.

> Previously, the executor freed this dynamically allocated suite_set
> immediately after executing the boot-time tests. Because the debugfs
> nodes were not destroyed, any subsequent interaction with the debugfs
> `run` file from userspace triggered a use-after-free (UAF). On systems
> with architectural capabilities, like CHERI RISC-V, this resulted in
> an immediate fatal hardware exception due to the invalidation of the
> capability tags on the reclaimed memory. On other architectures, it
> resulted in silent memory corruption.

> Fix this UAF by properly coupling the lifetime of the filtered suite
> memory allocation to the lifetime of the kunit subsystem and its
> associated VFS nodes. Ownership of the boot-time suite_set is now
> transferred to a global tracker ('kunit_boot_suites'), and the memory
> is cleanly released in kunit_exit() during module teardown.

> Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>

Reviewed-by: Martin Kaiser <martin@kaiser.cx>
