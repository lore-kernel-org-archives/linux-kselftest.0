Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CF239C002;
	Tue, 28 Apr 2026 23:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777418815; cv=none; b=ZF5RemLQYL6qpn7c6UtWNUACT6TplF12qL10RoYyusOChnn7uajZ8sOn6ricVbwGKhgJ5JVHNJiMlBo+3Km665sGJieBGVe0c3XipZpsAHEYUNuFIYS3yb+OiD4DRC3qsQXwMjWzQFm0izfezsnxkP+N02+1DZwlR0nao/itsNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777418815; c=relaxed/simple;
	bh=ZicstlCEy3IWZiOQN/EqQrzbm+06rnQtEWNLsCVGooE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2Lw6IXhsJeQD/oiWx+MB9+eNJXPumqzIPfPfG1+EEUomzZur749BMQqBD29oXiSmGbJjPtYhvLEnvsN/n2IMzBHNM7RoE5ZJAcPmxMVtBaY6x2iC1BpP1N/DEU2a//n5e23obIzO/brwnxcjRREeQw6d35clFGeNstaxSbTyR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxMMgw6b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxMMgw6b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F957C2BCB7;
	Tue, 28 Apr 2026 23:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777418815;
	bh=ZicstlCEy3IWZiOQN/EqQrzbm+06rnQtEWNLsCVGooE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AxMMgw6br9IYs5kUlF1aeVc43ekD0MINnQFVcc3+dfepsNX1bn3YwkAhj376oIxEr
	 pMzBVcM6hwG5KQG/OPdsBJqpF6d2RyOFweZNGgE+eZZrJTAX+L3quYd9SNuBvP2310
	 y4F9vXe6rAE8WoohyUS8w8Amw5Y68T9AK8rfq+9Zpb8Xcjvm2sx9FKKOADhwzzpTeU
	 Va90VfwICsFOlsmymfyKcuXPVWB95ABgTCeTKUcE4HCY6nAbhAXkjMECdLYSI9hx4o
	 79HWNmb1vfuvClF5kLMBrzOCEZ2CyVYBm+pI+jYb0vfCay1z6iGMm4SKH0a63oqNDo
	 Jhr5RBFgh6diA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0E7F61AC5842; Wed, 29 Apr 2026 00:26:51 +0100 (BST)
Date: Wed, 29 Apr 2026 08:26:51 +0900
From: Mark Brown <broonie@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <afFCO2BpXZQW695O@sirena.co.uk>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
 <aeuRfEeOUWEHzPix@arm.com>
 <63409143-f4eb-48c3-89de-1aef4fb57381@sirena.org.uk>
 <aeud4Hqxq4PNitMc@arm.com>
 <b94bce09-69d5-4454-b4a0-81612f286f0a@sirena.org.uk>
 <20260428101513.GE16537@e132581.arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pCVtL2GPjLu+SJ3O"
Content-Disposition: inline
In-Reply-To: <20260428101513.GE16537@e132581.arm.com>
X-Cookie: 667:


--pCVtL2GPjLu+SJ3O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2026 at 11:15:13AM +0100, Leo Yan wrote:

> > It's not glibc specific so it seems reasonable to keep it in gcs-util.h,
> > even though we don't currently have any nolibc stuff that uses ptrace.
> > That said this isn't particularly strongly held opinion so I don't
> > *really* mind either way.

> Does below change make sense to you?

That looks fine to me.

--pCVtL2GPjLu+SJ3O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxQjoACgkQJNaLcl1U
h9D+Mgf/egrEQwsX1P3T4kqHQcwCAKPkC9IlRDqUTJ+Va678AdjBDlbahJ3ebpzM
1XHWOpofkLnm0Rrngp9tCcta37e9xapMRRvIjRT9aPZf57rbwIOiIsecNOr96v4Z
bKXKw4yeALHiRvfkHa61gm7JDn0IG2PvRYkStDH0I9AnDEf3//j0bbquOitFuRS8
QqOD59Uh0nMsnnj1Ms7Y1OFzyXgFQk6vyZjN6oTfaXL4PmPM+GE+W4DSo8EaCZsD
jU8VEBMeWezzSa86urtGanZWgrG77VlDcCTlV7kT9lwcnd0zFkrrMlVLuUFFj8sl
vC0Tj2ZlO1/rfrkvrVxdSXDYmJX7Cg==
=HRmc
-----END PGP SIGNATURE-----

--pCVtL2GPjLu+SJ3O--
