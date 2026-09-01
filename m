Received: from mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5A63C343E
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272796; cv=none; b=EDOHVQaREidEQWhI6/6Vcy6scp5dsoy6WgbFj6xfY2WNip6cG6oLMfrIZSc/mUnhwIZtmxp3WNd/tTHIqi4gorDXauRz+qLAOzi4pqpt+lMgo7B0QZd6EsW4xLpUFd8cWty90FNWiu3V2BdIwrTHcM4CeQN7NFxK7PxPPhmx/N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272796; c=relaxed/simple;
	bh=BYo7V49rEgMHWq7ZsNC+wtDhhAsiwmzghNYGwdvniXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciTdC51gQbxChLfNweVVbnoHeoicPzArYXY5w+AXD468+3P46JCUfBAltAf/TFWwYLvkIHrz0KCw9Dg234tvX2+z5Z3VpeuuVBtVstKX/fPhtMSzYdMhAJmz7trz/ovDU5DCOQoV3RxR90Qrzq1PKHkfs9Rq+U84WXi4QmWxJrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KQ609SL6; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KQ609SL6"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BYo7V49rEgMHWq7ZsNC+wtDhhAsiwmzghNYGwdvniXQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788272792; v=1; x=1788877592;
 b=KQ609SL6IHL5v6wY9CTa3CteAVI/ZdNVtmgrsxO4pqjjgteZANPV3lk2M24qTFl65/j91zYj
 tJhAX9ifZy/XUtKlVRri9t/do88wcXn7vAB4uYJpwSt5wNUh1qCRaSLUG3pq70HnLrX9lkjayPk
 WGQh3hBx+JY52C+2Uz3EQG/k=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6877674021b6adc4;
	Tue, 01 Sep 2026 14:26:22 +0000
X-Mizu-Trace-ID: 6877674021b6adc4
X-Migadu-Flow: FLOW_OUT
Date: Tue, 1 Sep 2026 07:26:21 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Christian Brauner <christian@brauner.io>
Cc: Meta kernel team <kernel-team@meta.com>, 
	linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: cover kernfs dentry revalidation
Message-ID: <apbgQnHeMKDyVHPg@linux.dev>
References: <20260829022825.407836-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829022825.407836-1-shakeel.butt@linux.dev>

On Fri, Aug 28, 2026 at 07:28:25PM -0700, Shakeel Butt wrote:
> kernfs_test only exercised two xattr calls, so nothing covered the part
> of kernfs most exposed to userspace: the dentry cache.
> 
> kernfs nodes appear and disappear from kernel contexts with no VFS
> operation driving them, and removal cannot reliably unhash the cached
> dentries, so ->d_revalidate() is the correctness backstop. It had no
> test at all.
> 
> Add tests that drive kernfs from kernel context rather than through VFS
> create/unlink:
> 
>  - writing cgroup.subtree_control makes the kernel add and remove files
>    in every child cgroup, exercising both the negative-dentry revision
>    check and the deactivation check,
>  - renaming a network interface renames the sysfs node underneath an
>    already cached dentry,
>  - sysfs in a fresh network namespace must show only that namespace's
>    interfaces, covering the KERNFS_NS tagging paths,
>  - lookup hammered against concurrent mkdir/rmdir must only ever see
>    success or an errno meaning "it went away",
>  - removal-while-open, readdir duplicate detection and a
>    seekdir()/telldir() round trip over kernfs_dir_pos()'s hash cookie.
> 
> Also the other direction: walking already cached dentries must not
> invalidate them. That is not merely a lost optimisation --
> d_invalidate() calls detach_mounts(), so a revalidation that wrongly
> fails silently tears down any mount underneath the directory.
> 
> Both filesystems are needed: cgroup2 has no ->rename and is not
> namespace tagged, and sysfs cannot be mounted with a controllable set of
> children. The config fragment keeps a kernel built via kselftest-merge
> from reporting a pass while running almost nothing.
> 
> Verified the suite reacts to a broken backstop rather than passing:
> stubbing kernfs_dir_changed() to return false turns 8 of the 11 tests
> red.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Sashiko raised couple of issues, so I will address those and send v2.
