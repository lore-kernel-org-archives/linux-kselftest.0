Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5C3C1963;
	Mon, 28 Sep 2026 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594030; cv=none; b=PwCE78WnfuJWsFP4xR0pn6jXwAx6ZdVmt9CriM88wJe8QoVRiS8Fyz/A8JLzSqVs2xgq1F/D+i8zAZ3aJ3QdPd6uN/gZpGa6peWzhV+bxzr6gvRLhX6/LWeS8Lk3ZU5Xuqv0aU1xSkdJq+637V9+notIQSon4anMu6W3z6v4Dqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594030; c=relaxed/simple;
	bh=Xt9fMidhXbEU+swi45nX46wlwtCnk/OmcRXy+TVkMDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okmXVSWgVg/mJKGpjfPs3HvE/118gAJUhZDmdL+k4ROYhImjt+hgACrtOFy/Bf9ZfdqQnTjSaczBQO3u3LJhr2vuMm5tDDZo+RkB5a0pheal7I7hLmhx9l373V8WW8yinylFRhxEMuiewOtXA3fB9pzcI7S6ddTXGDIDnWSP3kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQeK0CN7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQeK0CN7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D591F000FF;
	Mon, 28 Sep 2026 11:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790594028;
	bh=Xt9fMidhXbEU+swi45nX46wlwtCnk/OmcRXy+TVkMDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bQeK0CN7BKmE7JHSsiLZo2GFx5vqJft/tbAP2TzTjl+M4F1Ew932Ddjtrv1vMa1lr
	 nZZKtCI6XKfe8RE9k2GYFnJq+WU/M4+As1WL2vIn2wKtKMLjd6vb81MvwW5LGyVzHq
	 ydBJDeQ9UA3woKsTRpBv6KIYPmoGo+9TRiEErfwd4Apyl4Slm3x/Ipn2rKkS4Edgy3
	 tQVCSURBTBFQJzxVMfviFDABHdgQLFxdwFV8K8dEEg7KSgIqSk6cB1MNHLGFBXozr6
	 DJOt6qRiv8feKHBbFe0TAovpy1caQOeME4J1y94rzYDhpbHF1kavOEBctX3ECOWrVN
	 iNwOLimAMTayw==
Date: Mon, 28 Sep 2026 12:13:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Alireza Feyzabadi Farahani <arfa79lg@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>, linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: ALSA: Skip timer tests when device is
 unavailable
Message-ID: <3c3502e5-eabd-4133-a93a-a69a5a2671cd@sirena.org.uk>
References: <20260927064430.2112688-1-arfa79lg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qqAs8gvD/4vczrQi"
Content-Disposition: inline
In-Reply-To: <20260927064430.2112688-1-arfa79lg@gmail.com>
X-Cookie: All is fear in love and war.


--qqAs8gvD/4vczrQi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 06:44:30AM +0000, Alireza Feyzabadi Farahani wrote:
> When CONFIG_SND is disabled, opening /dev/snd/timer fails and the
> userspace timer tests report failures even though the test environment
> does not support ALSA timers.
>=20
> Skip the affected tests when opening the timer device fails because the
> device is unavailable. Continue to report unexpected open failures as
> test failures.

Reviewed-by: Mark Brown <broonie@kernel.org>

--qqAs8gvD/4vczrQi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6S+gACgkQJNaLcl1U
h9AgVQf+KSbdqOvSf+AkN6++AuG5aET16O0JEdAEhNBEZbf+1YzcCrTJ6ygaxD2w
rg2gI2JiZyBvSf0Kes0wxVl6Ga8LWIr8zjisjizfvQohkK4/O25xFpMKTZ3aEi5A
cAKFRnuTsNzH3F3GONiaCLUlxIek30gW5ydZpQVUdU9zjO0xj5bcgKDfKP6BNqMP
7Q7uFWKttGB6oGJ5L1/oWL0U9pVDTeolFinyMHo/i9IQC6XK38aCtvlGXVbSF1Eg
240IqWGRmBx2zUEUtrdAH/9zUJ8G52pnvFBQQ67KmIh97a1OBMedNruPLruYnFfs
/YmEblK27r3WFrBUthF4xdISq1jHBA==
=YAGk
-----END PGP SIGNATURE-----

--qqAs8gvD/4vczrQi--
