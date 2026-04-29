Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3455538D018;
	Wed, 29 Apr 2026 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444924; cv=none; b=eMt7FyFw5MMhz21du9YmZk+FYQKYzT9/iozKARh202OwVd7rw7+F4LholuyvbFbFaFEz3un4xSxPHK4i/49pJ7jHC2+e6+HmrOXRpfFjztBzL05NQGKOeo+5L/ee6wPNpawrYSNLpXwaxcdo+C3dm31tHI1aoWvc9Qtb18JxLEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444924; c=relaxed/simple;
	bh=zWqxAlu/ucA1P6KiKmx97UoqK35wwC2a8fv/LnXOx3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=attU4WNjQF7rmB2NEHifJ4pVinD9JZ2l91O4QcniApy8STBR6LFR86pF2D0GcqbceTingMPt/xx5o5pQsYy4DFj7tjrfror5NgBLUZ3lft6X186LN613oGT9OZsHUWPFMb90sMVsR0gGPkaU0JKdPkNp5PWQ7AvvqlI4VIzVTUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhvS+AEi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhvS+AEi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD290C2BCB3;
	Wed, 29 Apr 2026 06:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777444923;
	bh=zWqxAlu/ucA1P6KiKmx97UoqK35wwC2a8fv/LnXOx3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HhvS+AEidghosFxYFCxxdeYV2TD2EthsWHUQvkDvugahuv/aLZPyEa4k69YelJi0G
	 I/SpPotGYb+ehBYgUTx46f41fx74RXaOnHzFdU+4X0eoN0r3Mr+aKqFQuNdrdcF8wY
	 A5NuVmKiDBrwafYcy3JNTmA9W9gUmuGY9RzXnH73wGaOrbQbMc5rlCjxXM/a90eRje
	 +Xj3lD7I1TkhztOAjZhDhdffWkpa6SldLnbcXkgybnCK1+fT8xlAQG5NJp622XUyTt
	 /W4qb0W3bIJZOgs/AkYMlbki1qEA/7PRiIFP/DjXhJ2Ph96QHMRTEtjmf0zmd7QF4G
	 h0r1lNhnCgOUw==
Date: Wed, 29 Apr 2026 08:41:53 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alban Crequy <alban.crequy@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Alban Crequy <albancrequy@microsoft.com>,
	Peter Xu <peterx@redhat.com>, Willy Tarreau <w@1wt.eu>,
	linux-kselftest@vger.kernel.org, shuah@kernel.org,
	Usama Arif <usama.arif@linux.dev>,
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v3 1/2] mm/process_vm_access: pidfd and nowait support
 for process_vm_readv/writev
Message-ID: <afGoMdq5vCKO8iaN@kernel.org>
References: <20260428122826.339550-1-alban.crequy@gmail.com>
 <20260428122826.339550-2-alban.crequy@gmail.com>
 <8b29da5b-e260-4b77-a640-8abb447291d1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b29da5b-e260-4b77-a640-8abb447291d1@kernel.org>

On Tue, Apr 28, 2026 at 10:05:49PM +0200, David Hildenbrand (Arm) wrote:
> On 4/28/26 14:28, Alban Crequy wrote:
> > From: Alban Crequy <albancrequy@microsoft.com>
> > @@ -194,10 +202,18 @@ static ssize_t process_vm_rw_core(pid_t pid, struct iov_iter *iter,
> >  	}
> >  
> >  	/* Get process information */
> > -	task = find_get_task_by_vpid(pid);
> > -	if (!task) {
> > -		rc = -ESRCH;
> > -		goto free_proc_pages;
> > +	if (flags & PROCESS_VM_PIDFD) {
> > +		task = pidfd_get_task(pid, &f_flags);
> > +		if (IS_ERR(task)) {
> > +			rc = PTR_ERR(task);
> 
> This could return -EBADF or -ESRCH. We should document both in the man page. (or
> decide to always return -ESRCH, dunno)

I'm for documenting both in the man page to let userpsace see what went
wrong.

> -- 
> Cheers,
> David

-- 
Sincerely yours,
Mike.
