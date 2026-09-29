Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62B23F4DD9;
	Tue, 29 Sep 2026 19:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709865; cv=none; b=cCuubDEgAT3kCpDun9xCkKGlll3qovPc9mzG+20sUHqABAaq+Jmd+a+GptdswCmawHF6VcT7pLJ4QJw5wvHM9n+KlntlYyDedQWhvYq6rEGpsbA/Y5SWNx5YGX8hvMdPDLo5j2GTuBQBEtinFDLtYvtaVkuZ1YJZ/lZ5jhlSF1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709865; c=relaxed/simple;
	bh=QbK+E8OtIzF32QonND+KHJdCfdBfayxRrD0iDnQSt0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddmxKqsF4sbZeUiar+aTvU+Y5vm5zeCIXLiFjt3H98UTOkKJbVorGlPWHngbjNRSyWvRPkqqhKyQ1ZRrw9p9nWLHPJ3hlDWCU5bWtm9fcxuzUw8EqECKrkg9a6LgEnb6mtIQNnhRgFSJD1oZqUnijR9yia12tSvhAA1zqeVB9yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLeVPkRh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLeVPkRh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A9C1F000FF;
	Tue, 29 Sep 2026 19:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790709863;
	bh=+4lcFV7BWlJxo0mkhLOYTkZFGAJFfiTavqhBD4KO1lY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FLeVPkRh1a34ogB9TpRqthY2RcbpuPqQsAGNc8EBMC8NIGvoauZPvtJdN18aNpI85
	 m5+apCTFoKPSgyD80h3yqAunUkZBSHhpsRtktMeQU6PmoV9plQ7nxsmRnEdZpzeITd
	 iuw7p12XnIonSLvhM0cCedPFuSbrmDNrcnUJJ6ZkbtgzLKV3vq5Rk8YPLs3Zsj2Tem
	 vtYbJG/7wRtE8fsTUkKYkWlHUVEShd1dUSTrq5K+X+n/Dn2Af17dIsj1rG6KW+RDD9
	 UFRZdZ7Avco2qztl/Zdyx7lN7s5vlRb0NWHXIq+UPEs1nanv/2dE8haepp2+acg6/1
	 +FekM+w1yBvmA==
Date: Tue, 29 Sep 2026 20:24:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Radim Krcmar <rkrcmar@qti.qualcomm.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	Andy Chiu <tchiu@tenstorrent.com>,
	Florian Weimer <fweimer@redhat.com>,
	Peter Bergner <bergner@oss.tenstorrent.com>,
	Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
	Mark Harris <mark.hsj@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>,
	Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
Message-ID: <20260929-operative-anointer-7f54be845b54@spud>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
 <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
 <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
 <70a3451c-db31-41d0-af9d-8c9e123557f6@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rW7jw50OZvM/1nk9"
Content-Disposition: inline
In-Reply-To: <70a3451c-db31-41d0-af9d-8c9e123557f6@canonical.com>

--rW7jw50OZvM/1nk9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 06:30:49PM +0200, Heinrich Schuchardt wrote:
> On 9/29/26 17:12, Radim Krcmar wrote:
> > 2026-09-24T06:38:17-04:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
> > > On Mon, 21 Sep 2026 16:24:53 +0200, Heinrich Schuchardt wrote:
> > > > On 9/20/26 09:18, Guodong Xu wrote:
> > > > > [ ... ]
> > > > >    	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
> > > > >    	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
> > > > > +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
> > > >=20
> > > > Hello Guodong,
> > > >=20
> > > > The RISC-V Unpriviledged ISA specification has this description of
> > > > extension B:
> > > >=20
> > > > "The B standard extension comprises instructions provided by the Zb=
a,
> > > > Zbb, and Zbs extensions."
> > > >=20
> > > > __RISCV_ISA_EXT_SUPERSET would imply that something else but
> > > > riscv_b_exts is in B. But such an extra seems not to exist.
> > > >=20
> > > > So shouldn't __RISCV_ISA_EXT_BUNDLE be used here? Some code further
> > > > change may be needed to set extension B if riscv_b_exts is fulfille=
d.
> > >=20
> > > Thanks for the review. Intentional, and the difference between the two
> > > macros is whether the extension gets a bit of its own.
> > >=20
> > > __RISCV_ISA_EXT_BUNDLE carries RISCV_ISA_EXT_INVALID as its id: parsi=
ng
> > > the name only sets the bits of its parts. That fits zk, zkn names, wh=
ich
> > > are shorthands with no identity of their own beyond the ISA string.
> > >=20
> > > B is different: it is a single-letter standard extension with its own
> > > misa bit (in the same way as A), and AT_HWCAP on RISC-V is the bitmask
> > > of exactly those single letters, so the kernel needs a bit for B itse=
lf.
> > >=20
> > > A is declared the same way; with the spec defines A in the same words=
 as
> > > B. If I can take that as a precedence.
> > >=20
> > > IMHO, "superset" in this table means "also sets these subset bits", n=
ot
> > > "contains something extra".
> >=20
> > Zba, Zbb, and Zbs are equivalent to B for our purposes.
> >=20
> > Are we sure that B will always be listed in the ISA string when Zba,
> > Zbb, and Zbs are present?
> >=20
> > We could incorrectly lose RVA23U64 bit otherwise, and I think this was
> > Heinrich's concern as well...
> >=20
> > (The "A" extension has the same issue...)
> >=20
> > Thanks.
>=20
> If Zba, Zbb, and Zbs are present the kernel should set the B flag in
> hwprobe. This is why RISCV_ISA_EXT_SUPERSET() cannot be used to describe =
the
> B extension. RISCV_ISA_EXT_BUNDLE looks more appropriate but may lack
> functionality.
>=20
> RVA23U64 looks like an RISCV_ISA_EXT_BUNDLE() to me, too.
>=20
> Unfortunately these macros are not properly documented.
>=20
> It would be helpful to first align on the meaning and usage of the macros
> and document them properly.

The intended meaning was "bundle contains no additional features beyond
the components" and "superset contains additional features beyond the
components".

IIRC the reason for differentiation between the two was to simplify
things in the kernel and avoid having code which requires y feature checking
for "bundle extension xyz", because firmware might only set "component
extension y" and therefore get a false negative on support.
Probably ditto for userspace parsing /proc/cpuinfo, since I don't think
hwprobe existed at that point. The things that are using superset now
don't quite match that, because some extensions have been retroactively
changed by RVI to match the bundle definition (due to new extensions being
created for subsets of an existing extension) and superset was used also for
the xlinuxenvcfg stuff.

At this point, I think we could probably just cull the differentiation
entirely, retaining a macro called "bundle" that has the behaviour of
the current "superset". People should just know to check the minimum
required extension (that's common sense surely?!?) and the kernel will
always propagate support down to components. This is at least the 3rd
time recently that I have seen confusion over what each is supposed to
do.


>=20
> ---
>=20
> The benefit of an additional hwprobe flags for B is limited. When I want =
to
> check for B I can already use:
>=20
> RISCV_HWPROBE_EXT_B =3D
> RISCV_HWPROBE_EXT_ZBA | RISCV_HWPROBE_EXT_ZBB | RISCV_HWPROBE_EXT_ZBS;
>=20
> if ((value & RISCV_HWPROBE_EXT_B) =3D=3D RISCV_HWPROBE_EXT_B) {
> 	// Hurray, I have the B extension.
> }
>=20
> There is more utility in the RVA23U64 flag because it combines values from
> RISCV_HWPROBE_KEY_BASE_BEHAVIOR, RISCV_HWPROBE_KEY_IMA_EXT_0, and
> RISCV_HWPROBE_KEY_IMA_EXT_1.
>=20
> Best regards
>=20
> Heinrich

--rW7jw50OZvM/1nk9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarwQXwAKCRB4tDGHoIJi
0gsNAP4zCeyU0ECIOLqFYp7eKcSULXfObTdh0pHUxJ7mwe9PCgD9HL3G732aWACU
0okpHhU7u0xbfNAkhsrFUz0MfF4L9A0=
=Sl5P
-----END PGP SIGNATURE-----

--rW7jw50OZvM/1nk9--
