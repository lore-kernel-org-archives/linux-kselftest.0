Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B27A4F7976;
	Mon, 28 Sep 2026 17:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616875; cv=none; b=eMw419ehgf3bsVGkyyVb+8cJ2TtvEFkVfem0wm1B8PZjq/F0MYq9/0v2x+04JOucYuxWxaZvidckpl+AbzMU9NmrOTlnrLz34yePtWE7olviUzaiSbXfTkxiUjqX6q3tdLAiaA9fknBthJHT2MQGrtICR+g1F8HCGHaSW+Ft2O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616875; c=relaxed/simple;
	bh=egnQhtDaTpYjfPnvXXu2ySGjkg5KEvtAtt1PKHUy9Sc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GEQzcwno++K/ZuAjqTe1C5kFmThu1gEA7rLv7LnlUsLiXNEZYQ7vdrufgRzPS4aUTu5XEfymaHDi1KWzm4y/nsA1G83EN1TxL9X/QB4dnPsjdmuJmtEwUFQ8wevtAVzOA4YGZZW96cU9UJoFlj5RHHGGEzmtkStNnLf3CWXET1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsTmcLgE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsTmcLgE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC311F00893;
	Mon, 28 Sep 2026 17:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790616872;
	bh=56BxWF8z/reF8ypYDw5KpTL0l2aDGF9pTpnE6xZCNrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZsTmcLgE2/ZooJgOsZcL7H3uFx363nXNblOsqsLrv9KBo5qclY8yqU/RGP9ph1cay
	 D4qe/gVrzVxzSGY/rJn76bN1oyx64b32IVcL82LLVALwybXed2fn3B9YrKUfvXCzKn
	 msmVgZOSrFNny3hQzgTgj4AxKsxHvxyhf9QbvW1AnxwbtV6xOan9MNFsoczC7mYUZd
	 b8xqU7WZyVxBhKSrQOSwqAJ3MniYckmJ9LyHVOPnmEHv/tFNcg6jUjqViK7nIjUajt
	 /V1swvrD/XLn6hx3M1ck2lQxR5MTFg31cASPRsnAgK6C4OfELwmgUYzZ6OYovJB300
	 9G7shR8rJAhCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh
 to scripts/
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolas Schier" <nsc@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Luis Augenstein" <luis.augenstein@tngtech.com>,
 =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Mike
 Rapoport" <rppt@kernel.org>, "Alexander Graf" <graf@amazon.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Willy Tarreau" <w@1wt.eu>, "Maximilian
 Huber" <maximilian.huber@tngtech.com>
Cc: linux-kselftest@vger.kernel.org, linux-kbuild@vger.kernel.org, "Askar
 Safin" <safinaskar@gmail.com>, kexec@lists.infradead.org, =?utf-8?b?VGhv?=
 =?utf-8?b?bWFzIFdlacOfc2NodWg=?= <thomas.weissschuh@linutronix.de>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20260928-move-gen_init_cpio-to-scripts-v4-2-f437a33c40ac@kernel.org>
References: <20260928-move-gen_init_cpio-to-scripts-v4-0-f437a33c40ac@kernel.org>
 <20260928-move-gen_init_cpio-to-scripts-v4-2-f437a33c40ac@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 17:34:31 +0000
Message-Id: <20260928173431.8FC311F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

> gen_init_cpio and gen_initramfs.sh are part of kbuild and required for
> all kernel builds w/ CONFIG_BLK_DEV_INITRD.  Move both to scripts/ to be
> more clear about their importance.
>=20
> Link: https://lore.kernel.org/all/aSdrCFkUQup3qb-q@derry.ads.avm.de/
> Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nicolas Schier <nsc@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-move-gen_i=
nit_cpio-to-scripts-v4-0-f437a33c40ac@kernel.org?part=3D2

