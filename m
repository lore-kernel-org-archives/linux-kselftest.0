Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7A31B80E;
	Wed, 15 Apr 2026 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244047; cv=none; b=R5ls3EA+ViG2M1ZO7VcEj4l06oImEbpVGJtJHd1NjK5xFgaZG5QKz2VVHVMfLF3DReBH9vKSy4+x0oSSn3oaqyDI1r0AC8GIlc4aPui0ePmS9EMNesen/bgpoqa+JWi4Y0lubM3KjgulDSyN97+3UXQ8jneb7tiBBtUft7Xnuc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244047; c=relaxed/simple;
	bh=GBVWguG7RdZeq+1mTENU3jp7ImGFi/k9ptHm/Np7hXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=evJLsFd4vGKd69ZvlUBa5+pUAV3UjyTmoB+xk9Z4vX1VBl72kAL+KzyvtivJRCOGuzNakxsvZlRcajKg/DB+qSLXLAP2pzRfmpFD+gqb9Cewgfx+C1q0tR7Ct5VMmiS/5KcZyogMA2hvpFKmKiQnEzGTgmJas3tya2UlXx7w9Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Tefzh+47; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Tefzh+47"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GBVWguG7RdZeq+1mTENU3jp7ImGFi/k9ptHm/Np7hXs=; b=Tefzh+47t6l6/khyFeSKGS/lcJ
	QJmitHEa6gYvJZ/aRnkk+C/TDK11jfN+M1ErYLE5EiP9jjlnl3g+uQ3fS6+l9GJfKGmb9GObDNPIP
	7K1B8mZCbDoFjUVeacG+sNRY5yS71xQvuMTYFd3k2sNTRDy7S9y39j7gAFGnMnYtDbj/QaADSznap
	Ub3FT+H5tF6in7evc6KVfUYw61kB60ZtYKeYtuv2Ug03bdb6bGEw6OBbhef4ND1zMb2NAF/HDp8wY
	EvPa0yvTkLZho/REcEmHJ7I6pmND7rBUY9p1FFv17tG+oTvixJjNIFSFFZYn80SZO2EG825bTObaI
	wHKie+Og==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wCwDR-000ET6-1f;
	Wed, 15 Apr 2026 11:07:21 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wCwDR-000KjI-17;
	Wed, 15 Apr 2026 11:07:21 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject:
 Re: [PATCH 1/8] arm64/hwcap: Generate the KERNEL_HWCAP_ definitions for the
 hwcaps
Date: Wed, 15 Apr 2026 11:07:20 +0200
Message-ID: <5941978.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ad9H0BiD4le07P-a@arm.com>
References:
 <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
 <8745494.GXAFRqVoOG@steina-w> <ad9H0BiD4le07P-a@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27972/Wed Apr 15 08:24:27 2026)

Hi Catalin,

Am Mittwoch, 15. April 2026, 10:09:52 CEST schrieb Catalin Marinas:
> On Wed, Apr 15, 2026 at 08:24:22AM +0200, Alexander Stein wrote:
> > Am Montag, 2. M=E4rz 2026, 23:53:16 CEST schrieb Mark Brown:
> > > Currently for each hwcap we define both the HWCAPn_NAME definition wh=
ich is
> > > exposed to userspace and a kernel internal KERNEL_HWCAP_NAME definiti=
on
> > > which we use internally. This is tedious and repetitive, instead use a
> > > script to generate the KERNEL_HWCAP_ definitions from the UAPI defini=
tions.
> > >=20
> > > No functional changes intended.
> >=20
> > Somehow this change causes to delete and generate kernel-hwcap.h on each
> > make call. This results in compiling essentially everything each time.
>=20
> Does this fix it:
>=20
> https://lore.kernel.org/r/20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@=
kernel.org
>=20
> It's queued, it will go in before -rc1.

Ah, I didn't notice that. Thanks. Works for me.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


