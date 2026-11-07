Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794085170;
	b=Vp8IWnUbcBir7iOr6hpqNJhNUgUAs8fbt5z/+i5dGN9f7gqZjWRQLhFcljy+dbncTgsX
	 KFiyszBfk2LZRJQyre8p7gVTqxJgUA2u/IEfv0m1EkE7Mcb1ri42Fvkc0EL25p+C+lVIc
	 jgRbqF588M/xkL0c+MEPJkrH8x7bGAADn5139ZI0YiKWwAgBzoSGVCI0GZAeE2oIgjHVu
	 p4Hg9wVgsyTAZfSRXKX84+zrJCEhGxxVn4j/YGBOOz10L6Yyq+M7/EUpqmLrz1Qahh6Xj
	 +Lm1P81B8C082E2z2JahzhBLbF4B2PvikqXyZApICrjiEyVERxLk0NP1tMpqlIoyIow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794085170;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=FVriCB8SqEw+1xBYoFV/PA9lO1dkif1FstYPaRAdYvk=;
	b=atIGhLkMPX4MVHTsgf6lPylV6nrJBQ4Nz63a0Kl59tWpCXWwG6HGfS6Uqscah7Y1VbFa
	 Eyjsp6SW4rRoH/Wz/R9u/+HhZBrLP5WlO+iWMNmtNCAfeBsGCrY0XaNf2ISR01SyFAPds
	 XzvP0ZqZ5+3tKPpJWwNxkoqXCh+71005tM4u0OlnxvrL3nKFhO3nokv/9FgE9oZez3U8L
	 rC+1njio/r+1pXWIrezXN7iPcyZnR8FN5wjQTEpRrdiuDlQQcmAnizOQghSjaFwnqN6cT
	 qpKgmBIxOHEi+YCWGqZjpc21GCJghm9QfT9PgkpSzGJuTjRi6maW7uCccKJpe3ckZvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOSHuApg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E058606A33D;
	Sat,  7 Nov 2026 20:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOSHuApg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8A81F0089F;
	Sat,  7 Nov 2026 20:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794085169;
	bh=FVriCB8SqEw+1xBYoFV/PA9lO1dkif1FstYPaRAdYvk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NOSHuApg/ruQ/bnmK42QQy5OkN7Z8oDpc+4I3aIf1LYgMPHEE56HIRESVuHwWMlwc
	 LOVyvRl/xLj/TM/P74t6VLFPa7JOG/V7ZmNGcmXL/A2m5IrnzAaFomFEinS21MR4XL
	 XCmXyuwqVl+ew1pkO9949ghwJ+LJJIZs96fqmjUOtbLC0IdwiMlL3UoG5skfAY7szq
	 X2WfQmZYXLkCLLWkLTaJFlzXPgSHXtDvaHeJuHwxc7CTXeGrWB4V1FWQMB+dhMnz9O
	 9BC6zW77MgwiW72rdSTn1KYfl7vr0zmraG0L2Xs5OlV1D3PsjFFNIuiIhn0yOqgyxu
	 IQtuUxGxoMizw==
Subject: Re: [PATCH net-next v3 4/5] selftests: drv-net: psp: factor out psp
 connection setup
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 07 Nov 2026 20:59:28 +0000
Message-ID: <179408516862.994134.13048510473902240219@kernel.org>
In-Reply-To: <20261106-psp-v3-4-a8dd38f5a727@gmail.com>
References: <20261106-psp-v3-4-a8dd38f5a727@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message says "Here we are adding some more error
  paths, so we just handle errors by closing the data sock".

--

selftests: drv-net: psp: factor out psp connection setup

This commit moves the PSP connection setup and the assoc uapi calls in
psp.py and psp_responder.c into helpers. Other tests that start with a key
exchange can then reuse that sequence. It also makes run_session() close
the data socket when conn_setup_psp() fails.

> The caller of conn_setup_psp() not handling errors was preexisting. Here
> we are adding some more error paths, so we just handle errors by closing
> the data sock to make the code a bit more robust.

[Severity: Low]
This isn't a bug, but is the "adding some more error paths" part still
accurate for v3?

Before this patch, conn_setup_psp() returned -1 in three cases:
psp_rx_assoc() returning NULL, recv() returning < 0, and psp_tx_assoc()
returning NULL.

After the patch, it fails in the same three cases:

    rx_assoc() returns -1 when rsp is NULL
    conn_setup_psp() returns -1 when recv() returns < 0
    tx_assoc() returns -1 when tsp is NULL

The v3 changelog says the per-version key length table was replaced with
the key length from the kernel's rx-assoc reply. That table lookup looks
like the only new way this function could fail, so the sentence may be
left over from v1/v2.

The only behaviour change is in run_session():

    if (conn_setup_psp(ys, opts, data_sock)) {
        close(data_sock);
        data_sock = -1;
    }

Could the commit message give the actual reason for that change? For
example, the existing failures can leave a half set up data socket open.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106-psp-v3-0-a8dd38f5a727%40gmail.com
