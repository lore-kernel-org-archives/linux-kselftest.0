Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2063A3E7F;
	Fri, 17 Apr 2026 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432646; cv=none; b=eam8/0JIepWg6oZC22gt2ulbTnCsB7Ht7T84VXh5EAWJB8waKL34RYkgDpbTbrrTVVu6n3QrwvjiRx6IlbXp6t6LAamJFufmGTY5h081hVCnpfE+roYIWkiALv37w8rXm7yeQp/7CyAy2CDIzRCOfRMQWLRVESukvc9/L6XeN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432646; c=relaxed/simple;
	bh=gODLVDoNdIu0aRnnS7D3RFNfqDLdhGeFRtSzDpXq3AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBdQsQXJJTt9Eh+YUquMMIKLT2kj8G+YSbJMQWfKLyznRSRcrGmnqjRQZTVBOwHV2AKqzEIsx7/dH2eX/ef5boWIwCbzdfl0PuGpO9qAR/iJLFNnM0pReHh8zeCbeb0dpz10B0eJCTnDO0FNyg1eimP8PevoRSn29xI0cRwwRMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXrrSmk6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXrrSmk6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601A3C19425;
	Fri, 17 Apr 2026 13:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776432645;
	bh=gODLVDoNdIu0aRnnS7D3RFNfqDLdhGeFRtSzDpXq3AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QXrrSmk6IogDUOp9fs8s8OUg5tJy9+6BnwjdpMi4ZRyj7b3jNfjzuvDG4QFcOdCJs
	 oPZTgF8IjVVdGqUrp7l0zwd6BGBU66SI+puqxJHprL+kUK1xM10sWokd+T3lE1g3ar
	 jhzzmWIlCmH3QVh7cew8lYksVQcLu+oZMR79k49H9y/ktUDUKU2UNCLHAYmxnAjHoQ
	 zDumMODlRxyhO2OuqOBigWn1ygvSWzKuvY1wrNjRok9oiwUg55U7JTM82cY2Y83EzL
	 8Woe7/xUgKebHpp2HuoaJWRe/imI/1UOS2e8PrKmGcMxgaegsY629P1WFJg8TtmYfD
	 ElxC2PiLBcRxQ==
Date: Fri, 17 Apr 2026 14:30:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <rbm@suse.com>,
	torvalds@linux-foundation.org, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Aishwarya.TCV@arm.com, ben.copeland@linaro.org,
	kernelci@lists.linux.dev
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
Message-ID: <e54a02b1-dd0b-4dd4-93aa-0484bb2cd8fe@sirena.org.uk>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <ad-8BIkw_ijCLqcF@sirena.co.uk>
 <e4b82973-7d9e-454d-8f69-6d2a1a8ec7dc@sirena.org.uk>
 <c834846c-96d5-405c-97d9-f182b8fe1569@linuxfoundation.org>
 <a73aa838-d194-4867-86fb-42bc8d057fd9@sirena.org.uk>
 <9c9f9851-5962-4281-9f34-a1f2e012b13e@linuxfoundation.org>
 <0420ebf1-2598-4f4f-bd09-95774156b48b@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l8K65XbEJBIqZvnB"
Content-Disposition: inline
In-Reply-To: <0420ebf1-2598-4f4f-bd09-95774156b48b@linuxfoundation.org>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!


--l8K65XbEJBIqZvnB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2026 at 03:15:30PM -0600, Shuah Khan wrote:

> Just a quick note to say I applied all 3 patches and will send pr tomorrow.

Confirmed that everything seems to be running fine in -next for me.  I
am seeing the test number duplicated in the log messages from the
wrapper:

  ok 59 59 selftests: arm64: syscall-abi

which is confusing my parser a little but is less of an emergency, I'll
take a look.

--l8K65XbEJBIqZvnB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmniNf8ACgkQJNaLcl1U
h9B8Swf/VUIDQqa12mNHNUCII3JGnRQSTgbsZLNisQ4kkDdBzzF7Cxh3tfPruNlE
KIxnW0HpJeegirn1Dd9rGLjCPDztCa1jOL+20r/mYRLNiedIT7r5ConwbhBnfo5a
0IHAcxDt9bMR7eJGdWw84XaP3gysVHcsP1qsTEmTgvmmXR23O2MH4mKAvhtT6Am6
FZNx3QtkoLzIVaTkZL75I2OHfBmye/bXvRt7adGq3d/0rVaI50SqgO2c3QGI1p+a
H/Jwa0LWgbu5o5zCIhwgpJpFdg9k7A8681CCK1PYASibFiCf9NJUXRGPA6Xw9lWb
REBlk10xyoRSDoBL/kDjxg7J5d1UyA==
=Enxp
-----END PGP SIGNATURE-----

--l8K65XbEJBIqZvnB--
