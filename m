Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF76296BCD;
	Tue,  4 Aug 2026 01:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785806395; cv=none; b=eYM9UKWaZuII4H1tKHqd9MtHZHycsm/35WViHKkKV205cXILmtne4ZxPBU7raRqYJBr8IZ2+CoQcQCjhzJXdS652ruWXxAUmEQzToRwr2l3TiOJr0Y6xNBttTpNObN/FEzMjKWBrfcHuZW7KGDAJbshsWP3Mw+r8KTgfAo90kvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785806395; c=relaxed/simple;
	bh=bMbjT50Dh9r/E7ODY8GPoXUoxlqyM3hULw7vGT/xUi4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CX//Up45kqT3O5FsVjffNgHah9dVWf1jDbwey/C9asDuCUVEPunBX8ofxFlDlFu/nxIWuN99QsItnrpZvJ4NBCWaipk2TYfDk8l1N1WNoISPjpwIZ0wwL7R7QdVD8q1+L4Gdz/omjwgN1jGR2w6mRNMxzU4BU5n3kCXxUw+ZxMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWvEdLO4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWvEdLO4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C441F000E9;
	Tue,  4 Aug 2026 01:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785806393;
	bh=bMbjT50Dh9r/E7ODY8GPoXUoxlqyM3hULw7vGT/xUi4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZWvEdLO4pQiLYkm1RbanhkDrVsRyx+FCnzWHEai1QgLSLLOn3f/7T1ku2scJUVa9v
	 N+5ADgK+ndKihEb6/0NQXXkw2xh6Fo2NvXdmqGutPd23sbqL9AwAAyrmvgFyMkXRfH
	 xTdT+0p/zPJPwNvI2py6MMSv4EkOmZPor9ockFk6ZLfbG5Cx6wASAUanquWy7i7LtS
	 hUyz/sCQO0hmLyGF0AZk13Cp94USj2VeOqhfoOEnrp9Pb/YZ/zCtYzVNsq2nGYG4VT
	 QIcbCaphXl8jGcDCp9RHQW6SOTnCpg00Ty/5g2hygav3M20gvvuqr+OsXN/tV3qVGZ
	 pNPpn7PHRgF0A==
Date: Mon, 3 Aug 2026 18:19:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Chuck Lever" <cel@kernel.org>
Cc: "John Fastabend" <john.fastabend@gmail.com>, "Sabrina Dubroca"
 <sd@queasysnail.net>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/9] net/tls: Bound time spent on no-data records in
 tls_sw_read_sock()
Message-ID: <20260803181952.7920e6d0@kernel.org>
In-Reply-To: <b997d118-0e36-4511-b14e-66704dc8e9c9@app.fastmail.com>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
	<20260726-tls-follow-on-v1-1-99bf4cc1c729@kernel.org>
	<20260803153905.09f1ba0b@kernel.org>
	<b997d118-0e36-4511-b14e-66704dc8e9c9@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 03 Aug 2026 20:35:54 -0400 Chuck Lever wrote:
> On Mon, Aug 3, 2026, at 6:39 PM, Jakub Kicinski wrote:
> > On Sun, 26 Jul 2026 20:33:29 -0400 Chuck Lever wrote: =20
> >> +/* Bound the time that consecutive empty ingress data records keep
> >> + * the socket lock held without releasing it.
> >> + */
> >> +#define TLS_RX_NODATA_NS NSEC_PER_MSEC =20
> >
> > A time bound is a bad idea in the kernel, a softirq can easily=20
> > take >1msec and turn 2 consecutive zero length records into
> > a fatal error for the connection. =20
>=20
> I don=E2=80=99t have a particular dog in this race, but you and Sabrina n=
eed
> to thumb wrestle to decide which way this needs to go. My original
> thought was to use a count of zero-length packets.

There's a time limit on rx_action processing which is super noise prone
on production systems, hence my preference to avoid any time bounds on
in kernel processing.

And looks like user space libs generally put a numeric cap on the
zero-len record count within a batch?

FWIW I'm not super convinced this is actually an issue for TLS 1.3.
DoS generally means that attacker has some leverage but here attacker
has to encrypt the records for real, so I don't really see this as
a DoS vector. But better safe than sorry, I guess.
