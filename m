Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1F33382F3;
	Fri, 17 Apr 2026 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776425071; cv=none; b=UqprxvOOyCu4OvsdK1njB15g/JTfIkrPk1gdgTj2uMZ61+z6m1XUnsqvyGm13h2nfb5feiRHa6f6ktyNNCm1PEd8SketHvltHWouCntXuVc1VbB5LmDAqzjcMLxMqjPhpGZG0Cl26pbAQx+fgtBkOmPbQLN7KPxPHyY/KTI0xco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776425071; c=relaxed/simple;
	bh=L6qitQy/q2D5JdYnKYv/Txw+aDlW8qjnq+Ex/xEZJBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvVn4BkMmgO7nrfveInVwRN8j0dEHg8KWnDYZBIkqCe9Vi324pQ3PAgCYSbxTw9wo8bNuVSNvu5r3L7HLd+mI11YI2ozEmVfgxBY5aJuFduYdnxLWr04VGUJzU0AykCdRF57Sl7YiHkUsmUD/ZCjdR6w3H6swIPH1OZbXq9S6WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BmmCFImz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BmmCFImz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D8FC19425;
	Fri, 17 Apr 2026 11:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776425070;
	bh=L6qitQy/q2D5JdYnKYv/Txw+aDlW8qjnq+Ex/xEZJBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BmmCFImzd8rfQeHh6WEjrihCh1bJMjsCsqipim0MpJH3fREzC2oiN+B7ekS3HF6zk
	 o+EfCbNjbyQJqJg5ns/kRppBMsQGjjP3QXiImsMVaDj552nTiUUAqj8mko91YWwNcs
	 V5R/WgOxvQ2d6hGRrnWCChbcaKdVQEIOvWmrs44+zIJ9TyqHpMqpWmxdzYvTRMV836
	 C+ybj+CkhaTwhs+7UK9ysXriW5tkSMu74FSmXXzGORRxQjcIBIb7I+Gv6iH8ifZmz3
	 CvQUTwh2c8dvFG86D2ylkfhpvSXn4mgVM2z3bt5rR/hstnHcrGTt2e/OsZ8kyIn2VJ
	 AqUX3+B4MYjVg==
Date: Fri, 17 Apr 2026 12:24:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Aishwarya TCV <aishwarya.tcv@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Specify requirement for
 PROC_MEM_ALWAYS_FORCE=y
Message-ID: <8260f624-7ed8-4766-8f80-0d0d4dbb5cb1@sirena.org.uk>
References: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
 <17ea54b2-d43f-49a9-9dd4-d2330a8daa92@kernel.org>
 <5357ef55-15c0-4c66-867d-898fa7f51414@sirena.org.uk>
 <aeE4XSuXY8RfphVs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rurjnzOyeXujEi3i"
Content-Disposition: inline
In-Reply-To: <aeE4XSuXY8RfphVs@kernel.org>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!


--rurjnzOyeXujEi3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 10:28:29PM +0300, Mike Rapoport wrote:

> But sure graceful skips are better than failing the entire tests. Would be
> something like this:

> @@ -622,10 +621,17 @@ static void test_prot_none(void)

> +	mem_fd =3D open("/proc/self/mem", O_RDWR);
> +	if (mem_fd < 0) {
> +		ksft_test_result_skip("opening /proc/self/mem failed\n");
> +		return;
> +	}
> +

The string reported in ksft_test_result_*() is the name of the test, it
should be the same name as is used for pass or fail.  This is used to
correlate test results between runs.  The error should be logged with a
separate print, in this case ksft_perror() is probably a good choice.

>  {
> -	mem_fd =3D open("/proc/self/mem", O_RDWR);
> -	if (mem_fd < 0)
> -		ksft_exit_fail_msg("opening /proc/self/mem failed\n");

Yes, this is a preexisting bug in the test which I see there are more
instances of :(

> --- a/tools/testing/selftests/mm/mkdirty.c
> +++ b/tools/testing/selftests/mm/mkdirty.c

>  static void test_ptrace_write(void)
>  {
>  	char data =3D 1;
> +	int mem_fd;
>  	char *mem;
>  	int ret;
> =20
>  	ksft_print_msg("[INFO] PTRACE write access\n");
> =20
> +	mem_fd =3D open("/proc/self/mem", O_RDWR);
> +	if (mem_fd < 0) {
> +		ksft_test_result_skip("opening /proc/self/mem failed\n");
> +		return;
> +	}

Same with mkdirty.

--rurjnzOyeXujEi3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmniGGgACgkQJNaLcl1U
h9Aq9wf/YXGg0YC6URYjkBzqhPoqyKQtnKLLfLCjk3ZQsGUUQx92Cn17KGkNoADf
FX1mnlXc8YTLPO/u6fu86GDV9oeOBcE7+fQMiZ+UrGyt8weNg/V2AtZv+YkuOYrs
aWxdkzKkriB8c3NHFOKmAondmg8Syjv6dVwbmYZsZksrxIdaWXGoFA6FPvvnKl0N
YAZiWW0RkYB9RgO2zpEMK1icVTnDe2CoqcOglDK1BRF2VVx6j9ZLCkKUdThMH5GS
CQ0u7m+67zxC0Qxsb3Pv5OWOEkqxD1AAspjnzfYxC9rd/di5Iav0mBLaq8CHoL2R
cCjF3smz2rEIo1gxF1JpjKLDLMQ+nQ==
=kWZG
-----END PGP SIGNATURE-----

--rurjnzOyeXujEi3i--
