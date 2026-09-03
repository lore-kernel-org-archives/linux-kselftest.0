Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92754DF4D3;
	Thu,  3 Sep 2026 20:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467183; cv=none; b=jwceB6bdlFO94cynfmsdFDKVcsxxtRh0X7LaRLNsPncUg6ZAAhDDUZsghr6II6+MOybIqZQpqLF06hAFSN9Ewn0Z5cUzt2uMNf4PMD++FDkQ9rsfnwiyL8n5/OSV/J6o6kKiHzrZToxhNjj6CauCX8dl3cpc/gCtL1z5vXcPBw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467183; c=relaxed/simple;
	bh=09MHZ5B8NwaJeNDtQtwQamcZ5qyNv3VCJqjodHpedH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYqz0/9esBtnlsN7niugV/b+Xb+Z6MEQ3SOyjCzB9WuAHchYzTZcdg056nX6uNSHYCWli5QeFn7UA/0XzWnN4wer7b3n37GLlJXjpmL4iIuUtyHs9xVXSivkDhEHnhLLbPq3H05XLxj61V3i+JMMNV5S8Kh2KapeEdexePyZJKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWgQrnJb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWgQrnJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6EF1F000E9;
	Thu,  3 Sep 2026 20:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788467168;
	bh=Kn+BrQDF1tpL6NihpVkXwRuv3+9c2tqI66dX8xw+xLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PWgQrnJbzG1Vcn7hcRs+ndmjjvosFxPtabrYQ2iiqybuoszWpGKXkb0Jw+laCaIGq
	 gsjVBPsR/6s9GTFIiSO0pIMiiJuC/Ul3Ym0OkmTHWzb5rSZz448I3OjC1O+jVDUw5X
	 sZmrqJE+aGKSo8q4/uouXsVzT45JTCS2o7Yhahxj//oLMzQClTBF+jVptGKL6UlF9Z
	 X3XqMFj/bu7eW2jGQEVCxJX4xZOzuo9l/6kNy1YY6yBhQA+m+jT+F4hkT31XSZWX7G
	 K/lmnm965rKlypr9A8SrJGoN8fA6xBKzja0gexB2jrBz/4K0570Rq9Mtd8XSM5TsVE
	 mSfHJsbnTA2ew==
Date: Thu, 3 Sep 2026 10:26:07 -1000
From: Tejun Heo <tj@kernel.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <christian@brauner.io>,
	Meta kernel team <kernel-team@meta.com>,
	linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] kernfs: fix up the unlocked attribute reads on the
 creation paths
Message-ID: <apnX34sTUnMngU5k@slm.duckdns.org>
References: <20260903040253.670020-1-shakeel.butt@linux.dev>
 <20260903040253.670020-3-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903040253.670020-3-shakeel.butt@linux.dev>

On Wed, Sep 02, 2026 at 09:02:53PM -0700, Shakeel Butt wrote:
> Two creation paths read a live node's attributes without holding
> kernfs_iattr_rwsem, which kernfs_iop_setattr() takes for writing.  They
> do not want the same fix.
> 
> kernfs_create_link() copies the target's ia_uid and then its ia_gid
> into the new link.  A chown of the target between the two reads leaves
> the link with the old uid and the new gid, an owner the target never
> had, when copying the target's owner is the whole point.  Read both
> fields under the rwsem.
> 
> kernfs_new_node() reads the parent's ia_gid for S_ISGID inheritance,
> and that one does not care which value it gets: the node does not exist
> yet, so nothing orders a racing chown against the creation either way.
> Taking the rwsem there would only serialize creation under a set-gid
> parent against a chown of that parent, to pick between two answers that
> are both right.  Mark the field read data_race() instead.
> 
> The pointer that leads to it is a different matter: __kernfs_iattrs()
> publishes kernfs_node::iattr with try_cmpxchg(), so there is no
> unmarked write for that read to pair with, and both sides read it with
> READ_ONCE() like the rest of fs/kernfs does.
> 
> The Fixes tag is for the symlink half.  kernfs_create_link() has read
> the pair without a lock since it started copying the target's owner at
> all; only the name of the lock its writer takes has changed since.  The
> data_race() is a marking rather than a fix.
> 
> Fixes: 488dee96bb62 ("kernfs: allow creating kernfs objects with arbitrary uid/gid")
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Acked-by: Tejun Heo <tj@kernel.org>

> +		if (attrs) {
> +			/*
> +			 * Unlocked on purpose: the gid is inherited onto a
> +			 * node that does not exist yet, so nothing orders a
> +			 * racing chown against this creation, and either
> +			 * value is correct.  The pointer above needs no such
> +			 * marking, __kernfs_iattrs() publishes it with
> +			 * try_cmpxchg().
> +			 */
> +			gid = data_race(attrs->ia_gid);

Nit: READ_ONCE() is likely the better fit as it's an intentional lockless
read whose value is used.

Thanks.

-- 
tejun
