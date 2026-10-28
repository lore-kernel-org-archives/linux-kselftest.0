Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212302;
	b=yy6Cu8f3mX6+1zPz3KXPv6w+J62kpg5VHOxuIQ92lgCkMNUjCnYz8dnC/Bu/LjEbC2oB
	 tda+srOs0/ABu4/wbWKj+8pJ7mvn4nWSBmitEIu4q6buiCqUiPtfNm73baKQyIKvSuwZm
	 pIity4TeLaAtyh84Pj2O8f5RcKXCAhsfUOmls9cmunNB9JLcu8shytifrDY/QTZ0WnIv1
	 KGbmeE246tt3ym9dRwlMD3DUaGTILcRZ6wlGn9Klzz0ALOQiJBfFlXYTY1LormBGf/Evh
	 1bcPuF0NVndeRnEjQtrp6DTuoxQ9jYwsdl9TMXNQtoiXnFXtdHEBiYdub7/kFpAy3qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212302;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=AhGwMBlXb9QayOpoIgLMCOSWoppIw0OFkOZJ4bKojBU=;
	b=NMMgse7H6T7s8WbI8T/DH30TqXo8CmnXFJkkIfrLoZFzrv67nes+M6GA9QV2LUXdFtJl
	 4I3027dtU7Ies7UrqKfWfkRbdZdt1PlmjrGE57eOVAZ64oOatx5EQCEoRa9SZoxV5C/3v
	 pykbiS2HZthYyG0JvdBEwe3fBuLGE3vYtb+QTLzgoh3ao4D1ddclKEEVMDxZGHAwKdnKS
	 Tj9Qll+/2/Z0zMwIrR1f5w2V6x9Vn3HKcYiXJSHC5hyi6EOmclYf6JwmMZdVad8LEaDkI
	 /cNYBbH9BHLbyz8Y5mYIGHswnCP7CXvTtiqw1OxQ7LKwjTG/vk3+NwS7dMW18lr+ujg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zpmpp+Zq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE77606A326;
	Wed, 28 Oct 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zpmpp+Zq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC831F01825;
	Wed, 28 Oct 2026 18:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793212302;
	bh=AhGwMBlXb9QayOpoIgLMCOSWoppIw0OFkOZJ4bKojBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zpmpp+ZqiBhJDbBCqSiYhds7+OsBVknD16S19y+dM78X5O/2NLnnQRzQOLKxa8rGm
	 AWqo+psYcNkpxa6CU3ZqLQdv8kJ99QKbFsX9D4xU6HdBguei7iRkKuyf7kWDdnfHsV
	 OC4dqatLiE6pCPji5GpazeqoFSPDjfKBmCbiejFHseBoyEd+vz8vmZtKtXJWVO3u8G
	 CnT39zMnWqvR/Y6RjfoqHd4qyzplNXVVG1rCNuCzVBNR9OlXr4qENeCdlqU74jx/Gr
	 Wl5SPcdhBeHdJyjHOj78fuDRzRC7sKcwWhK/WpzEyj8isUevSlSjmE/yFsABpvz+lk
	 JtLqsxrGGZcUw==
Date: Wed, 28 Oct 2026 18:31:34 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Iv=E1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Deepak Gupta <debug@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: [PATCH v3 3/4] selftests/arm64: GCS must not leak on a failed
 clone3
Message-ID: <e87dc329-3f77-45bd-89af-c98551801658@sirena.org.uk>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
 <20261028154315.1272705-4-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EgSzcDImSQq/kPzv"
Content-Disposition: inline
In-Reply-To: <20261028154315.1272705-4-ivanrwcm25@gmail.com>
X-Cookie: Pushing 30 is exercise enough.


--EgSzcDImSQq/kPzv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:43:14PM -0300, Iv=E1n Ezequiel Rodriguez wrote:
> KTAP coverage for clone3(CLONE_VM|CLONE_PIDFD) with a bad pidfd
> pointer: sixteen failures must not grow the parent's GCS VMA count.

Thanks, this is a lot cleaner and easier to understand than the original
version.  It'd probably be nicer to do the refactoring of the existing
code in a separate commit but that's more nice to have than essential.

> +TEST_GEN_PROGS :=3D basic-gcs libc-gcs gcs-locking gcs-stress gcspushm g=
csstr \
> +                 gcs-clone-pidfd

We should update .gitignore as well (or merge the test into libc-gcs but
that's a bunch more work and definitely into bikeshed territory).

I verified that this fails with the current kernel and that the kernel
change causes it to pass so with the above:

Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>

--EgSzcDImSQq/kPzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmriP4UACgkQJNaLcl1U
h9BzNwf/fWeDVy8I0F3zpUZkbDWBz+B0NHeFLUK3At/UfT7hecHF42jNPNh3Xc0b
uZQr3+cver9uHhs6hWET4qJctAOzVU204Lc2PNA9Flr42rh8h8+MkwwoBwGZ0r3f
r78kAheb3Kt0vcKAZW6uISJLn5jW5Wf4RNxgh91OlNstBhasep2Bso5Oc6GuIBpG
mbX/7VW4hG9auddgjYFwLW7hxBPt2ktTN52xxWwPuvaUSShN6ymkddfN+FJFeGIm
axGOVeyLJGYFaZ/z93kpVAeO6SbO4+dvJJWdyGXHcrax1CUI9ACivl3bMEBehioB
T7NHKcS/pNoywh81iKvz7auWKzyETQ==
=XNL0
-----END PGP SIGNATURE-----

--EgSzcDImSQq/kPzv--
