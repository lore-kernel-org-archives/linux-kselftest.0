Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3733FA5CD
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254870; cv=none; b=KXovWur+PhN87ZWo6tnhIvwFhYXRvSL52qI9AkiCBs4VOUJz32jftI1CoU0l0e+QW1AczLqbt3FanGHrp2QswuXDgGYqogkc7svIWBxWTim5tS/YqbcVXZ//trU1L5HlV2LoYgGoyfAqUEG5SqgaFs6jHcxGQFyAKxbpO7tF9SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254870; c=relaxed/simple;
	bh=cyGBiEtH7owjZ+3wjPCfXIGSFw9H1yMxnlcfEZMSYJI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=A66+jjIUqTgmEzbQ2Sdk/nfRxMnUiUMCpKHYYJKk2BPi20Ji+lnA18k5D4svE+hiNPzSMLdEflSenrFClKTKKELuFM8NRZyxoWsjeGDFyj0zvYGhOIo4UkNU/J8o2BUz/3Meg1lT/zPWAF8S+rRFhcNystsYtaRH69oaGEdC/yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=Qxk6pED8; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="Qxk6pED8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Subject: Cc: To: From: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1778254859;
 bh=dfYhS1DkNAeSK5tg73GFpmu4b1Dzj3tC81cPx/pc8A4=;
 b=Qxk6pED80OlhTQ1SW3WoHb9Mu0RFmSlMjld2y3Tqac4MgY0Q83nVi55zKLd4SBRi5azs6l5zE
 VE5JSlM0M2Kx6okFXE9jRisHYkIBgyYlHPDciT5Y/UJsPFMJMGG+buvouSCiCv50Pcwx2ehPfpa
 LEgumTytooD08172LCwIHSguHXbZ2SkOn9xzjeCYXxDkrHHeWsyU3neI1QWTWrtKfjS9v62ZpPn
 nphJor3QJA7/uRbAxhHd77QU+C+R9ufUTpQwmti7nfZn+uOYL8n05Y8IH0F8XiT8zY+nmn/XYXd
 L6NPXMvklvZL2zt4WSxIcBJ/lhse6EjqJTHPeaMEqPpA==
X-Forward-Email-ID: 69fe04098d5081d1392a8776
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.7.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Fri, 08 May 2026 11:40:54 -0400
Message-Id: <DIDEQIFQF1EW.11CESAK4JL4PR@ubuntu.com>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sasha Levin" <sashal@kernel.org>, <corbet@lwn.net>,
 <akpm@linux-foundation.org>
Cc: <skhan@linuxfoundation.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
X-Mailer: aerc 0.21.0
References: <20260507070547.2268452-1-sashal@kernel.org>
In-Reply-To: <20260507070547.2268452-1-sashal@kernel.org>

On Thu May 7, 2026 at 3:05 AM EDT, Sasha Levin wrote:
>
> For many such issues the simplest mitigation is to stop calling the buggy
> function. Killswitch provides that. An admin writes:
>
>     echo "engage af_alg_sendmsg -1" \
>         > /sys/kernel/security/killswitch/control
>
> After this, af_alg_sendmsg() returns -EPERM on every call without
> running its body. The mitigation takes effect immediately, and is dropped=
 on
> the next reboot.
>
> A lot of recent kernel issues sit in code paths most installs only have e=
nabled
> to support a relative minority of users: AF_ALG, ksmbd, nf_tables, vsock,=
 ax25,
> and friends.
>
> For most users, the cost of "this socket family stops working for the day=
" is
> much smaller than the cost of running a known vulnerable kernel until the=
 fix
> land.

I like the concept - but is there any way to ensure that important function=
s
like malloc aren't being patched? Or some way to make sure that what is bei=
ng
patched will not kill the entire kernel?

I know this probably boils down to "operator has to use it correctly", but =
just
wondering if this was considered.

-Josh
