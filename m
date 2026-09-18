Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0E43C1D72
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 02:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697448; cv=pass; b=CK7Ds1JUVWLnjcCCYgMTL7ywqWMcpwMmqPqhs3g9pRsb1glxSqCB1rFYb5QqUF7OffsPkB02NbCTw/ALvdlWmhgIcavfTkEhEWg43uVjq41Rv9qZYpsm38n4N4k14G1UaOfbsvK5nY3jU78L0Ru5uSXgQG9mXT3HRkIciNnhq68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697448; c=relaxed/simple;
	bh=1sQBP7SrkiTRTrgayl1ZMm59v8E7DacBcXYFi37yUzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3gJo8TWaBbKfpW1iWTxCZGB4DrXyswk3Oqk5KPRQf+fdHKQIlE/qe8e+uDpDmv8CoZG3d9xN7x3V76CvzJXcS0hXK8uav6yqeC8F1lTIDNPdpq1k7AB2QLqxjGtn/PLh0WNKHJFRBPuBYj+euzE9kNy1q7PR1Ze0hdTbxEdi8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHl6crkm; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHl6crkm"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so1950335ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 19:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789697438; cv=none;
        d=google.com; s=arc-20260327;
        b=ZpXjuRWCCxULW+s+4xrYWmgn8QmCGl43/mXO7xNQ2Lbt0OhaTTTjmO60nPH4s7Xa1G
         BKvCN93T4QKFadScN71Ms1SJeg5MSsjUZbNFZo3erkJA4Z3WXQPWTkL0i4f+FLREj6gm
         fHUsTUA8IMwHiKubPcpX9hclWmlOJMoWMadmF1RUKR/d1d+gWoeFK3D1J1bu9y/6RrZU
         YKcSHsAHLacBDKszYVQbONsBHU3frj6RIA7AWn1PJXC0p/UELsKoYHYcMzy8XfQ7PgoG
         ynT+qqkTPYl3EGxnDSBGQCiTiQYXCqMI+ME5p8045c3LDhSQ5Irh2R+14CAalfz8WPv4
         Y18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1sQBP7SrkiTRTrgayl1ZMm59v8E7DacBcXYFi37yUzk=;
        fh=Y6ptpDb0/aNXi8tVJh17hFvqavoP7EkDq21mjn4YgTg=;
        b=qlT8dodBo+J+pa9wYE9FkhQy2YvN6Y6xn4GepF6v0tIsfr7tDEAja3fcKO2c7BBD0i
         w7hD7fp1DMsZzeFE5PL7ULf9F55N8nqkYzPy3Ivl+sOaWHErKoluw+Bk6qYp/3ozLJOy
         8fPIRK4EHlXVcVOLonS0Jn0LXH8ZSO+5y2mCz4QqpRUefcx32RymX6CSXB5yDfCEvLMM
         9TQrq0DC4kcS8sk30FMnkMyD8dF2T3/sQUF9xhqI1IwR7jOJzZIl//YXsxosITf1Tb9X
         Bc8oJTDeOA9dKQmgZyVoDxtZuDaEkNok/2UfKuxIJGHMxkICkRTDD50/Nb7nsOR1xMxR
         GICg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789697438; x=1790302238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1sQBP7SrkiTRTrgayl1ZMm59v8E7DacBcXYFi37yUzk=;
        b=PHl6crkm73fjSPV3qwbNtdvvgUWfbFJUu75vjkG0WS8aNCEeA9ORcN7EEAakPNDLZ5
         YB0c1l6muddfY2jMfAQbqpw4I4dWROiCXZF1IOOVHmkEtTxJa7U1UFn9/7Rjzgsq4gqj
         mGosE/A6baJb9wFmCGHdBM8339JPjthQurWwpUx8s1xPYo7g5HZRuOKQzWDUcuPv67RV
         gcwXPG5GYg9XVP9gBkTahTWAq7ffG0ho0Oe4OAspYvF/cVgFb4gtmCith421CtJ5jkNj
         D+sOxmb3qQRRU1EFopCNaNUCXF6nV8AU0QoV5yzEmMUQo5QRJMI6Bav76IMMwcKU4C8x
         vbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789697438; x=1790302238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1sQBP7SrkiTRTrgayl1ZMm59v8E7DacBcXYFi37yUzk=;
        b=sS7tmipmZ2EY+PLz/VX9hRwYN2laku9YEkcW3OJq0Ir5v+xk9qv8p5i4THGFK98p75
         aWMcWXFKi9segZ0pLcaTvA+nopw1REgeomRLGK2HyZTYLsNGYKcz2LLDeNzwSma1MOU8
         GvMWVDvJBTdW5LC8rVqyDsx/El394DVixUMWN73x1wrEBVbjyYbG/Z+J5r/BFyX10Xgx
         1hrGn/PDu6bkDhq+XU/1IhvSFApkGXAfmXsdvlxxv27kC701iJhkYywb2m/2bC+mUdRJ
         LP3qQ+A3Xb0VZSSFY3+EVRXM31Ld0uNVr9tJ0TRhgMkkad/4Ky6pQtn/6V75gmXhb1xv
         I5Eg==
X-Forwarded-Encrypted: i=1; AKwUvBz7o7yE6vtTBnt/KZznlsCeu4fKA/KOL1tjb/WT0CBBEiXi8I2TkaNuZM0PLrvgMYs6ch7BeLL8WsrALneLrnI=@vger.kernel.org
X-Gm-Message-State: AFuF++m+55kVPPW2MEJD2X1493VB5xyDmyZNC07nMKiGTg5zvo33EapG
	9tPd2kGcltuLja885L0BapGtIELG15abfqmdNcV9L4yC2QNS/zOGikiov2/bponl7np9u1Dd9GH
	XxPh4JuXaCLa03uskfvznV+wm3GQ33lQ=
X-Gm-Gg: AYBFou0ohjZKCj6P+uVqABpv93Bbz9buHZLuvJYbzm6DCxfn+d8vhdtG8fwZYZYCO7W
	YCg4S2GbyIp0p0HTPN5g1lspUI7bCl+WBg4PjrenOCdGWxzAnBcjgURA0Cm7+oqU5mKdkvQhapC
	3DUFSMews4K8Imk1lf//1x6amhLiMv+YgeUY10aRkiWklTAeCWlTfFDtM+5eUG9trbHbEzCTT/i
	Kgf+A93L2xrFNaoVA4oUroLRkJ3hrqZmO6bSDjEmAv2jnGS32Z04IMg006LsRPXG3jORmkc8oxj
	g7sDQ6AJd70wp1D/aACqERMhylJBS64EQK8yIL61MpLyyJVshqVD+KiXUT7iahXe681tzLC/jfL
	6AXOSFowwOHqiZScFsS89Ugf+ZsIPrOJ0tWjlEP0+tYacdTxgnVNBMcbgsYqHjzvTBAkEouyWPw
	==
X-Received: by 2002:a17:902:f68b:b0:2d6:fee6:65ae with SMTP id
 d9443c01a7336-2ddb1ab3983mr24249855ad.4.1789697438293; Thu, 17 Sep 2026
 19:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911135711.109338-1-jiayuan.chen@linux.dev> <20260917185926.1bb7c430@kernel.org>
In-Reply-To: <20260917185926.1bb7c430@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 17 Sep 2026 19:10:27 -0700
X-Gm-Features: AcwNN1X9hXr2f0Sb6Klu9W7uMPQkOFPox7maFcjw4UGshBodQT-bZgDlH6jEEwg
Message-ID: <CAADnVQKaXUj2uxgqerh7N_CDxneg2AgF9VJ2SddG=rgn1de1sQ@mail.gmail.com>
Subject: Re: [PATCH bpf v3 0/2] net: xdp: fix bpf_xdp_shrink_data() page
 handling on generic XDP and veth
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, bpf <bpf@vger.kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Simon Horman <horms@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Hangbin Liu <liuhangbin@gmail.com>, 
	Martin Karsten <mkarsten@uwaterloo.ca>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Eelco Chaudron <echaudro@redhat.com>, 
	LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 6:59=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 11 Sep 2026 21:56:50 +0800 Jiayuan Chen wrote:
> > I'm always confused which tree(net or bpf) should XDP target.
>
> Selfishly Id prefer net so that all our CI would just run without any
> manual effort on my part :) But perhaps BPF folks will disagree using
> basically the same argument.. :S If not perhaps please switch to net?

yes please :)
all of xsk, xdp, veth can (should?) go through net tree.
We can deal with sockmap poster child until it's cured of bugs.
