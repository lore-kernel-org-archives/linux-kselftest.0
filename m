Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40808221275
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 02:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780281553; cv=none; b=QzpHz76777BIQfK+0sMp+X5n6ff17AdtMwdbzpvIabgBK8DIU+T3UM5hQyrVL5uaWtaXDMqadYdpCQii/ksEBpWvpEHcgRzO5mtIVtlq4NhH4YMmYi+AmlVYg4ls9AHJpwqItRuS70yzBzi8Sj4qy6vuQTYIc1TfctV+m36id40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780281553; c=relaxed/simple;
	bh=E5Sjn2yURtroB92Kl6+8gE5/WtDOFsolZL/dz0K6dT0=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=hEOt9p6oS+RjmPJvHOSFeR3olab01TLuel2wq4iGXljPAeqZm4uu2C3CU59SxsHOHuhObu379W5gw/8qvpwRQxFRvVPccB74FD+T6+r+zvIn8HNtrx1qx6qVz8jZQT6ZhfLgFO1TDVapQQk9seg8KHLWIpS4npnzC1iYNZrkj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TDDX08vn; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TDDX08vn"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780281540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMfLFxpky3lTG4VESTITwc7VxCTjEnXZROlAXcq5Ry8=;
	b=TDDX08vnWpAHdaPWUgxv4HK+ImGI1p1k1QKOb38Vudzh3N3QUM5v/eX5xFmmhtIefELXju
	4UZ7Wl5j/ebLQd7Gin6uOtLZ4fDy2pa/u+IMWqvr9PRgOHn7YoCZTPC+H+lL2KVr98cOx3
	LF3RH+R9aTXdXh5/jHt3YmodWU+F+W4=
Date: Mon, 01 Jun 2026 02:38:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Kunwu Chan" <kunwu.chan@linux.dev>
Message-ID: <3353788b10ec296dcb549abfeaf29fe845574dc8@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 0/5] selftests/damon: misc fixes for test bugs
To: "SeongJae Park" <sj@kernel.org>
Cc: "SeongJae Park" <sj@kernel.org>, shuah@kernel.org, damon@lists.linux.dev,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, "Kunwu Chan" <kunwu.chan@gmail.com>
In-Reply-To: <20260531170807.99856-1-sj@kernel.org>
References: <20260531170807.99856-1-sj@kernel.org>
X-Migadu-Flow: FLOW_OUT

June 1, 2026 at 1:08 AM, "SeongJae Park" <sj@kernel.org mailto:sj@kernel.=
org?to=3D%22SeongJae%20Park%22%20%3Csj%40kernel.org%3E > wrote:


>=20
>=20On Sun, 31 May 2026 16:56:28 +0800 Kunwu Chan <kunwu.chan@linux.dev> =
wrote:
>=20
>=20>=20
>=20> From: Kunwu Chan <kunwu.chan@gmail.com>
> >=20=20
>=20>  This series fixes several bugs in the DAMON selftests. Most are
> >  trivial but cause tests to silently pass when they shouldn't, or
> >  fail prematurely on slow machines.
> >=20
>=20Thank you for sharing these great changes, Kunwu and Lian!
>=20
>=20>=20
>=20> Patch 1 fixes mutable default arguments in DamonCtx.__init__()
> >  that cause state to leak between test instances.
> >=20=20
>=20>  Patch 2 fixes a trailing comma in DamosFilter that turns
> >  memcg_path from a string into a tuple, silently breaking memcg
> >  filter setup.
> >=20=20
>=20>  Patch 3-4 fix bugs in damos_tried_regions.py: wrong operator
> >  precedence drops the "not met" prefix from failure output, and
> >  empty early aggregation cycles cause premature test failure.
> >=20=20
>=20>  Patch 5 fixes several wrong strings that produce dead elif
> >  branches, skipped file existence checks, and broken dict key
> >  lookups.
> >=20
>=20I left comments to each patch. To summarize,
>=20
>=20Patches 1, 3 and 5 look good except signer/author info mismatch.
>=20
>=20For patches 2 and 4, I think we need more discussions.
>=20
Thanks,=20SJ.

Noted. I'll fix the signer/author mismatch in v2. As discussed in the
individual replies, I'll drop patches 2 and 4 for now and revisit 4
once the underlying issues are better understood.

Thanks,
Kunwu

> Thanks,
> SJ
>=20
>=20[...]
>
