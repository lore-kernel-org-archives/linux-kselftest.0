Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8F12E040E;
	Tue, 19 May 2026 16:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206643; cv=none; b=VW91KZRmf1hkhNa4J7Cle73Ol0OP0RA4JocfdQKxO1nLHRRxki1R0iVF5tTnjzIbYJr5qP8KpiKlri5wcSTH7WahICWOOtfWI/Rt4Fy5r8RrBCQKExpmubmyKD4jDCef8ll+jjlt3aQxbyIidFVeB7X5LnJ4omcRV1am5PpuYvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206643; c=relaxed/simple;
	bh=Lnx/pXqjltGA5ONxEFwxZf8Y5U4N814gZuOhZVLw1og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUYRU6axbpI6F3h4Gm8e87VAB8xlvjJ5ZQzdz1ZD4uMMEqVjjkWh11hFjwRtbQCBm4GDn6C55DOsOaaMxNBfSgJfwYHRkv8nWKu254O1eDRaqIFZ4gPN3/Cyc2wFTkExa9Rwhw0IXvOMKSxXjFaZIDcrfAiDPLQkjC8LLyDiyEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJNf/CeG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJNf/CeG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D00C2BCB3;
	Tue, 19 May 2026 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779206643;
	bh=Lnx/pXqjltGA5ONxEFwxZf8Y5U4N814gZuOhZVLw1og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJNf/CeGIvGrP9EaIQi4pfT79mOF0qY5KAreyTQLYPRMDGTSDpylVsdIrWl1mgf/N
	 bz84lZ0pmvcZZBQxouPO2C26PK1I8ZasCMTaaauyU3AGxfrwCUpL5kK2jKhKWEdFqp
	 gqGQHW8pg5/flkPE1rcDX+caQW0+ly0PTFRXsXI0JQatAYvZ5mJikFkYlCC6jdJ2FG
	 e8c7PgBrlZzTIiAFvWTUqhcp6+dcdoBgwrUjh9snuG9Qph59B56kRUIrKRBnf4YVJK
	 pr8/FgYUxlRT52kN7RJxsWWtvvcuQUR7ozAbgxqhK2/c3mr8DzvtpT5PmPVcL/FYDx
	 osGbT5LF/b2Ug==
Date: Tue, 19 May 2026 17:03:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64/cpufeature: Define hwcaps for 2025 dpISA
 features
Message-ID: <4f6f15db-7881-4bf1-af84-f2066e740129@sirena.org.uk>
References: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
 <20260518-arm64-dpisa-2025-v2-1-b3367b73bd00@kernel.org>
 <agyAs0UXGulhFXga@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h/QgtpyNZPBR8+wA"
Content-Disposition: inline
In-Reply-To: <agyAs0UXGulhFXga@willie-the-truck>
X-Cookie: Huh?


--h/QgtpyNZPBR8+wA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2026 at 04:24:35PM +0100, Will Deacon wrote:
> On Mon, May 18, 2026 at 04:07:29PM +0100, Mark Brown wrote:

> > +HWCAP3_F16F32MM
> > +    Functionality implied by ID_AA64ISAR0_EL1.FHM == 0b0011

> > +HWCAP3_SVE_LUT6
> > +    Functionality implied by ID_AA64ISAR2_EL1.LUT == 0b0010 and
> > +    ID_AA64PFR0_EL1.SVE == 0b0001.

> I've queued this, but I'm curious why you've called out the
> 'ID_AA64PFR0_EL1.SVE == 0b0001' part here and not for any of the other
> SVE caps you're adding?

It was mostly due to the possibility of ID_AA64ISAR2_EL1.LUT getting a
new non-SVE value, now you mention it I should go back and add the same
restriction for the others due to the use of ID_AA64ZFR0_EL1 for SME
only systems.  It's the implemented behaviour.

>                         It's also formatted inconsistently from
> pre-existing entries (such as HWCAP2_SVE_B16B16) which put the
> ID_AA64PFR0_EL1.SVE part of the antecedent first.

No real reason for that, there just weren't other examples on screen at
the time I was editing this.

--h/QgtpyNZPBR8+wA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMie0ACgkQJNaLcl1U
h9D44Qf9Hm/HoYVWOogGsZwsAW3fUJ+l+CbQYeMQ4uxFJrjRfTyWJF150CL8cR/p
fSjXG7b893A88VmLURRews0SIbQl+ySoLBMmkquPYOEa81h9IFjfRWIUwMSg9RaI
n/u9d/tr0nTsBcdxgBd/pI5j/XvW184DfpWW2nyHHlR66ocYiPsHxi5P9bOkimYR
Rk6dMU2/t1h6OpPTY4lYUsGrPeX2tmcVOCB464/QHWzjGc4KE+FY8FzlOCi3RL7t
pKN/3a7k8ysVJahVqHEvMB8Ko4pTGygRuWAqR6d1bDI9Rn/nuevyX0O1vHkZHUoV
fyT2A/dA+fo/WnKgX3z8BnV3epB0mg==
=XelS
-----END PGP SIGNATURE-----

--h/QgtpyNZPBR8+wA--
