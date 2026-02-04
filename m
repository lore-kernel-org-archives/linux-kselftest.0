Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AABD2E92BC;
	Wed,  4 Feb 2026 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201578; cv=none; b=jREWBSmJfRKmRdFp6ac8GQVQlE0XvIbQPYD3U1EkgZ5fkBF5R27BloKW2KVmAztTJnGs7iW8ozF4RQdFYH0M7ApsOMdPAPRT5W7ADlffQ7W+iX37P0mL+87bylN9+TJ4GMQzSpPoWlqAEBNMfBZ4zjcOz2GFN2/SEnNej9a4Eyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201578; c=relaxed/simple;
	bh=jWq9hzFrHn4T0n/HkYPD0UMv27FmeuY0AJk3lrTEpgg=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QyjqgU/1RjKK/Gve0tSLChfF2RLFM4rT6ODFh822uuNujnUrnBBIR68JAt5ubpj2skRoQdeSJoYEZI8Y/H3uy9r2PbP68pHZoj/q2v96ufmEzWomTo23fyOJzKrccKfYM20Qca9H0XC2qQaQtQBEGBQUyYhtAN34DAO1uqEFO6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=td6G3Uey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="td6G3Uey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E9CC4CEF7;
	Wed,  4 Feb 2026 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770201578;
	bh=jWq9hzFrHn4T0n/HkYPD0UMv27FmeuY0AJk3lrTEpgg=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=td6G3Ueyt9785VTOqQpQ1qDCNtWh4EIIq2k7oN3izFRukPxS8bE8VtXwyVFOk/qTB
	 IuhNla7cwOkfGGcQMY3Wm7aAOVxGjGOSS8kZEIARYbWMo99zrx6dx+n8xTHMed11Je
	 I04yrGUhFA1hs+dIEQigixrZmdMWgOB+4hUVwnPDGQ+vJpX1HrO9xVu2hUE+ft9hML
	 yYauzvTd8NT4xRUvHU4gJBaAk25bzyFymQUg0qhaeAdn7xMtK8UcipfBdudOkgIpZI
	 g/d7NrjEwbuoedp9i1NcRre823hhg5KPSklBpea4yfcxdpQRzl+zHbrjkity/Jp8ZR
	 Bh0wWcsZK/ydw==
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
Subject: Re: [PATCH v12 00/13] arm64: entry: Convert to Generic Entry
In-Reply-To: <2699bcdc-8d56-7fe9-fa9a-a3d61476e806@huawei.com>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
 <87bji552uk.ffs@tglx> <2699bcdc-8d56-7fe9-fa9a-a3d61476e806@huawei.com>
Date: Wed, 04 Feb 2026 11:39:34 +0100
Message-ID: <87y0l823o9.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04 2026 at 09:28, Jinjie Ruan wrote:
> On 2026/2/3 22:16, Thomas Gleixner wrote:
>> On Tue, Feb 03 2026 at 21:37, Jinjie Ruan wrote:
>>> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
>>> maintainers' work easier and codes more elegant. arm64 has already
>>> successfully switched to the Generic IRQ Entry in commit
>>> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
>>> time to completely convert arm64 to Generic Entry.
>>>
>>> The goal is to bring arm64 in line with other architectures that already
>>> use the generic entry infrastructure, reducing duplicated code and
>>> making it easier to share future changes in entry/exit paths, such as
>>> "Syscall User Dispatch".
>>>
>>> This patch set is rebased on "sched/core". And the performance
>>=20
>> Why are you using sched/core, which contains a lot of unrelated
>> changes. core/entry is the one which has the prerequisites and nothing
>> else....
>
> By the way=EF=BC=8Cit looks like core/entry and arm64 for-next/entry have
> diverged: the first three patches of this series are already in arm64
> for-next/entry but missing from core/entry.
> Perhaps the two branches should be reconciled so that both contain the
> same baseline.

The first three patches of this series are ARM specific and have nothing
to do with the queued core/entry changes in tip. They are independent of
each other and these three ARM64 changes have no business in my tree.

If the ARM64 folks want to apply the rest of your series then they have
to pull the core/entry branch into their for-next/core branch first so
the whole thing builds.

But given that the merge window opens on sunday, this is probably moot
anyway and the rest of this series can go on top of rc1 in the ARM64
tree w/o any further complications.

Thanks,

        tglx
