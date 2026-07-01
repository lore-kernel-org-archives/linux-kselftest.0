Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3413139478B
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 05:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885378; cv=none; b=Kw2rKZ7oJ2izF6ANrEJLe29pwIbtVBSXLunrCTxmt/+wDO6ZCqdPW4iD8yYouSN56GHxeVC1lZCgTelLYQK/c95qU29HMtqFUp0KArX19mrxj+lxetGfuM5o+eZ/E3MZ5ff62dw5CFBJGgkRnQoBVBCsFJ6OOoS7fCStrbPeU6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885378; c=relaxed/simple;
	bh=du69GUw1EIX5aANGYtoDtWVpbMocCveU908JccD8Dt8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=cQ6xbHEjXyiS6lcXk3JTvfLMPkWREE4fGC0iH/zKc4j5Sfq0UfpAgDsIwJAqZuw2uOCaRU9Sx2zCB04bgGRCOHv1fBC5GtnMt0BuuKeV4XZW0rKAe303WTRpkQSxKMxBTF4fjn2i+vYYgVYJutkO4vejqnBVkszsdf9ZlOBiDK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xzx0XDdn; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xzx0XDdn"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e9f5637634so186918a34.3
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 22:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782885374; x=1783490174; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMHc6VjC8zpAtFBxLHo9uqSmcB6QkUimxcvK+ODJl3o=;
        b=Xzx0XDdnzBkey9K1juzhg7Occmgf7fcUA4KNpLpW/FRtUI1gHOIRWCZRKKY5aTLfp+
         yTnon9oOc7eddpfQECZVqIKIiWi6M0hgBJyjaCcBcvqHFbDlZdx74RBGKJ16PhMpnpi3
         3D8OZkuZlQPZRmbDbTufJ9ZsWtaX5kXl1meWq2aIXqN/7pwZZ8/FoPpxWBDQwnKH5FHe
         rixh0B26doerafmmBgfiT9sBnYTZPag5f7WoxzwzePOayo/tHRa0rJCP85D19QPmFClW
         EU1CpJgF3MNSVQFrwMgwY0R7dW0MIPUc1bg2Pynaki1tQH2PbAF4RmCURaMAo/MqqIZk
         YuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885374; x=1783490174;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMHc6VjC8zpAtFBxLHo9uqSmcB6QkUimxcvK+ODJl3o=;
        b=YUAxCZ7ougVZwgaeWtwEqyV/r84rIyC7zBNCBXuzhNj7j3SAU6tlORqupLIz1sUGoX
         3hUO9lF2y8Rb1cN/fDqlBEpVcmz0DWVhxAoFcE8LbuWxBRSWPP8kZhqvQXhb8wWdTXg9
         /3EsPz9fRpE2LjtFYCCp7FWLBKQ1kWYNuaNu6X4hi63yG4tpPPqJKIEym28vgCGy6HJM
         +OFFiB90ClWqeK4c9teVsV1VGgoS5oDdTXPr0Vil3AUZC0lx1rdVlkmGpFfoDmieL3bp
         Ad2woNbd3DIYfNqdgE1q4grSTWcbJ1Ut2Bz5cbFm+g4Mog/T+fOkgBLPJRFPYBaGOAbV
         8Z8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9t0xDbcPjOaFmIgCj04cFoyotnjtltobuxwNC1IAoIqOFwvoQUdk79zASH7TSKgb5WYSs8IRQ47htdjZ3D6TE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3BDF4W4f9bnnTx08VnOz0oo4yc0N9g9T91BYSHJRTmfJ+DcQQ
	K8ycWu+smZXR36ubj4szfw2N37kXl4Vhnlgi4dwUi7NHmutWgaNNnJ2P
X-Gm-Gg: AfdE7ckP6aIkf0ZarxDQS0jTGece69g/S7QmhkoPVIeZJs4e/OwR0LICZCsmVc8BBwH
	Yg2zKTjAeHr/dbX2PQD73qlQ90HPLCwAliPaFHhIhn/o9la56qZf8kmTYLJ5/Uv/PDRTMqL6h2d
	l1/vF2ZRNPH4eL0icGCarMezxyq+Nl8xMdqHKawRG+U09bam57yqrsLCqdTklnzb3P4OUaoOhpP
	UdK5vRkeQz9xPTMSTReeDNaquGxs1UBsTiRHlGt8Yq0S/HOWp2zzbiTy1odrLEPyKUzfxoYijmH
	kJwexpMBhZiARp59LQfivxvPARmgg0GP+pmT57SZtFjtLuRE0iAEIA/MLHHi7h4Or5Tx2LTPET4
	7OblYFMoqtu9FaBnJGHM1Cm8udkMKo0h2Qnx5EsRCJks7vMTLl94UBx8Ds1eppQ+LF6+2xpDDBY
	Kswz6Jtjr2NcygVBQJDZxhGYAlt1mqhueTwYUDK0zRz2fzoCkpV5HjvOsrSiJ9masxhQOV1AQBe
	1De5BA=
X-Received: by 2002:a05:6830:81d2:b0:7e9:eaf2:edff with SMTP id 46e09a7af769-7eb4cc4cb36mr45738a34.26.1782885374015;
        Tue, 30 Jun 2026 22:56:14 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5f::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec2e353fsm4114877a34.20.2026.06.30.22.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 22:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 22:56:11 -0700
Message-Id: <DJN048GYRBCZ.M83AO0MXTKSV@gmail.com>
Subject: Re: [PATCH v3 net-next 1/1] tcp: Replace min_tso_segs() with
 tso_segs() CC callback
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
 "jolsa@kernel.org" <jolsa@kernel.org>, "yonghong.song@linux.dev"
 <yonghong.song@linux.dev>, "song@kernel.org" <song@kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "memxor@gmail.com" <memxor@gmail.com>, "shuah@kernel.org"
 <shuah@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>,
 "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net"
 <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>,
 "eddyz87@gmail.com" <eddyz87@gmail.com>, "horms@kernel.org"
 <horms@kernel.org>, "dsahern@kernel.org" <dsahern@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "jhs@mojatatu.com" <jhs@mojatatu.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "stephen@networkplumber.org" <stephen@networkplumber.org>,
 "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
 <edumazet@google.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "donald.hunter@gmail.com" <donald.hunter@gmail.com>, "kuniyu@google.com"
 <kuniyu@google.com>, "ij@kernel.org" <ij@kernel.org>,
 "ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
 <koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
 <g.white@cablelabs.com>, "ingemar.s.johansson@ericsson.com"
 <ingemar.s.johansson@ericsson.com>, "mirja.kuehlewind@ericsson.com"
 <mirja.kuehlewind@ericsson.com>, "cheshire@apple.com" <cheshire@apple.com>,
 "rs.ietf@gmx.at" <rs.ietf@gmx.at>, "Jason_Livingood@comcast.com"
 <Jason_Livingood@comcast.com>, "vidhi_goel@apple.com"
 <vidhi_goel@apple.com>
X-Mailer: aerc
References: <20260630120145.286497-1-chia-yu.chang@nokia-bell-labs.com>
 <DJMRPJEUTY5G.30HYOMPLBGZOJ@gmail.com>
 <PAXPR07MB7984443B70E713F016EAA550A3F62@PAXPR07MB7984.eurprd07.prod.outlook.com>
In-Reply-To: <PAXPR07MB7984443B70E713F016EAA550A3F62@PAXPR07MB7984.eurprd07.prod.outlook.com>

On Tue Jun 30, 2026 at 10:46 PM PDT, Chia-Yu Chang (Nokia) wrote:
>> > -     /* override sysctl_tcp_min_tso_segs (optional) */
>> > -     u32 (*min_tso_segs)(struct sock *sk);
>> > +     /*
>> > +      * Override tcp_tso_autosize (optional)
>> > +      *
>> > +      * If provided, this callback returns the final TSO segment numb=
er
>> > +      * and will bypass tcp_tso_autosize() entirely. The implementati=
on
>> > +      * must derive an appropriate value and ensure the result is val=
id.
>> > +      */
>> > +     u32 (*tso_segs)(struct sock *sk, u32 mss_now);
>>=20
>> I don't like this interface change.
>> It introduces churn for no good reason.
>> At least I don't see why you cannot live with the existing api.
>
> Hi Alexei,
>
> This patch was part of TCP Prague preparation series: https://lore.kernel=
.org/all/20260611161504.228319-4-chia-yu.chang@nokia-bell-labs.com/
> Our original patch is to add an extra tso_segs, and after discussion it's=
 recommended to replace exisiting min_tso_segs.
>
> This is needed because TCP Prague would set the exact TSO size rather tha=
n using autosizing from TCP.
> The TCP Prague itself is planned to be submitted after all preparation co=
mmits are accepted.
> You can find its current stauts: https://github.com/L4STeam/linux-net-nex=
t/blob/upstream_l4steam/net/ipv4/tcp_prague.c

You have to explain why Prague CC cannot rely on autosizing.
To me it sounds like a red flag. autosizing logic was there for a decade, i=
f not more.
And now you're arguing that your CC logic is special and it deserves new AP=
I
and breakage of existing convention.
Maybe you should step back and reconsider.

