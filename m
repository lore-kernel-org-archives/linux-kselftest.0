Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1AC322C6D;
	Fri, 30 Jan 2026 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769785314; cv=none; b=GywXkTslyto0UldK2PWHAgTB2YXEZN7nbYrwVT+Xo15yAjrQ7WgEU/1ngMXJ1lzVKTnWV53VvHWupfp8lHlhNyy0RLJ0tfuMZUSjXxBrEi8/Mb7NuiiSg19md3Fdcv4eKkpaHcK+hsHocEAyz++xMQrg22QtVuIGe6hmNh4+0m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769785314; c=relaxed/simple;
	bh=jcI6FHxj+KHvDboDOSm66IUrFEGKvpzUg4I0CKx4Wrc=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pNpS8ztbwWZUsIoUvmdmpmE0g3OUqehAatslIEdQcMsTBKIgqYcRs68Tz5xniysbSLfy/6KPBIZpqRUpmBNrjmx07RiSBrBgELwnD1bHf3t5w+2VewSGzAPOYQ+b+8T41eorR2s8OVqsVjkWM6wrmqG8I87BdRWXCFrNVIQqomE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stFcnulc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stFcnulc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69C1C4CEF7;
	Fri, 30 Jan 2026 15:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769785313;
	bh=jcI6FHxj+KHvDboDOSm66IUrFEGKvpzUg4I0CKx4Wrc=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=stFcnulcSsZzbYrPkxAQSO6XbNqjmD/rteaSiwiuuy488UrObmFC1bfAGGRRgYqRr
	 8Vdb1dPSvXTo7ElbWqgIXwgB1JpoaPBBz1lHdJfjiGZ8EQSK70V6e6Dv3ICK/lCUWZ
	 sEQQ/CPBt3WLCLoqm9i1tKQZH86SWgpNmS50n5IkGZEaG3RaldVd0Zqfx2rHITTrth
	 soMO2df1BNV08yrlcVlt66aVe3hPsjMmd+c7VSRMgiU7f1cEly7p6UsOY8D1vQTkZu
	 FauITEOLZuCSvz3xXsGKm7CvfWnD1wo62Zxqhy3s81j9HYeR6+iRMPeMX9dk7UTvoF
	 1o2yo7ms0+BTQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>, catalin.marinas@arm.com, will@kernel.org,
 oleg@redhat.com, peterz@infradead.org, luto@kernel.org, shuah@kernel.org,
 kees@kernel.org, wad@chromium.org, deller@gmx.de,
 akpm@linux-foundation.org, charlie@rivosinc.com, mark.rutland@arm.com,
 anshuman.khandual@arm.com, song@kernel.org, ryan.roberts@arm.com,
 thuth@redhat.com, ada.coupriediaz@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 09/14] entry: Rework
 syscall_exit_to_user_mode_work() for arch reuse
In-Reply-To: <13d22231-d84a-4993-9a69-e3922e45b500@arm.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
 <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
 <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
 <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com> <87o6mbl82j.ffs@tglx>
 <13d22231-d84a-4993-9a69-e3922e45b500@arm.com>
Date: Fri, 30 Jan 2026 16:01:50 +0100
Message-ID: <87cy2rkuu9.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jan 30 2026 at 14:27, Kevin Brodsky wrote:
> On 30/01/2026 11:16, Thomas Gleixner wrote:
>>> Agreed, the comments are essentially describing what each function
>>> calls; considering how short they are, directly reading the code is
>>> probably easier.
>> No. Please keep them. There is more information in them than just the
>> pure 'what's' called.
>
> That is true before this patch, where it made sense to highlight that
> exit_to_user_mode() must still be called after this function (without
> re-enabling interrupts). With this patch there is however much more that
> this function is lacking, and it feels very likely that comments will go
> out of sync with exactly what syscall_exit_to_user_mode() calls.
>
> I suppose we could simply point the reader to
> syscall_exit_to_user_mode() to find out what else is needed, and keep
> the comment about the calling convention being the same.

I've picked up _all_ four entry changes and reworked the comments and
changelogs already.

Those patches should have been bundled together at the start of the
series anyway so they can be picked up independently without going
through loops and hoops. When will people learn to think beyond the brim
of their architecture tea cup?

I'll go and apply them on top of 6.19-rc1 into core/entry and merge that
into the scheduler branch to resolve the resulting conflict.

ARM64 can either pull that branch or wait until the next rc1 comes out.

Thanks,

        tglx

