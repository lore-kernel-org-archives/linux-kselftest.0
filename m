Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207377;
	b=RtnULzvnzkhucrdTaGzmPh0CqtMINye2QAqXo8vJM3KQ2EksATHd95Ms1Nqc8OcIpVKt
	 Ct3oAVFGI6hOwSIkw3970/vg+D9BB2CUinIJ+jf97Ea6UDvfP+muNNR++SChbQU078vIq
	 lW6bbh6TMZUE8sPGiphZxeoXxv/8XcvId6dCvjVt8gugKzyU1ELyq9Cb2KhFKLFQU+usk
	 Srn/MbV/csBd6iBujzGRrg+WFzXT130fjebUmHsQAIGlN0fsQj8nCrvWf+pyMAcMp642i
	 P5Jt8etA5WtaeB6LlAFrmNkop6FggPgBJJF6ZKXkAqEAyaq15njwXWhnobHCU5U4R9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207377;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=4GH1ahEms1dqA45xIo5IOe2rBwRqoWw8ywFNljYwSWo=;
	b=EIfvR4w4lVSIgT/OK9EwD01hgmPA8wpQuoC9sLOgKV8kB5FlL67dpwG1S5Yt6+dYRpEq
	 piEFF6yKcnKzS0QtOjUdeY1HVHiTIBUSal7G2xJfYVxsV3FFfVWju7a8Q0yPy7CcXFdBd
	 JR3YJlqJNu8nLEviDJ74ZmA1oqHIxtPgrGyT7W41pUtZd59fWMXYfiSMhC3uoG84yyYci
	 yX5nZ0zXfKsply5tH/rf7jdRwe/y8VfiNlNdUPH+QLY6ctIa5Ug5EDzU+OtIwgby1Wjpb
	 L1HGaegtDMLObelYZL32zkw3g6xEDo7a7ENR82XxTzvdG5/UoH2psQGzuZP/BFxuq8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906E8606EEED
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906E8606EEED
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9495d543b91so79524085a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:42:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207375; x=1795812175;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GH1ahEms1dqA45xIo5IOe2rBwRqoWw8ywFNljYwSWo=;
        b=YpxyCRtuO2LJcZSBCPmnunDjIQM/j9b+1XkgdTegK9mUTEFrijm6avYfSf12wHJTJm
         3UkQpQ9Y5L5vbt5HpEZBo7j4Tgj4ajA9jfGb2Xb08gmtwDo+IKMhSNhesoxZ7yqo1gDV
         SOdG+EDYfaxMT1/9lLLtbsx+n/IKMa475iakcPvOfZm4oggVs0eV8RRmjFXXzOna77zh
         5tTvnR4mgsJB0rQ2DT11fSvep3JDAZACQs4B95hTvXOojXQtB+/ppzrh/1rFLD2SNydh
         m7afMnDiKo12paE1FVjHfmYS0wowwkBidOztRMAmnlOD01gjG2SKe2aVgl2Y1c1jPdhu
         I7fw==
X-Forwarded-Encrypted: i=1; AL+hErFDH02u7FEqrf3fnHZLAqpjR3uCljXPibzcZZ2TlmHUpObrZqNKD8lJElRLsOleyGW3T7B+WTw8aWN8QHrsv4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PiU2rHkIhyr/WauyJj8oRl8zUkTnXAYKcWlpAYmslymROHxaW
	XHYKov7+wy6EC8Xge4IQbolJ39yTSZpwfJMkvnefMJY+hDyVrqCouRFx
X-Gm-Gg: AYBFou2zO9kc5EIe+jAE6vaP+M4KlbPi2nj/ox6KSVNHShdaHkxLdbgd1NBkUMAZNPj
	sCi7MxFF9T2P54nRt0341tdV5tb21VEysItQShjkLOp4bx6/eWSAhMAInXT0gcPgVC4giAMc6vQ
	ghyNz2v9trlHiiIeb1d8TEpwMtg8RdIhbGYozD5jY2fUdz/sA5J8qeskLHQUx96T0dsQs4SecS9
	8tkhsdamytSfhbjb4dGQAQaua0SGnmP/8poqttyVj7Ip5f7ZvPYSwboYAdcSvUEU0rlxywssZcH
	oMPDWcuZ3cEE2QA6AFFL1bSG0C++7KQhqO9aZhZ1tvlKqqvv2TOjmY+7LzUl+O+37rbt6rVCx/J
	frnXDZ1XRz96IeqLJ3T+lLJeEesd+m+b5tYr6cwRn5lP5rSTKwsLrhfXlrtXEgAuIFfe0lsOfoA
	BXjLdW3y9w4yHXgdG8WOcA4VTxolDj5AMC+zQvkmdNf4tWZqILOBN32gVLuqX8H0S6rWDqZ+cRo
	faFYZU9cyQACqPayoMD2yqzJ1/eJUeMfAhXcNxZr3LbFKr8etGBJg0GcSrki6PAazw3jrVV8g5i
	A7tdLqVadWo49eA73m/jyxWdyHTRQI6hzt2Qd5sqXbZVCgAPqOMeiHmPjLtE6navl/sorZ14kam
	lK1D7wEV48i/NHsQcUG+kKwgT2EsqWiCJpTvB0zMC1EdVFOXUObUS
X-Received: by 2002:a05:620a:4453:b0:949:7502:695 with SMTP id af79cd13be357-949bab651bdmr693737185a.68.1795207375597;
        Fri, 20 Nov 2026 12:42:55 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm288439785a.5.2026.11.20.12.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:55 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>, Jiri Olsa <olsajiri@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Andrea Righi <arighi@nvidia.com>, Xu Kuohai <xukuohai@huawei.com>,
 Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Andrew Werner <awerner32@gmail.com>, Zvi Effron <zeffron@riotgames.com>,
 Andrii Nakryiko <andriin@fb.com>, Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH bpf v2 2/8] libbpf: ringbuf: Prevent NULL callback crash
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711461.18576.2987868815331228057@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAADnVQLuNSE5AM6Cqzs4yDFrhTyD=j-y5dfya3dLwk3si9v26w@mail.gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-2-33fde039ddf3@kernel.org> <ajVKM9tJskwg9OFa@krava> <130931685c8b2064325fc65a856ecd810c8a6b5c.camel@gmail.com> <CAADnVQLuNSE5AM6Cqzs4yDFrhTyD=j-y5dfya3dLwk3si9v26w@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> If there is a need to check
> callback nullness it's better to discuss altogether.

Combined in v3, including the iterator API and its NULL-callback tests.
