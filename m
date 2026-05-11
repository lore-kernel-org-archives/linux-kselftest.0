Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F1E40DFC7;
	Mon, 11 May 2026 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514132; cv=none; b=gTSjF/qq6PC9md25EJIHcBfb6EcRGi1gluKwj6X0fLC/ufQ0x5QrLvc6YTEW/3qK1GRBiU/oLqquR1hVms7r9ltVKsynFyQOOh1JOtlYLjCMFWnlyo1WFfXdgVFmM71tqavO47vf/EXTKRHMHlbPNBbDPmVCZt85a/0bv1+2B24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514132; c=relaxed/simple;
	bh=hBJtPARJGHieC4e15Lf/L6a2nrslNmrmwY7VOCOkYp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIMNMnTvMnOnPU4rGx8TUlv2v5l0HBM2cQw78axRAxMSO9H5j3aUU52VRCTkEAoJMFEUeZmm57L7rhnbPlXzFT8ssjDO26oGmubtUrmSOtbGFndvC4AGaf+AnzAu4Q7w+TAWsbLIx/3vVdMGUQ+6VOvVK4rkE2X4HRj4YBknOYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=eQnLgeqE; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="eQnLgeqE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wrLNUPV9+W+5iFwARPpGhQy5+Ze0IUVAAWbwzbDM9Q8=; b=eQnLgeqEU1/WK8BzdVwICDvSzR
	Pwvd8UMjGhi8qnP3fGq/cRIWUQIXAfBbIdZUCQNmd/TKrlTZfUSeTy1AbdOERS7mHD0ugGu7Ov6Zn
	tjpxpSNKTl7kXmyd1e+NZQBbCMdmB8xyQyf4rDmS/avckEdQgRHO9Lk5RGpWelRVCxs50+D4gEiP8
	Vs+ETA/RsFbKCnHCEp6UGc2bgnKhXE5NFPUP1BRxU+MLwP0DBC/1HVHibmm76LEg/hbfEudiGcXRX
	//i0cDvp2kYlNBFg9SEh4Zj7fpNe7J1tlSArWoyNd1dfHue2ujzibYE+OISmqqmEA22mIe7xHq7z9
	dfZYrMKw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wMSlf-001hYn-18;
	Mon, 11 May 2026 15:42:03 +0000
Date: Mon, 11 May 2026 08:41:58 -0700
From: Breno Leitao <leitao@debian.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Liam R. Howlett" <liam@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v3 0/2] mm/kmemleak: dedupe verbose scan output
Message-ID: <agH4girwVSEIMFAs@gmail.com>
References: <20260506-kmemleak_dedup-v3-0-2d36aafc34da@debian.org>
 <20260508151729.682551a2b2739e8b5d15ade2@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508151729.682551a2b2739e8b5d15ade2@linux-foundation.org>
X-Debian-User: leitao

On Fri, May 08, 2026 at 03:17:29PM -0700, Andrew Morton wrote:
> On Wed, 06 May 2026 05:58:23 -0700 Breno Leitao <leitao@debian.org> wrote:
> 
> > In this version, I am not touching the kernel code, but, just fixing
> > the selftest, as sashiko reported some issues, and I am addressing them
> > in here.
> > 
> > https://sashiko.dev/#/patchset/20260424-kmemleak_dedup-v2-0-8bea649b2a92%40debian.org
> > 
> > NOTE: Additional testing has revealed that lockdep detects a potential lock
> > inversion issue on kmemleak and legacy console.
> > 
> > The problem occurs because the function holds &object->lock (a raw spinlock)
> > while invoking printk to report the leak. This printk requires the legacy
> > console_owner lock, which remains in active use despite the ongoing transition
> > to the nbcon framework.
> > 
> > Concurrently, console drivers such as hvc (hypervisor virtual console) acquire
> > the console_owner lock and may subsequently free memory. This kfree() operation
> > calls into kmemleak's __delete_object(), which in turn acquires object->lock.
> > 
> > Although these code paths hold locks from different object instances, lockdep
> > operates on lock classes rather than individual instances. Since all
> > kmemleak_object->lock instances belong to the same lock class, lockdep
> > identifies this as a circular dependency, even though the actual deadlock
> > scenario cannot occur in practice (?!).
> > 
> > This problem was not introduced by this patchset/selftest, but, it is exposing
> > it. I plan to solve it once this patchset is done.
> 
> None of the above is usable for a [0/N] - it all pertains to the
> ongoing development process and should formally be below the ^---$
> separator.  Because it isn't relevant to the permanent kernel record.
> 
> The v2 series had a nice cover letter, so I stole that.  Please check
> that the below remains the truth, the whole truth, etc.

Ack, That remains correct.

I just updated the cover letter to reflect the changes, but in the
future I will keep the overall goal of the patchset.
