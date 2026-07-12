Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44DD2D7DCE
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783844330; cv=none; b=pPxmi1ihzXd534yC/BdQGzSeU878JxwoB3FSG8chctvZ/OxvnN6a5oCQPzHfWjAwraO1mCH+WctB52OwAPQ5ptLSUGb6aN00P+Bs7OGw6fgNgrBYtBc2u3AivEAyVuFqc+nImxL7yvmWMftQpC1KvrPvM/JV+q0kgpEoCBSv/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783844330; c=relaxed/simple;
	bh=C0pyjdZQVqwifoHGIzoK0dwOSIun05ofQhgr9y/iY4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsQd32jgL7yju+gBX4TN0v498nYnnEIFHlpu3qugeL0ljgY/IDDv1qvQlHjMON0ZQ/R7IgGX+xlwyYrLsEUYpCkE8eiuiNGlc5yj15x/kQxuzuwLPy+DIOPZDYVfEUjg+rO6Fj44wBD0AZyJ7xq/eJ9pSgQfSesMTtAcZLC1HjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MEWiPyFZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MEWiPyFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=75ub
	1ZjyI5OqaXxEVT5ISZjS26avsE+iZDfgKAY2wmI=; b=MEWiPyFZReTMXRGm7PFx
	UAN7gc7KMbteSgPEbjknxZb0LxdTJfKcaEdeG/tgDSGFMppT27TlRwK9cwUY1kCc
	NGonQ64FNlF1J7BLQfWDyMiRjHEG1fpQcFIxKDLz3/sm0oKMttv/KmYzxI6km0Yz
	UOvWtRw0SbCRJXPXULRzCX2ZZ6q5iggbrmgMg2I3EDviohXYq89JBMmQc+nXx/79
	4rYtvtbLjZGnSZa9w2HWetUNOWFkWipRA5/+dzzMxwI44Zz+Ut8xlJg3Faxhyre+
	j3hZh7RZlcaPa8u0YCyJA1kzmB53uVHRb0nOCvVrau3FSCB7RQQpbxPumiyilfJo
	TA==
Received: (qmail 2160944 invoked from network); 12 Jul 2026 10:18:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2026 10:18:46 +0200
X-UD-Smtp-Session: l3s3148p1@w/lmn2VWvskujnun
Date: Sun, 12 Jul 2026 10:18:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 0/7] clk: Add support for clock nexus
Message-ID: <alNN5qxBJ4EsB3Li@shikoro>
References: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZVqbSNm8t340mGQs"
Content-Disposition: inline
In-Reply-To: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>


--ZVqbSNm8t340mGQs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Miquel,

> Then there has been a bigger series (including patches for other
> subsystems) to show the big picture, but let's split again and focus on
> one subsystem at a time:

This is a good idea IMO. Sadly, for this series, I won't have time for
review. If you have a branch available for testing, I could provide
test-tags, though.

Happy hacking,

   Wolfram


--ZVqbSNm8t340mGQs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpTTeYACgkQFA3kzBSg
KbYtZg/+On4LkPUnhbxowGKevVHFnDhdpxRu9+Dthux7ECfGg1j+ojbarCC1oSQ6
igQgK4wFWWN3sjYUykr3lvwaEovz6/nlRKK8Gg3XGF6VBKJaIr2XEom0NucteEKb
NEWztJ6SXfg2s9osPXrheMjBAFPC514tOEzHKa6zSkNY3szh5PyNa2kkt2nf7+yq
elV7uwKnbGn7jqhvGa1bsKG47y6IcnTMva8BFfXPJHfGeoNOp03ZjsuBLbBoIT4h
QdUxz5Za4tbcLAl12EqAAMgw/as0T9XyAGAs5PCD6d+3QS9BAYLhSrICm+IB4a75
HZJP2CQhaBTYvbKgcPK8tWxENUN0F/Go+Duu1BJqyQLsnL1tPYxd7CkY2goNX5fe
4oWOPsArOyD62/LH2shDesXE6nIyG+49Ku3sz4DK2BckOXkNnTRGEhtdHs9x8y3G
Cb7y+bOq7CEv3NeS21pw8g8ob9JjXdyPS4kFKqgTUn3FAgV/BaoJ6wtQZ1NXULKo
z3en5KXa7pg9V68G6qUPOGZNydNpFB1lyqXEGX6dQcwzIYCTbHc6AJNUTQZbiibd
PYmnknRdhR2eZVqPQHpk1m0zC+YYuDHggZpo+gSeYE1ka7YV5DIDJE12EPdZaoVj
pT3/0Hzm89T9SonggBakW9PbhpVqQjOX3CCH4VtDKOe/cpv9yWg=
=3krj
-----END PGP SIGNATURE-----

--ZVqbSNm8t340mGQs--
