Received: from mta1.migadu.com (out-237.mta1.migadu.com [95.215.58.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554FF3845CB
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 14:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532435; cv=none; b=QRgHmh4vTdtSs+sV67dow9G7iB9EC1TZn43jrfzWzeyRKMC6JniH2aWG96a5Dhfqq3xtVurASWZ8AwSzc/7ehIsNOKm+xi1Xv7t3mZBjbtmKyEcvz0YtRxckU0SidjLGNHMQcaoACebQxhnCEVKBhnpHj/ah/+yFK7EGfuuPdsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532435; c=relaxed/simple;
	bh=JuPH7/2Y2ltdy3iQbdznIQ0SDNwJB4Wc+2UbdaNxT08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhVk/Wfe3TyKnXITfnVd6/IrpzgyYMQ2p/TRUEq41mz9FngpkGacHI7qyf/rCzOfvoX/5bXmUKU5E5iDUVq3vuco8kom5///4UVtaSLas9pX+MAgTAdDdj9cR8F9JUxCVndHsjkx9M5YLYWY2ZiwYoPctczfvbND1kyF71lMiNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aqEbJ3iP; arc=none smtp.client-ip=95.215.58.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aqEbJ3iP"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JuPH7/2Y2ltdy3iQbdznIQ0SDNwJB4Wc+2UbdaNxT08=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788532431; v=1; x=1789137231;
 b=aqEbJ3iPMSzdysHD6Z/Nn6ZNICUweuIjiyQHuaG4hUEKRQlp8XnbAeVWf18r15aXp1uaFGZD
 fQbT6jXcJMypMkuZomlcBp9mTodoBVTFrw2jGNfnmtyLL2Luvgz0KzsT+oF3zyGMd0CEHo4DgfL
 8Krn04WRcb5Irl8A5iIFRVpY=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 46051ea72cb9bae1;
	Fri, 04 Sep 2026 14:33:51 +0000
X-Mizu-Trace-ID: 46051ea72cb9bae1
X-Migadu-Flow: FLOW_OUT
Date: Fri, 4 Sep 2026 07:33:45 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Christian Brauner <brauner@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Christian Brauner <christian@brauner.io>, 
	Meta kernel team <kernel-team@meta.com>, linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: cover kernfs dentry revalidation
Message-ID: <aprVEyqOrdmuD-HN@linux.dev>
References: <20260902014050.499002-1-shakeel.butt@linux.dev>
 <20260904-kandidat-bergbahn-ersonnen-3a6dd1f1cf0e@brauner>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-kandidat-bergbahn-ersonnen-3a6dd1f1cf0e@brauner>

On Fri, Sep 04, 2026 at 10:13:11AM +0200, Christian Brauner wrote:
> On Tue, Sep 01, 2026 at 06:40:50PM -0700, Shakeel Butt wrote:
> > kernfs_test only checked two xattr calls. It did not touch the part of
> > kernfs that userspace hits most: the dentry cache.
> > 
> > The kernel adds and removes kernfs nodes on its own, with no VFS call
> > behind it, and removal cannot always unhash the dentries that are
> > already cached. So ->d_revalidate() is what keeps the cache honest,
> > let's add tests for it.
> > 
> > Add tests that make the kernel change kernfs directly, instead of going
> > through create and unlink:
> > 
> >  - writing cgroup.subtree_control makes the kernel add and remove files
> >    in every child cgroup. That checks two things: a cached negative
> >    dentry is dropped once the file appears, and a cached positive one
> >    is dropped once the file goes away.
> >  - renaming a network interface renames the sysfs node under a dentry
> >    that is already cached.
> >  - sysfs mounted in a new network namespace must list that namespace's
> >    interfaces and not the parent's, which covers the KERNFS_NS tagging
> >    code.
> >  - many lookups running against concurrent mkdir and rmdir. A lookup
> >    may only succeed or fail with an errno that means "it is gone".
> >  - open across removal, readdir returning each entry once, and a
> >    telldir()/seekdir() round trip, which uses the name hash cookie in
> >    kernfs_dir_pos().
> > 
> > Test the other direction too: walking dentries that are already cached
> > must not drop them. That is not just a slowdown. d_invalidate() calls
> > detach_mounts(), so a dentry dropped by mistake also unmounts whatever
> > is mounted under that directory.
> > 
> > Both filesystems are needed. cgroup2 has no ->rename and is not
> > namespace tagged. sysfs cannot be mounted with a set of children we
> > control. The config fragment stops a kernel built with kselftest-merge
> > from passing while it runs almost nothing.
> > 
> > To confirm the tests really catch a broken backstop, kernfs_dir_changed()
> > was stubbed to return false. 8 of the 11 tests then failed.
> > 
> > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> > ---
> 
> I have to say I would appreciate trimmed-down commit messages with less
> relative clauses. This reads very LLMy still. Especially for tests my
> appetite for wading through multiple paragraphs of info is very low.
> Same goes for the very wordy changelog below...

My appologies, I will be more precise and concise in future.

I assume the kernfs bug fixes [1] will also go to your vfs branch. I will send a
v2 of that series with appropriate tags and will try to improve the commit
messages as well. I have a followup improvements for kernfs_rwsem which I will
base on vfs branch. Just wanted to give a headsup.

Thanks a lot, Christian.

[1] https://lore.kernel.org/all/20260903040253.670020-1-shakeel.butt@linux.dev/ 
