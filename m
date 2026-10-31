Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480284;
	b=uM9NPnktRFFMopD83egoPk0KpwxvyMxc5hl0vuk4yFQzFU+RLmt+Dq8Ktq8HqKcUptPi
	 rSHnT1eCFBGQkScDDd7GOpQjNEHdHq6eFWTHZA/hEp5wpNPwpzBfj8aB7NdZ+tO8908IB
	 dScLoDtKArFg6EPbBpv4h8UgkQzHjdXRRDXqKzhCAobFmt0Ggc/epeOW6Kofsa0awh61L
	 rYNapTZeYdpkwdrzzoLYiYa1AtMlJPL84XqIy+0+LNkAOxmqsI4FN2nmn0NF80wu1mYJ+
	 Lqdx3E7yKStCc0g2RJfqiDkvosMSFi5mwmvwYCJS2RYfzjFjuexKbTqOSpozHidZf6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=Y/LYbbBt7trzTMNEroyzygNAvIrDGCzErGprATR8hIs=;
	b=oyShzDxy/0pUIX5UM6k3+/1ps4b1mCqb5HcKvH2osg2XAOX+8EMeHDJ9PjFXqGDJPMB1
	 2Fooz0/bxaFWDWSvPe75QvuZVmdOkHx5xb//XMvBrE4/d5ucLEcjKUKr9o5BuTUm5e4KG
	 21evpIOBjx03m7l7PFC7LslENb0Xq3Oi9n2aiFi27GHuKpnUvFHrXC0xL53m09+XKiozE
	 UY5v+U2YHOodb6UnjMJ6ktI+B4xyKedEw8YCGi3g9Ao8P5FhMckPAZkZdrDc/gWMI1IIi
	 ID4HDtcWBELUbSwnMnYj8MoQV5fQWrFIfFIv7TDuMG2r7IvweHuvGK89bWBYOEjAnNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vIz5pZpn;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FD6606A31D
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 20:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FD6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vIz5pZpn
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e5fb79ce82so11637465ad.0
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 13:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793480283; x=1794085083; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y/LYbbBt7trzTMNEroyzygNAvIrDGCzErGprATR8hIs=;
        b=vIz5pZpn/CV/yT3JZ9+1Z8dTi8d7iNdhPVwu7OHZVUJIqYzO+tijbQDNdD4DTk6NDL
         Gje9LUAQUA2bhu3AtYBzjfgA+ADNZMmCw75yfHKfhu69QGj8bU74LyR4Rc6mDTEaZ5YE
         b77vZZqkQqCWM60tqV1LmKF7ixexHIaZDLyG9T6tKaxPpy8oHSZKQMCmPEqOP51FLPgG
         MT1VRA1zNe9Ww3FN8aLr7AgQ/ivfkQ/d7jYTqRuvitlh05Ebui+s6dpbGoEa8h/sT4G7
         o3LLNgX4g1GuuFV11VC3Rm8Dxd8h11rh1Pc/HKAxRcc+psyMI20jAACnaB06y8W9RyIJ
         7rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793480283; x=1794085083;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/LYbbBt7trzTMNEroyzygNAvIrDGCzErGprATR8hIs=;
        b=2FRXZxPldT6NQpRTB4vsqoLSPnL6CoonSc4rTzk3rfK8buoEmUEpPMMKBkbt2LANVV
         Sx9vJbZQhyyRyje1yyFHcbIBEj9pJjA2M/b+gpy+bwRvu6WoHpsI1KxhIfz1MQBMPejc
         Yq4RdI2Cxlz2kbrLAFoKq1GqbXWWVHO2hkSZvlEVHXYbaLLmGB+N6cbKBf2Sxvf6fERO
         Qh5qAV89EW0pgNEhqiCfu2HEa7xbsHfM3EMnXc+DIPlDlvPZSlqj3ocQXmbO72gZcSy7
         cCnqJWYAlgo6trLSFuLMIlkflRqw4lD/1bFx/jcTWGuWT9hBfWqN6eeU+av62LwSkuwJ
         WBvg==
X-Forwarded-Encrypted: i=1; AKwUvBxuAu/U3wBn2GqepzoGqGBRn7mAUzjjDP25jBAt5pjcivX+q62LNLXtJx6mI5UGU2+9RlumnYwwBrKz7lCUllo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWLfBsZUHA+9n/wFxmDlSOW2evW+ZwkMZ+9y33MkN0lBzpJazC
	VEDg2oFeQF89LRD5pP0iZoqMW61LKNf319vGLAJt+BqQ+P6+lBy0BKxH
X-Gm-Gg: AYBFou2OF8WW5BneseSTl6eQ8iIlDmEAdruWaVnVx6Fcly9Zh8Zg3qFOP/1Y7MUs7Gf
	FFgUSkgsj9vpO25VngW281oiPErxbi6Rc9VJkeP0QfY0xMPyX+8k7spCwh7HFOwhxpkmtvd3620
	eIxTdaa5wV0Xd5AHv0op+pUcJgtZ6fD4DxnS/IMll2TAeLqCJKAvnP36GBXk/lqGYSo8e4KqAql
	lfo4sNCiZh2X4Xq3r/YpJJbOR8XxooyF8/mjSltFOo4zh9x1NSWeH5SOC0niIy+IudGyM1m+XTP
	bzvaRNfu7l2VrANmyhqGsfzSlsXkQ5U+JPReMNY3OM7nkVEDhcux79WggP2lI2TYz5fpx327tmV
	ulOgeNY3NjriD5b9IQUpzlfJ66Z9b7rJU88C3HQqJO3ZDXFVBUrvpQDZFJ5o7SEYEwcwst0J/40
	VrSIxul26fH2KRe7nITSLZx+vDXLqCPDw7IYv9ALzccH3GZW2xW6oVxut5pRogdIecaH62CYZgO
	RMaNT6xJeLyXX5PbDYxi4YfGc45A+B4XGYFackhJwEWUhCfsKwqqpH6ERkNh8SbcPbj4nzu2fz+
	0bcrHvbEcVQXOvSWeoOl/II5f9NFb+LeuQIVGHzkyFAe5M3k4BHK+hbIjeQ55bFa7EUAbnCfANf
	sBQqvbCV5w4Bw+0/LnS4hryllkUsiK3X5j6j3tcVJAaBHhC3tveCnso4=
X-Received: by 2002:a17:90b:4a85:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3ae897994c4mr4981300a91.50.1793480283148;
        Sat, 31 Oct 2026 13:58:03 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9426ffsm13250949a91.7.2026.10.31.13.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 13:58:02 -0700 (PDT)
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
Date: Sat, 31 Oct 2026 20:58:02 +0000
Message-Id: <DMJBP7BG3GE8.1ZXVVR0YIM9OO@gmail.com>
To: "Chris Down" <chris@chrisdown.name>
Cc: "Nuoqi Gui" <gnq25@mails.tsinghua.edu.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Mykyta Yatsenko" <yatsenko@meta.com>, "Shuah Khan"
 <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf 0/2] bpf: Gate dynptr probe-read kfuncs like helpers
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20260615-f01-07-dynptr-probe-read-cap-v1-0-e626cd61a381@mails.tsinghua.edu.cn> <DJ9QOWVIXFHR.1S8UL5H0USVCB@gmail.com> <auN_R9gCBqNwEkKV@chrisdown.name>
In-Reply-To: <auN_R9gCBqNwEkKV@chrisdown.name>

On Thu Oct 29, 2026 at 5:15 PM UTC, Chris Down wrote:
> Hey Alexei,
>
> Alexei Starovoitov writes:
>> It's fine as-is. Won't fix.
>
> Could you expand a bit on the lockdown side of this? I ran into the same=
=20
> discrepancy independently and was preparing fixes until I found this thre=
ad=20
> while looking for prior discussion.
>
> The CAP_PERFMON side is now covered by 81c975aae375 ("bpf: Require CAP_PE=
RFMON=20
> for kfuncs reading memory"), but the probe_read_kernel helpers still chec=
k=20
> LOCKDOWN_BPF_READ_KERNEL while the matching dynptr kfuncs don't. Is that=
=20
> intentional?

lockdown is a security circus. It was broken from day one. It never worked.
So all these 'ohh let's fix it' missing the point.
