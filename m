Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601341;
	b=2Z8y6qJkK45KcCxVdcswPX3/8j7JuS4Ztvuqs3JLss8++zVKwN8bbJCxxSuPBTraXEG2
	 RHOOqphIw4Bzrr+bOGoVmplFCsjL0YayTS/3bUxqwisgg2CfUA8uQHJYR8PsFtOTV0Z+3
	 FrQaf55gsM3wNjW1vgsUlZsvoOAbFnjbjDZCmxsRS/qQnS2j/CvLgM/rtO81NFKV03tFb
	 nKfosXySfZ7V90IovzWx4xJ5RJqJ9VIp73V3wXUt+dcYVOMB6rzB1WIWVwqIsEzfJDw4a
	 HE88VBQbC4CKgd8TKSyGtwpvPkAir6bhvK7E4rVbHQunaHHYSpoKMd81D1g/rPs8SCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=s5HRLWT3GJ5V57HOZzLlKs66p4zza+KZ/ooym+DPD/8=;
	b=s1yCuRPCCKOVdAov/qnw2EpvNeD76TIaxzumzpCLCe4nqIbnPX0aXE2HzPcFHPB/ds55
	 RmhAKhZV6dUD/Kej9RTCksvK0D86XbcWbKTaZZddzA8UlbQW0FC1ekGa1cFvqGeqMqQZm
	 zuxOX7qL+bBcDtAbFQLOeyk3LuvSegjk2h3P0fRVjZ1lv8V49ItKGefHkBW7+83gOTwzg
	 e92/FgwM6krJd9H/iFA1E5/TlNO+VkPEZy/j9rL1CW80WaE4rApueE/wcrXmIqI9wEYnV
	 MKrLacI4hOhn9jBvyyJraRJPTYefUjWDOsYahHZVFWQ14V0F+RyqUyVWIPsye4ggpvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL9QWYYa;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3884606A32D
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 20:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3884606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL9QWYYa
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso691371eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601340; x=1795206140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5HRLWT3GJ5V57HOZzLlKs66p4zza+KZ/ooym+DPD/8=;
        b=wL9QWYYa8TzOJZVMNIyc+YX+4aWHXvMAiO159H51XCo86sRljVLG9cSgH+BOWJZiP2
         6G2le+g8OtX74/MisNw15WdAoAWTDcvYg7tM3VF708EJMOGrOBUYzsjGUNGzc4V9dZto
         EYO9AFg6efIX7i5dit17/pqUx+ghyCOxB1VwYfSjW3FRdQTE0aGgSh6aEwa7oNzFuSpG
         g5wtAjhoE09wyLWJq6rj9H5RFxaTDKm+KXN18OL25Y/hsccmK9amysRVN2Lj8o6Zv/Va
         jsOoobBDuEuXWpHTpjiPTYd4nIgte5zLNnQscwGjiU0QRaiRX4JhfCcH0qT1+lod5ULc
         4HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601340; x=1795206140;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5HRLWT3GJ5V57HOZzLlKs66p4zza+KZ/ooym+DPD/8=;
        b=kOlX4Zyg348TfSwQAZ//eIrZDJlB8ecvF9qHU4jlrpJWN56x6W+SlknfZ6zmenDnyd
         kqRz/cKk8W8Nzjd+cCPu0M+3RPGOtX63zJZgwjLeWQpPAubVh6IWr0vcyZ0O/MOV8yte
         dD51Z2FqZzp9g2LEMDUf++s/bRwwHHEb9VAgzth+TwAkrHZ7XqW1EZDZoQr3kbcMXC1u
         sY++HW2i912h5EU6DsXDV8H/Z4GixAtjg8laSDulmEF6XQZjxEch/SzixPGkxlSkb/bK
         VP2ojzMsmLza6LfD6KPX85XxZ7HK3qG65xsT/Omljz11A3YyVppZUVsv7WSjJvWF/PiR
         m5YQ==
X-Forwarded-Encrypted: i=1; AL+hErHhXWkBJJ/Zyc5hJvDjjhp7wqTSnvRTcopaN54e+Z5EkJRH3ZRrsayyhJ4416ijuw+dsmtyxjuUh9cxsf9VV0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JWngqcifK5DE3V/w2kJ2xvG8l68s/y3esd2lHRafT2M8RA5J7
	VPaFRowN6OZXBtftQtWfXt7DGs4Aoj7gSHCw81SfAZFBkqvczSPm/Jz1
X-Gm-Gg: AYBFou0ANdwsykAm+97FA+iPD4QLXcpIDQkdPhlBDEeHlqT9VRS9asW9QyDUpMeIOxL
	+rFLteSuuYXgEbOx8TRQmfR7B1966PUScawzdHl0I/ty4POBGoGd68PVdtUo2e52iVW/5RTgm5C
	+6C5p5D1W1OxhtXejoAxXhnlxm4IW1wic5BItbEp8brYL2nTPFSZ9Fc2+FVua+uCIFBkW8v7AN0
	WdW0ICYgenGcWmLuGiSvLlVdrQxf2VWEaNwF+3c5vTtKOVNRdOYKXjNYL3ZOTaTvMujX+t0JXwv
	dFftYHIiCiN5Jo/IWnOn2ZCHhTMOANFAISxVq4dZeKoBP+yWziQurNLMqO+CoudRz/MIsL0CmB2
	zzG1IMP9oSIGHTsctccmsEWzjR+B/T0nl6umeSpq79iuhzKGszcwTgSKnck8tZTY+szpluaz8Zm
	cNV1s1X2HNeSP8yALBnEXEfcivYK0yZcg8v3KlWRNm0LPQiWWQfi6d1vwYwkLsEHJ9aS0Dh00fb
	EOk/651UUVNBP+mNjUkLXm2fr9iHqjJ7Xk1kp3/LydEXLzvsClK0VhawiDmOxHBPFT9V2NMEvnK
	mV944PNg1Jy7ni75/05RPHQ=
X-Received: by 2002:a05:701b:4594:20b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b50313a743mr3055299c88.39.1794601339464;
        Fri, 13 Nov 2026 12:22:19 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm15946929c88.3.2026.11.13.12.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:22:19 -0800 (PST)
Date: Fri, 13 Nov 2026 12:22:12 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Neal Cardwell <ncardwell@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next 3/3] selftests: net: getsockopt_iter: cover tcp
Message-ID: <avdxbp3uCMtiO_KT@devvm16445.scu0.facebook.com>
References: <20261112-getsockopt_phase7-v1-0-1eb759dd0929@debian.org>
 <20261112-getsockopt_phase7-v1-3-1eb759dd0929@debian.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-getsockopt_phase7-v1-3-1eb759dd0929@debian.org>

On 11/12, Breno Leitao wrote:
> Add a fixture for do_tcp_getsockopt(). The setup keeps both ends of a
> loopback connection, with TCP_SAVE_SYN set on the listener, so the
> accepted socket has a saved SYN to report.
> 
> TCP_INFO and TCP_CONGESTION cover clamping the reply down to what fits,
> TCP_ULP covers reporting zero and writing nothing, and TCP_SAVED_SYN
> covers the length-then-EINVAL path, which the second half of that test
> uses to read the SYN back.
> 
> TCP_ZEROCOPY_RECEIVE reads its struct from optval and writes it back.
> With nothing queued it maps nothing and succeeds, so the tests cover
> the 16-byte struct glibc still declares, a larger buffer cut down to
> the kernel's struct, and one whose extra tail is not zero.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
