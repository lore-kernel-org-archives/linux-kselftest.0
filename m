Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E73E9589;
	Thu, 19 Mar 2026 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936312; cv=none; b=FxYZIcBj79dkRXQW2HUzx30ZxLGAe6JrHlfwahHIsW4DAbTu85M/wciMGB/hV427/VVFqQgdJnfA5tGR87g4eyQK36Wacb022YVUZP1RGRV3QQ3bleX+iczAYmBt1atAFsZ+8xdF3z/xet8A71se3TwvEvFfcun/iQW7QahdHX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936312; c=relaxed/simple;
	bh=bulJuIHOPkmsY4vZeEUt2EEEHlRPsQREHa6rH8/GZlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lO8g+BN/KiAQo26fKExqfZ7ar5gQCD8EWifc2G9+uOE6+WJMTOm5qYfeWrCtnuZ2cOSRJNMZZniD4HydYzDKR8FBv0Mgdf6F/Z68ZXbAGJVQhL6hOjcvJds3a0239ZYWn5EXH63YUbSAALz2Y23/DOEoQUltvdK/2HghaTVGyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAqmYDFq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAqmYDFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CB6C19424;
	Thu, 19 Mar 2026 16:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773936311;
	bh=bulJuIHOPkmsY4vZeEUt2EEEHlRPsQREHa6rH8/GZlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAqmYDFq9seKuV/CQmq7BClLSWULxWgUhsW6zq21yz3YLktacM2cgOnvd++q8RMlM
	 tKTmgzSrBxIVvKXB7njhRdV5Np4Funk7GVzOzGRquSaL/oQcfyqp45UnXPu6sM7Wfb
	 uUI1vCZZWPr86Tr+eVZWtHqscxPR0ny1GzJ2FRe4MwHpRMxPT82Frlvwviv0qc4sIi
	 e9nPQf1B/AlQncOoRgMI2wvCTjmVCwC0rU43lp2j1G4HxeoJCG2ylDu4cNMz19P3AZ
	 MprcW0MldGiDHn/hdhKI7FZ3m/hBTBy4m1S1XnIHBiJDu5B8fylmV5rL+8h2f0Pd8+
	 OF5hr8iXMzKpQ==
Date: Thu, 19 Mar 2026 16:05:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Copeland <ben.copeland@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: ALSA: Skip utimer test when CONFIG_SND_UTIMER
 is not enabled
Message-ID: <778a9f3a-c479-4629-89ff-7a189b730b2e@sirena.org.uk>
References: <20260319124521.191491-1-ben.copeland@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qPToLBSzfzXvWBWQ"
Content-Disposition: inline
In-Reply-To: <20260319124521.191491-1-ben.copeland@linaro.org>
X-Cookie: Given my druthers, I'd druther not.


--qPToLBSzfzXvWBWQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 12:45:21PM +0000, Ben Copeland wrote:
> The timer_f.utimer test hard-fails with ASSERT_EQ when
> SNDRV_TIMER_IOCTL_CREATE returns -1 on kernels without
> CONFIG_SND_UTIMER. This causes the entire alsa kselftest suite to
> report a failure rather than skipping the unsupported test.

Reviewed-by: Mark Brown <broonie@kernel.org>

--qPToLBSzfzXvWBWQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm8HrEACgkQJNaLcl1U
h9Cipwf+JeqOlKUa9Ke2INwMHr9caNFA/ZZYQshaiIm4DjBFNiVtu+6vGHJ7Hwlw
+h5Oj1XoXBGxXW07W3Gvz8SanmX4iXZz66MiPrKPHjqEUHrvDZGFN43HEvA1IBho
yg9QoYHJP4xO+VZ38xVgW9OoOMS+kUwmWZYvNTzFTk1lUThhkoGTZy1MHcFHaW2r
agi7i6NAB0lIVYNDw/zbsuq85TuNn/A2sC907YRiK+sFcJnNGo17ubZgQSTrw4xT
e8HZWXOWCGrfC68AeNkQ849x3TcfUW77+40JByfCYlTS6Hl+Bz/51Ae0ug3dj/qm
gEPdoNzOT2HRUsIb1OVlvNU2s03hSw==
=m2EO
-----END PGP SIGNATURE-----

--qPToLBSzfzXvWBWQ--
