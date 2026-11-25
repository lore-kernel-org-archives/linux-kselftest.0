Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591905;
	b=4AIOVY3Z48xqAXVHU4B5+dXFEYjUsopV/Biq7Y0WnOEVTHsb1a5OXrnSyj3DIMb/8L6z
	 82KrXYK90p7Tc5T57381LsLDuW3HQZpx+aCqkZidI5jF3so++kZ0z+6FyMXBj79kk2f1Y
	 thw5XWkB0bip2q1llaJiYdmgLNmn7xMwsDArax/aME8CXGzYJm6Jx9JY1+K4Lw8Gae3Gn
	 xxn/hgiRRMccxqe8A+3ZepwQiDDj1Yt60laHDXntl6ecxxnHFU5U3mE0DAakPNXDvyoqO
	 lPOgDFJbQ74ERvLLp2kryT5g8VX/zFk/5rRNgzafnBAx3vIriupljG1DAs1mgsscf1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591905;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=xhPmW75hRN8afltKNaginLxSJfgmnI9GqSM1TYaN1jg=;
	b=J/TARVbf+sJXrEK2fdowu3/Yy1QsPXZxFYShkEeMk5KSOYmeb+jKwNfvqgWruHRWQMaZ
	 jmXRze3p7qXWv7VUzKqyXEZOsCLwkKmClYHJQaA9ZSzPWzOlWSCpusJsdj4VS5AdR8KYs
	 sOc+ocnXoeX0hozSqO4f8WeT1NTV04JF4MnGh0e6AwmGi+LP+DXAkLGrulOyE33A7k/Rk
	 /cFsDdyDFTypL9VXVWunKLNjFu7Kvp63giayP1sJg39K6DLqcyi2bi5B0NCZnvUHuVPrv
	 vyK6f8NgZIIY4U+M4wiBvx1PgVgWBA4uOKF4C2HM2aPQE248LBGNnQga60OusTUpkRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XUMkSBkj;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB715606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 07:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB715606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XUMkSBkj
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0BB451A17E3;
	Wed, 25 Nov 2026 07:31:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D388560480;
	Wed, 25 Nov 2026 07:31:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36DBF11E69C2E;
	Wed, 25 Nov 2026 08:31:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795591900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xhPmW75hRN8afltKNaginLxSJfgmnI9GqSM1TYaN1jg=;
	b=XUMkSBkjmtDGNy2KCNuD+1fE7wF1/zRXlc6Je+oT+Iq6rsqCMPB9swiqRni5sTlp0jlcO1
	ThQspvPhjxNWHf0//C1HyHT6OT5zNwPLfmMqKGs6w9h46hyDpYeW5VhBUv5ZxZMrkDTUvx
	osZuCxX5BirGuOMPckaAlQayxj+9UEBez8Y9SthfIj/AcStnJmuQdPtJBNegeSlXmPb91+
	JwmN+kU96q0WKncXG1C0a7MtS9EB6B/OVPqAWdWo1OgwVKBI+1+BwMHR3ZuoYwZexzoNz4
	dxJOZmxyRqTft+xJdVa5XhdQWZ+ypGyW7YNsSdcbGWbxapLzbXtSeROgysWpbg==
Message-ID: <532be622-69e4-4a03-9467-e9c96cd61855@bootlin.com>
Date: Wed, 25 Nov 2026 08:31:30 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] selftests: drv-net: pause: detect the link partner
 from the remote side
To: Andrew Lunn <andrew@lunn.ch>
Cc: Matthieu Baerts <matttbe@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
 Willem de Bruijn <willemb@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev
 <sdf@fomichev.me>, Breno Leitao <leitao@debian.org>,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261123201406.479904-1-maxime.chevallier@bootlin.com>
 <4148e81b-ec5b-4374-b74f-4f5cba175c7b@kernel.org>
 <fb92bc0b-ab3f-49ac-b4a5-5368c87b3a7e@bootlin.com>
 <bd804c6d-0294-40b9-a6eb-2b1ab2ad357e@kernel.org>
 <39d50105-c550-4925-bf63-6f0fcbb897c3@bootlin.com>
 <ea5f29db-dd1f-4476-9766-1453e92234a5@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <ea5f29db-dd1f-4476-9766-1453e92234a5@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/24/26 18:29, Andrew Lunn wrote:
>> Looks like it's rather the HW or driver that doesn't support this :(
>>
>> But that's OK, I think we should ask the least possible features from the
>> remotes, the rest of the selftest should already handle the missing capabilities
>> just fine,
> 
> Supporting nway_reset is trivial, at least for drivers using
> phylink/phylib. So we should encourage it.
> 
> So i would say if the device we are trying to test does not support
> it, the test should fail. If the link peer does not have it, then i
> would be more forgiving, we don't want a developer to be forced to
> hack on somebody else driver in order to get their own driver to pass.

Indeed yes. In this particular case, it's the link-partner that doesn't
have it :(

Thanks

Maxime
