Received: from us.padl.com (us.padl.com [216.154.215.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E946E3AB271;
	Wed,  3 Jun 2026 02:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.154.215.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780452625; cv=none; b=YQHJDU99l7Dp/KoABMB62ajnbHZZ+GV8LqrKROETIR6/p7VI/fgG3iNT/m/2bMUUsBzMExBk5yUU/VeZJXuvmO1BYGTeqnubKTwG4rzH8Qv6tMQJyYp51mlR039br/DQak5TfH7aWRZJjDRMulzeg8PV2zVthV4RZ2Dv3Whz9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780452625; c=relaxed/simple;
	bh=s4CAiE4vIRteIubAn5/oiZKBCwwuTGAWnOK8l9l4tyM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mVkMAt22MHzeKGiZ7UywuNW9oQun+Dx3AvFiPnnHHTNgL2d76F3bbUQEqU0LdHETlFmN+oEXXEEFXERbdBAZE/AJZAwHJs4aH2MSLRM+W8oiEOlUpigSt4OlClR54AUyOaC45La8o0+JV3ACinLHa44Yghbb6e2tXe+0908BD8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=padl.com; spf=pass smtp.mailfrom=padl.com; dkim=pass (2048-bit key) header.d=padl.com header.i=@padl.com header.b=lNRyan4r; arc=none smtp.client-ip=216.154.215.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=padl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=padl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=padl.com header.i=@padl.com header.b="lNRyan4r"
Received: from auth (localhost [127.0.0.1]) by us.padl.com (8.14.7/8.14.7) with ESMTP id 65329tGr002922
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 3 Jun 2026 03:09:57 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 us.padl.com 65329tGr002922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=padl.com; s=default;
	t=1780452607; bh=s4CAiE4vIRteIubAn5/oiZKBCwwuTGAWnOK8l9l4tyM=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=lNRyan4rtgIg/ve5PAW1Auf5u87osem4kwJWhSBpQWnIYL9UYghA/nHaEpn2DDcmT
	 9N/MZjNzGtpTitFMlzGh5xbMcf/P+bOPbVqep7eARojp0BB1WsFmNNm/ADt/s/HQlD
	 U+p6Xf90/d3o+54GAjdN4Ca8+BqaDrLvU79WadAUSY3j2gwYOm6Flr4SkcKYi1e9lq
	 AhGEbZrsLW0XbtoCHvbr1vmvTE9kdGR3AKKaLKS/JquMnExO7F3xzeNmhtK5SvvjE/
	 0e25o4CmDPEN9gLWpcGeZQjlXLtJxyecIXTfnQNIiqfQkw2GCbEuozKjq2LQpcNDqQ
	 GhjHZ2+5p2PIA==
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH net-next v2 5/6] net: dsa: mv88e6xxx: MQPRIO support
From: Luke Howard <lukeh@padl.com>
In-Reply-To: <A662D3F9-18DD-43C9-A43D-912E5A8A4360@padl.com>
Date: Wed, 3 Jun 2026 12:09:44 +1000
Cc: Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Nikolay Aleksandrov <razor@blackwall.org>,
        Ido Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        bridge@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Max Hunter <max@huntershome.org>, Kieran Tyrrell <kieran@sienda.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2AC04CE3-1760-49B4-A25D-170629AAD38A@padl.com>
References: <20260602-mv88e6xxx-8021qat-mqprio-v2-0-72be14522e7c@padl.com>
 <20260602-mv88e6xxx-8021qat-mqprio-v2-5-72be14522e7c@padl.com>
 <t44kmhk6gqxnwhdvo7svouexwelwsya7zgukpbv3cxpfsmutqa@y3rjoj3tvqce>
 <A662D3F9-18DD-43C9-A43D-912E5A8A4360@padl.com>
To: Cedric Jehasse <cedric.jehasse@gmail.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)



> On 3 Jun 2026, at 7:12=E2=80=AFam, Luke Howard <lukeh@padl.com> wrote:
>=20
>> In case of per port priority mapping, i don't know if this is working =
as
>> expected, as the IEEE priority mapping is done at ingress.
>> Eg. i think if MQPRIO channel mode is used to configure a pcp to =
queue mapping
>> on port 1 and a different mapping on port 2. Traffic received on port =
1 that
>> gets forwarded to port 2 and egresses port 2 will end up in the queue
>> configured by the mapping on port 1. As mqprio is an egress qdisc, i =
don't
>> think that's expected.
>=20
> Good point, it=E2=80=99s interesting there is egress mapping on the =
6390 but only for FPri to DSCP. The Frame Priority Table set ordinal one =
would expect for egress QPri mapping is =E2=80=9Creserved for future =
use=E2=80=9D. (Be nice if it were an undocumented feature.)

I misread the data sheet. Egress PCP to FPRI mapping is possible =
per-port on the 6390 family. This doesn=E2=80=99t resolve the other =
issue (MQPRIO-less ports on the 6352 family). But it is good news and I =
will revise accordingly in the next patch revision.=
