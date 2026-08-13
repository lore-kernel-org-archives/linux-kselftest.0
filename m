Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8C538238C;
	Thu, 13 Aug 2026 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640502; cv=none; b=Y0Y/cgKpfvkoXi14YoCN2WexqdbAzhXsm2W2C46KlhYaQGp4D4cU6s6KVSlDXIUdGN66LKKS8Pvkhh52ae2VRC2QuSdHYhIdyzB5Zr9QbYILi3qFnKMsuBWsKTA6RCRtYZF6hFwbgMTm48LuSCbb1da7M3LRH3uFfVNSTDja1yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640502; c=relaxed/simple;
	bh=GePZ31TGPBJanc/JVQYvtBOijS6DiyBrW5H/YrR2scg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjN34XWHBTK+R9f5jiScCN/v71q3hxNldrlxomSOI/R8jFFc8WAK1oYEbubAfnId8B40wSPzOpXQT8pyWTAOg0fY+wm+Xrrd7fs0x5mIbmCKl0K5Rmza8MPfj12jDAdmQp5HjJpdZ7gfCyKPsBHg6hUlTUwPvWFzafXelP6SIOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/or0qZX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/or0qZX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4231F000E9;
	Thu, 13 Aug 2026 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786640501;
	bh=GePZ31TGPBJanc/JVQYvtBOijS6DiyBrW5H/YrR2scg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d/or0qZXa3USfe9zrvVJrjFEARdxr0gpZ71KO8sVwrEtOsu3pq81xbLKSWI+xOKts
	 GhhrWmYnocJkMYD+7Vg/chD7/b7z+Ztehs/lQ/+qWS6EtwfCw+Xw/fX24c5hVCpi23
	 ngFbzWGMBIXBrFPa7g1GyOPJuVr6+tvWbja23c1ag5kHewrDXjBwFg/HC0IdHBXn+X
	 m+kZWaH80PaUhfW8a51IItCI0AnzVBsqYyl78VsaQOXl9ZNBi+II9tSSp6oOpoejjv
	 6QkimSGedGJKJtn3mkISPnsLErmjj5BCHiTAGFeygEOUpIRjToi/d18ayyBTYlopBE
	 8SQ+zNWOiuZ8Q==
Date: Thu, 13 Aug 2026 18:01:35 +0100
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
	Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 03/11] dt-bindings: riscv: Add Zic64b extension
 description
Message-ID: <20260813-volley-panning-c0589cd0ba22@spud>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
 <20260812-rva23u64-hwprobe-v2-v6-3-c985af3256b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rXSRKR8H98tOltzT"
Content-Disposition: inline
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-3-c985af3256b8@oss.qualcomm.com>

--rXSRKR8H98tOltzT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--rXSRKR8H98tOltzT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCan34bwAKCRB4tDGHoIJi
0jPmAQD3suLs4KD+gV95qtdRnqAAnSnqF0Dq1xP6Y9wXr7g1IQD/R6iza5bEduSZ
fWorzbmQ9vqxCuCV8H/B0cqrBm979AA=
=1OKO
-----END PGP SIGNATURE-----

--rXSRKR8H98tOltzT--
