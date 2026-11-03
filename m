Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729688;
	b=afq+v4EOJwOdOZ/qECWsyjgDB7JBCVohqz2PZ5SrTg0RK4ORyz3fwZj6CNo9fX/U7f79
	 ZaTAvr1WpECJWzjqbrqx5+ERjfIJ3N61Nhc2ZwT9MsEONJOS7I0d5w84AlDNhTAV0oPez
	 Cy/IfrNJPsNIjxYGiOULfQNwgYoW4bP2VMqaZsWKXEHD+MeWXhZoJGaImkw+WWq5ehNDq
	 eBlTqCpH8pCme8zSNmNH6g21Zf2t0oRoX4IXqMskI06xE17j6jkECgQ5ty4FvzGm8s4Bs
	 gX0zLxqJtIFox8SImoOruC6jEXn4eXI889UfWv4IxVjXr5mXti/OChJ4VVfvp2QeuJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=UhwuzspS0Yyijji1M7E/UqphlI1Fhl8GUBAG8CiVACA=;
	b=XwZsJ2cHgR6H6L4mwH6bScU3qrV2/UbOJWPrSNLtpxzY3YdHyKQDxv3y5VpYp3jtDwqN
	 Meez8dAEB4Gd+xmYITP1AwZyS26EmQFUl6CBVXtv7ozQGJl4WuNdeSlE93cYoOFQbnvOK
	 sGysnpdLhiG3xKJxCkiGdcwpl02hCrsNMMmQOcHs+HRE8j6LOQ+eEyH5540cMin8AuO8N
	 WToOz06b/jiSlcrhb22LPcyeMsOeqRZlWrXyvXtnd0z7NI6p5M6O6ER3uy8e2TJ6XrENW
	 eKF39RX+dJLs7UoKEa+A7oqc+kBbaA3Z8b1Uufa4VOupQPwCP5otGrl6vF9GDf+EhhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B903A606A324
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 18:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B903A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e977109392so30570575ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 10:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729687; x=1794334487; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UhwuzspS0Yyijji1M7E/UqphlI1Fhl8GUBAG8CiVACA=;
        b=T+pqAzLGRhfho17ISJiPBzo9Vm0WZ0VOpbCIz9fTLNtU22DlVClTI0m1qSFgsFBaKZ
         J4ntsKG8WJlXizSAk6CCiW8IcIb92j3Mf2fvkqcYsvgAbqZ8U9KrLd2i27w69Y7txFaz
         KZIqpxClXaHhL2CbaRX+LgfJKj7NitexpFfUoZX0qw0k8o8DRN5Rbx08fxkEMTVaQH8y
         ymz8US3QILzm0heLLvQFx8h6oNhQS5UHmg72pYDxJKGHpqE1PoSS3MFmWLHJRTk7bhQY
         V2NfnfeGSBAMDSFfPwviDqkxVFV5nieJftargTrRoH5Jfa9Jb30hnZokwDWqv0fnqwGU
         i5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729687; x=1794334487;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhwuzspS0Yyijji1M7E/UqphlI1Fhl8GUBAG8CiVACA=;
        b=0ZMJfFlg5CLPTjdgSC7rqT4Je+qoFOXKGdNzn5ohUHCfF6QCcesLg+u61bSWDTPXDT
         2DRbI9xHYiQN6Kg8wV4qESEgE/UVVQuecjPzqB6Ewi1Schvu9/zPKov9PmsTNw7wNk2H
         +oAQiHfj0pv7wU8bBKxClPLEIzxLKpLdnpQ8WQXM91LTPySlQAV+8QUR30dud4+c2tOb
         TxFmWqyzSDK31kCcO1mjfN4ft4Ejrm9YmMlYaFBRqoPikok1oI7YL29qTogO2MIHXPx1
         eYZN/8XOWxcQMjVNGQzNOU1tYYaSrJ04uzFUhTM5mWAST3YLOKHz57GC7aw30Nj72tbj
         LhLg==
X-Forwarded-Encrypted: i=1; AKwUvBxPmva9fvBpqhsZBo39gHTJjqGPsHvMh27bWAu9FkGa7vDxjE6nqmJH/6XBUYRch5J4YXUw7SOGAqQ9T6qBl8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TkB3nMmZ9k9csDFH2xngb/W54I83Pc4jJc7kfwricV7DCWbSm
	mFGB25a1NYBg+PVisHE8OL31dsU0lrvLPqsBCGKUr5gvGTuyv9YcCFlj
X-Gm-Gg: AYBFou3eZK9KwH17Tho+xMoR2tiWNWoraMuy0EhYSMfNl18rrAL74AJyuh/tY4KvN0B
	V9ePnlUKcY3I3m2gndLuNTTNYahVaCEAKd5i9PYyWIfQIDWgOAbkN3JdWYgFN55/lykS3cKMi+G
	HmdFXVSYtXg03EOH1sZD2GXjnF3KDUalVdMdrGiGZrIXxlYm8pRGMeupmLorG9aGUED6YHfQ5bw
	0el/kuSGDZPtKrIYF35fId3YGqKLfcYSkyE22iRY8f4K/KuxfDXwlu2/7ao2OhKNTFc8CsSF+EB
	YJrT9Zmb5LjzFSZwP0RYqXhS0quc8XGCWnB6oCR5EcMjlzVSeRgebLdDSlX4uCWusPdbsSy3AA6
	nlwQ8mAqN/Jp2weQwPIqpVxR75RimI57heUskrMY6PMoZPXyPuozRK53uWjwJU2t72/UpPIgnxE
	o4KQj0jLZ0vWwsyN2Djo0yBbNvsEpNJvP60K1sOtSDpNl5WwE1NVB6aHBDsw482HQfFZU3ZK4hO
	Z8Y4pbDXW8TTiT9CEBgYEMc+4xPetUjVx7VUVmuLGlniBDuYFiEPtYOn8mOKFAUAoG7UfkyCQKI
	n5UzNrqM1brkxe/5LIv0AMn/7sq36xpzMMngeKkFGV9K+FxkKDC07YjXDz1+dCt0LeSoP+PArUm
	X6U11Vr/zLwDlxCbH34+Mjb/s+AQoK+I1Qw==
X-Received: by 2002:a17:903:1cc:b0:2e9:a166:f7fe with SMTP id d9443c01a7336-2eb364961bdmr141273635ad.62.1793729686970;
        Tue, 03 Nov 2026 10:14:46 -0800 (PST)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392a5f48sm43693435ad.64.2026.11.03.10.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:14:46 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 18:14:45 +0000
Message-Id: <DMLS3TW3RYF3.230ZHPCINZ0N6@gmail.com>
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next 0/2] selftests/bpf: port test_ftrace.sh into
 test_progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <DMLGLCFQW48J.334XR00MX6V0T@bootlin.com>
References: <20261030-ftrace_in_test_progs-v1-0-aa50c5dd1ccc@bootlin.com> <DMJE6776F9F0.1O5A9ZMKWYEUP@gmail.com> <DMLGLCFQW48J.334XR00MX6V0T@bootlin.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 03, 2026 at 01:13 AM Alexis Lothoré <alexis.lothore@bootlin.com> wrote:
> I initially went with a ftrace instance, but I came back to global
> ftrace because graph function filters (set_graph_function,
> set_graph_notrace) are not handled at instance level, only at global
> level. But maybe setting only set_ftrace_filter and set_ftrace_notrace
> is enough for this test ? That would indeed simplify a lot the setup.

Yes. set_ftrace_filter alone is enough.
The test needs function_graph and a trampoline on the same function.
set_ftrace_filter of the instance does that.

>>   all functions are patched       only the filtered functions
>
> Are all functions really patched with the current series ? It is still
> applying filters.

Yes. All but the ones in set_ftrace_notrace.
Only set_ftrace_filter and set_ftrace_notrace decide what is patched,
and set_ftrace_filter is empty in the series.
set_graph_function is a run time check. Every patched function calls
into fgraph. Then graph_entry() -> ftrace_graph_addr() drops the ones
that are not below bpf_prog_test*.
enabled_functions shows what is patched.
