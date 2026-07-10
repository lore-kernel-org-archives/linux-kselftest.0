Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5E3C3428;
	Fri, 10 Jul 2026 15:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697910; cv=none; b=aqxLKJA+BoEmMdCoaoDt1ydUVmhhIPNbBjMMfFsgTGXnRvQi4oIdKHMs5DrbYUj2hYRfif3AZh/VlOfNQDRD3zIkqNgQDMtBYsmlivPq8jsEiXaBF1vukRd9VXGXjy5xnQR8crF7R+4CjxGufe6OA9V8iqpjtP63ZwsSZ5QieJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697910; c=relaxed/simple;
	bh=DtT7FTjGMjq2zY8aPWsbFGoVCnYTdBVrw1mVaw21aRg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kehjZQVwNWGw5qqWtVQ/A1hIsx6OUhiobYlgcL0PSYPlCpVf4Ey1TTQaYndCy5pOJmGfMYwKcUFI8Xco66XBkHxU1hqf/0iA8UVSci2I+VopSMolwVPLC+2px3NKbohJtjbQ6bmZSyFe9wRgsjonEGCIzHym+MYkxCRA1islPt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvNemzKX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvNemzKX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3F11F000E9;
	Fri, 10 Jul 2026 15:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783697909;
	bh=iSOEINRoO6HE5NOxott3HWiwrBXL02Ivy5qz/Rs9LVY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=LvNemzKXlLuF5PyX5QEtUAjG+TXppzsaWgClX8JhswGVZ0r9V25dllYEI2yiwP0Q3
	 duHRsJdwq8Ls0X0R7DDX1qZ413SQ9TOyqElSWAW2IK7y9kVcQ4bIRu524bQcZ847Oe
	 FRmkWMG0VyShfnX+IbQJJ0Fve0g9yTVG1qG5zNKy9G6kPUFETMJMOr6kOErQRXgyUl
	 icu6JZDOneRTC51oeDROaVvnmiCGsSWJ2P6wfXaPvevBjbg7+xcG0iF7BPV7bJ+9dB
	 Urj+HmLxyPJrWLKIbflz+3fzngu70c2gNAA29PMa4qu011G9EZR4XMwjoXuzUVoha+
	 mH63FWO1iGyKg==
Date: Fri, 10 Jul 2026 09:38:25 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Wang Yan <wangyan01@kylinos.cn>
cc: shuah@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, geomatsi@gmail.com, 
    andybnac@gmail.com, andrew.jones@oss.qualcomm.com, 
    thecharlesjenkins@gmail.com, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/riscv: ptrace: Fix memory leak of regset_data
 in vector tests
In-Reply-To: <20260710083437.489648-1-wangyan01@kylinos.cn>
Message-ID: <5ad27d5d-a396-341b-324d-ff2ca7bae26f@kernel.org>
References: <20260710083437.489648-1-wangyan01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Jul 2026, Wang Yan wrote:

> The regset_data buffer allocated with calloc() in the parent process
> of several vector ptrace tests is never freed before returning,
> causing memory leaks in:
> 
> - ptrace_v_not_enabled
> - ptrace_v_early_debug
> - ptrace_v_syscall_clobbering
> - v_csr_invalid/ptrace_v_invalid_values
> - v_csr_valid/ptrace_v_valid_values
> 
> Add free(regset_data) before kill(pid, SIGKILL) to release the
> allocated buffer.
> 
> Signed-off-by: Wang Yan <wangyan01@kylinos.cn>

Thanks, queued for v7.2-rc.


- Paul
