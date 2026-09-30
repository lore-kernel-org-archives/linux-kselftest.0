Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100FB3939A5;
	Wed, 30 Sep 2026 22:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806691; cv=none; b=EvgX7Pf736EG/V+BRS5HXkFRwMLSLK8Zv8S+YAb6+1dwXXaUhBhIxJgzNPk0hIEw/cIC7a2XeGq1N4jx1RHppyX1ahbI2QJ1JzmmYqe/0uKhTqDSVzryfJ+OFBnIfRsyUXBC/udHrRapFMkjG4fEzaXr+nkxNWgIpOrJeNPk7oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806691; c=relaxed/simple;
	bh=ea5Nu3/2HzNpjPXyyMZpFZcaB1I+CCJvXSlR27T1GOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKKBM0gDS8Xja0vSKqn+cftIvHAsrL2Oh/C8oqZI4/PLIPgxBDp/Y6UIA5pz+YRa/VhbmM3QRL3d9bDfQpu2TrdOvotWy/SbauZxWx1ooUJNl/xI+DIox3zT6+XjMQx3NRHxgeFFMnJxJF9ohk7oeLsM1yjgclBS+OHBV9pS1bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=PUZraXCV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YwxI+pRr; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="PUZraXCV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YwxI+pRr"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id C782DEC0273;
	Wed, 30 Sep 2026 18:18:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 30 Sep 2026 18:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1790806686; x=
	1790893086; bh=MKguRLAXrycjCdciKcU7X0Eioz8/jvQvQYy1COZgCNg=; b=P
	UZraXCVUxW7RidU2rzilDgDzCPnNxJ0GCkAsPAl92y210WussivyMVXK8yUzm7HG
	KQQnI14yQBn6vUtuM3i42OYkb/BdW4l9NChhSsTxdDar67kWPZKBvWsu9cdH8+NH
	xGPXo4I5BBMO6MikOroe4NPnZWKFqWSSvUrc/rBmgx9DjB1zbPeqvs0pkX0PPC75
	c3/hp60ZgqObr6FBNgL+thrj4lXvF3pmQ6EYnAmcXnQgK2G6/01y5/ehOzn97WSQ
	aJkcm5kNfm7CwD5aUl9WdaK2NpD0odeISiPnj7f62JB56yeX4J5wjNVgtVaHXuz8
	LrXxI3qSvA3GvSNf8LXvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790806686; x=1790893086; bh=MKguRLAXrycjCdciKcU7X0Eioz8/jvQvQYy
	1COZgCNg=; b=YwxI+pRrDDPRajUCw8DvzAtjnw6Umqe/DDHYGNVKfZgsBHEI6j7
	zoppPsHTApXiP37bS01x5TF4O2vene2gvXB9e0Y8yqxr/i0HboRJU00f1CReB/cI
	+sb4ZNFEFX1wT0i6xvP8C62WK/RdBghI72e130KImK/Olpexg4AaLoVwcYMBe9vo
	ix/EkkWugydqjiX5dUz7vxnE3uA1TUDuYYXyW0JEfd8tNCSob2o0x0OyrgWpuG+m
	yQmQxXoUukCTRkjGXRCwlUGVzr27hH1yKqVn3ZSze15PdFrDW63MpgV05t9Mismz
	dtSppHn+MBiNFCMMlgCQdgdew9Qmhl47TyA==
X-ME-Sender: <xms:noq9apbprYm649MG3hb51xbOZ2oi0zZbANSbppHz6j-iFef8PN1-6g>
    <xme:noq9aogKMHTKCSxerCF1gqy7X09IrdDk6oS3-wz9ZUDhfiiAKR3jtB9TLXnTZqg-V
    ycUccqbmsugHMt4W5M7GXFNUt3JODU0Lae8Us_7O7f_n3FJyru-F40>
X-ME-Received: <xmr:noq9are54xCJq4nesZj9dg8MVdJjLHxmdfJAqqM9CtltPsIHI567n3W16qML>
X-ME-Proxy-Cause: dmFkZTGT3M6Y2KKr6yBk6H5S10BdfD2Jhi7rpJfos52VRC2C6tx2sy/uzW87KGQFn2PCz8
    tLBJoJ/683Ctj7TNzXLKG6adDn6+MjhKveVZwce0ApDfnaBQJ+Hv4MlJPVB15vEuCS2UpH
    RnLudo2NdbbtdMDEcn48P0ztnM/iLdYYW20LJNcF2aOOOFcxfs+T9jZykIG2iQ8yvP239y
    Vpkp8BlaAZhcy0sXweHad1kh6kTjv0IRv4ijQO/YHSFxNzr5wtVyDJpRSb3PgFZpNaxdRv
    fNueavSHGmGPFNHKkpyv3f/ZXErfSqg97nj5bXZ4cil5ilBaCUFkwI9fvet78lzo9sCJn6
    Q+526XPzrrG2xfpDasFu7zQhTX6fCssDOnTqNW24l6p/0wlhAs7T/3loYhcMI59a0zzaxc
    xxdmIIG+GmC55kRMdnvWyKSaPYiPdZZ6kAWHZBRWQgnGHv+PqQyoXuV1Hwgbdpf4aYR1/4
    Hh4csgchn2//TOfbc9Niif/SN2SOYwzKbjZ9QGNNimiIxgkzz8fgybqV1ikREgrfoJMYBI
    zm5JRvA4o8x1YspdmFStykuOwrI74cwcbMDcWANpfUGkATqt6/kZKA+lxGV2YtGiHe4bHc
    /eN4IT7+n4MlpcPxupqr0H2UBx/SuZRKc+Q/c+os1JYM+CBalbvK0c/ILqSA
X-ME-Proxy: <xmx:noq9ann77gKkTodxg0jbgIxN7np1t-gOeXfFHIUVOO1XCkiUwFR1Tw>
    <xmx:noq9agzqKzTTqD0_kjtF0UGRICTUY5R3OieZYc3WGY0cOWJCfzTejw>
    <xmx:noq9aqwOdzsEZlU82NzSzDO4Azi7uNSd3zJRyVlN6XdsyXpbCnMoBA>
    <xmx:noq9agXSWZCy_pGxdPUHdmVeZvZ8g1SriN1kp_NBH4wQEie3j180mg>
    <xmx:noq9avagRWg_1Sz6DvJvkAKFJERLHjXgGssgvqge4VhpLqLij9pmSUy0>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 18:18:05 -0400 (EDT)
Date: Thu, 1 Oct 2026 00:18:03 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Haseeb Malik via B4 Relay <devnull+haseebulhaq55.gmail.com@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Haseeb Malik <haseebulhaq55@gmail.com>
Subject: Re: [PATCH net] macsec: check the resolved SCI for duplicates
Message-ID: <ar2KmwhtCMbOKLsG@krikkit>
References: <20260927-fix-macsec-duplicate-sci-v1-1-085bd742c8e9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927-fix-macsec-duplicate-sci-v1-1-085bd742c8e9@gmail.com>

2026-09-27, 01:03:24 -0400, Haseeb Malik via B4 Relay wrote:
> From: Haseeb Malik <haseebulhaq55@gmail.com>
> 
> An all-ones IFLA_MACSEC_SCI selects the default SCI derived from the
> MACsec device's MAC address and port 1. macsec_init_secy() resolves this
> value and stores the result in secy.sci, but macsec_newlink() checks for
> duplicates using the unchanged local sci argument.
> 
> Consequently, an all-ones request can create a second MACsec device with
> the same transmit SCI on the same lower device, while requesting that
> SCI explicitly returns -EBUSY.
> 
> Check the initialized SecY's SCI so that duplicate detection uses the
> value that the new device will actually use. Preserve the all-ones
> fallback when the resulting SCI is available.

Or move that fallback from macsec_init_secy to macsec_newlink? That'd
be a bit cleaner than hiding a rewrite of the value in some other
function, and then having to go fetch it.

Something like:

macsec_newlink()
{
	sci_t sci = MACSEC_UNDEF_SCI;

...
	if (data && data[IFLA_MACSEC_SCI])
		sci = nla_get_sci(data[IFLA_MACSEC_SCI]);
	else if (data && data[IFLA_MACSEC_PORT])
		sci = dev_to_sci(dev, nla_get_be16(data[IFLA_MACSEC_PORT]));

	if (sci == MACSEC_UNDEF_SCI)
		sci = dev_to_sci(dev, MACSEC_PORT_ES);
...
}



And after your previous patch, we could also move the sci_exists
check up after determining the sci, there's no reason to do it after
registering anymore. since I didn't notice that while reviewing your
previous patch, that should be done in net-next once net and this new
fix gets merged into it.

> Add regression tests for duplicate rejection using default, explicit and
> all-ones SCI requests, and for valid fallback and reuse after deletion.
> The same tests reproduce two failures before the fix and pass afterward.

Nice.

-- 
Sabrina
