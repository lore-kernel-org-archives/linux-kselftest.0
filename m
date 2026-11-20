Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207371;
	b=h6bRhksYlql3hRqFDl7C3u1ZZEtO6Tz+IvrWfsT5xdo9+itJHK+uuiRnhxTDI4aT0MXf
	 0Nnx3eFz4PDalelce0cNIpaPHUavmsx1kxN5NGLU4lTPaJv1L1tST7if+VzjIkNI+jRCe
	 5WBqhf5uyE/wAwByq9DjxTbMWStjOP50C5s6h8omjoqYHDjjDjLbE5+EPYrjTlrPwXkdN
	 JsPwRcOqMUkzFn+X19GE6rtmTsmXZwlhnSvYy/DN4K8DoSZyUvisPylkfeRfEtZQ4UpeI
	 ZhGNc33XNaCXG9AjCddUT/XBUGxBvMfLjwSJUqtjmsSXcOUbhH3dTBzx5G3mKS/aEcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207371;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=5Vy+uDDmlpqXaPhIJuzEyGUW5XXKRnuQUYCNM07djE4=;
	b=EkTjqPcFUy2wvfKrRJFs42VEC0sdETLz6z2RG9e9aeX1xfp9VefKSiSBh/75RoDZoEp0
	 QhJsWmxSbYZGTfiwB/7OQ6S3RSm1+VDDmohm+Vhd2vk2kZin58mZqtb76PzywZBFkSNkn
	 MPpyv/py234cVsrqBYpfblgv3XDQCDnRs8JlEu31jl/POd0djn7zoDd0G7VgnnCEsn/el
	 SBxHFfg/m9gkj/+7HVnpLLLtXRJA/Ask1iQMsN5DeuQELdUuTL3vy58NKC1FYcPFIORLr
	 ntwVMps4MbEIkbLo/MN3MUMk7Ttb1BtOOFf1pxtTFgj6sYjSpbJu/u/bgdo2E4GO/FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA13606C0D0
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AA13606C0D0
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365f9a04c5so8344511cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:42:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207369; x=1795812169;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Vy+uDDmlpqXaPhIJuzEyGUW5XXKRnuQUYCNM07djE4=;
        b=xAdghMH6Zid3dwnEKOoN74ntA1LZCSCR8YWUSAsaFlTyxkosl473I551U8GUNRk8Eh
         OJdxoVxksLeOYaETDafss155NCvKm/GsV8QXLHc6jpzQq75evviYd0tJtwoeHyyrpA1F
         6NAEI3CNllUNeE6CT609Dya/e+mwJ8RHrme5TWX15kb3ZlMuet/IYrgNEhvG++bV0p8C
         xDhvQqJJ/iyuWudc/xIDTd4NeeH6HAIwGrn8ulqUR2ji2RDJXmV7jPYA7ZfzJvn/xhS8
         R3eqMl650tIXkFF8UTaNONnBRwu+IGKDJTVO3PeHEapP3Tf2QBsB4NMUiT9KaSIkY9XV
         1hgA==
X-Forwarded-Encrypted: i=1; AL+hErFEIW5pftjBfeOEcgerjTyDox/CmArAdyi1jAWi558hIsnuholhiIZ2i5Zkm5+/FDCnP49yjYVSwiLFHBRx/tM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8MfDYdcxNdpgUGlJY1s4P3QMPn2lKWNWlnf6vMKdYO1VtQn7t
	a4Vb2oIkciEw9HR/exOZu4CI3wRatLuEWP68tmIiYQoD7djSmusroV34
X-Gm-Gg: AYBFou2u1HU8GMvhgj2CupqBxJR9Dr2GOeNuTu2tZXAvBmxwc2K+uDKGfNuzoKEjZwP
	MTlew1hO2coZaoCzRTWy/XfVoCPyRJUeDrVkSubjPiFro/BSfCSfaoQa/fYb59zbKb1Lb1dbR5k
	K+g+xHLYMB16EuclonYjgSzyDY2ylAiq7DRG2c5/pyAJwzYayaKdLGzrcK1/ItwX9lrclc/ubZB
	91InG25PaavEdGMtG3N4weu0YHRzpjZcGpV2wfR8BQOYApQMjjRDBUHeZ8ci9zplTlA5k6cAoTX
	oa4py6qkUU5gIGdeXVMlbH4dMkDLTGYneawQIlzQQUcB/WcjW4YFb0TYdlwvAnf0pez3nChOJPC
	+QCFgvUbpsm9xZOQ86AfJq9IQ/loxVFg+38rpKnPfLvEW4Xm9LYSdut8VGZrN7Qx21Hp7Bzu155
	GGF6M/4qaBIUyrT0lGu3/vRXyP4ZYIwujEkavu5mVZEwJyr/I3diUqRwvJ/iMUb2CUniJ6dTmze
	ebuZxNEaNtUfNYM8D1KvO53CvVHoNxNlDfIMpAY5am0aHUoDK5RbBPFxyjFbG2n/f6AumRLtHo4
	uPDfEVAlk6BhzxSzSzZAqSi3pEWo0lUYAZu0RCQMznECWOOtUIvDdK25MTYLHpPhxIPFSEDicjo
	I3got36RS/oxQ6kq37QEUN+sAjwnfdofjYoyIzUtFE9GQQIZMvprB
X-Received: by 2002:a05:622a:647:b0:535:92a6:22db with SMTP id d75a77b69052e-55d76932dc3mr81030961cf.1.1795207369141;
        Fri, 20 Nov 2026 12:42:49 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bfe82dsm34020236d6.0.2026.11.20.12.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:48 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH bpf v2 1/8] libbpf: ringbuf: Honor zero consume bounds
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711452.18576.3585895078868133287@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <9323b0acc22de75ead4732db464672443eb141ff.camel@gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-1-33fde039ddf3@kernel.org> <9323b0acc22de75ead4732db464672443eb141ff.camel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Could you please pack the tests as a separate commit (or commits)
> at the end of the series?

Done in v3.
