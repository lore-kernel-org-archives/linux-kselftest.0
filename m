Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9095423EA83
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 02:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772762900; cv=pass; b=KWox2jXm7Qwzu/wB9Uhy0WfcBmHcn4/FmQZoXiwJQwtER1krk3CeHqN7X6CGPDigbt0lmtXCRzD++pxu3WVVcYUzwt51VZa/YvZnLts1Ppneptndsk3O+z+r6Xp2pu+k2PL6Qx0T91D3CjvMzTCf+HzOhN/E13M/qQDfTEro858=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772762900; c=relaxed/simple;
	bh=/Uki9RsKdjh0Yx5MYD7ET7E2uUAT8r6JDmpn2OGZ5ws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C++SnME6j1IytVopQp9o4MvbyuJPfRlC1lpNFF58ijZcS0n2mOGj3SqNeR8lU09iIH7YKt2hrpoNuf+yo/kPmavK7AN7H5hNU6h0eWwP69Xgt/QTwiwqnhFFHwVLIpHlUzntwI0bfgl/XkDmnMaIhaKAqFLB2l3qB+yICRuFFZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9KamQkJ; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9KamQkJ"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ad9238d8fso8580026d50.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 18:08:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772762898; cv=none;
        d=google.com; s=arc-20240605;
        b=Dlh66+P1I57KeukmUuKD/XZXpgpJVCu5zlploTQMjic51dDKst5juY6pJG4J2PQWJA
         W3hqh11FWbBDboQxYtd3rGdcGW994DW6paaYiPKvEwyTFfyAjN2Of44nGeb9NAX7uqGO
         i/qlLG/8GHaFfjX+5komJm9zJ0BtDQo2MyHT0/LOAFPfsm5kAilU5cUVh0YEMIasjEld
         gNIPqB6fakrjVu/U4qasmUuVtcTkaOSgIPSIYDbJ/jG8T4Be9hFagXMNPsOUPuYgu7W2
         jVKXZ1+rRWj1Om70Xq31szps817n49ZMiPbUw9UJfqDyUIegaYQuSaZ5iQtrtj2NxT0l
         yeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Uki9RsKdjh0Yx5MYD7ET7E2uUAT8r6JDmpn2OGZ5ws=;
        fh=c8gfwOhbYkbhPsSXdbHCEEyqlHyocB7TcDgbVPdy2Lg=;
        b=fJs0rjffatI3nX2C6POQq1GO12xob4gXIIbs5tgTZazzlyzfuZcFjIxcX1ZNMj0Yc4
         T4QBJCGVyIJxP4xzIOtMUhtL0HcAB/0YLM/ae1mo7Zpp+utU4X3pJ00WsH0nMJNMyiEp
         vTokpBX8lMykSRFwtpy6cbDlKRg7WXnSlaKEb/2YDSnJwkoD9060VWawR1dg46TSN/5P
         JAbRVZdViHQAKXibBXbQxKC0rpDB5IbChYo9jGiVTzZRMuS0JKuN8nmj60DBPL92aaNl
         D2vMRlRgWVLaRG0113tw+2f1LZXw0A49CrmHgY5fILfoRPTg3DdFJ5dvptokSOlXfdLw
         E3bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772762898; x=1773367698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Uki9RsKdjh0Yx5MYD7ET7E2uUAT8r6JDmpn2OGZ5ws=;
        b=D9KamQkJzxVp5OWhPai0/1n5H2348UX7/msn5iG9HUgApWIeRwg4yevNhNnSG27pQd
         8PI93Z922NtwV7SGXTtKpKyzWVFiETCHOCPK96bY1t+/zCJWdZSgRTlZSXISPyUlKjK0
         udQG6U2L6dN8lk/Ufw0sDtj2qiTstu7StPYPSQAhQUOI8ikpR28Eovi4BUsJN8JJlwjU
         wnDpuHpIFLHZFDiSUhoRAu5DYH3p0fhZC0Q4adeUA9RmRIn2COQPuetyaxhbRq1SCOB9
         SM9jk6baHOU1Ml/tdcQQy0izT+9Z5AgAYO8brJvi4tnGj9zb/pM46nmnYGKBPgGspSIS
         ggag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772762898; x=1773367698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Uki9RsKdjh0Yx5MYD7ET7E2uUAT8r6JDmpn2OGZ5ws=;
        b=Z5yUWolXBKK/nWrL5+xHb0Y8KGgPO6R8x580Gt33DVKZXvUmsvZrsVutWgv5Dldl4n
         QM+qNeyY6+tpnLkN80HjCEwnIAoHXTrd3W0MLAjzDhalxmxhkXTdqSw9bxyEohdNsQUz
         5+ro+a0DxqKXoQCXp6oJ7CupPne6JNgBJLXK8pUiZWNFXysR7kR5ox2Kn94FtT1ac+Os
         1NG3U6frcCdNkXMxsQeE6lieJPJ/eRX64L+rvQPKGPX+hmSLq2+hXH/6zJlQdqoXYLKR
         qif0zqFpIJ3slULW9bJSM1RzJKg9cQzHsdN/hM6uE39TachR8gsSPfrhb3gFevGpGVPz
         d8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuVR5QOQZ73Y6C9Z9C90FJZuSnQIgxmcBB2HvqnoSEo2KmOPhHwH9PGFRUnucgrXjnSkCgLgGNEIZ61kK/nMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB4mhZO/T8gPMx4cFGIC/aQhpPFZiMKx0sEa0jOUmEf4k3X4PP
	zq3G2ZYQZOAo+VsEbmZ6IAidMsbMMmWFAcjOmk9Jh91GfVede3vxBX5OHCTccmcGbfGHA/pXGbO
	5q/mwieAfJCgWv0XJVXoqlTrnzzqRNFM=
X-Gm-Gg: ATEYQzyMn7a2DFEfPErCRZJBVmBI4bh3+OXNs+CmkInIPd60S/l69ft6dzxz7B492fG
	DNPs0PGMsDRhH4aTn1CPTHaEauDbdk8FfTWlCRHkTLnfBjWO94X8LX5OyNjprQw+idu5Rr0+CKf
	k7mMyVM95GEqblhyTzCWv0ZaX6269+WL3b2lkgxYvGFyZgWAK0Drb257b+6lsv6e8H5Yq0F9O0T
	MMqILZyS/Ct/1W3cI+7EC2vLq9DMcnchVoQrd9YlgnSXQ9PwjBQb++z9DflgyAvvVAEF5heWtod
	jfz0g5FS
X-Received: by 2002:a53:b191:0:b0:64c:b68a:f519 with SMTP id
 956f58d0204a3-64d14397896mr464727d50.80.1772762898553; Thu, 05 Mar 2026
 18:08:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302071434.311395-1-sun.jian.kdev@gmail.com>
 <aagWYyrrwUt-poL1@mail.gmail.com> <CABFUUZEdbCMrNyp4kEO7A4KZPn5TKi48+tQvaaYaYuJj5FQ7gA@mail.gmail.com>
 <CAADnVQJfDYiBHa4f3p_7MpURE_a33+atRbjbcpZ0VmrKFaKkqA@mail.gmail.com>
In-Reply-To: <CAADnVQJfDYiBHa4f3p_7MpURE_a33+atRbjbcpZ0VmrKFaKkqA@mail.gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Fri, 6 Mar 2026 10:08:08 +0800
X-Gm-Features: AaiRm506lW5sZ0vhaSfvVU0rEwcX9rsPKby9YutJ4fCIZJpsj4LuhVd5BCEEaHs
Message-ID: <CABFUUZHv2a0ky84aUKcqvH3o8x=5jpUtZMW=SrrNiD392e0sQA@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: skip verif_scale_pyperf600 on -E2BIG jump
 complexity limit
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Paul Chaignon <paul.chaignon@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 9:14=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> It's been failing for too long.
> Pls do a minimal change to its source to workaround this 8k limit.

Will do, sending v2.
