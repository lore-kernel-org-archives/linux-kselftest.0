Received: from mail-ed2-f8.google.com (mail-ed2-f8.google.com [74.125.228.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE56386C3E
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 20:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603185; cv=none; b=if6XzPjnGuA4oQfxm3+St7AbpozVkA1geaJO1m9fTESBBB4jA2VMeahCd2KIYQ1I9bKul84qdtjbqGIfth5yXn2azqJFQgq8VM2TtSj6LNID6MpWU8TzPMph1U80PwbNrjWSyfuSwnFxY9BZrtEmhg0akBbf5747pN6MLHItzYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603185; c=relaxed/simple;
	bh=ol47nmdJ3GGPpvnwTP08QG3mSisZMayi/zyMDrGvbeo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BcpE98fm6o15CQQdoQ+Z6H3dkwm3p7qCrLwm5nUYjbt4Z+ZFAXd6deGaWzALMC6JW039LSR72pLGT5xi745ra0tW8MaM66gS28agjRtrHPVOqD7bwKNP0a372mw3+mfr78VK5/WoelkIyvArVdO9oKb8gP2dk77pnyfWhAaiyfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0vk0C3T; arc=none smtp.client-ip=74.125.228.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0vk0C3T"
Received: by mail-ed2-f8.google.com with SMTP id 4fb4d7f45d1cf-6a18fec4137so2151866a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 13:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787603182; x=1788207982; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SRshhMnfCPGoeVvs80B/UT7NtsgA5MHGwn5ATUedTPE=;
        b=J0vk0C3TZAQBH/haRMhHELEp5AtLALmiRZb3oC8MFwaGmabricWlPFNY3SO7uy9Kbg
         ZIYqr2dspHtS2fbtjYW07kDM4IITbF1Rra97lzinPYGNT24kLR2FIS4TGwtFN8OQ4Ki2
         NeQypT+0aXHPflHYHxWv0Q/VBz06Jyo0f3wldntDv8XGbAeWWpsx6TGg2GJ30/tZeReW
         wutzGhR21gl4oTK7H1yZwbBXawCfGoUJVkBA/3X3aMCRRZAz7V6fZOGO5EU6Q1keDtBD
         +w8ORQfkSZ6bwv4/SjIsM0kUF4t36Bp0Dms0ZlsJ/D0gkAg6zoQkjy2LxeXjD/vRjYH2
         7VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603182; x=1788207982;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRshhMnfCPGoeVvs80B/UT7NtsgA5MHGwn5ATUedTPE=;
        b=fvUH5siftqcdKwx/VBWU45hCR0WzseQo48gDVlCLnZJUUXFacrbj/69zJ4oJcB7+AI
         ZfBcmLioeOcu05AW0nDJINe5y6adbMw8i+CS06OgbR9iDjsza1z8BwbzR9OWJzVTUV4h
         LHr8WbWsGev9tWBZikfomrjJmLuAebkrclIlfKafiEU3O1uclUjRJpfGXW9Ho/NLpNJD
         HugjHYdhNBcYOD9I3CH05+/3QW2SvLxChA/VE8XUeTT81CK9cLtF5b7xYYX/1gyc+BvC
         5Z2AiJx8aEUfZ4HzllIVeM4VWa0sl9D3uNquR92qCuP1SGcIqGDO4jW20oYNqn2HGZr1
         /awg==
X-Forwarded-Encrypted: i=1; AHgh+RoM5m7r7k2EqkIu2P14JeDU3NZ6m2/usy9fi8pq2iCwd8MtpOO3IRZ0pjLPeAiCMvMzqCj70z9xD4S4sr9Izcc=@vger.kernel.org
X-Gm-Message-State: AFuF++kaJWPbSypIZ4sjb9VSR5Cw74+Z3BNeQ8DUliYIzZ2KMQ/aHYol
	GIaQcHiOIeP2S8ztSv2p+w0mmi877H9uwZOKvcqOwxiL5eY+hcPDxLSE
X-Gm-Gg: AR+sD101tQgt7bTYt9gfCFpzOAVqnZOEz4WHw4PLEcqaH1te4jjJGMVLUWOBNaOOuLL
	qKoLqyP4L2IUqmlm4jh5ZuACyTaaqxaWuhMv35Zid72+M2ZHFK6qZPH/RmmKLNwT0Lypri+x8Nv
	PHvwSCyl89gqg00yl9eQyjTI6mVDS2ydp9Ty1zkgDzTFlHWOXjTWzUMZ/7bHXgv3Vn20D+m47Hd
	9ZsRvi6fYWbxdbeUh+cK1x1Q5cQMyjLYDz3J1vJw1MIGQTvFliaWVgD0/gkIZBsIw5dT9a01u0I
	YV/qsghGOb0s2Rj8HpXJXvhyktss9gnS9yssH74aGZj6TY2ATVainIqxVJHcSL2UFhWCNsHq8XY
	wUxY72bXwPQzU5LTYTZTwwCzcZ7nqin1XMndRtG6FZXuAMY5mE/nK9izH/K6Y+E5X97kZJKNJvY
	mdNUmqPCsvWe3Lv+JOrJdCT4hL0kV+VoufcIwdSsumuCAQtEKDveJ1P0xCQC81CMqKVi8wLEdz+
	d98PmlI23fojn1SzGA8k7VGwEnPoEPIkHKvheDpjBzAjuLBcFuE30rR9lUBmUOLakO7DTn5rvLR
	AK6vU1GGWFueS68dOfWLWBDDCMU=
X-Received: by 2002:a17:907:8e86:b0:c1c:4db0:8314 with SMTP id a640c23a62f3a-c24e5b55335mr83473666b.13.1787603181757;
        Mon, 24 Aug 2026 13:26:21 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ef7bsm1665564366b.52.2026.08.24.13.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 13:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 22:26:19 +0200
Message-Id: <DKXGFVV8E9GU.10V7UM3R2SYOL@gmail.com>
Cc: "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "jakub@cloudflare.com" <jakub@cloudflare.com>, "jiayuan.chen@linux.dev"
 <jiayuan.chen@linux.dev>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net"
 <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>,
 "eddyz87@gmail.com" <eddyz87@gmail.com>, "martin.lau@linux.dev"
 <martin.lau@linux.dev>, "song@kernel.org" <song@kernel.org>,
 "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "jolsa@kernel.org"
 <jolsa@kernel.org>, "emil@etsalapatis.com" <emil@etsalapatis.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "shuah@kernel.org" <shuah@kernel.org>, "horms@kernel.org"
 <horms@kernel.org>, "dsahern@kernel.org" <dsahern@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "jhs@mojatatu.com"
 <jhs@mojatatu.com>, "stephen@networkplumber.org"
 <stephen@networkplumber.org>, "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>, "andrew+netdev@lunn.ch"
 <andrew+netdev@lunn.ch>, "donald.hunter@gmail.com"
 <donald.hunter@gmail.com>, "kuniyu@google.com" <kuniyu@google.com>,
 "ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
 <ncardwell@google.com>, "Koen De Schepper (Nokia)"
 <koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
 <g.white@cablelabs.com>, "ingemar.s.johansson@ericsson.com"
 <ingemar.s.johansson@ericsson.com>, "mirja.kuehlewind@ericsson.com"
 <mirja.kuehlewind@ericsson.com>, "cheshire@apple.com" <cheshire@apple.com>,
 "rs.ietf@gmx.at" <rs.ietf@gmx.at>, "Jason_Livingood@comcast.com"
 <Jason_Livingood@comcast.com>, "vidhi_goel@apple.com"
 <vidhi_goel@apple.com>, "Mike_Rudolph@comcast.com"
 <Mike_Rudolph@comcast.com>, "Jeff_Howe@comcast.com"
 <Jeff_Howe@comcast.com>, "srichard@netapp.com" <srichard@netapp.com>
Subject: Re: [PATCH v8 net-next 0/2] Explicit TSO segment count
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>, "Jakub
 Kicinski" <kuba@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260824163139.990734-1-chia-yu.chang@nokia-bell-labs.com>
 <20260824130511.2955f30d@kernel.org> <DKXG3AFFUMEJ.1RDMQ7LNT1D0S@gmail.com>
 <PAXPR07MB7984EBA84647E27ED9E65041A3A02@PAXPR07MB7984.eurprd07.prod.outlook.com>
In-Reply-To: <PAXPR07MB7984EBA84647E27ED9E65041A3A02@PAXPR07MB7984.eurprd07.prod.outlook.com>

On Mon Aug 24, 2026 at 10:21 PM CEST, Chia-Yu Chang (Nokia) wrote:
>> -----Original Message-----
>> From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>> Sent: Monday, August 24, 2026 10:10 PM
>> To: Jakub Kicinski <kuba@kernel.org>; Chia-Yu Chang (Nokia) <chia-yu.cha=
ng@nokia-bell-labs.com>
>> Cc: john.fastabend@gmail.com; jakub@cloudflare.com; jiayuan.chen@linux.d=
ev; netdev@vger.kernel.org; bpf@vger.kernel.org; ast@kernel.org; daniel@iog=
earbox.net; andrii@kernel.org; eddyz87@gmail.com; martin.lau@linux.dev; son=
g@kernel.org; yonghong.song@linux.dev; jolsa@kernel.org; emil@etsalapatis.c=
om; linux-kselftest@vger.kernel.org; shuah@kernel.org; horms@kernel.org; ds=
ahern@kernel.org; pabeni@redhat.com; jhs@mojatatu.com; stephen@networkplumb=
er.org; davem@davemloft.net; edumazet@google.com; andrew+netdev@lunn.ch; do=
nald.hunter@gmail.com; kuniyu@google.com; ij@kernel.org; ncardwell@google.c=
om; Koen De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>; g.whit=
e@cablelabs.com; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsso=
n.com; cheshire@apple.com; rs.ietf@gmx.at; Jason_Livingood@comcast.com; vid=
hi_goel@apple.com; Mike_Rudolph@comcast.com; Jeff_Howe@comcast.com; srichar=
d@netapp.com
>> Subject: Re: [PATCH v8 net-next 0/2] Explicit TSO segment count
>>
>>
>> CAUTION: This is an external email. Please be very careful when clicking=
 links or opening attachments. See the URL nok.it/ext for additional inform=
ation.
>>
>>
>>
>> On Mon Aug 24, 2026 at 10:05 PM CEST, Jakub Kicinski wrote:
>> > On Mon, 24 Aug 2026 18:31:37 +0200 chia-yu.chang@nokia-bell-labs.com
>> > wrote:
>> >> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>> >>
>> >> Hello,
>> >>
>> >> This series replaces the existing min_tso_segs() congestion control
>> >> callback with a new tso_segs() callback that allows congestion
>> >> control algorithms to provide an explicit TSO segment count for each =
data burst.
>> >>
>> >> To support BPF congestion controls, the series also exposes
>> >> tcp_tso_autosize() as a BPF kfunc, allowing BPF implementations to
>> >> reuse the kernel TSO autosizing logic while implementing custom
>> >> tso_segs() callbacks.
>> >
>> > AI CI says:
>> >
>> > The bpf-ci build jobs are failing for this patch on all tested
>> > architectures/toolchains (x86-64 gcc-15, x86-64 llvm-21, aarch64
>> > gcc-15, s390x gcc-15), all with the same link-time error:
>> >
>> >   net/ipv4/tcp_bbr.o: in function `__BTF_ID__set8__tcp_bbr_check_kfunc=
_ids':
>> >   tcp_bbr.c:(.BTF_ids+0x...): undefined reference to `KF_DEPRECATED'
>> >
>> > This comes from the change to net/ipv4/tcp_bbr.c that marks the
>> > retained
>> > bbr_min_tso_segs() kfunc entry with the KF_DEPRECATED flag:
>> >
>> >   BTF_ID_FLAGS(func, bbr_min_tso_segs, KF_DEPRECATED)
>> >   BTF_ID_FLAGS(func, bbr_tso_segs)
>> >
>> > KF_DEPRECATED does not resolve to a usable symbol/flag in this tree,
>> > so the BTF id set for tcp_bbr fails to link into vmlinux on every
>> > architecture and toolchain -- it's a straight undefined-reference
>> > error, not a per-arch/per-config issue.
>> >
>> > Could you drop the KF_DEPRECATED flag (or use a flag that this kfunc
>> > infrastructure actually defines) on bbr_min_tso_segs, and re-verify
>> > that the kernel links cleanly? A local `make net/ipv4/tcp_bbr.o
>> > vmlinux` build (or the bpf-ci selftest build job) should reproduce thi=
s quickly.
>> >
>> > Full build log for reference:
>> >
>> >   ld.lld-21: error: undefined symbol: KF_DEPRECATED
>> >   >>> referenced by usercopy_64.c
>> >   >>>               vmlinux.o:(__BTF_ID__set8__tcp_bbr_check_kfunc_ids=
)
>>
>> I think Chia-Yu's AI is hallucinating, it was a proposed flag but not ad=
ded yet...
>
> Hi Kumar and Kuba,
>
> I will drop it in the next version; however, this AI hallucination is fro=
m Sashiko's feedback I got:
>
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260814173034.749151=
-1-chia-yu.chang%40nokia-bell-labs.com
>
> BTW, any BPF-related flag is suggested to be added for graceful degradati=
on?
>

We don't have anything yet, but I will add something this cycle and figure =
out
how this can be marked deprecated then.

> Thanks.
> Chia-Yu

