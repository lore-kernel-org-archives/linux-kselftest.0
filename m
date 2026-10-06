Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE7749C4BD;
	Tue,  6 Oct 2026 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299707; cv=none; b=s7rnF/EaCIz81+Lpa2bqaYOQB9Rmf8jDjaiLCYp3X/0u20APvOFcUCMryHI/iFL66zeCUQxEIzMSNFiTo9yoONPw7CKW7Ui2Rrvd6x2CTwvHsFygnN1iVn8GSvbF87q2XcOE6PV1S2HTd7Wg4Ah6KOsuY0W4aQMU8gKD9wzQZEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299707; c=relaxed/simple;
	bh=OlPcxReq52q0S3BhW/G3xi8swY2Rbd9Vxa7mMejTR4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcwZN3F6lF4Ld1KwhN0IQSPxQNj43o2WYdkaAuBBnqHO5vdlPUz3ihyEYp6O/2tpnnnUy11A3+ywyDJmWd3FFjatkz56DG2uirhXAtM4Jq6zP9rJCfGgeMN/v6JeO46Wwsja+DGI2ajunouHGlCeuyGjWXwoEYFlfWYWjniT5z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqfULfyu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqfULfyu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564701F0089B;
	Tue,  6 Oct 2026 15:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791299705;
	bh=BnBP/HW+HUs1c/9b1ViBv119RNME4VYKXi0TTo+Qf7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nqfULfyuDoHoQHq538OXt7Jhb10LG2xXPNzGwlBKoKIhClhVpttzTyTmWT4UnrzZl
	 nkrg4MjFfBwMHdOJI7vpiWMq/hMRe+CUP0F5f+vBZifej8237GHiMjP2clxfwQpGsV
	 ecwKBvLy0MRmZZySFAvQvgWp1+HT4cGsGOKCCQWO6SMFUtpawkdZ9PhFt7n+KdM3/J
	 P2V3rSX8S7ICAu0UC/JQhkNzEj1r0VwzBa5OOUnR44ERV1kW43l0WA5FTGITUP+mJg
	 aNarGGSCrcUyRPABxoaHGJU0VA9tP8EBDpYZ3Rt4QW0SpQEamPxaxsGcjmj4CqsA5w
	 XIeAjt5547Ptw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 55BFB172B9E2; Tue, 06 Oct 2026 16:15:01 +0100 (BST)
Date: Tue, 6 Oct 2026 17:15:01 +0200
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Bill Roberts <bill.roberts@foss.arm.com>
Subject: Re: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented
 by locking
Message-ID: <asUQdaTtMF1X_Hsa@sirena.org.uk>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
 <asUIWgHk3hdaLEu5@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0raDfj7qAX9drGKE"
Content-Disposition: inline
In-Reply-To: <asUIWgHk3hdaLEu5@arm.com>
X-Cookie: Use the Force, Luke.


--0raDfj7qAX9drGKE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 06, 2026 at 03:40:26PM +0100, Catalin Marinas wrote:
> On Thu, Sep 10, 2026 at 08:00:39PM +0100, Mark Brown wrote:
> > When we refuse to change the GCS configuraiton due to locking we
> > currently return -EBUSY which is an odd choice.  The only userspace I
> > found that relies on this value at present is the kselftest and other
> > architectures are using the more obvious -EPERM here let's switch.

> IIUC, riscv is returning -EINVAL. Should we get an overall consistent
> value? Personally I find -EBUSY quite descriptive but I don't mind
> aligning the architectures (before user space starts making use of the
> return value).

Yes, it's using -EINVAL though it differs in that it's interface for
locking only allows locking a single enable bit in the enabled state
rather than letting you lock unknown bits, or locking things off, so we
need some changes there too.  I guess we could also go with -EPERM which
would also distinguish the "I don't understand" from "This is blocked",
but nobody uses that yet.

I was intending to do something soon to pull more of this code out into
some shared place since especially for RISC-V and arm64 where they're
using the prctl() rather than arch_prctl() interface so there's less
reason for things to be duplicated.

--0raDfj7qAX9drGKE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrFEG4ACgkQJNaLcl1U
h9D0awf/Xe86q6e11p+608ssP4aZxBI78PtAfpwBy8yVgJnLYFHp0KmKvwbBjcMs
gIihJUx6WI+SQz3OGTYSQfuWf3t4bKxojv6RJG3i0NfJc2Me7OUBRSaIADDnVHgL
aQEHX75BZZJZYVGTwaqp0lPHWzOQgaYwCvontiu/NgwzFzeDFwcy8CVNk7rcsUw8
IvSyGad2KWYfb8aInSuFPzXCzKH0pjhjJDX0GC2WQ8ARaybpaNWe4HWd+QGd7oD1
nMbaPhZYZyF2ePLcY3SUOR5Hx2DxLWjXmYn3o8woxdNSlgtsuOoQ0Jh7WXmucerZ
5xxKWjpj6Xh4Wj/6z3X3ZvmaDtwayw==
=TvPT
-----END PGP SIGNATURE-----

--0raDfj7qAX9drGKE--
