Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207367;
	b=4YcfnvLaP8uQIaZkAN1qag/M2I88tIIjsumtiL03wVn4TFB8QH/e6YvfHq4UVCzVDrp2
	 02xZytfZ529gdhflnRReaKEP4cHppFrkVAvCLZRP1Lt7Yjd9uwPDaprYNFwBh2mtgsXZS
	 PXXKHUZwYFxwzEa8Qj+E04uCIRPPn6N0t02IUXr42jeb+nN0F8QvIbyCjxWTXKJxNtilF
	 U/72O9Ar+Gld7B1OiF4afpWN4NYbePfUal1guQAz/J7HJYKRvhfLZedNOfARyTtEm7cCl
	 BrEwoWZsSfhfmZQJAAMJj1s49pjYyyhKNu8bQu/OHvVs0whXdmhcvTwM/l9pAAUbctw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207367;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=pCml9rYMYB7fB2Zy79l25CZ2iG6ygatLQQpuCxucxW8=;
	b=Z+QQ5uQEo3F/5co8V8Ykty4Al/U7ytKib+U8N3RyNN2gcuQKdZn7oB5n2tc5BP0Tf7ag
	 jhMRY1H5ISgMSYrywveUk0eDvHrezW6rfz6c+HvLJ7WbS6njLsQXJ0Frk/IaYXZESgWF6
	 yv8acgBszASBF4TvqPFU6DxCYKapI6u1E1XyFzlfH81GUAA1JYMPCTcrx25s+aT8GcShW
	 KAvPyGfK6nhmKP2ArzMNeHokHt+QK+IQMyl9eqbC4BnMi/XVKhFl7YAEth7FTzLzqGm0W
	 ZzuBDXbo2ijSWjYOKD/X9buPUatA2bFzfmoiAqKMOE7aL7OCKRVnxIi9YNRZvb7iVpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD4B606A6C2
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD4B606A6C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-949589c1495so123404785a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207365; x=1795812165;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCml9rYMYB7fB2Zy79l25CZ2iG6ygatLQQpuCxucxW8=;
        b=vz9PLd6OoUM9y2Io3jIDaznf4NngHb/Dg3f/n4HqMyZX9W4xrSgERwyvJ67SC6Ixm8
         dvSW83RhdwekJaU4+jsPuMVsu4IDF0XRm7l5z1GSBjfSarM+cRdP6kduI76VQF2KuVDz
         5xhBc/axy9lOfh7ttbQsYJHRCR42Qcvx2Rd4f0swodCoIiYLqJmgA+Ggd/Dwl+9b/riR
         CddmPKMuk7dM/tVnPppjIXjCLWUKn2bjteoU7cEVQh+0ffFzSrcMuaY9gIBdc0wZ9XnY
         Fxx0E1sOvNhWPTyowgFmTovgUiJz9TrqzWQzthd5j91gtYZnA/uYlJPF0vGP25lbSnqz
         eABw==
X-Forwarded-Encrypted: i=1; AL+hErFFu0mX6WI0LouSPUYDBUtlzN7PDCSymZzXhOarNUa4ypucX0XM4jGoHJ49bhYsrHKRV2hThUEaiRGKE9h/Gs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bH4JgRkf3B3efjoH5FOZe8hqs5Y2KNWJJdDNH03JhIFfR7epC
	TzrXvDjNZR88giTz+s9hd+8ulXj0o9kj5ZeWpECRuM9OPqAapZ2aIptY
X-Gm-Gg: AYBFou2RnKGFFL5ujEvWwxpEXFT13+8gsMK+CgkUA3MbN6FJcFPLDZ+GB0OdXpL0qIr
	/9lfxJ5yLFRzIzzLBV6M3j9mKsP3YHfOLxkv/1WvolugAXrN4mnN6ngvokuOHR5Wqro6ORlOe2G
	2S3nCPMHlIaypIpgF3yroVBIBO/Ydv0eh1861o2pUXcbMLakaYuRDvuv7ncDz/8c4+qrxnDcy/d
	3LOvlL3doIx8MC8kE1iG2oAiHgYDGWSBSpFw3UUUCxOE1hwOyisaMvyFK/kP16VqmNSTRhUZQTO
	HztUPTo8VTZshydb79KrdblkCuP+qX0lTsEPOrs6GSgSd1mKz1oiNJsv+1HSTRY9lEjtbXsUPTn
	Iz4yb/QzzrI6hVuaN6iFSNfwtay2F3V3k2+8WhvJ0tRMC/8DfpGP/hnsy0aCkJGpUWlztslXNSl
	AIj7sx2RTqyZp0J91KnppBtPjoEMjBrYwi/VJZTk8fYF+ewILR3IVq7YSx8OmG3WQccBIb86sG4
	CRt7vymnGaAijDL0yf4tZ3A/hFKxhOISyO77oQzCFURkE5IxUA/sbSUY2wvdeEF1EuFPTEou/CT
	Qel0QGad3AKprcU1f+wiauEoXyzQAKYeUxBR7PlJGjYxHsiOaH3aicL7TkLsgO54UIItEhQtY/u
	ceR7rVSO1DKgeEO8Y+Ru2+vholTDtQtVzmL+wtxxXpQysY3cpypuF
X-Received: by 2002:a05:620a:2844:b0:943:b019:f011 with SMTP id af79cd13be357-949ba9b3e47mr780500985a.28.1795207364641;
        Fri, 20 Nov 2026 12:42:44 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0319fcsm277058185a.4.2026.11.20.12.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:44 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Andrea Righi <arighi@nvidia.com>, Xu Kuohai <xukuohai@huawei.com>,
 Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH bpf v2 2/8] libbpf: ringbuf: Prevent NULL callback crash
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711447.18576.11461006206277762922@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <130931685c8b2064325fc65a856ecd810c8a6b5c.camel@gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-2-33fde039ddf3@kernel.org> <ajVKM9tJskwg9OFa@krava> <130931685c8b2064325fc65a856ecd810c8a6b5c.camel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> ring_buffer__new() and ring_buffer__add() when callback is NULL or
> when overwrite map flag is present.

Iterator-only rings need construction with a NULL callback; v3 includes
that API. It preserves the merged consumption-time checks.

Overwrite registration remains unchanged. Both callback consumption and
the public iterator reject overwrite maps.
