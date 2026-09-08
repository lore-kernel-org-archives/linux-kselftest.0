Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927D857F752;
	Tue,  8 Sep 2026 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884606; cv=none; b=eSoUvO/V135zbYnnznLKj/bMRQNPvLqjINLLro1HMjNs0VzJmIazNCj6EgZHvP7ceZd3v8VF5K/xnDzTcIuXNvpXDwdVeHnC2XP6z+DevVarzrtE7Uq5hYuIOS5fn4pbcGMsEho/xb5e3vYhsM/mEjnFGSLWDK+F6uvNdqgvAOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884606; c=relaxed/simple;
	bh=RwGa8ZunLYKL47WuwyHPBds4mdS2edgzn5GhW/HAIe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwfLhqsOcgtFjoqAiiqn1sAeqBYwLespOhFndOhFHzDzDHSNjuAEi5mWE9clJPzoh43ERq9Fv3LwrqvmuXjqTepuO/qryTPOhJP/n7FZ/QNath9upA/TpaCD1EKUkpdCTS5Grj9+nMY7vnJo39QQFY/Gpc1FemILcapH8fL5rBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWdERB/b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWdERB/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4861F00A3D;
	Tue,  8 Sep 2026 16:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788884604;
	bh=VHw7pveUSPsk9WUKNe/4HqdcBdQCj4ysEn42QMxNN9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CWdERB/b7JQhGeGEabqh7stxW2tlqjqt4fkVD93nvAZc0cilwJ/9HU1AgLG5AUByR
	 aRmc1XugOyO/x1qkpj28zuDTgHhKEWH6/5mecn6rCZe5J56umgV4kBxqG8PKqgavf5
	 L3p4zEw7zyrKn57R+4gAY9EJU/MBj+i487r1CjHAGHcX+cl3zDAkfYUUJI5S1VIK70
	 sD0dnu6vTo09Mf1ch2+h5QXILpVZrxUoF/PR4gjdj4C+TAWScryWMGea31g/4mCZYD
	 b+O6ZmHoxu79grGoUd2xM2Rtgr+am5UNRgTCcklX8ly295QhNvy9tbziEGiPVe7zV+
	 L7xYZpKzLPUhQ==
Date: Tue, 8 Sep 2026 17:23:19 +0100
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>, linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/alsa: Test writes to IEC958 controls
Message-ID: <21cc0424-8b57-4be4-9555-892b980d2f74@sirena.org.uk>
References: <20260904021939.149468-1-sammiee5311@gmail.com>
 <20260904123334.1505003-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sd110ppb7aeovEmU"
Content-Disposition: inline
In-Reply-To: <20260904123334.1505003-1-sammiee5311@gmail.com>
X-Cookie: The world is not octal despite DEC.


--sd110ppb7aeovEmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026 at 09:33:34PM +0900, HyeongJun An wrote:

> Nothing checks that the put() callback of an IEC958 control reports a
> change, because write_valid skips these controls.

> Toggle one channel status bit and look for the event. The bit comes
> from the Con Mask, Pro Mask or plain Mask sibling where there is one,
> non-audio by preference because it means the same thing in both
> layouts. Bit 0 of the first byte picks the layout, so leave it alone.

> Write the value once without grading it first, since a device need not
> implement the bit we picked. The graded write then compares against
> what the device gave back, so it can only fail on the notification.

You're using "grading" a bunch, I think you mean "check"?  It makes
things hard to follow.

> That probe and the restore after it are not graded, so nothing consumes
> the events they make and the graded write would find one of those
> instead of its own. Drop them first. The other write_valid tests write
> only through write_and_verify(), so they have no ungraded write of their
> own to drop after.
>=20
> On an HDA card with four HDMI PCMs:
>=20
>   -# Totals: pass:212 fail:5 xfail:0 xpass:0 skip:56 error:0
>   +# Totals: pass:216 fail:5 xfail:0 xpass:0 skip:52 error:0
>=20
> A driver whose put() never reports a change now shows up as
> event_missing rather than as a skip. hdmi-codec, img-spdif-out and
> uniperif_player store the value and return 0, so boards using them
> should report a new failure.
>=20
> write_invalid stays a skip. Every bit pattern is a valid channel
> status.

> +/*
> + * Find the read only mask control for an IEC958 value control.  The two
> + * share device, subdevice and index but not always the interface.
> + */
> +static struct ctl_data *find_iec958_mask_ctl(struct ctl_data *ctl,
> +					     const char *suffix)
> +{
> +	char name[64];
> +	int stem;
> +	struct ctl_data *mask;
> +
> +	stem =3D strlen(ctl->name) - strlen(IEC958_DEFAULT);
> +	if (snprintf(name, sizeof(name), "%.*s%s", stem, ctl->name, suffix) >=3D
> +	    (int)sizeof(name))
> +		return NULL;
> +
> +	for (mask =3D ctl_list; mask !=3D NULL; mask =3D mask->next) {
> +		if (mask->card !=3D ctl->card)
> +			continue;
> +		if (snd_ctl_elem_info_get_type(mask->info) !=3D
> +		    SND_CTL_ELEM_TYPE_IEC958)
> +			continue;
> +		if (snd_ctl_elem_info_is_inactive(mask->info))
> +			continue;
> +		if (!snd_ctl_elem_info_is_readable(mask->info))
> +			continue;
> +		if (snd_ctl_elem_id_get_device(mask->id) !=3D
> +		    snd_ctl_elem_id_get_device(ctl->id))
> +			continue;
> +		if (snd_ctl_elem_id_get_subdevice(mask->id) !=3D
> +		    snd_ctl_elem_id_get_subdevice(ctl->id))
> +			continue;
> +		if (snd_ctl_elem_id_get_index(mask->id) !=3D
> +		    snd_ctl_elem_id_get_index(ctl->id))
> +			continue;
> +		if (strcmp(mask->name, name) =3D=3D 0)
> +			return mask;
> +	}
> +
> +	return NULL;
> +}

It seems like we should have a test that we can actually find this
control, right now it looks like we silently ignore it being missing.
Are all IEC958 controls supposed to have one of these?=20

> +/*
> + * Toggle a single channel status bit and check that userspace is told a=
bout
> + * it.  A device need not implement the bit we picked so write the value
> + * without grading it first, then grade against what it gave back.
> + */
> +static bool test_ctl_write_valid_iec958(struct ctl_data *ctl)
> +{

> +	if (drop_events(ctl) < 0)
> +		return false;

This will fail without reporting a diagnostic which isn't helpful.

> +	if (snd_ctl_elem_value_compare(val, read_val)) {
> +		/* Grade against what came back, the event check still runs */
> +		ksft_print_msg("%s does not implement status[%u] 0x%02x\n",
> +			       ctl->name, byte, bit);
> +		return write_and_verify(ctl, val, read_val) =3D=3D 0;
> +	}

Aren't there two cases here?  There's the case where the device
advertised a mask where we presumably know that the control ought to be
writable, and there's the case where we just guessed a bit to write
where it's more legitimate that the write got ignored.

In theory we could also probe every single bit advertised rather than
just the first one, that's more what the tests for other control types
do.

--sd110ppb7aeovEmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgNncACgkQJNaLcl1U
h9Aqggf9GQBOxIRiSroEkkXwYrkHPeLckbMmY76SkIl61CZoi5k0MWxyFTda/vfC
MCTvL8soybAFEdYz8w2jc49bFo+lL1meVxxQWlhHB+6Xc0VDiTc6pew8bj0i4Vwa
Ih3O3vbrFUEBiCOVWPSG9hvgo+7RJFfOVWCnuDX9VvcDF9OLKhjRDTAW/s4AGjRt
QLW49PLGmYRGbZS+kAGEoK/gGNUB4O1+izcavnizJdqoECeutrwiTDdizXqqbeOA
7uHBx065gfNHzLWOP+AcgJoSL6oYLvn0YT4jjrWb8x1FyJDK/Sr0PsAQy3Sh4AAh
VH9frsDokHHyc6t/M+gu3wbC+pbqlQ==
=h138
-----END PGP SIGNATURE-----

--sd110ppb7aeovEmU--
