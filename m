Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B74352C2C;
	Fri, 30 Jan 2026 23:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769816020; cv=none; b=UMCLlAxaRbJ4WseWl5sd3GKUnlFAf/tXWXXGckTc78XRvmLbWOwX7MkfI1ihNBpuzJBCy1o4lKNlM44U5Y8hffD1nius5c5zf4x7OVXahYD5WJHYHkcr8wPhyNFCff+EzDP5XxnR0JWIJOkXvvcHyQtgOwHTnpAdqmYgWLmNOsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769816020; c=relaxed/simple;
	bh=AVhmdRJ94F3dw5wGstmAj1dksZFvIUSfMKKBNIBZv1k=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ICsM6TfKPCX83a7IWX8Ph3ks5v9+h4GIcN6uxbX13v3pwORjVP2r88079TuvkChFmx5f7Jd8VCDr0/PpJ54gJZpV/Y4aOVgug+pu+QynN8M+tJ8EsMcVtoJqBkSQJgjrlREXoj8iLtIphp3yotS2IfzAKUD4iHhbOn4VehwDrfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogd5PYPc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogd5PYPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4E1C4CEF7;
	Fri, 30 Jan 2026 23:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769816020;
	bh=AVhmdRJ94F3dw5wGstmAj1dksZFvIUSfMKKBNIBZv1k=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=ogd5PYPcP2pM/ST1oHnzPbwoa38OtSgui+3HxH/SKB4AXnKCR2Y8ScM37DyO6SHNL
	 kSbFUDBEWIV8OxKDT2SC88OP3XAaE3YxUlbeJ4xLJhGdLwMMolVLNrxeOPTWrp+p4z
	 2dGRPAnkEjPiApIgRmHEQdEbF4140xoSBqln4tjx0NDD030yJ3aWGmGythtpQKP/bG
	 ng2jyCL27R84ix4Kf3y6c/nB9V0ydDYNpUdKx50Wax/vrFiS9GvnbvDkjOuX+TD2rt
	 5kLEckGf2h0RcnZ1tw/FTNWOYbI5Bq8TfrJ2QC45SI57ziYy41dr3DIH/cSjecOmMG
	 C0mff67XW3zvA==
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
In-Reply-To: <87cy2rkuu9.ffs@tglx>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
 <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
 <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
 <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com> <87o6mbl82j.ffs@tglx>
 <13d22231-d84a-4993-9a69-e3922e45b500@arm.com> <87cy2rkuu9.ffs@tglx>
Date: Sat, 31 Jan 2026 00:33:36 +0100
Message-ID: <87ecn6he0f.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jan 30 2026 at 16:01, Thomas Gleixner wrote:
> I'll go and apply them on top of 6.19-rc1 into core/entry and merge that
> into the scheduler branch to resolve the resulting conflict.
>
> ARM64 can either pull that branch or wait until the next rc1 comes out.

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git entry-for-arm64-26-01-31

Consider that tag immutable and consumable for ARM64 if you need it. I
did some massaging, but the ARM64 pile should still apply on top of it.

Thanks,

        tglx

