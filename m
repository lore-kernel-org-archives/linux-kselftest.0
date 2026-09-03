Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF89412C08;
	Thu,  3 Sep 2026 20:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466918; cv=none; b=f3uLb2Mk51o+wC44+O7W/smd55PRq6RRnNTFqnWznNKa7YWhRAZs5RgPdRVPxiaB5ABaEdFqSGYynv/pADujzem6Ik5Vhu3GW6l/tMZRJSxrvVP3m5u+nbnLep329YzVC8uuFD7C/8xhL+K21/H5QnD++ffMNTXuGX5fqSGQ8EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466918; c=relaxed/simple;
	bh=BEPb16dmxnmQfZwf2ZnIPwOhZq4jG4NkOIexQXfMu0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Db13wuxu3VjQT8tHLv6H+86b7FeAU9i84oXzyuVT9MdmFgxaAiJZydTfqm2TdfK+EJsokgLy5SuO6/GEwJ8rvhi/f9o0VglpLOfcJIgP2TmFFl3cL8ckrVhzyS4bElFMd8aLQ67PGlz/uL6nr7HkAlRJnlXWXM8sr8dHuolzJNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYOu04Hk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYOu04Hk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A241F000E9;
	Thu,  3 Sep 2026 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788466905;
	bh=Eh/nvFFm4Bq2FVysbNaoCvb6EzkcxFMAm4c3sSZmWBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gYOu04HkiAbUmILZyCgxllW/fQHH+aCjbX1XuAJNK9HGtDpgwPvt6cKeSqisXdChe
	 msH02DBKSdxcA2nkJKWgkrBJtnqcKbEHypJRYNc8VeKUELo0d1XxuVSn++NpfOM5qz
	 6Bmj6xTyF/ImU5lNJWpJOnWB4eXctkYn5fRyHN9pwjeGaXnUERqMcKdeyMPn98WzcN
	 d854IB1HfHmF3v9LjUENkbU0Z9hU1TGa5KksOSnTXFInung5RAZN81mLZBO9xnEi8j
	 mvF85bTj0w29DwiU4PuVm1CA45Jv/F0xnv3EH2BlAfLfz719Jt79w99V3/GXvr9WOP
	 jQN1stgk5TxbA==
Date: Thu, 3 Sep 2026 10:21:44 -1000
From: Tejun Heo <tj@kernel.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <christian@brauner.io>,
	Meta kernel team <kernel-team@meta.com>,
	linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] kernfs: take kernfs_rename_lock for same-parent
 renames too
Message-ID: <apnW2A-0rHqhd8KE@slm.duckdns.org>
References: <20260903040253.670020-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903040253.670020-1-shakeel.butt@linux.dev>

Hello,

On Wed, Sep 02, 2026 at 09:02:51PM -0700, Shakeel Butt wrote:
...
>   CPU0                                   CPU1
>   kernfs_path_from_node() on /a/b/c
>     reads the name of a, gets "a"
>                                          renames a to a2
>                                          renames b to b2
>     reads the name of b, gets "b2"
>     returns "/a/b2/c"
> 
> This hits roots without KERNFS_ROOT_INVARIANT_PARENT: sysfs, where the
> bad path can reach sysfs_warn_dup() and pr_cont_kernfs_path(), and
> resctrl, which renames a mon group inside its mon_groups directory.
> cgroup sets the flag, so it skips the lock and reads names under RCU
> alone; that case needs something else and is not addressed here.

Well, I'm not sure this is a real problem. Do we even have places where
multiple nodes along the hierarchy can be renamed? And the only thing we do
with the formatted paths is printing them out somewhere.

> So take the lock in both cases, and let kernfs_rcu_name() accept it the
> way kernfs_parent() already does for ->__parent.  Same-parent renames
> are rare, the lock is per filesystem, and the locked section is at most
> three stores.  It also gives a future rename sequence counter one place
> to sit that covers every rename.
> 
> Fixes: 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

That said, it theoretically is a bug, so, why not?

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
