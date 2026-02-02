Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61F3233128;
	Mon,  2 Feb 2026 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770048945; cv=none; b=Jw554mK0IH/4bXyapvs6dddwhvieErMrVbnNDbk9dffMqeOauVLBP88uZPMIlfWknE8MBi2ikBmue/0328+DZJCOF2MWTHnue/u+MKEOc4ByRXhB2OFz07DDevj4eAlarZ0ZsZw4eQk5kxei3iHEMFH5dBCkSXuMLyIRMRssC/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770048945; c=relaxed/simple;
	bh=ei22QOb+q/8HXhX8zmTOT+RphBhmkDDnCnWON1zXhvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lqs6a7RJQUKxx4jBhDiumwW/gfQj6IJkR9bbdXw46ElEL5IjUoUJ7XItxfR03g5I+VXTl2SN4nCxnD4EyEMJ+9x90ojMSi/EA0ahVrV8SXYzGJYmDwWQrYCjI6PoiVia5fb9rKoqiR7eORcqet99y43WkCDBDAYD1/r+3T02P/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkatxLBH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkatxLBH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D0CC19422;
	Mon,  2 Feb 2026 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770048945;
	bh=ei22QOb+q/8HXhX8zmTOT+RphBhmkDDnCnWON1zXhvI=;
	h=Date:From:To:Cc:Subject:From;
	b=UkatxLBHmOAoIfWfRg6Hbn4+8pewTAnH8tM1zDbYonnapT4jstvd55lJqM69XCuVI
	 yzhiUHssg/c5f4+xSjWEg4/cnXPymUR//yTuzKnXn2oEQ5s5QQeakQ2geygmDc5wVE
	 N8g16+A06CmwveWLNcqW5qKxxQIWRdSD4f8JrSW4oAbXHSrznT3kWK5UJeHZmcmgA1
	 pwHX0jZHsLZTQJkqfPyCVyaKzF4UKQ623E5d9ahKZM9+GWXO777ILR0jYJg0vIULM7
	 IaF5UAG7N4BNuzL0q5X3r9MEqwYV8QWqI0uh+Rfs5Xs8bscbjtXD7NJYMNSpo+/Ek+
	 5t9kSb8houlDg==
Date: Mon, 2 Feb 2026 16:15:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: linux-next: Tree for Feb 2
Message-ID: <aYDNrCLRYulLfYH2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qbBOzscy82TlVFU4"
Content-Disposition: inline


--qbBOzscy82TlVFU4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have an added a KUnit intermediate build and test.

Changes since 20260130:

The mips tree acquired a conflict with the at91 tree.

The fs-next tree acquired a conflict with the mm-hotfixes tree.

The mtd lost it's build failure.

The drm tree acquired a conflict with the origin tree.

The ftrace tree acquired a conflict with the bpf-next tree.

The apparmor tree acquired a build failure, I used the version from
20260130 instead.

The iio tree acquired a conflict with the tip tree.

Non-merge commits (relative to Linus' tree): 10258
 9963 files changed, 578007 insertions(+), 213177 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 405 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--qbBOzscy82TlVFU4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAzasACgkQJNaLcl1U
h9BDGgf/U8iThYg3pCdtNbFDtnRJZYxff6KnUNtwaBMh/2L3AStR/qbMCvNqY8Pv
9VeOA/ykDxKW1VPwzMtEJe04nGxukr/0d8dbcUTzJfavooNJPrDgC+DGefuqUuXf
3Bdfc3k57hgKd/ZsZpLmWYOBt6JY2Al0e36/Ql7dvkuukgtMx+BfJoPc5g147Uk0
cCnOudZ15AFbxxXTEKEXT+XDaPXnb/H0iJzUP25NeR0xFgkQy1GYsn7jyfcNVXY3
0zF7LK5JdOy+A7V4Hfld7IcACBhlzEq/7V6OFuRQZF4ebNYPJLlQf3r4KaJTQQPg
nl1E6YoSVrLStfbOOHQYYH4Bu7AeJg==
=0Rh3
-----END PGP SIGNATURE-----

--qbBOzscy82TlVFU4--
