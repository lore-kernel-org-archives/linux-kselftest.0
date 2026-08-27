Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F714483AC;
	Thu, 27 Aug 2026 12:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832914; cv=none; b=Kni4x3EPB7F9BcZ4KRV1tFYCAKCK+kM3aWPqcdfg2/yMiUxvH6WfzAnwyzUed6uh1EqbxBYJCa+A+T+0RYdJG1gWmqvzMtV7U4bn/GmqRLGzS0wM9P0YGa/NH34L6etkTzuzLoWwIqIfARnzbFCx419ej/1kbYiF/Jrin5zS9so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832914; c=relaxed/simple;
	bh=f3rgPVY4cXFMuGzY4uKrOogmmN7pkENAbTjaUjuEUfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGFsgnbD8K/hxhV7HXuD7YSAxbkaporx6GuTVGgNXZm9ydlqflE/yUyAXXNsrMyumY08Ux2oDHRBRe6o6vZss+a/w0Qf//98C2TN8FX/mSIRcOLsNCbcuDxS5dnrvUPdYsTOi4ZbYidzi/CAOP3zcs+ThHjXN1zvw3I5CzUSTL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUzQMoxJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUzQMoxJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEDA1F000E9;
	Thu, 27 Aug 2026 12:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787832912;
	bh=OvXjJRXBUzQTXjIk2SBQORZUK73WXX7PK6h6g7xXJSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RUzQMoxJkpxyCoz0a2/sLQb1IVLhrCUgiaTIeCnSk4MWC9vT3OEIh8jCRWE4mCcgT
	 xnM9Bcwe4KEkZBsGphkk5RUH1kzegvjvo1HDSXewtMd9o6eTJylWendZlZM72Kg3DX
	 4lq0tFfubJiZtt92Hk/W4kd6dS+CbRK5DmhGbnrIy2uRedQmdeKPojrlkvu1GgdBYy
	 ttbhgX3KLVczbvuZX9rR/FcBg1vHg3gfmFuhD7xIyVeCtDUjX8BHEeq8Fyp08gepDK
	 X5DUVWEiG+hLMau2NQqaPgkN1vQvCKidO3SzXwSfQxTwpM1GJ++7IwnNfEgCrypvQi
	 7G8z+2aoh45yw==
Date: Thu, 27 Aug 2026 13:15:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: ljs@kernel.org, linux-mm@kvack.org, liam@infradead.org, rbm@suse.com,
	akpm@linux-foundation.org, luto@amacapital.net,
	brendan.jackman@linux.dev, david@kernel.org, liuhangbin@gmail.com,
	corbet@lwn.net, kees@kernel.org, mhocko@suse.com, rppt@kernel.org,
	shuah@kernel.org, surenb@google.com, vbabka@kernel.org,
	wad@chromium.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org,
	geert@linux-m68k.org, daniel@thingy.jp
Subject: Re: [PATCH v2 1/2] selftests: run tests on nommu architecture
Message-ID: <28939864-7a8a-4204-bf68-b53e77200f35@sirena.org.uk>
References: <20260825015945.141739-1-thehajime@gmail.com>
 <20260825015945.141739-2-thehajime@gmail.com>
 <ao2aTD1ZGObPfp4T@gremlin>
 <m2zey8ufh0.wl-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mrf2Wb1b1zm1oMZI"
Content-Disposition: inline
In-Reply-To: <m2zey8ufh0.wl-thehajime@gmail.com>
X-Cookie: Alimony is the high cost of leaving.


--mrf2Wb1b1zm1oMZI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 27, 2026 at 05:36:59PM +0900, Hajime Tazaki wrote:
> Lorenzo Stoakes (ARM) wrote:

> > >  		esac
> > > -		cd - >/dev/null
> > > +		cd "$OLDDIR" >/dev/null

> > Hmm, why are you changing this bit?

> on nommu we cannot use /bin/bash (i.e., no fork(2) so, we use
> /bin/hash, a busybox-offered shell with vfork.
> with this `cd -` (standards specified) isn't implemented due to slim
> requirement of that shell (I suppose, miserable...).

> thus this workaround.

It'd probably be good to have this as a separate commit with a changelog
explaining what's going on, it'll make review easier if nothing else.

--mrf2Wb1b1zm1oMZI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqQKkgACgkQJNaLcl1U
h9BXfAf9HIKrY3R1ifWbdQiCchDNja2ZvlJvk7WjJkdSkjVHJpNUyYWBr7iNXldP
uqe6h3Lxz5A01ehepxZw9SUHN3KJ7lFEKu4+nL1Mad5Ilj/fxLocolyYhzyo7sff
9rNiCZgNo7MTu3Fo469kifhj4gTzmkOVFmruROcRqHnsfEkRFA5jl0QG3SgGP+43
vlVLBlc3hLG9gmxOvnC3D5a3U2WdKvn35p8ZFZGp2zGSH0sAqNda1cx6tKul6r+k
zjOxyuuOwW4JjgUoBbRTXgyUziM/UFEYpffTFZ2fVH6rtOeS6cwJaCoAJ8xR2N/8
VpL8PDYd1CYUFKaaQFzI+zEMB095gQ==
=Em/s
-----END PGP SIGNATURE-----

--mrf2Wb1b1zm1oMZI--
