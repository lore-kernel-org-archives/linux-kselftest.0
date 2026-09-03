Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD6A1D9A5F
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 05:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413850; cv=none; b=DtMfTDj4E+qKN63mVy1DMjUOvOq/ms0HYjkAW6xFdTdSDXZbalhDuLQjY7UGOK67PiqwEQgVUpxrvl/ARyidRziP1NG0ye4ACmb3RzVhZXIJwqWkbPjgFdvdzx5tl4X1CiJIPGrONz1p24BME7ZM7L7+G17SxlpSrLKdkKy1y2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413850; c=relaxed/simple;
	bh=GUra9Sz1ZsJBvBMzdUk5ZKkwM32xrfNY9UlZVLF9CBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsNmSJMKoCWygOvvh6oNbU2Ep91P4QLfd27rByhwKVF7eUB0IOMcnMQxRV7TsSNpoebXWdqaLwZX/OYRL+DAfs9oQZ5xODEPd46cSUGYpS7SlpafPqO8ePSAk80rkYkThwHp8QAdxyUxQV/w1n6F86Y2UujTAfS1tA0eVpDcR8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U+r/bmwK; arc=none smtp.client-ip=91.218.175.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U+r/bmwK"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GUra9Sz1ZsJBvBMzdUk5ZKkwM32xrfNY9UlZVLF9CBw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788413847; v=1; x=1789018647;
 b=U+r/bmwKHwc/2GSw7taX7xlq3WSkSI+ubK/Wigo/T0FnELu45/VTHFyl1R8Yr7Id+JzIIoUM
 3n7Uh6ZtdnaZU67OFM3qJhReq6IACfmrxbO0skZpFFHbuVwC+Uhu/5u9zTNU32azQ82/uLf9JnT
 0Szm+LxFR3lGsCUKg2XXCiPg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 34ba9696c4835a6b;
	Thu, 03 Sep 2026 05:37:27 +0000
X-Mizu-Trace-ID: 34ba9696c4835a6b
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 22:37:21 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>, Christian Brauner <christian@brauner.io>, 
	Meta kernel team <kernel-team@meta.com>, linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] kernfs: take kernfs_rename_lock for same-parent
 renames too
Message-ID: <20260903053226.GA15581@shakeel.butt@linux.dev>
References: <20260903040253.670020-1-shakeel.butt@linux.dev>
 <2026090330-cytoplasm-resilient-900b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026090330-cytoplasm-resilient-900b@gregkh>

On Thu, Sep 03, 2026 at 06:31:58AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 02, 2026 at 09:02:51PM -0700, Shakeel Butt wrote:
> > kernfs_rename_ns() only takes kernfs_rename_lock when the rename moves
> > the node to a new parent.  A rename that keeps the same parent, like
> > renaming a network interface, changes kernfs_node::name with only
> > kernfs_rwsem held.  So the lock protects ->__parent but not ->name, and
> > a reader that wants a stable name has to take kernfs_rwsem, the same
> > lock every path lookup needs.
> > 
> > That also makes for a small but real bug.  kernfs_path_from_node()
> > takes kernfs_rename_lock for reading, and kernfs_path_from_node_locked()
> > then reads the name of each ancestor.  It reads each one once, so a
> > single same-parent rename only moves the answer from the old path to the
> > new one, but two of them landing inside one walk build a path that never
> > existed:
> > 
> >   CPU0                                   CPU1
> >   kernfs_path_from_node() on /a/b/c
> >     reads the name of a, gets "a"
> >                                          renames a to a2
> >                                          renames b to b2
> >     reads the name of b, gets "b2"
> >     returns "/a/b2/c"
> > 
> > This hits roots without KERNFS_ROOT_INVARIANT_PARENT: sysfs, where the
> > bad path can reach sysfs_warn_dup() and pr_cont_kernfs_path(), and
> > resctrl, which renames a mon group inside its mon_groups directory.
> > cgroup sets the flag, so it skips the lock and reads names under RCU
> > alone; that case needs something else and is not addressed here.
> > 
> > So take the lock in both cases, and let kernfs_rcu_name() accept it the
> > way kernfs_parent() already does for ->__parent.  Same-parent renames
> > are rare, the lock is per filesystem, and the locked section is at most
> > three stores.  It also gives a future rename sequence counter one place
> > to sit that covers every rename.
> > 
> > Fixes: 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
> > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> > ---
> >  fs/kernfs/dir.c             | 28 +++++++++++++++-------------
> >  fs/kernfs/kernfs-internal.h |  9 ++++++++-
> >  2 files changed, 23 insertions(+), 14 deletions(-)
> 
> How was this found and tested?  Did you forget an Assisted-by: tag?

I am working on a series to improve kernfs_rwsem and going through
review-prompt with AI to review my series and these were existing 
issues AI found. I have created reproducers with AI for these and
tested that these patches those.

