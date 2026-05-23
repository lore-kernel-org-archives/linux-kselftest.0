Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FC11E1024;
	Sat, 23 May 2026 02:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779503209; cv=none; b=VHQrXMlPHvcDAaxTYOSLxWvdVnv8l358vBLgQGYfd0tt2bQUATbA/J2CgjImy1vfdNLj2jrV3/fMX378j/sFuYaV8Yx6qe9sWzIXv7BffHq2teZGp9yoHQs88I/LMmf6CiWBJ8gV4/8/ALiV44tyoKYGRajXYDzeBi1bv/CQ2dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779503209; c=relaxed/simple;
	bh=E69nwexHTQ3z65FLTWNgLUG63vpdzQHroXdoBkT0BnI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GujsNor36tQs4Kh2D996BqNa8o65WAme6tAqxBtUhiNN2Lj6Xhqgf60WGJnHT3fDKGdDHHLZpxIAvsdSPLrKpVFIO1y/N3+RRvBbeMuv8uOvDeqNh59bkks/e/MLLxW2Gr0q7WoL19E6Y4gNqnajQoDbbnwHw0VelhhNYUnVfp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZvhrAwR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZvhrAwR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764521F000E9;
	Sat, 23 May 2026 02:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779503207;
	bh=9qmBuRUMK3DK+keEcNatYKzjbUdLQAHHA+I9hSZz/2E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gZvhrAwRjKhYAJwxoFnRfzv9QfTzsZeLtABylZpaazHkTUrfvR2vXkK0+a/HaYEr6
	 maXlgDbc8kdqjfqxgx5EcuEUcauX0SycrkVJ2WFQ16OepbmHuq/RP68mkwFRBGNzad
	 TfS0uxaRwVJw8vD079+R+/hgsZFSWsTmr7tPtSfZyTgR2IyM+HXo9atmpo0xO0wHHu
	 TxR12Llg2lQuYiJgnIiE+65ttfL+KXIj2LLjY6dSwegYdVUyqMhnaL3ViweC1Y+Sbo
	 S6KqacNrWqDaS31ozJrcNnJ8BNOaCRZHbIFCJb4AcQYr6fDichMsGeEp2YzyGeRrgI
	 Mb3eca/OMcDIA==
Message-ID: <0463a0ef38073c92d34201c7d0b4ff3ba69934ae.camel@kernel.org>
Subject: Re: [PATCH net-next v1 0/3] selftests: rds: ROCE support follow ups
From: Allison Henderson <achender@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, edumazet@google.com, 
	horms@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Date: Fri, 22 May 2026 19:26:46 -0700
In-Reply-To: <20260522191423.3ade3031@kernel.org>
References: <20260522215430.3748226-1-achender@kernel.org>
	 <20260522174601.3c2c2b46@kernel.org>
	 <585a18b53dbd2545224185a9f4d9f9c05ddc7e24.camel@kernel.org>
	 <20260522191423.3ade3031@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-05-22 at 19:14 -0700, Jakub Kicinski wrote:
> On Fri, 22 May 2026 18:19:35 -0700 Allison Henderson wrote:
> > On Fri, 2026-05-22 at 17:46 -0700, Jakub Kicinski wrote:
> > > On Fri, 22 May 2026 14:54:27 -0700 Allison Henderson wrote: =20
> > > > This is a follow up series to the "Add ROCE support to rds selftest=
s"
> > > > series.  The first patch renames run.sh to rds_run.sh, and also add=
s
> > > > two wrappers to the TEST_PROGS target to run the same test over the
> > > > rdma and tcp transports.  The wrappers rds_rdma_run.sh and
> > > > rds_tcp_run.sh also provide self-describing names that appear on th=
e
> > > > netdev CI dashboard. =20
> > >=20
> > > Could you make the RDMA test return XFAIL rather than skip when RXE
> > > is not available? We try to use SKIP for cases which are easy to
> > > fix, like a tool missing. We won't be running RDMA tests in netdev.. =
=20
> >=20
> > Sure, if you want I could also drop the wrappers since rds_run.sh defau=
lts to tcp. =C2=A0
> > Then patch 1 would just be a rename.  Let me know what you prefer.
>=20
> Dropping the new wrapper SGTM. But IIRC Matthieu suggested the split,
> we should let him also chime in.
Sure, the initial suggestion as a rename, and then I added the wrappers.  I=
 will wait for more folks to chime in though.

Allison
