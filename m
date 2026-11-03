Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731861;
	b=ttN4go/zhHA9FF+vssiGsQcTkiTEiPZ+m5dqLunTTLnMlewbLQh1Jm8f+FTBrSx0Zc3+
	 So8M6suQykbni/gdx8+nvScJWa/lMkRCFPbh0x4REU4dup8NktHSe5z1DvbYs7hiTzYtH
	 4vU9vHVDN8GFvBC7HrYT+bJ/INWMroTYp0eeqK+WJ4scycEyc24Z9G3LrL4q8qiSjCS8/
	 ldmxNc7XS0+yFEusxsae8i1QGtwYrjDbfkI4VNBcp+SxBtVxj2e5m8Us0e8pz6A2xod4Q
	 +VnU3kHa7LjaqY5g3O8DmIkoBTccy44DL2XJYFrI+CsFVJRkzIvkCGexjM4qSdHaLoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731861;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Subject:Cc:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=SV3j1/NOB3cqz5PgTb/kJewLkVW1H74At45X3b+EffA=;
	b=tr1wUqJKcz0sSFNjM5DsD1IfV1fLgsxEfPVzvcpin2E5SmOQRgBY4vcmjfUFPgnHRpvG
	 fZQTPCVkreoglZsOuhyc87Gd6CcYKoPoUrE4nJMXK9340DOGTo9gDYhLGzvOGkpacRwSK
	 LKVqt1gIBUWuNR+PFhJGuWQFNbEbUL9eb5/xMg0DPpUyJgfLApYJtsD7XaPmDs9xK8Rh2
	 CQhRye2UliH/DR5BV6Xj+3kcyQp7eKpYC6VOe+l1BHNd7v/hb7zoAY4M1Q1kE3M2U8baE
	 t3ARko6UFn3TlRvfPcQGfc3BQyxJpAZWMDL31o4029/MEGWnF7B7MTDyCD/QROhtGiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BFRa0cTW;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09706606A31B
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 18:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09706606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BFRa0cTW
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 74AA41A143C;
	Tue,  3 Nov 2026 18:50:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3F6F56046C;
	Tue,  3 Nov 2026 18:50:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8973103291D1;
	Tue,  3 Nov 2026 19:50:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793731852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SV3j1/NOB3cqz5PgTb/kJewLkVW1H74At45X3b+EffA=;
	b=BFRa0cTWbki2shifQuuZaeD36FTwQ7JoMSjmkZp/J3DN9jcUQ4QurPyQznbB4tYwMQeg16
	LahZiXeWIdTXdxfihVcLs3ER1tudijCn6XE7tzQ1Q1Dr745sgxUJHc2TDK7SGrab1nr02H
	Sb1BggmG71T5TTLPnuwv6X4FGYSQpXJ7VJy8lz9XmDwOZuYK3mBeHZnIkmoDmsy36hXGCW
	aQDGcnIZkhpVEoQ2L7y7w+rzt6jlgrDA6ilZybQNx/GPdZI5bgW2eVdg8j65MWPtAnlv2k
	8sLxzv+6pdMIDUSFLFmVmKhvBhYBoU9wqsGe0VfUc/CPVbBSTaHlTfBiQmJpHg==
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
Date: Tue, 03 Nov 2026 19:50:46 +0100
Message-Id: <DMLSVEMJA9UE.2H7ZSBBU81XVS@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>
Subject: Re: [PATCH bpf-next 0/2] selftests/bpf: port test_ftrace.sh into
 test_progs
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261030-ftrace_in_test_progs-v1-0-aa50c5dd1ccc@bootlin.com>
 <DMJE6776F9F0.1O5A9ZMKWYEUP@gmail.com>
 <DMLGLCFQW48J.334XR00MX6V0T@bootlin.com>
 <DMLS3TW3RYF3.230ZHPCINZ0N6@gmail.com>
In-Reply-To: <DMLS3TW3RYF3.230ZHPCINZ0N6@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Nov 3, 2026 at 7:14 PM CET, Alexei Starovoitov wrote:
> On Tue, Nov 03, 2026 at 01:13 AM Alexis Lothor=C3=A9 <alexis.lothore@boot=
lin.com> wrote:
>> I initially went with a ftrace instance, but I came back to global
>> ftrace because graph function filters (set_graph_function,
>> set_graph_notrace) are not handled at instance level, only at global
>> level. But maybe setting only set_ftrace_filter and set_ftrace_notrace
>> is enough for this test ? That would indeed simplify a lot the setup.
>
> Yes. set_ftrace_filter alone is enough.
> The test needs function_graph and a trampoline on the same function.
> set_ftrace_filter of the instance does that.
>
>>>   all functions are patched       only the filtered functions
>>
>> Are all functions really patched with the current series ? It is still
>> applying filters.
>
> Yes. All but the ones in set_ftrace_notrace.
> Only set_ftrace_filter and set_ftrace_notrace decide what is patched,
> and set_ftrace_filter is empty in the series.
> set_graph_function is a run time check. Every patched function calls
> into fgraph. Then graph_entry() -> ftrace_graph_addr() drops the ones
> that are not below bpf_prog_test*.
> enabled_functions shows what is patched.

Ah, thanks for the additional explanation and the enabled_functions
hint!  That definitely clarifies something I've been struggling to
figure out.  v2 in progress with your suggestions.

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

