Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6C4576EA7
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961070; cv=none; b=DeLj9r1Lw9lR2w49fM+4jPHfQXWwaJDp6zI3XI6lpmlpdfmDu2w+12e2J6EWhyKiXAxKzJLtzew2287sz1t6ebEvcC65k4ecg+7BPsI3XadMWDuhXAbHS7LEGtcOTQ4J6IYasrwH803TtHyvPvBHV/Xi9y7EJU5n4+AHsEuKCT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961070; c=relaxed/simple;
	bh=c8s69uF6RIIg/jHSdzxsYQ7S8UDIf9cWpe1rBQgZpJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewmFMCJmjASqQRNxsXSPnlC9P0BZAQ97EdUr+BuIBJWlu6NkASscNOfORnWap4xF9asPDyonjogOMi8YSFBhvMy7Nf6+dhj/IFTJShDy7JjDCpfwryAvSkafb8kaYVYQ5QizFrO9Toasjv738e4fDV2WUp5Mqjb4zG9TsBv8RpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=ikNPSpOT; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="ikNPSpOT"
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DC3A63F91E
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 13:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788961064;
	bh=wrjcPeS70hvY/2jCIpdeC3QpRdoxkk0IP/UxQtFlPx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=ikNPSpOTBiWLUaQDtYVCdFKvB99c1QTWQXjtUxgIXdB0siNCT39pSZmULUKpussqx
	 FPZ4GMEtEkOClCEz7KO3BN4WnzvXXl9pqx+pnSViXl8EJ+aaXcW7DabU7jmonFN6RZ
	 hlzW3P+zGYgvQqsL1R56HVIUumdiH21iMnyv0sOzPdGpqMg5dV4an08mulOGsMzNMO
	 ZnrY+HMPGisB2L5//smE3YldTOvLhNbJWPJw2njpVxpID3anhOa+UCLsryWdCkRxcj
	 RJHBhQcv5gvr03m3i9G/13iUmY9Bq63ICFtlmSjPM6ylFxyigWvu+N6yJH7BXH1tcN
	 NRfRivoDumrouxtk6tXa9JNLutY/jAXieUIUePmwKRYj5TrQi9MLVoZ/jZDNMztHhx
	 iIkRod6wX7FWcCC7R+poNLKdKYHTAJ5X+Vdx6VI/87KhOyKmvMAfGS4HjR6NYC9Q8Y
	 Fa1a97O6fjbUDHuQpezIa6DXJc335UxbW7RwEX8KSg18DdCfAkcGl1xbT4KVm0Plxq
	 EI3HpHiDJGpsPYdqG+BCnxPI1JXMyVziLNkrRMMa8XhUU+2KFmd0unD1RjEpn8BHXB
	 ts7DaC8HZjgodaycLMiW/ya9HeqiUXfo/RUXfUOumN3eNQF2lIckCmdC9udzFyU2ih
	 DFmtR2aR54oip6GoqUuAnMF0=
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-482f763db88so3364653f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 06:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961064; x=1789565864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wrjcPeS70hvY/2jCIpdeC3QpRdoxkk0IP/UxQtFlPx4=;
        b=fTCjwXFpfZs5MG6eajCCgH2DvMFAJsH++lJL/bLaB4uYHcCQM+LTU40Jgo5UoveAV9
         mkz7SGJ66G+ubvkJG9enNmzZasKRrOM9EqA3oZXKLtwvofOcbJWw52HcV6Z7JlEpy4F5
         KztDG19l/f3BPe1OmBKkih8bQ9iYL7TqIFsSFKZlXVwwq/GZyEuJdTeHTkmIYzW8EOND
         pzdJeha1nXjqwLzasHsXxgVMlHzltLmPW1GbhedjwZJ+IjTHllMysh+2Yj6h+r8jbGOz
         +ZSOx+vf9akqR7FRhRe/VDUHLsHR59UgDG/GXBYImIVlNVlfKXx9TdVYv7XttLh5nPDq
         Onaw==
X-Forwarded-Encrypted: i=1; AKwUvBy+2OHrM685Y/rKLTeaVN0XRsdnZx4NJtKQjDhWzakHMtIaorqKhEzWKGW8wtnhvnJcaqlfgegY02xOKaCWVUU=@vger.kernel.org
X-Gm-Message-State: AFuF++kTuroXUGo8ERcMJqkuq8n/qD18/LrtLvWZ/jC5z1KHgQ7ZouCx
	w+1DElmmNWEL0QpjKOd73Wmb42ZCpyKirYTbM9UWTc4WKyTBMjm73t7HcMt5dYyo+10/nQWFFXh
	bqZYqz5fkC8uHzqZ/Sx4Rq4tOTfPDqbznmBHntOWx5h97VLXLrLN4bEWguCo8LVQrNfX5Oc971/
	CUSlPsIl9RSw==
X-Gm-Gg: AYBFou1QLYvG4T9FlySZYIa2TgkBKJsM5gZWrMxkNzyROGWcqtKGW1TiJmNj/MKrAAN
	8hXBy3qs+oN+y3zp41CnMDZ13flVIR3niNjIWF1tDnVyL0SLQcGdI3F24xRG5q1hfbKHpTqUO4H
	8f/Da6Xn7OwIrAHvs2azCjPUAWjPZTDpJl+EZNVEDOSTSfesJ75cUCKOzjhyyaEiOQ31qu9be5+
	YKBxitCmmW87d0lrc4grVDzIDE3G9/1du6zXSpkyAn5HIDSi3L5aiS5O/uxwDf2aqk429sGp7Wa
	I15Wb6O71f0YhrFc54nmfqDvGjofRsBbs4WOodJaXkCNMl7vECr+YZ9csEGJav6UEbBqid4qSS1
	Kq0niDBoRZ8jauRRyGT/SEjRWJAPTe/aO0qtWe/OIzmCkIdvm7XI0xdhlfM+VWf1daZ4Otw==
X-Received: by 2002:adf:e19b:0:b0:485:a46b:bc13 with SMTP id ffacd0b85a97d-485b30e56d0mr1667157f8f.0.1788961064232;
        Wed, 09 Sep 2026 06:37:44 -0700 (PDT)
X-Received: by 2002:adf:e19b:0:b0:485:a46b:bc13 with SMTP id ffacd0b85a97d-485b30e56d0mr1667107f8f.0.1788961063813;
        Wed, 09 Sep 2026 06:37:43 -0700 (PDT)
Received: from sprawlopolis ([154.62.191.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm46791526f8f.30.2026.09.09.06.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:37:43 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:37:41 +0100
From: Andrei Gherzan <andrei.gherzan@canonical.com>
To: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Kleber Sacilotto de Souza <kleber.souza@canonical.com>,
	Hangbin Liu <liuhangbin@gmail.com>
Subject: Re: [PATCH net 0/2] netdevsim: fix IPsec debugfs byte order
Message-ID: <aqFhJbNp5qqlehD0@sprawlopolis>
References: <20260908140325.13367-1-andrei.gherzan@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VLgbsStmR6asIkJ2"
Content-Disposition: inline
In-Reply-To: <20260908140325.13367-1-andrei.gherzan@canonical.com>


--VLgbsStmR6asIkJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 26/09/08 03:03PM, Andrei Gherzan wrote:
> The netdevsim IPsec debugfs file (used by selftests/net/rtnetlink.sh's
> ipsec_offload subtest) prints the SA salt and key in host CPU byte
> order instead of network byte order, because nsim_sa.key[]/salt are
> typed as plain u32 and printed directly with "%08x". This makes the
> reported values differ between little-endian and big-endian hosts for
> the same underlying key material, and breaks the selftest on
> big-endian (e.g. s390x), which hardcodes the little-endian output.
>=20
> A driver-side fix was proposed in 2022 but stalled in review: keeping
> the fields as plain u32 meant sparse could not validate the added
> ntohl()/be32_to_cpu() conversions.
>=20
>   https://lore.kernel.org/netdev/20220308135106.890270-1-kleber.souza@can=
onical.com/
>=20
> This series:
>=20
>   1/2 retypes nsim_sa.key[]/salt to __be32 (matching the existing
>       __be32 ipaddr[] field) and converts with be32_to_cpu() before
>       printing, so the debugfs output is now network-order on every
>       host, independent of endianness.
>=20
>   2/2 updates the selftest's expected output to match the new,
>       endianness-independent values. It depends on 1/2: applied on
>       its own it would regress little-endian hosts (though it happens
>       to have no effect on big-endian hosts, whose old host-order
>       output already matched the new expected values).
>=20

I forgot to add Cc: stable@vger.kernel.org to these patches. Should I
send a v2 for that, given patch 2/2 only makes sense together with
patch 1/2 (applying just one regresses the test on one endianness or
the other)?

> Tested on real booted kernels, both patches applied:
>   - x86_64 (little-endian): PASS: ipsec_offload
>   - s390x (big-endian):     PASS: ipsec_offload
>=20
> checkpatch.pl --strict and sparse (make C=3D2) are clean on both patches.
>=20
> Andrei Gherzan (2):
>   netdevsim: print IPsec salt/key in network byte order
>   selftests: rtnetlink: update ipsec_offload expected output
>=20
>  drivers/net/netdevsim/ipsec.c            | 10 +++++-----
>  drivers/net/netdevsim/netdevsim.h        |  4 ++--
>  tools/testing/selftests/net/rtnetlink.sh |  8 ++++----
>  3 files changed, 11 insertions(+), 11 deletions(-)

--=20
Andrei Gherzan
gpg: rsa4096/D4D94F67AD0E9640

--VLgbsStmR6asIkJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQvNqws+Dz7aX1cEEc7voa356t88FAmqhYSQACgkQc7voa356
t89CjhAAsc9ihP4BOFOtH+fWmOM5lVZIpAeuppSpPCB9czlRzrua64EwObXfFX7n
oG9uQUzx2p3UTY52038DFCCsmCVxKTMPbQvfLoevy1SUXlt3ZqGW7p/WoaPalozb
c1zLAj99KWyKE9YdFd1D5dEzsDJkilxX7CSD51JExDzwpqflugcpJyVJ6JUGe/B0
JSkg7FL6XMY6w2WBer6R53PxG+vCHqhLV4M+vObbysVFJyoEUCBV6aFcZHbdxRBj
FLw58vys31n8/6x8vC6n2jjdoYTaiQb/4Bh1JtdZfKIGDmIE7NQN1v0OU9Hgp+iv
6BebVhgAUI2SB5I8tj67VB7Dm6TndFci7R9xZFsBxwN5pZ9P/LcGSz2MviBZronM
P7QNFq3Kl1FnBMwYg/dwy5K0C+HSHBKX7sQCUW0zuokREsSmfzGJDzUP0hZ4oNY9
0KERXDISjbWkBMZGg+AAv7oz6oHgkXBHjU7u5cS98cxQhYLCipcEd48bm5tgZvh5
HfNWJ0AScmeTps6vwLMLfjj9+r/zO9nAhuUNNxsoHlqLGbxmsGMldd+e8xU/wOzg
tOjdOwiLuGwq6vTqci6sT9iuKf3yW9UTsJwG6qNCCUXgQ50vnIkY6siA2x1cfCK/
cSEomDAKcGTrB/zi3iWZyLZb9TxzJaqMfTjOJjR5/Z6uJLmJwEI=
=HvP6
-----END PGP SIGNATURE-----

--VLgbsStmR6asIkJ2--
