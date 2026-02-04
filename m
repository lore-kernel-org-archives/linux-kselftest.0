Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2582BE639;
	Wed,  4 Feb 2026 12:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206869; cv=none; b=WnYbtA/yetSWB1tU9FQqWgwFcXXP7uEoZkvwAJy/yhVw7qXZIoMwI90uJ3vJnlnG3y63nZlHLcC+qnjn9Hv929f4LtrH756yHc8ZgPN+X7duTF1FYIRSyMxNiJ0+9/gmN4pT+91y/p8/iF0WRnngYShcFpYw4KjBdbhZr63zNIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206869; c=relaxed/simple;
	bh=Xzsj0E6vrWYH/XkemxWZu7ieGiKYV4GnOsHPNEi3sBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFoesh2VfKnOqKHBA0b6DDT7x6d6pFIx7PmcfsMAf4YVb/b+9Dj0E2G4X4mcxI8RzvjM5Tu4aaTu1+dOWTsKzzthfOwQ5JlRepGcbDfdohi69JuTjaxhoJzYBhkm6nAuf8sIiOek4eKKcMif1EHpS5334eV6S4S8S7BQiYpvkes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNoj/8pH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNoj/8pH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918FCC4CEF7;
	Wed,  4 Feb 2026 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770206868;
	bh=Xzsj0E6vrWYH/XkemxWZu7ieGiKYV4GnOsHPNEi3sBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HNoj/8pHDGsxCxIsn8XFJx2+hkYhVd3cwXe67h/uc0eMOwEFO4pmsYh9knCAKu1my
	 QipNfgCJ33OWeh9tXAZX71GrmbJYCRdA2GF+hymnAxE1qUJF/hcWfFGXZ52tVNR0Wf
	 PT9e8Yq7TZ6xoePwmteSN51k28AN/6EQLH4FWBNanrJkae3tNC2klAMTuHztsqFsPW
	 LX3zACkcIgRNkusYR+hZiUV+IMB0IOR0SzhZDVglcOu62ZqhWljWfW53jG4AX5Q5f7
	 AH5+Xi83MFES9ub7BM9jR06ywYojnGO0W0j4jiH+IHwrNHxnkC5lQDEkthuOgyDkAU
	 V7m645f6R0kAQ==
Date: Wed, 4 Feb 2026 12:07:40 +0000
From: Will Deacon <will@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
	oleg@redhat.com, shuah@kernel.org, kees@kernel.org,
	luto@amacapital.net, wad@chromium.org, kevin.brodsky@arm.com,
	akpm@linux-foundation.org, charlie@rivosinc.com, ldv@strace.io,
	anshuman.khandual@arm.com, mark.rutland@arm.com,
	ryan.roberts@arm.com, thuth@redhat.com, song@kernel.org,
	ada.coupriediaz@arm.com, broonie@kernel.org, pengcan@kylinos.cn,
	liqiang01@kylinos.cn, kmal@cock.li, dvyukov@google.com,
	reddybalavignesh9979@gmail.com, richard.weiyang@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v12 00/13] arm64: entry: Convert to Generic Entry
Message-ID: <aYM2jM5BMRGdjnt4@willie-the-truck>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
 <87bji552uk.ffs@tglx>
 <2699bcdc-8d56-7fe9-fa9a-a3d61476e806@huawei.com>
 <87y0l823o9.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y0l823o9.ffs@tglx>

On Wed, Feb 04, 2026 at 11:39:34AM +0100, Thomas Gleixner wrote:
> On Wed, Feb 04 2026 at 09:28, Jinjie Ruan wrote:
> > On 2026/2/3 22:16, Thomas Gleixner wrote:
> >> On Tue, Feb 03 2026 at 21:37, Jinjie Ruan wrote:
> >>> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
> >>> maintainers' work easier and codes more elegant. arm64 has already
> >>> successfully switched to the Generic IRQ Entry in commit
> >>> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
> >>> time to completely convert arm64 to Generic Entry.
> >>>
> >>> The goal is to bring arm64 in line with other architectures that already
> >>> use the generic entry infrastructure, reducing duplicated code and
> >>> making it easier to share future changes in entry/exit paths, such as
> >>> "Syscall User Dispatch".
> >>>
> >>> This patch set is rebased on "sched/core". And the performance
> >> 
> >> Why are you using sched/core, which contains a lot of unrelated
> >> changes. core/entry is the one which has the prerequisites and nothing
> >> else....
> >
> > By the way，it looks like core/entry and arm64 for-next/entry have
> > diverged: the first three patches of this series are already in arm64
> > for-next/entry but missing from core/entry.
> > Perhaps the two branches should be reconciled so that both contain the
> > same baseline.
> 
> The first three patches of this series are ARM specific and have nothing
> to do with the queued core/entry changes in tip. They are independent of
> each other and these three ARM64 changes have no business in my tree.
> 
> If the ARM64 folks want to apply the rest of your series then they have
> to pull the core/entry branch into their for-next/core branch first so
> the whole thing builds.
> 
> But given that the merge window opens on sunday, this is probably moot
> anyway and the rest of this series can go on top of rc1 in the ARM64
> tree w/o any further complications.

Yup, the rest of the series (beyond what we've both queued) also needs
some more review so this is all post -rc1 material.

In the meantime, thanks for picking up the generic bits.

Cheers,

Will
