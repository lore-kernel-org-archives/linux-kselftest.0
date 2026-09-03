Received: from mta1.migadu.com (out-63.mta1.migadu.com [95.215.58.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B4F372ECD
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 06:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416125; cv=none; b=FoEQJ3369Mes9cj7Q5eLTaeotVyEgpLfml7brP0e27n4mxuwy2JHZaZuZ7TDDSSav6mOS1IJeQLcFTgHhnSb16uLdoiB8UUpFLnxdtqxcGHbqp16aSFKuPKHvORgyW7mGlg5EWlv58J7X+SWuRbUNoRPQvfn3y/wgg/sHuuMbII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416125; c=relaxed/simple;
	bh=VW2G9+S+grYb3iReEIYAciUQOjbf6ENRNXOUTjyONew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGqo41XXTsv7xOhpQLx5LbLt6rDetdfzSJtmHhakvjHn6ePiZMzARyYzvU039PN6bHqtu1OXpVOrctkHf9I5Tms5pZVwP+HYOkcKtp2r7jTucCYLqf/JmufwAyo5kd53ZsWhJg7KwDVyrp7D5PRmP8wTc2OJsQJZQjZ/dSN23Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tBm7ZQTX; arc=none smtp.client-ip=95.215.58.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tBm7ZQTX"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VW2G9+S+grYb3iReEIYAciUQOjbf6ENRNXOUTjyONew=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788416121; v=1; x=1789020921;
 b=tBm7ZQTX2Dm6E5zwJFfDBpbZS3DL2Rs/wANv0RSwBMOXI4lXSHIXmYMy8p8cm2m4+Lh/kbE5
 xqJD8CWATxUJs4PCjcjjwxhxGwGSwfA7U014kcvM/Oi+qCSWyyRZScj8eneqDCWkUOhtHdUrqWs
 3feaIJinHAYiEFgzb4CJClZU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4d603cdf1e5a2158;
	Thu, 03 Sep 2026 06:15:21 +0000
X-Mizu-Trace-ID: 4d603cdf1e5a2158
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 23:15:16 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>, Christian Brauner <christian@brauner.io>, 
	Meta kernel team <kernel-team@meta.com>, linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] kernfs: take kernfs_rename_lock for same-parent
 renames too
Message-ID: <20260903060812.GA18952@shakeel.butt@linux.dev>
References: <20260903040253.670020-1-shakeel.butt@linux.dev>
 <2026090330-cytoplasm-resilient-900b@gregkh>
 <6a990797.3e7a366d.3bd849.72d1SMTPIN_ADDED_BROKEN@mx.google.com>
 <2026090351-turbofan-tux-d75e@gregkh>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026090351-turbofan-tux-d75e@gregkh>

On Thu, Sep 03, 2026 at 07:41:53AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 02, 2026 at 10:37:21PM -0700, Shakeel Butt wrote:
> > On Thu, Sep 03, 2026 at 06:31:58AM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Sep 02, 2026 at 09:02:51PM -0700, Shakeel Butt wrote:
> > > > kernfs_rename_ns() only takes kernfs_rename_lock when the rename moves
> > > > the node to a new parent.  A rename that keeps the same parent, like
> > > > renaming a network interface, changes kernfs_node::name with only
> > > > kernfs_rwsem held.  So the lock protects ->__parent but not ->name, and
> > > > a reader that wants a stable name has to take kernfs_rwsem, the same
> > > > lock every path lookup needs.
> > > > 
> > > > That also makes for a small but real bug.  kernfs_path_from_node()
> > > > takes kernfs_rename_lock for reading, and kernfs_path_from_node_locked()
> > > > then reads the name of each ancestor.  It reads each one once, so a
> > > > single same-parent rename only moves the answer from the old path to the
> > > > new one, but two of them landing inside one walk build a path that never
> > > > existed:
> > > > 
> > > >   CPU0                                   CPU1
> > > >   kernfs_path_from_node() on /a/b/c
> > > >     reads the name of a, gets "a"
> > > >                                          renames a to a2
> > > >                                          renames b to b2
> > > >     reads the name of b, gets "b2"
> > > >     returns "/a/b2/c"
> > > > 
> > > > This hits roots without KERNFS_ROOT_INVARIANT_PARENT: sysfs, where the
> > > > bad path can reach sysfs_warn_dup() and pr_cont_kernfs_path(), and
> > > > resctrl, which renames a mon group inside its mon_groups directory.
> > > > cgroup sets the flag, so it skips the lock and reads names under RCU
> > > > alone; that case needs something else and is not addressed here.
> > > > 
> > > > So take the lock in both cases, and let kernfs_rcu_name() accept it the
> > > > way kernfs_parent() already does for ->__parent.  Same-parent renames
> > > > are rare, the lock is per filesystem, and the locked section is at most
> > > > three stores.  It also gives a future rename sequence counter one place
> > > > to sit that covers every rename.
> > > > 
> > > > Fixes: 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
> > > > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> > > > ---
> > > >  fs/kernfs/dir.c             | 28 +++++++++++++++-------------
> > > >  fs/kernfs/kernfs-internal.h |  9 ++++++++-
> > > >  2 files changed, 23 insertions(+), 14 deletions(-)
> > > 
> > > How was this found and tested?  Did you forget an Assisted-by: tag?
> > 
> > I am working on a series to improve kernfs_rwsem and going through
> > review-prompt with AI to review my series and these were existing 
> > issues AI found. I have created reproducers with AI for these and
> > tested that these patches those.
> 
> Then please read our documentation for how to properly document this
> usage of a LLM tool.

Sure

> 
> If you have reproducers, please add them to the kernfs tests as well as
> patches part of this series when you resend them.
>

The reproducers are like stress tests and are targeting race conditions.
In one case delay was added to fully expose the race. I am not sure
selftests is the right place for this kind of tests. I can just publish
the reproducer on the list to have them on record if that is what you
are looking for.
