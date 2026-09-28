Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B3A50390B;
	Mon, 28 Sep 2026 23:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790638847; cv=none; b=pXbSaFglPYghMqBY6J8Ymm/2q9Tot6I9MHR8GxxyEyQDbIGgXepv3+lW+nF2nLYY3t7NPHLwzlGlScfmr3Fa+bq7jEU/koebQXx4ANTR/EGB97rj0JtGuQ6F/zoM05rUh89dV1YsZQLaCANdGKG1YJaBOQ/mZuWuGT/RU+FRbGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790638847; c=relaxed/simple;
	bh=GRqgViEtLV2PsZk8F2kMvwySfqaZ8mavhXyCDOnPrEk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MwIAg8hJZP6CZjhtXnR/TtG5otCbeQBQ9QyhvPp89X6obKxzqoP8r7Kjl+mo7gjYL6BkHtDhdGDa7QBDoz4gvtfAP32bQXBdz7nylwhtRkciz/uvCyrZfIcF8m0N5/V98/54ETXgm4jMgjftfoUpmwInGdwYCimOxMcfVegvn8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxBsthN8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxBsthN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05C01F000FF;
	Mon, 28 Sep 2026 23:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790638846;
	bh=10xc7Azmk4SFvGail+f9Z+PY1YIWejnjMnB5QCOIkvI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BxBsthN8nWdMeXn9ccQmJolTlSLBnjM7VVyEtTVVbRmwi1c9Pb5t18TFDOGPzr9Ty
	 Yk/odJKzqs81Nqnf2gT8wq2kzWpKs0GcYPcM879ys9JBpICpu+7Dg0iv6eyw4bsinG
	 Lx3V6gU9V2YA3hpKH2tqcCCqcNvspNQAZARHBsXyZl4wSY8qgDyr3wLb9Ob86mOgAc
	 bFBPyH6JofLPu/fD8L8eg6dWx9A/KATB4CxKMOcJ0mZDU6vY/TBnxxbfwKiYGSUzAl
	 QiWvcDu6LeQcVBQX55xkXorzugDccUpeIDI8jyR7l31nP9Y3TyxpEoi5ltVWd+O7aX
	 5BNdRfOTaFFXA==
Date: Mon, 28 Sep 2026 16:40:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jamal Hadi Salim <hadi@mojatatu.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, netdev@vger.kernel.org, Jiri Pirko
 <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, Victor Nogueira <victor@mojatatu.com>,
 hybris <hybris@mojatatu.ai>, sashiko-bot@kernel.org
Subject: Re: [PATCH net 2/2] selftests: tc-testing: add duplicate action
 delete batch test
Message-ID: <20260928164044.665237ea@kernel.org>
In-Reply-To: <CAAFAkD_S3EwTjGXX7YZRLSQZgwX5un0Td9ru8r9chnAMk3ni+g@mail.gmail.com>
References: <QDISC-K1TH.v1.20260922072206@mojatatu.com.2>
	<20260924103222.239e3d45@kernel.org>
	<CAAFAkD8goF-B2qP41roK8OipD7TRzZfVEdFDPxHddB5Tm6VhCQ@mail.gmail.com>
	<20260924134244.1824ed80@kernel.org>
	<CAAFAkD_S3EwTjGXX7YZRLSQZgwX5un0Td9ru8r9chnAMk3ni+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Sep 2026 04:15:00 -0400 Jamal Hadi Salim wrote:
> On Thu, Sep 24, 2026 at 4:42=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> =
wrote:
> > On Thu, 24 Sep 2026 16:09:16 -0400 Jamal Hadi Salim wrote: =20
> > > On Thu, Sep 24, 2026 at 1:32=E2=80=AFPM 'Jakub Kicinski' via Hyper-Yi=
elding
> > > Back-end Review & Insight System <hybris@mojatatu.com> wrote: =20
> > >=20
> > > repost? (2/2 was stuck on some ether). =20
> >
> > Yes, please, repost =20
>=20
> pw-bot: cr

Quoting documentation:

  Updating patch status
  ~~~~~~~~~~~~~~~~~~~~~
  [...]

  No email should ever be sent to the list with the main purpose
  of communicating with the bot, the bot commands should be seen as metadat=
a.

  [...]
 =20
See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#up=
dating-patch-status
