Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F961B86C7
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 02:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780280397; cv=none; b=FM3XR917EYbyrIydpq4cNEHZEo9wNV5f8x5tNdbRoCq4jpqAwNjc8FrJfFJEVgLXb6JuPcPMindeu4GFUOXIJbcUBlRD94/kI7lTfG90cOsAO2jnuTsa4vKP9G34chuSQFHlrRl4UpCw4YgXe03mBHGwLFphu17YqMma5eh5Sgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780280397; c=relaxed/simple;
	bh=DkbiK7xTkQnd4WrcYAgERkfg/wT3aw19YfKCSvhWPiY=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=eUbZjdG8VbMnRM0eCqljDyIzqKOztbRp39VAhFBYJkO5on1U6tQHxIXqtTrQC7fboeBJwwmZQ5y+Qsw4hn6PRb0byhRsco9xxRYTBPMCgmWslDHoJ3LAwxM9mpLusMRwFgm9k3xAxFVwaFLPt6vXGKurCtzP1E+bsFqF5wiaBO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hLftl0Gl; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hLftl0Gl"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780280394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nefyT5OBxsTCuKDlG/KjCrlTz0zZS2F3Z2D5SQfViTU=;
	b=hLftl0GlB63Jiph1E4xmIkxrKeqSb360RDRyLjAJRYHNGnc8hWoRkYA4tqsQZEx2eWaRgM
	e3PcRH2+Apep+uxasvb31jPHo7l3tr4KVaGSkIZiO0TmUkgm1RuITE0QASkL1FAMkjPtqX
	QG1WOYawC+iijEAXY55OMsSLMFrEnrE=
Date: Mon, 01 Jun 2026 02:19:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Kunwu Chan" <kunwu.chan@linux.dev>
Message-ID: <075c80f2482b358705292a2557defdf384c94f7c@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 2/5] selftests/damon: fix memcg filter path handling
To: "SeongJae Park" <sj@kernel.org>
Cc: "SeongJae Park" <sj@kernel.org>, shuah@kernel.org, damon@lists.linux.dev,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, "Kunwu Chan" <kunwu.chan@gmail.com>, "Wang Lian"
 <lianux.mm@gmail.com>, "Kunwu Chan" <chentao@kylinos.cn>, "Cheng Nie"
 <niecheng1@uniontech.com>
In-Reply-To: <20260531163607.99063-1-sj@kernel.org>
References: <20260531163607.99063-1-sj@kernel.org>
X-Migadu-Flow: FLOW_OUT

June 1, 2026 at 12:36 AM, "SeongJae Park" <sj@kernel.org mailto:sj@kernel=
.org?to=3D%22SeongJae%20Park%22%20%3Csj%40kernel.org%3E > wrote:


>=20
>=20Conventionally, this mail should be sent as a direct reply to the cov=
erletter.
> But somehow this was sent as a reply to the first patch of the series. =
Please
> send all patches of a series as a direct reply to the coverletter from =
the next
> time.
>=20
Thanks,=20SJ.

Sorry about that. I'll make sure future revisions are sent as direct
replies to the cover letter.

> On Sun, 31 May 2026 17:17:21 +0800 Kunwu Chan <kunwu.chan@linux.dev> wr=
ote:
>=20
>=20>=20
>=20> From: Kunwu Chan <kunwu.chan@gmail.com>
> >=20=20
>=20>  A trailing comma in the memcg_path assignment makes
> >  memcg_path a single-element tuple instead of a string.
> >=20=20
>=20>  As a result, an invalid value is written to sysfs and memcg
> >  filter configuration fails.
> >=20=20
>=20>  Remove the comma.
> >=20
>=20Good findinng! But, Cheng sent [1] a same patch earlier. I believe Ch=
eng is
> working on revisioning it. I think we should give Cheng more time for t=
hat.
>=20
Yes,=20I noticed that after sending the series and saw that Cheng had
already posted the same fix.

I'll drop this patch from v2 and let Cheng continue with his version.

Thanks,
Kunwu

> [1] https://lore.kernel.org/20260529145248.84593-1-sj@kernel.org
>=20
>=20Thanks,
> SJ
>=20
>=20[...]
>
