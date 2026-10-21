Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551887;
	b=MG/LEaYK6qEI5B8QaNw5CcKg6nMuXD5QW+dMlO66N8c5xIpeJ9QzIPLClGGnR0OLXuwM
	 BlLpDqN5tk92954pheBnh2eCTSWPvGrBXK/nmfMXec++rQBmFDE3D7TPSUWrJKpvq+T3m
	 qi8bqSDlMlzuNlQc/HR2wJWBDw+CIC/IJ+tUmOpDUNpmUgy8KR0tECKJpdy3mEU/Kk1Eb
	 Cdi7KTFRZeU5H19hkA6lpYUV8yg6jzm4fgp/lR8Ev+pFV/D2fZP1D5Lbmkdnneq9uVmx3
	 2hEZzLHW/gIGbOUHDT2Kdf9zMMMPPglC9olc7laPPfs4dUrx7TUoebJgnXymPpnjiHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=rc5wrhUHr1AVoBfBDZ+r5qvZgVrRLeIPWk5f/ArMKLg=;
	b=nn/mrJalGeGCWbzM5KIAMmc13zJLbqZDVdChIw4E5fA/TlUC/yo+vBpkPtTcpypNqkVH
	 80082YYlFEe1SjDiRX6tHWhsbaQV+vG2+5a7/LO11lp36uHWkwIZFPLJ1OybBX0NVhAKF
	 HatVt/dTYWxX0PpiI9B7wbRAW7KFZoa0V3IDSNZv6phYKlYxQwkRCxsHJRKtgDNRB/HdK
	 z+4DcmTXz4wrD4GboVJH8yHMHDIpEDN/YrLvrysmMKYMz5e/CHbdU3Q9S4RfzEqRFbxi5
	 gym4lcSUCKdXG92fvvaTXxeJF+xCj3AvTHMcbGakEmSwDpkj8AkDUOAwH9OghKZ1bBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PuGDi+yC;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1DA606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 03:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C1DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PuGDi+yC
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso67690a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 20:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792551887; x=1793156687; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rc5wrhUHr1AVoBfBDZ+r5qvZgVrRLeIPWk5f/ArMKLg=;
        b=PuGDi+yC/qP1bGcg/TSJFrSAOJewAE8/w32VXn0pviJ9BU1AXHc+a3rPhPUuvSfVDm
         JR7tpDlII85BMuy9n3vyR4guPVqaMo0FxWhPE9NcoUQbhXT+7mMAI4QRfLXUIcqo5/Xs
         q6j4Gd+4w4vZcM5fGQi/8qw9VONKn+ZhsJ6qLm4IGL2EXDxGcJlYXGqZxwREBl5JaE7P
         l6vYVejnVU+p2Lwy4bfhWLOkJSbW+EYU4kJGgtyAWl+a57JCZRRlZ6MXcsMGDQJtdKfX
         UIsVQLX4CpWTz8Ys24LC4PJxBQF3aDGHBsiFJYu9VBoyLLX+g3l+ljvbGnceydfkRGMe
         hbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551887; x=1793156687;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rc5wrhUHr1AVoBfBDZ+r5qvZgVrRLeIPWk5f/ArMKLg=;
        b=BuUAtpPDFHvM+zMIEfSsUoteiEG/EIniCDd5bnWCZk/N0SCAXDecqXJfBNX5uLUJKp
         iEDpme8mkwDezch9Aht+hOWFM3SgZA5o6IBk/2AlETe7A4pOX/OERq6JIV0SvwmFADRU
         eUoEtdfoCZeDdAnSrI64XgYgeJrP4W6Ne/h0x1V9M6/Z/g/yM1kXznd7v6luV/qMhvXy
         aRT6bH7MvNAKkGsVXBp9OHAae59TooZdmXhgheWxVEwmZ7/hz+5k/FwTpo03LQyLoPj8
         vLZS5ObacNlKiFvQkm62O7zMSoU9fO+VrOsYj8/o05IkDpo8wZOKlY6mfX+GAT/elEpj
         l40Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNY6xtNE7KMfC4D3zwUxoxZd2oGnf5hhkXi9I3d+my5TTDtsWcZ1MysoVKQ7z1RCA54RfkN+88tQ4DGGw0Mvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW69/f/JYu8TtZMNyznExFbknJkHqXifM3txz57HnXIifLcE9J
	5HvRE8Pt7c51OZ9Ek6hNPjxpEfG28qlcL7ogCgGgDmy1IW1bKzbNZ+zn
X-Gm-Gg: AYBFou2PmA890K4YSIHFsxU2eYuC9XpdFVtru3cKOM2BsYA9ACyyDLdjuodmuqAfS6d
	2+tF0igfYGSqWJuLwJQSvHnNBWbtgTmXnfbo+y917JaXk+cmB+vcUOIgb0rKjZh/070C+p4SstH
	i3JMI5PtahzjaP7yK4eSqRRjkx1xkLdRHMZTi21QUW0/jSFz2DSCRby4JCgJWY8dWUH4rQ9VAr+
	wsVr0IPGBGlczmELBkpjsP/T59Vm2LNrI/xwUZqzXJ/dLRXYsRdUUI5s+oYVTL3P+OeWeS1vOY3
	gBS93pHCtEAFssBLzFnCA+F4Di7TpHsRwdHJ/gf1Yyy+QeyLrKEsusSV8rXDhwP/b7diEXqIA0t
	vt3wx2WYGOafbKfy4R7vHbRHdw8JED7fYLJlzhGREU5PyNz43e7v2UwMXtcckzZO3tTlGEbmmNk
	66uInepcw+Hh6DudlfvW7kk8OHXz3c/4wnMgDjSUUSWxjPP+06pSeF80Qr0ZzJRluxD6me5T89Z
	KlMw3mdbbNYPt+3fRYFgcYbY805IQCE60HvidcDg3LWJLOBnUx1BEHjsv8YqlldA7ewC6sG8m9k
	GowZYOcWwr58GanmyLlm7wV5RI98cy6PHtLG0NVIkev0XEPK8U1M+85daSjB0OxK8+MMY7zAkYK
	qSUEruw==
X-Received: by 2002:a17:90b:288e:b0:3ac:2788:cab1 with SMTP id 98e67ed59e1d1-3ad86ed22f9mr629222a91.30.1792551886548;
        Tue, 20 Oct 2026 20:04:46 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035883bsm1999788a91.15.2026.10.20.20.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 20:04:45 -0700 (PDT)
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
Date: Wed, 21 Oct 2026 03:04:44 +0000
Message-Id: <DMA6LZFMAQ3X.2YOXSMADL3LQ5@gmail.com>
Subject: Re: [PATCH bpf-next v3 2/6] bpf: Add syscall common attrs support
 for xdp link_create
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>, "Leon Hwang" <leon.hwang@linux.dev>
Cc: <bpf@vger.kernel.org>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Stanislav Fomichev"
 <sdf@fomichev.me>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Shuah Khan" <shuah@kernel.org>,
 "Kuniyuki Iwashima" <kuniyu@google.com>, "Hangbin Liu"
 <liuhangbin@gmail.com>, "Martin Karsten" <mkarsten@uwaterloo.ca>, "Masashi
 Honma" <masashi.honma@gmail.com>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261020152804.39863-1-leon.hwang@linux.dev>
 <20261020152804.39863-3-leon.hwang@linux.dev>
 <20261020182553.534c8d6e@kernel.org>
In-Reply-To: <20261020182553.534c8d6e@kernel.org>

On Wed Oct 21, 2026 at 1:25 AM UTC, Jakub Kicinski wrote:
> On Tue, 20 Oct 2026 23:28:00 +0800 Leon Hwang wrote:
>> --- a/net/core/dev.c
>> +++ b/net/core/dev.c
>> @@ -97,6 +97,7 @@
>>  #include <linux/kthread.h>
>>  #include <linux/bpf.h>
>>  #include <linux/bpf_trace.h>
>> +#include <linux/bpf_verifier.h>
>>  #include <net/net_namespace.h>
>>  #include <net/sock.h>
>>  #include <net/busy_poll.h>
>> @@ -10771,7 +10772,8 @@ static const struct bpf_link_ops bpf_xdp_link_lo=
ps =3D {
>>  	.update_prog =3D bpf_xdp_link_update,
>>  };
>> =20
>> -int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *pr=
og)
>> +int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *pr=
og,
>> +			struct bpf_verifier_log *log)
>>  {
>>  	struct net *net =3D current->nsproxy->net_ns;
>>  	struct bpf_link_primer link_primer;
>> @@ -10784,6 +10786,7 @@ int bpf_xdp_link_attach(const union bpf_attr *at=
tr, struct bpf_prog *prog)
>>  	dev =3D dev_get_by_index(net, attr->link_create.target_ifindex);
>>  	if (!dev) {
>>  		rtnl_unlock();
>> +		bpf_log(log, "Invalid target_ifindex.\n");
>>  		return -EINVAL;
>>  	}
>> =20
>> @@ -10812,6 +10815,8 @@ int bpf_xdp_link_attach(const union bpf_attr *at=
tr, struct bpf_prog *prog)
>>  	if (err) {
>>  		link->dev =3D NULL;
>>  		bpf_link_cleanup(&link_primer);
>> +		if (extack._msg)
>> +			bpf_log(log, "%s\n", extack._msg);
>>  		trace_bpf_xdp_link_attach_failed(extack._msg);
>>  		goto out_put_dev;
>>  	}
>
> No, this is silly. We shouldn't be spreading bpf_verifier.h includes
> around, and making core networking code use bpf_log().
>
> Add an extack to this API and for the extack -> bpf_log() conversion
> in the caller or some "boundary crossing" helper.

Tnis will be a trivial refactor in the follow up.

