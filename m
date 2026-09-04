Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C578E4CA29B;
	Fri,  4 Sep 2026 14:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533192; cv=none; b=puPG40OO+R58y5TIoxxGDw1YBmPNUt9dOJQxFAA1wLU8jb3Qvf5w6hlzBZALIC2tkYmMl9ueYctvSKnBGapsVOF2rU/nuD7uRl+MKp8E+YUFyNOzWklgDw+fvLcJDonLQ/APLvjyIv6LQvcvQX8fvIOL7RuYyw764w3Nkqv2GsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533192; c=relaxed/simple;
	bh=6YOKdGHqQZFFBriWHZr2LHxCtznyqa8Dq5ujELK1W64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIDcCop3pwGq7zNHOXWu+nX2n0R5yqcUgw9p0Jd3HVtaSDvOKFczJ1odF9K9dlSaCkLP640wWgy6PvPjjMdNJG9OU1Nb1qUdytSQZwbyiXo7W8lfgWViyR8QdcElou+3zS+8bpdNrAcBvGs4YXROCLgpIKiiffBJaG3uTyCAkfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GiHJpti3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GiHJpti3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A191F00A3D;
	Fri,  4 Sep 2026 14:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788533190;
	bh=C11iQdT2ycScZMPTToa+e5QQW1criHxxo7fUl5Vxeo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GiHJpti3iF2NhaBPSiHn44H8SufrVOgnk1G/klg2vO7ie43Xx+SUT9FVTLsblRkVw
	 +qdSw1m+0SnAYU4s0TpxrYhp9BbGj9YZHPzA5RCR1zxK5JrZcEytbEqKx2BK6aLn2p
	 xrdcqV/r6/e00GihtUay8zLXkX615OXiNMQQxnc8=
Date: Fri, 4 Sep 2026 16:44:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christian Brauner <christian@brauner.io>,
	Meta kernel team <kernel-team@meta.com>,
	linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: cover kernfs dentry revalidation
Message-ID: <2026090456-unblock-elixir-7d4f@gregkh>
References: <20260902014050.499002-1-shakeel.butt@linux.dev>
 <20260904-kandidat-bergbahn-ersonnen-3a6dd1f1cf0e@brauner>
 <aprVEyqOrdmuD-HN@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aprVEyqOrdmuD-HN@linux.dev>

On Fri, Sep 04, 2026 at 07:33:45AM -0700, Shakeel Butt wrote:
> On Fri, Sep 04, 2026 at 10:13:11AM +0200, Christian Brauner wrote:
> > On Tue, Sep 01, 2026 at 06:40:50PM -0700, Shakeel Butt wrote:
> > > kernfs_test only checked two xattr calls. It did not touch the part of
> > > kernfs that userspace hits most: the dentry cache.
> > > 
> > > The kernel adds and removes kernfs nodes on its own, with no VFS call
> > > behind it, and removal cannot always unhash the dentries that are
> > > already cached. So ->d_revalidate() is what keeps the cache honest,
> > > let's add tests for it.
> > > 
> > > Add tests that make the kernel change kernfs directly, instead of going
> > > through create and unlink:
> > > 
> > >  - writing cgroup.subtree_control makes the kernel add and remove files
> > >    in every child cgroup. That checks two things: a cached negative
> > >    dentry is dropped once the file appears, and a cached positive one
> > >    is dropped once the file goes away.
> > >  - renaming a network interface renames the sysfs node under a dentry
> > >    that is already cached.
> > >  - sysfs mounted in a new network namespace must list that namespace's
> > >    interfaces and not the parent's, which covers the KERNFS_NS tagging
> > >    code.
> > >  - many lookups running against concurrent mkdir and rmdir. A lookup
> > >    may only succeed or fail with an errno that means "it is gone".
> > >  - open across removal, readdir returning each entry once, and a
> > >    telldir()/seekdir() round trip, which uses the name hash cookie in
> > >    kernfs_dir_pos().
> > > 
> > > Test the other direction too: walking dentries that are already cached
> > > must not drop them. That is not just a slowdown. d_invalidate() calls
> > > detach_mounts(), so a dentry dropped by mistake also unmounts whatever
> > > is mounted under that directory.
> > > 
> > > Both filesystems are needed. cgroup2 has no ->rename and is not
> > > namespace tagged. sysfs cannot be mounted with a set of children we
> > > control. The config fragment stops a kernel built with kselftest-merge
> > > from passing while it runs almost nothing.
> > > 
> > > To confirm the tests really catch a broken backstop, kernfs_dir_changed()
> > > was stubbed to return false. 8 of the 11 tests then failed.
> > > 
> > > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> > > ---
> > 
> > I have to say I would appreciate trimmed-down commit messages with less
> > relative clauses. This reads very LLMy still. Especially for tests my
> > appetite for wading through multiple paragraphs of info is very low.
> > Same goes for the very wordy changelog below...
> 
> My appologies, I will be more precise and concise in future.
> 
> I assume the kernfs bug fixes [1] will also go to your vfs branch. I will send a
> v2 of that series with appropriate tags and will try to improve the commit
> messages as well. I have a followup improvements for kernfs_rwsem which I will
> base on vfs branch. Just wanted to give a headsup.

kernfs patches go through the driver-core tree normally, not vfs.

thanks,

greg k-h
