Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509413;
	b=ibsAeT9pqM8LSZogdiAOri5B6l71VASmcb2tF7uEAWv63GsNavY+9BZN9OCj7gbvMFhI
	 R5QSex1/k7symFD4AsSRHoXLHQpV21LFpGh5wIEETIknJE97zQ1Yc/qiQZVbB3tLzXpbc
	 wXzhZBk79sWXYUDP6KVsLnwssXJbjCofr32XpdDhhmXfnCcLTxG+2KzTUi3gBDu8GLbPP
	 d76XOqqv2ejNiLslFOSRhzM+J6jm3kCmUvYvU2neM13DpDJu8EKjqfMOq1uAJQsf6KOVG
	 ldNjiwxTcK6EVcd1i+ONDYqjxge/U3jJ+IBZjjGOio1Oh5TsjXXg5TCLfVjZXQCjJKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509413;
	h=Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:X-Cookie;
	bh=lwYbDAFnC+zU5jtpYjRFHdXQCyjjQIHBJfyMdgShgcQ=;
	b=O9v3mgaGe8SYmlvddgomHOmKaMJTdylIXGmkuIjSa7gHwvaRVvnlh9PkaAicXQ1+5yDq
	 8MzNYjJcOUrsEdoi6SqVF6gsbB0My9PZHr+DtNlQWvS1/kxcRfMwRw4QPL6+KLjAqJXen
	 JXZUaDXlSnb/OUfDkuOg5qL/IM7rtu3al18eFJ3xT5zLoDSx93hinPchTUaorlwvu0fz+
	 JEb1HlZ05SLDXpybhMvXnXA2wVd3gC14FAQF3PFIWbBL9bRJkqsvr4WZWmLaNwGdAI23n
	 i5K/s1oJJiopWy3zXOsycU4COqqc0p6pYjOeap3f20DSGtwrGb1UaDgPCG/a4ZSa5uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1174D606A31D;
	Tue, 20 Oct 2026 15:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727BF1F000C4;
	Tue, 20 Oct 2026 15:16:52 +0000 (UTC)
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id D00DE1CB0C67; Tue, 20 Oct 2026 16:16:26 +0100 (BST)
Date: Tue, 20 Oct 2026 16:16:26 +0100
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
Subject: Re: [PATCH 3/4] selftests/arm64: GCS must not leak on a failed clone3
Message-ID: <ateFyuJkEgL94Rvc@sirena.org.uk>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
 <ed22ebf64ed00a56d5e1eff31ac639fef00dcae6.1792179433.git.ivanrwcm25@gmail.com>
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
	protocol="application/pgp-signature"; boundary="fQdpgUNys5IVa7P7"
Content-Disposition: inline
In-Reply-To: <ed22ebf64ed00a56d5e1eff31ac639fef00dcae6.1792179433.git.ivanrwcm25@gmail.com>
X-Cookie: Whoever dies with the most toys wins.


--fQdpgUNys5IVa7P7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 04:46:02PM -0300, Iv=E1n Ezequiel Rodriguez wrote:

> clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer fails
> in put_user() after copy_thread() has mapped a GCS. copy_process()
> then calls exit_thread(). Without HAVE_EXIT_THREAD that free is a
> no-op and the VMA stays in the parent's mm.

> Assisted-by: LLM

This is pretty hard to follow, there's a lot of open coding, duplication
and strange structures or tests.  It makes it hard to follow what's
actually being tested and why which is going to be a maintainability
issue.

> +/* Same value as KSFT_SKIP in kselftest.h. */
> +#define KSFT_SKIP		4

Why are we not just including kselftest.h?  It doesn't have the fun
interactions with libc headers that some of the other things have.
If we are going to cut'n'paste values why only KSFT_SKIP and not any of
the other exit codes we use?

> +/* Same wrapper as gcs-locking.c: extra prctl args must be zero. */
> +#define my_syscall2(num, arg1, arg2)					\
> +({									\
> +	register long _num  __asm__ ("x8") =3D (num);			\
> +	register long _arg1 __asm__ ("x0") =3D (long)(arg1);		\
> +	register long _arg2 __asm__ ("x1") =3D (long)(arg2);		\
> +	register long _arg3 __asm__ ("x2") =3D 0;				\
> +	register long _arg4 __asm__ ("x3") =3D 0;				\
> +	register long _arg5 __asm__ ("x4") =3D 0;				\
> +									\
> +	__asm__ volatile (						\
> +		"svc #0\n"						\
> +		: "=3Dr"(_arg1)						\
> +		: "r"(_arg1), "r"(_arg2),				\
> +		  "r"(_arg3), "r"(_arg4),				\
> +		  "r"(_arg5), "r"(_num)					\
> +		: "memory", "cc"					\
> +	);								\
> +	_arg1;								\
> +})

Factor this out.

> +static void on_fault(int sig)
> +{
> +	static const char msg[] =3D "[FAIL]\tparent guarded control stack fault=
ed\n";

This isn't KTAP format.

> +		/*
> +		 * An empty GCS leaves GCSPR at the exclusive end. If
> +		 * the next VMA is contiguous that address is also the
> +		 * start of the next range; prefer the mapping that
> +		 * ends here.
> +		 */

I'm not clear what you mean by exclusive end here?

> +static int skip_enable(long rc)
> +{
> +	if (rc =3D=3D -EOPNOTSUPP) {
> +		printf("[SKIP]\tkernel has no GCS\n");
> +	} else if (rc =3D=3D -EINVAL) {
> +		printf("[SKIP]\tkernel built without GCS\n");
> +	} else if (rc =3D=3D -EBUSY) {
> +		printf("[SKIP]\tGCS is locked\n");
> +	} else {
> +		printf("[FAIL]\tPR_SET_SHADOW_STACK_STATUS returned %ld\n", rc);
> +		return 1;
> +	}
> +	return KSFT_SKIP;
> +}

This feels rather contorted, and ends up returning a raw 1 from main()
rather than a KSFT_ exit code.

> +int main(void)
> +{
> +	struct sigaction sa;
> +	struct ss_span parent;
> +	void *stack;
> +	void *bad_pidfd;
> +	unsigned long gcspr, gcspr_mid;
> +	unsigned long gcs_mode;
> +	long rc;
> +	int pidfd;
> +	int vmas0, kb0, vmas1, kb1;
> +	int i, kept, d, cret;
> +
> +	setbuf(stdout, NULL);

There's also setvbuf().  Using kselftest.h and it's helpers would
probably be better, it takes care of disabling buffering.  I can't see
any reason to avoid that.

> +	gcspr =3D (unsigned long)get_gcspr();
> +	if (!gcspr) {
> +		printf("[FAIL]\tenable left GCSPR_EL0 at 0\n");
> +		_exit(1);
> +	}

Why are we using _exit(), and more of these raw 1s?

> +	gcspr =3D (unsigned long)get_gcspr();
> +	ss_scan(&vmas0, &kb0, gcspr, &parent, NULL, NULL);
> +	if (!parent.start) {
> +		printf("[FAIL]\tGCSPR %lx matches no shadow-stack VMA\n", gcspr);
> +		_exit(1);
> +	}

Why is this something we're validating, and how do we expect to be able
to do function calls if it is the case?

> +	if (vmas1 !=3D vmas0 || kb1 !=3D kb0) {
> +		printf("[FAIL]\tleaked %d shadow-stack VMA(s), %d kB\n",
> +		       vmas1 - vmas0, kb1 - kb0);
> +		_exit(1);
> +	}
> +	if (!kept) {
> +		printf("[FAIL]\tparent GCS %lx-%lx was unmapped\n",
> +		       parent.start, parent.end);
> +		_exit(2);
> +	}

Why are some failures exiting with a different exit code?

> +	if (d !=3D 17) {
> +		printf("[FAIL]\tparent call/return returned %d, want 17\n", d);
> +		_exit(2);
> +	}

=2E..because?

--fQdpgUNys5IVa7P7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCateFxwAKCRAv73Ows9A4
iV7CAQCkMVFZ4IBfyU74fiWba6+YvlaiDdY46+hou1OQsUgQ0wD+OKvp47h6ILRv
YrtzWYolE5nx/q9ILHnbj4r5mQW6eQk=
=Buc7
-----END PGP SIGNATURE-----

--fQdpgUNys5IVa7P7--
