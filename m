Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBC4481FA1;
	Tue, 15 Sep 2026 16:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491152; cv=none; b=b8gi//R5FtFvgu1mv4Ke0ilAfMXY8N22gXF3GAz8cgwtKQ51Ccl3vONNHz0PQoDNiA8jTwH5U63dhUTwGDgIcj1HNfIIBX4wsT/D9ngKM14fW8WhK8B7M6rGPnD43BbGrk1ed12Q/I0+nfTnCRdk0WgJYIHkF+PHGG8WAl7Jr30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491152; c=relaxed/simple;
	bh=ypzeoRTb6xYEsb/0WCuvTZKzTa2DaEvHlXj54ddwHQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7hYa4lrVtnxf5x5UhpgXyqTt1UBwcejW8SJu9EobR8bx4wdu6kyeHbh2pL/At+Isl4Iikp5k4Wooomm4mjNQ70I5X0nvgqFWMxO4b4fuB+iEt97jxK9UbFBZTgSbOTE9CGetkLVSNzqHkslhdAl2QOMT7Ywq+h/ZmyMeUDfzro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cuDOM1nN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cuDOM1nN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB07D1F000FF;
	Tue, 15 Sep 2026 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491151;
	bh=ypzeoRTb6xYEsb/0WCuvTZKzTa2DaEvHlXj54ddwHQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cuDOM1nNDsxtF7PlFuKdms5h3NHvIeOPwqUQNtOl5kbk9O5dbaHIR/RrEzZUyG/3i
	 qSeL1n5WZRN1ll37KYIKax7VZLddYiaN5mCgEA+o5Jyf4GNB5aC/E77HsxtUsnI0Nl
	 TizghtMccZece/nmMV3joeDyInkBxIB4OBAn5L2KplAWNR6bK5s1N1tafFN5vdesA0
	 mzBUc/1bIzzXDMQsb27ampVmHD+ZSaxXeuOhxBtBRcKTAhYKq3nIPvhi6hW3nkeHk/
	 x8tY7cksKZJULwkgj3LWM16v3X62dPLE/HyWNWZe9O8tqegycyv7ZTSrdYI+6t4ilu
	 /oyUBJKLv7xuw==
Date: Tue, 15 Sep 2026 17:52:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
	Palmer Dabbelt <palmer@sifive.com>,
	Andy Chiu <tchiu@tenstorrent.com>,
	Florian Weimer <fweimer@redhat.com>,
	Peter Bergner <bergner@oss.tenstorrent.com>,
	Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
	Mark Harris <mark.hsj@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>
Subject: Re: [PATCH v7 09/11] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <20260915-widget-defiling-e22497c228cc@spud>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
 <20260915-rva23u64-hwprobe-v2-v7-9-aa35ebd9ae96@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HzK562KHekWwgPYZ"
Content-Disposition: inline
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-9-aa35ebd9ae96@oss.qualcomm.com>

--HzK562KHekWwgPYZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 03:15:35AM -0400, Guodong Xu wrote:
> Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
> (named profile-class sets such as IMA and RVA23U64), computed at init
> time by riscv_init_isa_bases().
>=20
> Register riscv_init_isa_bases() as an arch_initcall. That is late
> enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM and
> populated have_user_pmlen_*; without that ordering,
> riscv_have_user_pmlen(7) would still return its default false and the
> RVA23U64 detection path would always bail. It is also early enough that
> arch_initcall_sync(init_hwprobe_vdso_data) finds the bases populated
> when it snapshots the hwprobe values into the vDSO data page.
>=20
> Consider this as the cache that subsequent consumers (hwprobe's
> RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
> can read without recomputing, which keeps them consistent with
> each other.
>=20
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>

Something is wrong here with the signoffs here, Drew's probably missing
either authorship or a Co-developed-by tag?

--HzK562KHekWwgPYZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql3xwAKCRB4tDGHoIJi
0j7yAP91eT382HzKXLp423gHB51yfWxN+iAs4R+MhBlF05j5GwEA5GjMcnOJVD8Y
sEFBqUBTL8evUR1CilJLWuZxaN1wQAU=
=myHc
-----END PGP SIGNATURE-----

--HzK562KHekWwgPYZ--
