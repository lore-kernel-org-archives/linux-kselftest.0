Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A851B2D8DC4;
	Sat, 23 May 2026 02:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502467; cv=none; b=Vm4T5kLSekisKSsHrtY7zoxL8k9hN5yzvBM6bq/GwJVcD3nmfQtIbQ8D2w4O3NS4ZnU3VYujXse7cEpDb6z0se0i6scwFolL8ds5MM9eHAeMroB6T++rin4nKHpl7CPrSa+Cmw2r3PKXAlTGh/9kkUL6ZKyVbbe/SDJxoLQ7co4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502467; c=relaxed/simple;
	bh=eifHLiwQHg1aF9I796N6YR/CYPSbbOq0SCt85xsNLyE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oh+R+qkXzcJjaXxMD97RsoWdtaQANlZCAqw1MW91PbrPF4PGZhO0fkDsWF39qj6eyNGC2aoR83/CDaZJ/W1jZxPFaTlmcUcsTVgkyhbBWmsPndVIL8Vzph0lkosTf6SxBZNh7b5/Fd23xpdv4zgNZ+QGbpJMPU8MnwHBHCtjbcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcJwzuvw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcJwzuvw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4991F000E9;
	Sat, 23 May 2026 02:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502464;
	bh=q9HDQpu0SYwrmVMHlU6yKLpIzh2dGvhhVXbCDWhJ6oU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KcJwzuvwEwP+iOdB5KVCOVzd6iYxXj3kFxzLgDvD1jQOr8bpvP25cI5eRiVbAcLAi
	 F4HfM9gt9OxTT0RMg4h5rbhKV3HDNZfnGvq/M9QcokEK3x2/xkbR1YgZr8Eo53V7eG
	 1ynzCEK+RE/hoGyX9nvUfLlb5JEOEDXZwMjFnEy+f4t1XmXWLk1E11xrL5AL73RRp3
	 gBSRQ99pttcBa619m0/uNfygr7vvplpQr9XpCcWBysOo9aZIJJxjIWIKbNhUyp/+dJ
	 NZ/ox/pmD7FQ7DFKhD4KykfvP/0kNu6BRVlXXKPoFdbnXO2FXXJ2ED0M7q44VWZxSP
	 5LqB0AhXor9nQ==
Date: Fri, 22 May 2026 19:14:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Allison Henderson <achender@kernel.org>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Subject: Re: [PATCH net-next v1 0/3] selftests: rds: ROCE support follow ups
Message-ID: <20260522191423.3ade3031@kernel.org>
In-Reply-To: <585a18b53dbd2545224185a9f4d9f9c05ddc7e24.camel@kernel.org>
References: <20260522215430.3748226-1-achender@kernel.org>
	<20260522174601.3c2c2b46@kernel.org>
	<585a18b53dbd2545224185a9f4d9f9c05ddc7e24.camel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 22 May 2026 18:19:35 -0700 Allison Henderson wrote:
> On Fri, 2026-05-22 at 17:46 -0700, Jakub Kicinski wrote:
> > On Fri, 22 May 2026 14:54:27 -0700 Allison Henderson wrote: =20
> > > This is a follow up series to the "Add ROCE support to rds selftests"
> > > series.  The first patch renames run.sh to rds_run.sh, and also adds
> > > two wrappers to the TEST_PROGS target to run the same test over the
> > > rdma and tcp transports.  The wrappers rds_rdma_run.sh and
> > > rds_tcp_run.sh also provide self-describing names that appear on the
> > > netdev CI dashboard. =20
> >=20
> > Could you make the RDMA test return XFAIL rather than skip when RXE
> > is not available? We try to use SKIP for cases which are easy to
> > fix, like a tool missing. We won't be running RDMA tests in netdev.. =20
>=20
> Sure, if you want I could also drop the wrappers since rds_run.sh default=
s to tcp. =C2=A0
> Then patch 1 would just be a rename.  Let me know what you prefer.

Dropping the new wrapper SGTM. But IIRC Matthieu suggested the split,
we should let him also chime in.
