Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC5734D384;
	Thu,  3 Sep 2026 05:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788414218; cv=none; b=TkV2CNb7gmZqlVAU3h7fyluxtR57HdXV4ICYBkNyEbCOjz0I4bYfKmEC+KF+z4KLs6J1cmqVp9llav6Gxwy03B09XAjSR71mnqgHL3PkwwTdzMITxZZKtesc7ea85tLMWWHjEq2MpSbJcTgBjkISSMtxJvb8oSqykpfeO5UPSGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788414218; c=relaxed/simple;
	bh=56+B6ZGap2zpjnDcmP30lgJpoQQaz0l2GeKgqVqc3/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnM0qJViX1W1hJSxqzZBMdPRE6URwj99jlUHXv206SBqxbkKGwanhjVMKZLyjpHUGXr2FagW6R0fMy6X7U1ct5LcaOvDXTt2yxv9pDVjkNgo6TOrJ0OGcxFTAJstYv6MxdKpZQDATfiX2TEZUvHKhCFY3w2Egobkn3saE9xa/ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uKky5BCz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uKky5BCz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC91D1F00A3A;
	Thu,  3 Sep 2026 05:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788414217;
	bh=Jy6YIArcCpTZAYf77Oc3uKkEC44H2h6IYfvF/LWfans=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uKky5BCzpzXYdLKMCS06t//S/hlpcQnaHdw7OT19nrrTGbf1guYURgpkmQbEgUS4i
	 QhkCdXRdanZ2X/Wk/lnAbpTPqlLRxTr3xTYawUaDIDlAN4f64hI+QIWxNVCrh3N0f2
	 bswibKmq5LSynFtlN9g7XN8a1cQK+uM4RRcHWYO0=
Date: Thu, 3 Sep 2026 07:41:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Christian Brauner <christian@brauner.io>,
	Meta kernel team <kernel-team@meta.com>,
	linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] kernfs: take kernfs_rename_lock for same-parent
 renames too
Message-ID: <2026090351-turbofan-tux-d75e@gregkh>
References: <20260903040253.670020-1-shakeel.butt@linux.dev>
 <2026090330-cytoplasm-resilient-900b@gregkh>
 <6a990797.3e7a366d.3bd849.72d1SMTPIN_ADDED_BROKEN@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a990797.3e7a366d.3bd849.72d1SMTPIN_ADDED_BROKEN@mx.google.com>

On Wed, Sep 02, 2026 at 10:37:21PM -0700, Shakeel Butt wrote:
> On Thu, Sep 03, 2026 at 06:31:58AM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Sep 02, 2026 at 09:02:51PM -0700, Shakeel Butt wrote:
> > > kernfs_rename_ns() only takes kernfs_rename_lock when the rename moves
> > > the node to a new parent.  A rename that keeps the same parent, like
> > > renaming a network interface, changes kernfs_node::name with only
> > > kernfs_rwsem held.  So the lock protects ->__parent but not ->name, and
> > > a reader that wants a stable name has to take kernfs_rwsem, the same
> > > lock every path lookup needs.
> > > 
> > > That also makes for a small but real bug.  kernfs_path_from_node()
> > > takes kernfs_rename_lock for reading, and kernfs_path_from_node_locked()
> > > then reads the name of each ancestor.  It reads each one once, so a
> > > single same-parent rename only moves the answer from the old path to the
> > > new one, but two of them landing inside one walk build a path that never
> > > existed:
> > > 
> > >   CPU0                                   CPU1
> > >   kernfs_path_from_node() on /a/b/c
> > >     reads the name of a, gets "a"
> > >                                          renames a to a2
> > >                                          renames b to b2
> > >     reads the name of b, gets "b2"
> > >     returns "/a/b2/c"
> > > 
> > > This hits roots without KERNFS_ROOT_INVARIANT_PARENT: sysfs, where the
> > > bad path can reach sysfs_warn_dup() and pr_cont_kernfs_path(), and
> > > resctrl, which renames a mon group inside its mon_groups directory.
> > > cgroup sets the flag, so it skips the lock and reads names under RCU
> > > alone; that case needs something else and is not addressed here.
> > > 
> > > So take the lock in both cases, and let kernfs_rcu_name() accept it the
> > > way kernfs_parent() already does for ->__parent.  Same-parent renames
> > > are rare, the lock is per filesystem, and the locked section is at most
> > > three stores.  It also gives a future rename sequence counter one place
> > > to sit that covers every rename.
> > > 
> > > Fixes: 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
> > > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> > > ---
> > >  fs/kernfs/dir.c             | 28 +++++++++++++++-------------
> > >  fs/kernfs/kernfs-internal.h |  9 ++++++++-
> > >  2 files changed, 23 insertions(+), 14 deletions(-)
> > 
> > How was this found and tested?  Did you forget an Assisted-by: tag?
> 
> I am working on a series to improve kernfs_rwsem and going through
> review-prompt with AI to review my series and these were existing 
> issues AI found. I have created reproducers with AI for these and
> tested that these patches those.

Then please read our documentation for how to properly document this
usage of a LLM tool.

If you have reproducers, please add them to the kernfs tests as well as
patches part of this series when you resend them.

thanks,

gre gk-h
