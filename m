Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F89C32E733;
	Fri, 30 Jan 2026 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768074; cv=none; b=qQdBHjsV9Jt845SM6MezgYpZ6CXhq1xXKp+TW2USqTc0S7lQlYQupM2H5sBdtACsuuvTEBDgRJ8/bsYQvhOrHFguaTUNeomgbjOonDA+dhMQfvO8jUV5WzYhl7L0o6Vs+WnKk6lw2R6ilZ/+41sS+cQujY9DLI+A7jjm3v6U3Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768074; c=relaxed/simple;
	bh=PAnkuqO32ClpKHcX2BWeLyrxvj8SmyJn9Gq4UuehOXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pCmkfhRfiKb9bjtnCTwLCFwKvq8K69O+xcXNTUIMy8XLoTAhHNw31rM/cE9qlQMBFOG/VYeZD6p0FZ8YZ8Y8Fd9NrV8Z1fkt5yi3BxrrifcPQnXmY0adS3neJilOlYRJqIcIA7MORoMAtgGYJwGNP93s2vlydEfiN1IbFM68aQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bw/m2DGF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bw/m2DGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3067C4CEF7;
	Fri, 30 Jan 2026 10:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769768074;
	bh=PAnkuqO32ClpKHcX2BWeLyrxvj8SmyJn9Gq4UuehOXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Bw/m2DGFK+2+xwTLITydu5hjYD+iwt16S1lj13AERx6IXvyJbBzsExgjG8fK+8RkM
	 xeazubeebOkl2Xx3ssgpjGLnaDgjas0z0MIB9cx+ruBaBe/sbynH2xCL/JtBSWvGRK
	 K55RobIGUmifzjD58kRb2I0q8JRYngN/UFPw8gkZiR+DmEIpTZA6TIlYelulnegtCc
	 D3itABt9wI3crPfQATPAq6lmn15DYtaKx4JoA+uiYPbAnC3wtMbbanl2v0RBQWufnO
	 Hij8KePxIrPB/KQM3M5Vjkv6MKPwbAX14ow/C24ESCJKX/hMfW7V87nPaDb1zIf4MK
	 cRruHHtd1w6Iw==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, peterz@infradead.org, luto@kernel.org,
 shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 kevin.brodsky@arm.com, deller@gmx.de, akpm@linux-foundation.org,
 charlie@rivosinc.com, ldv@strace.io, mark.rutland@arm.com,
 anshuman.khandual@arm.com, song@kernel.org, ryan.roberts@arm.com,
 thuth@redhat.com, ada.coupriediaz@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v11 13/14] entry: Inline syscall_exit_work() and
 syscall_trace_enter()
In-Reply-To: <20260128031934.3906955-14-ruanjinjie@huawei.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-14-ruanjinjie@huawei.com>
Date: Fri, 30 Jan 2026 11:14:27 +0100
Message-ID: <87qzr7l858.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 28 2026 at 11:19, Jinjie Ruan wrote:
> After switch arm64 to Generic Entry, a new hotspot syscall_exit_work()
> appeared because syscall_exit_work() is not inlined, so inline
> syscall_exit_work(). Also inline syscall_trace_enter() to align with
> syscall_exit_work().

Has the same collision problem. I can pick that up and massage it on top
of the pending time slice changes. Let me give it a test ride on x86...
