Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BC83D79F1;
	Thu, 24 Sep 2026 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262837; cv=none; b=EBNg/BqiPuRBlwk5nCyB8q2jc6dlM+iq2jppQ1Xp4HXHzUKsRaLXV9igCAJJ0TCrVKaAHDdvWylAsUjJ5Nl5q3ZwiZaHpqVZW7EvOh/j5+cihZAAvmZcyFwLOUZR5QaRcybLZbW2AskHNGninF4fCIEK7IJL+8tntkx1YFa6qqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262837; c=relaxed/simple;
	bh=6XkQK9w80p7dJTAMNACNwmZnVEtZV81AxqvERRb6Lr4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DDGsN+wHlpp3Rrdc+xARa/iw0dPilk+WgWgM2q4h9QejS/a9V05KE31Yt5kmFSpEOQoWH1sWLZG7TMHiowN9VDrXW3kWaPd2OptNKH87pavE8LIRQTwAHU9Yo9Jgtc9iGYcncvhhEp2X8kOLsnZiXPNB9nUR8LyYhXe3LZOcIu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmMcxdAf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmMcxdAf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA351F000FF;
	Thu, 24 Sep 2026 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790262835;
	bh=6XkQK9w80p7dJTAMNACNwmZnVEtZV81AxqvERRb6Lr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dmMcxdAfk3hCOVw72ZOki+I/EUA1r+5HKEAZw5YrznQPKgJ3YgKf7FBtrpSI1Xl9P
	 gtfbPlwRHjmAMfqRccA/Dfq4XhmAzzI2KKCBrjg8VV2RvdgrEgSQedzrL24KibclsU
	 ga/EqDXFBhx94iSW0UOeZctcz6SZOwFnB2lTglUIBzZf+dZQJeRRMc+H0BuJSlWmb4
	 d/pUrqb+pRekewHkZrHhZDAG6VT7o05irx0BLmqoY8rkjmPoDzAM+3yajfmMLx8uag
	 1Wtw2zbAuKEQS7TGEjyqaoXotUXY1kKyCs9QtjhOd7OAdJPtow9wjRqL7FjCKOMZb/
	 s2mf2X1s9M0wg==
Date: Thu, 24 Sep 2026 08:13:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Victor Nogueira <victor@mojatatu.com>
Cc: "Hemendra M. Naik" <hemendranaik@gmail.com>, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org,
 tahiliani@nitk.edu.in, vishy0777@gmail.com
Subject: Re: [PATCH net-next v6 0/3] net/sched: sch_fq_pie: add per-flow
 class statistics
Message-ID: <20260924081354.4d3c8e01@kernel.org>
In-Reply-To: <CA+NMeC9CWgt9=0=_HjNH=Fsg7igmFqDS=VnqWh6tZBr98ZkPgQ@mail.gmail.com>
References: <20260922180458.5c54ebb8@kernel.org>
	<20260923040136.13432-1-hemendranaik@gmail.com>
	<20260923195323.5413f128@kernel.org>
	<CA+NMeC9CWgt9=0=_HjNH=Fsg7igmFqDS=VnqWh6tZBr98ZkPgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Sep 2026 08:35:34 -0300 Victor Nogueira wrote:
> On Wed, Sep 23, 2026 at 11:53=E2=80=AFPM Jakub Kicinski <kuba@kernel.org>=
 wrote:
> >
> > On Wed, 23 Sep 2026 09:31:36 +0530 Hemendra M. Naik wrote: =20
> > > Hi Jakub,
> > >
> > > We have vendored the temporary UAPI header changes into the GitHub
> > > development branch (https://github.com/H-N41K/iproute2-next/tree/fq_p=
ie_class_stats/)
> > > as requested, so it should now build standalone in your CI pipeline.
> > >
> > > Please note that this header sync commit is not present in the offici=
al
> > > iproute2 patch submitted to the mailing list
> > > (https://lore.kernel.org/netdev/20260922211139.38570-1-hemendranaik@g=
mail.com/).
> > > It was added to the GitHub branch strictly for validation and testing=
 purposes. =20
> >
> > Thanks!
> >
> > Victor, could you pull this into tdc as well? =20
>=20
> Done, it's in tdc.

Thanks!

https://lore.kernel.org/all/20260922205924.32173-3-hemendranaik@gmail.com/

will return in net-next-2026-09-24--18-00=20
