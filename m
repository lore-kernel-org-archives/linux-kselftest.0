Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0B530F927;
	Tue,  3 Feb 2026 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770128216; cv=none; b=dZvcXWz03n+TQmTCPEE3R/AQQaPXO/+QK2k7qw1GqL02DXLvUPH5359ueymauRAvtkcWiTZDRGzQDTouBsK9ykiMfPRSX+RCjuaSOKnv5NyAzeR2tJqr8c/kMXh1oTJaZctU2HE7lTcbDA/GDn8Hk/3T6YwzcTLIG93fMRYShl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770128216; c=relaxed/simple;
	bh=zam1ZD1A+PoOm0WPOB3rGE8poSwUMpV98xoTtBaj0x4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=vCkzoMjjj0u5gYAhp38/cc4aVTb8VLJshoinyOO3jRKSliqF9tk8jTujGbx1rIsydq6dbOWbz+Q1fXTZ2AXHGD2xO/ITeOl7n3AKhWX9us4Oy7vglZGsm09Eq5lYJU3hrkB61X5ogrRxmyi1gdaUryJy2h0mz6NF18pV4T/GbO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZMobXiy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZMobXiy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A20C116D0;
	Tue,  3 Feb 2026 14:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770128215;
	bh=zam1ZD1A+PoOm0WPOB3rGE8poSwUMpV98xoTtBaj0x4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QZMobXiyLkOcySOAwBTdVMHFtfmDobs8TrkIhE1Q2WnUEzAc/aatxUKA4cnpszgDX
	 SjRVCF1MUd9aWGjcLwcIR9idOw77vZNpFCo9nwdTtF5lkXiegJbEny/7g75+J6E1zp
	 zXtk1XtEJ7tBGO1gLlrwDDcYAp0DvAIJkWWlOtVz4c60pYBRtVnc/D7jDHDbvpPrV6
	 ud6o+8kcgSOB1vkHQNnjVlSPdL0SXVeL/UOXBPFNWnvtBECuoXZq0NPWhlpjIVSyd/
	 iwjNJidV9dF5dXxPaBKsgamZEvVzNTe+FF1J+urLZtdZ5n/GlRVNF3dK4ElCBOgWnM
	 tHbvUsDisodPQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, shuah@kernel.org, kees@kernel.org,
 luto@amacapital.net, wad@chromium.org, kevin.brodsky@arm.com,
 akpm@linux-foundation.org, charlie@rivosinc.com, ldv@strace.io,
 anshuman.khandual@arm.com, mark.rutland@arm.com, ryan.roberts@arm.com,
 thuth@redhat.com, song@kernel.org, ada.coupriediaz@arm.com,
 broonie@kernel.org, pengcan@kylinos.cn, liqiang01@kylinos.cn,
 kmal@cock.li, dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v12 00/13] arm64: entry: Convert to Generic Entry
In-Reply-To: <20260203133728.848283-1-ruanjinjie@huawei.com>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
Date: Tue, 03 Feb 2026 15:16:51 +0100
Message-ID: <87bji552uk.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 03 2026 at 21:37, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
> maintainers' work easier and codes more elegant. arm64 has already
> successfully switched to the Generic IRQ Entry in commit
> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
> time to completely convert arm64 to Generic Entry.
>
> The goal is to bring arm64 in line with other architectures that already
> use the generic entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths, such as
> "Syscall User Dispatch".
>
> This patch set is rebased on "sched/core". And the performance

Why are you using sched/core, which contains a lot of unrelated
changes. core/entry is the one which has the prerequisites and nothing
else....

