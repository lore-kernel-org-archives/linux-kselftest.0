Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114865;
	b=pTcJaxYhS08ZvMGI154Fl2C0ZKQwwilDTBr138CpZVUxJLAXE0qA19+n+r7TSWPFvvNx
	 cLeU3opPs6Hm4Mw1ZIoaes3QkTVEeBcBtf0+fuHfE2xqKPB6FH4lhnNoNGF5bfB2X6uTw
	 gLHHp446CQJpvR5dzgO8FNvcNqbI6tfHm8lY1DuG5o4ay5AuFD3mJRATIYOmPD4CS7dJq
	 WMap9WA5sADSO/9grubpN0bIBg4ZwCjnLOSKAOk8T9jfqc8C+ij8ZiJ++D0H+oC0nC2N1
	 fPFSgVHfaBMp+e7fjC0syaaLjguEx5OjA5dcB4WH8w+9py88VL+59eAjb85U88vyTKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=uqwtnNOMKZ62ohb4pCxSL5wBGLnxx/MLeyk7MYe67bc=;
	b=ol4XTPDbrgmADd2t/vCd+iSt5M6qvbJ7JnpeZnR/V53EWvVmzgVzbTLWXTbSZ/hPVuwr
	 C/kRiPUWp6LE85RdgmEJCrXvCl5HSoi7xe42D+20z482vP1YLxGAncHlUAg3x9SIFtqr2
	 ubRtSUO+ZnG7mk/2/hydk9a+yuI2NSk4QGiplTpMF8HZ1+N6f8YPvsPjBqqSugaP/4yl9
	 tIvYpOjbiKG4qPERolrnO0VCT0bEW+8x/4kDDeFJxb7U4dlEUR0+7HsPFH8AGf1ZqwCAV
	 ywpMyY9QmO/6qEvEUvPoV94nyADlmcMEPdVNdOdQW5T1O7qXq8KvD2BXbUfxoF9AECA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zx1yak+H;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACE1606A31D
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 15:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CACE1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zx1yak+H
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91c76540d0bso289326d6.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114864; x=1793719664; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uqwtnNOMKZ62ohb4pCxSL5wBGLnxx/MLeyk7MYe67bc=;
        b=Zx1yak+HP4vRh1a7K2NP1uGeEoVYSv5PWBRg8nmWiinXpO6HtYk19YC0TO2GKJUQpG
         AbHXCPy5c9GRnlxzBNGwoNDkjI8KfLr1z/1gO1G+XNPdZAw8/IG1XwI30jKNNg4ldjOy
         sh+rPdeZbxz03X42r07RMAnnLSDscRiB92jAOrtz1RZ00JROwLooZP3BvYRFfgusczZr
         n/Et6gNKJv8yxxssxKLyODZIDYq9IquF9P6ip0XYT9P33OlaM/utbO0z/HHvNmqt0iXa
         wJa8DegfBACV2xpO+Lnsn7vCgEhJ6k9a4/7Beoa+fbbcHKsihGspDNfqO112CHzj8A0v
         kZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114864; x=1793719664;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqwtnNOMKZ62ohb4pCxSL5wBGLnxx/MLeyk7MYe67bc=;
        b=UXkLZcd588k2/vwFBeUYbUwPNV8Yn5SYOf/xYvIQXFNBrTB6mVzr9UKvw0siqMVDyz
         OVpA5nKo9+d64ry/mNVQHeqrdUBGURJ+9J5NIWCIjFoFvjinr3wZkRKk0KtHtE1H8MBQ
         37ybMKueZZsQF08yaqgK8dA6HDqIyp2aiOeMy3ix4R3LxSzmCs+3hFnQsUzi7abksq2e
         Upk+po3JSbLl72qUGdFCo3fRhdwMYXiZKQTStaztVp8bjkYVCZ7ndGPdxNy9jqQgStzj
         lIxW/TasG/6JBofGkYVT1toFjVm5tFm3Lc7E59OGc+rkSodfaWzipPaDJ2WhiWBAlsAM
         zZcw==
X-Forwarded-Encrypted: i=1; AKwUvBxIlXHqbxsHDYxaPV42mfwcUWcCpeFK+QIBrmXEfg1C9AEyzvAECKfffvJiZm2/1NgBYuIxLCmjaKD/iI1BbfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHZ+MSGfS9ep7cAYsJMdhYXglWj1WMRwHK2TfNnHR5KpYuaFnr
	hnYDIUeYpM158VGkFxDx59jXT8z4IUoykaSiS8rBYXibT59ZukPQfN5c
X-Gm-Gg: AYBFou0t1dek6MgYuoGiUZhHzWjJTxm7SP1pwgDAXp5UqToopFcSnHMQ0/2g9iyer3K
	jaO1lR4kVYBqw38W4gcI99dsMoQORK4d5VH2Jt9w6b/uHTovBlxaJolLzM1JmDJW6CAww3lQ8T+
	yqnUrOKvrq8c078AVZbQXDjjCkqQ42JPs5VNJDuz5BlQW64EhWp/pV7M1waXHIDbIFW+AEc//ro
	9GNgDDTuBxTwJAZvHg2ICtqXbIkrvZDfn+gEL3kaxIB6aJqBM52uj2Kp9ZxfxB316hyAnmct+aW
	Ql34SRIOAFPppdPUp5XhbhGYpNKirqrqy9OUox1T84EBPkVbYpfOAoj9mV6U7bNcmIMyeqJ8W2A
	VTkCVpI7/zWpC9CrPm5DMyCbSQ3QcHQM6jokXxj8xaaUjLl9tfwvEXXdJqdy97jLXbPQ2TevXwh
	sLrdPqswHhPZKQtHU3jjntO30/i29lUtS+0OC65ZQ/S5ZU0UPSHp0I0U33jQHFB4b4iVUDEnsFQ
	GZcH7S47cnHwiBieQ34T69Y3nIa02Ak4wCnjaEfLd4=
X-Received: by 2002:a05:6214:5093:b0:91c:7673:a417 with SMTP id 6a1803df08f44-91c7673a830mr20960306d6.50.1793114863756;
        Tue, 27 Oct 2026 08:27:43 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::4:1ee2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c6e20ba4fsm27571496d6.14.2026.10.27.08.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:27:43 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 11:27:42 -0400
Message-Id: <DMFQ63T8HLVV.3L1SY71TO7GHU@gmail.com>
Cc: <netdev@vger.kernel.org>, <borisp@nvidia.com>, <saeedm@nvidia.com>,
 <leon@kernel.org>, <tariqt@nvidia.com>, <mbloch@nvidia.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <daniel.zahka@gmail.com>,
 <willemdebruijn.kernel@gmail.com>, <horms@kernel.org>, <shuah@kernel.org>,
 <cratiu@nvidia.com>, <raeds@nvidia.com>, <rrameshbabu@nvidia.com>,
 <linux-rdma@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <bjorn@kernel.org>,
 <dtatulea@nvidia.com>
Subject: Re: [PATCH net v3 2/4] psp: support ipv6 extension headers in
 psp_dev_rcv() decap
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Bert Freed" <toddfreed@meta.com>, <netdev-bot+sashiko@kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261023234640.1459291-3-toddfreed@meta.com>
 <179288570143.3134.8925369868949382653@kernel.org>
 <CADh2yMyYS-PWP4912En9D6B9up6Kz-hnCthNkWot+e7N8-q7ZA@mail.gmail.com>
In-Reply-To: <CADh2yMyYS-PWP4912En9D6B9up6Kz-hnCthNkWot+e7N8-q7ZA@mail.gmail.com>

On Mon Oct 26, 2026 at 6:05 PM EDT, Todd Bert Freed wrote:
>> [Severity: High]
>>
>> The PSP ICV doesn't cover the outer IPv6 header or its extension headers=
.
>> An on-path attacker could take a captured PSP packet, insert one of thes=
e
>> headers, and set saddr to an address they control. This assumes the
>> device authenticates such packets, which this patch's premise implies.
>>
>> Several of those handlers reply with an ICMPv6 error that quotes the
>> packet. With default sysctls, this happens for an unrecognized routing
>> header type (type 0, for example) with segments_left !=3D 0:
>>
>> Before this patch, all of these packets were dropped at the is_udp check=
.
>> Forwarding the decrypted skb itself looks blocked by
>> sk_validate_xmit_skb() ("unencrypted skb with no associated socket -
>> dropping"). That leaves the ICMP error path as the open channel.
>
> Agree with this finding.
>
> Ok, this puts me back in mind of the approach in v0 of this series ; just=
 drop
> packets with extension headers. Actual support for extension headers can =
be
> done separately from this fix.
>
> pw-bot: cr
>
> -Todd

Like Jakub points out, this equally could affect tls offload. We need to
be careful with any features that can result in device-decrypted data
being sent back onto the network. Another gap that exists currently is
xdp tx or redirect. That would also affect both PSP and TLS offload. I
think we should try and make these features work with crypto offload,
rather than building up more and more defensive checks.
