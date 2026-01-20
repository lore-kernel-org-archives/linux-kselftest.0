Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C7B426683;
	Tue, 20 Jan 2026 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913028; cv=none; b=edEIV9g/OeMjLffydFA6OJWZ58BeadkWv/hTFc7hsCzpp9r6JPg9JRLsUnV/gaavv8sy8iczB40Ij/CzD+BRafosxJMQBJcwvVAODQdpbqi1j749UNGlIyUH+gLB5cfx1Rb6MoTgsXdboE+SizXDpwV4pvCX2q+Zm5BcfXUm13M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913028; c=relaxed/simple;
	bh=FwCCfap6ECVxvhkpXpxPP23hoWsWThddcKf0xfbldy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3ePqBQVXzH+1bFeffJweOk6uGr13twmRzc9S6QCk+FnwWjzn6jpZQmz52mg3TPmOaAnBRP+hWEZatLB9qJ4/awikd2yp/RylQVBGwzlfUO8qty8Zd0b/uyVM7lbDCnPBF1ghflM55jxc7q513N4wULBNsFkomcyNlLHyujT3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8LQgbEp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8LQgbEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321ADC16AAE;
	Tue, 20 Jan 2026 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768913027;
	bh=FwCCfap6ECVxvhkpXpxPP23hoWsWThddcKf0xfbldy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8LQgbEpfs4Nl4Jma3+64k1ZQRLIGhx/e806PWcsu5/0NZ9jN2XpMUo3Ir4390JBl
	 nkg0czB3x2dmuq/vAfUGUg9nY40lgFGKJzUk2/tOAgGE/Og9/vStnT22pqxJ3NbTJ6
	 YoBltDg+IspqpIrj/y+CuWH4Z9bvwqMy/4ZsnLYXHi8JgUfU9U13XCxZ8rsDB0e49e
	 EocpNTpzHDt4hcO9M58cFFKbIJQW7bn5XFu16idcASAqRsFbOjSdbDXXTuD4gDv89s
	 br71Ugz1/wvlficrYdetEuzwKy101jV9A5/7OBZxf0IticcSoSN8Q4Uqw543Hx+s1+
	 ObshJF2VO5esQ==
Date: Tue, 20 Jan 2026 13:43:43 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Alexander Atanasov <alex@zazolabs.com>
Cc: Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Clint George <clintbgeorge@gmail.com>, 
	Ranganath V N <vnranganath.20@gmail.com>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	libc-alpha@sourceware.org
Subject: Re: [PATCH] selftests/filesystems: follow std execveat argument
 convention in anon_inode_no_exec
Message-ID: <aW93WqpBspTwFiAC@devuan>
References: <20260120111008.442109-1-alex@zazolabs.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4j7phh6h2fh4ebkq"
Content-Disposition: inline
In-Reply-To: <20260120111008.442109-1-alex@zazolabs.com>


--4j7phh6h2fh4ebkq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Alexander Atanasov <alex@zazolabs.com>
Cc: Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Clint George <clintbgeorge@gmail.com>, 
	Ranganath V N <vnranganath.20@gmail.com>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	libc-alpha@sourceware.org
Subject: Re: [PATCH] selftests/filesystems: follow std execveat argument
 convention in anon_inode_no_exec
Message-ID: <aW93WqpBspTwFiAC@devuan>
References: <20260120111008.442109-1-alex@zazolabs.com>
MIME-Version: 1.0
In-Reply-To: <20260120111008.442109-1-alex@zazolabs.com>

[CC +=3D libc-alpha]

Hi Alexander,

On Tue, Jan 20, 2026 at 11:10:07AM +0000, Alexander Atanasov wrote:
> While compiling filesystem selftests there is a warning:
> anon_inode_test.c:45:37: warning: null passed to a callee that
>        requires a non-null argument [-Wnonnull]
> 45 |  ASSERT_LT(execveat(fd_context, "", NULL, NULL, AT_EMPTY_PATH), 0);
>=20
> Kernel code is okay to be passed NULL for argv, in which
> case it generates argv by itself inside do_execveat_common.
> Man page of execvat lists both argv and envp as _Nullable.

Yup; the manual page uses that to document that Linux accepts NULL.

> But system's unistd.h says different:
> extern int execveat (int __fd, const char *__path, char *const __argv[],
>                      char *const __envp[], int __flags)
>     __THROW __nonnull ((2, 3));

Hmmmm, this would trigger UB for user-space users relying on the fact
that Linux accepts NULL.  Maybe when compiled for Linux, the glibc
headers should remove the [[gnu::nonnull()]] attribute here.


Have a lovely day!
Alex

> (checked ubuntu 24.04 and fedora 43)
>=20
> Which is the reason for the compiler warning.
>=20
> Fix the warning by passing a proper argv array.
>=20
> Fixes: f8ca403ae77cb ("selftests/filesystems: add exec() test for anonymo=
us inodes")
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Alejandro Colomar <alx.manpages@gmail.com>
> Cc: Clint George <clintbgeorge@gmail.com>
> Cc: Ranganath V N <vnranganath.20@gmail.com>
> Signed-off-by: Alexander Atanasov <alex@zazolabs.com>
> ---
>  tools/testing/selftests/filesystems/anon_inode_test.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> Quote from execv's man referenced from execveat's:
> On Linux, argv and envp can be specified as NULL.
> In both cases, this has the same effect as specifying the argument as a p=
ointer=20
> to a list containing a  single null pointer.
> ***Do not take advantage of this nonstandard and nonportable misfeature!*=
**
>=20
> Listed as possible to pass NULL, then a big fat warning in the man page
> and a header that acctually marks this as invalid usage.
> I failed to find the origin of the above contradiction.
> It looks like POSIX/GNU/Linux missalignment.
> I am putting this here for the record. So may be someone could step in
> and make it right.
>=20
> I've Cc-ed people who made fixes but they are just compile fixes, no
> explanation of why the warning exists and in most of them the array is no=
t a proper
> argv.
>=20
> diff --git a/tools/testing/selftests/filesystems/anon_inode_test.c b/tool=
s/testing/selftests/filesystems/anon_inode_test.c
> index 94c6c81c2301..191549a4304d 100644
> --- a/tools/testing/selftests/filesystems/anon_inode_test.c
> +++ b/tools/testing/selftests/filesystems/anon_inode_test.c
> @@ -4,6 +4,7 @@
> =20
>  #include <fcntl.h>
>  #include <stdio.h>
> +#include <unistd.h>
>  #include <sys/stat.h>
> =20
>  #include "kselftest_harness.h"
> @@ -37,12 +38,13 @@ TEST(anon_inode_no_chmod)
> =20
>  TEST(anon_inode_no_exec)
>  {
> +	char *const argv[] =3D { "", NULL };
>  	int fd_context;
> =20
>  	fd_context =3D sys_fsopen("tmpfs", 0);
>  	ASSERT_GE(fd_context, 0);
> =20
> -	ASSERT_LT(execveat(fd_context, "", NULL, NULL, AT_EMPTY_PATH), 0);
> +	ASSERT_LT(execveat(fd_context, "", argv, NULL, AT_EMPTY_PATH), 0);
>  	ASSERT_EQ(errno, EACCES);
> =20
>  	EXPECT_EQ(close(fd_context), 0);
> --=20
> 2.43.0
>=20

--=20
<https://www.alejandro-colomar.es>

--4j7phh6h2fh4ebkq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlveH4ACgkQ64mZXMKQ
wqn6nQ/7Bl38gOlgYMs0LN0jSi7IJrpGZ1TfGLeXx4WDv0acP01Uq6UJj8EL1cTP
JlwurvcOJpgkcSRPQa79uuvFw1IbWXVUa1AKrItrFoRabf9cwvqUhZDKdoWol3am
RvFCCeVhzk5rlius7Uv3nMWCAiWNQi5R4rdDG8eWOisIh9om/h7HQOtUe7F7V5z1
8jXB9Ru3N9TNz7Uy71yQjOp4hlM1lcAWwE3dltm4srZR1TGkz1I208EA0Z/OMSml
TTPByZoXIFrg3I2BOHRae5hy6JWI9YsGEktw8HyAgAighT2PGtOvh0sagAw5VrLv
0HSLZXjH0W899xr6DtFnmqT2zl8M5dRYkELrIzlg3yWWNpq9KIFKe4zv/wMspoL+
3jV46Pvoh4hWEgzjYfzCdWLSbqT61utGnfxwnRKXhvkt+iUPZ/Lb0rhBv1IkMqD0
6hnSD3YJUJlhxWEHJtgrigAtvEhhd6eU+ukWqQNwj0rqkTsC90oPIw7rD1WGJL0v
+/CuLxG3BE0h8HdAIPoVonjKnQuRf4RBPBdof9bt8mZ9iW5eEap8PCuAqTmfmpPe
Jf+r+VWwRj71VSahymkbsSXwKr+0UO6FM0iNktkaG8Bo0qASBrTs6W8j6dKGeEnY
U6N4K9N3DZ+2AQz1jzx0/F7l4OSmZM/A3dDT8Bwkiai1zNs0OOM=
=6Has
-----END PGP SIGNATURE-----

--4j7phh6h2fh4ebkq--
