Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFBB3F660E;
	Mon, 27 Jul 2026 20:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183224; cv=none; b=fC6QWmiy5x6Lhe13Z93D+TFkjQutmHsDM3gIgGjsrQqFXQ8fsDcQbcOn84Rw3PhEnh/Lr1/MapsRXp7QxgMs4REwOfNN0ufPRtuJflrOirvj5t0WJ8beLHS5OE1p5lWO61KSXaKg0a/Xcy2jhJJmFxxfq6QuxRGQf7kQwtDj7sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183224; c=relaxed/simple;
	bh=0Z6OjSTjBV5JVwkgDOnkOZjFswa0zAQO2YBIbZjfC2g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cA1pPN/4QDlpWkSFHBeN0ZM1EKg3oOkWzImgxo9HY9YKVkvlVCE4M88fgcNtTxnwtAOJ6w1QwlYEk6DjURDjeO46QGDkIjMk+MJpHF6+Zfmu/iFbU7xz0RwhJOiHVXYf7Mz0xehjLtOKmyFN3r+VtCNYf6IfJj+b3aybEZvIlyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gmotl2yD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gmotl2yD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F4B1F00A3A;
	Mon, 27 Jul 2026 20:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183223;
	bh=GTtEbAHh3aBmvWEykjwis5Eq2I2yhOgePqdSNTFsv44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Gmotl2yDIWSfNfeoaZNBJ8P95dPwVJmMLS9CgvcVd3+pZplKlxr7E8kDiUpMeq6X2
	 obl1rnbEJw9+vvESUnUIUoMK28sQLi7zx86EIEYESSBHRHEyrPq0x1bSUBWu9b/3kO
	 +hsrgl8K6o6aVWRjZsq6kNjeD5QFU8ktd4toTKVTvYHlulefK8ux3yqeQjKBejKmnG
	 U7Vw4RHWadf+cemivo/BLuu6moeSRyCS9koEbzLQDSazz1QvurrdKsOlfRhz5L70Ci
	 jX37KlNM4dIT7H1MIYvDN3UuiDTt2iUSfMRuYpgaSS5bORaogT+eyYiw/CcHQtSGRt
	 nV1YZmslxbX3g==
Date: Mon, 27 Jul 2026 13:13:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Arthur Kiyanovski <akiyano@amazon.com>,
 David Miller <davem@davemloft.net>, netdev@vger.kernel.org, Richard Cochran
  <richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni	 <pabeni@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Miroslav
 Lichvar	 <mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Wen Gu
  <guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Yonatan
 Sarna <ysarna@amazon.com>, Zorik Machulsky <zorik@amazon.com>, Alexander
 Matushevsky	 <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>, Matt
 Wilson <msw@amazon.com>, Anthony Liguori <aliguori@amazon.com>, Nafea
 Bshara <nafea@amazon.com>, Evgeny Schmeilin <evgenys@amazon.com>, Netanel
 Belgazal <netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>, Benjamin
 Herrenschmidt <benh@amazon.com>, Noam Dagan <ndagan@amazon.com>, David
 Arinzon <darinzon@amazon.com>, Evgeny Ostrovsky	 <evostrov@amazon.com>,
 Ofir Tabachnik <ofirt@amazon.com>, Amit Bernstein	 <amitbern@amazon.com>,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, Bjorn Helgaas
  <bhelgaas@google.com>, vadim.fedorenko@linux.dev
Subject: Re: [PATCH v5 net-next 1/7] ptp: Add ioctls for PHC timestamps with
 quality attributes
Message-ID: <20260727131341.17cfe4b2@kernel.org>
In-Reply-To: <bfa3af6b673f3edbec63d2fa13073eabd86522d1.camel@infradead.org>
References: <20260717065924.2556-2-akiyano@amazon.com>
	<1a5c0883140d470657b2cba24b964f5ce71b9a15.camel@infradead.org>
	<2a042252-3225-4cd6-8301-8865bc07a387@lunn.ch>
	<bfa3af6b673f3edbec63d2fa13073eabd86522d1.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Jul 2026 14:32:23 +0100 David Woodhouse wrote:
> > > I hate all this line wrapping, btw. I'll defer to the net coding style
> > > if they insist, but my preference would just be just to have longer
> > > lines. Especially when it's a block of assignments like this, the
> > > wrapped form is *much* harder to read. =20
> >=20
> > This is a long function, probably longer than the coding style
> > suggests. So one option is to move the code within the for loop into a
> > helper. That might then allow unwrapped lines?
> >=20
> > That is kind of the point of the line length limit, to make you break
> > code up into lots of small functions which do one thing. =20
>=20
> Huh? Are we looking at the same function? The version of
> ptp_sys_offset_extended_attrs() I'm looking at, having fixed up the
> gratuitous line wrapping, is about 60 lines =E2=80=94 none of which are w=
ider
> than 100 characters. It's a simple setup and then loop over n_samples
> of data captures. A helper function would only serve to obfuscate it.

1. temporary variables for long deref chains help both readability=20
   and the compiler
2. our 80 char rule is obviously negotiable.
   But more often than not the best solution is to refactor the code.
