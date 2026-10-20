Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519102;
	b=aeB/O4WhpyG4zBxosYgJweSJjeEpIhOFkm/eH5WkeeYkNc6SDgh0raY7gIFkzDjBSOzb
	 tERc/hVGlppezUqwqec8KuUMvq9IGuMW3Hky3/dPsohx8uGmoEHVQZ3q8ykAjup9p4hBw
	 sj5tAKSVitMG1R4pyeU/WwCJUMqaRx61dg9C+vw+2G8M+fZ1u4H49+MdFxUnui/RdXVpR
	 e1infCIOoeQyxtdSYQAb34D7qv49VOwpgZy1xLVB0KYrqfl9cN71LV8OsWqiJFZB263G+
	 QOqxZeupBz65pN+ox2P7Luy3kdqt8o2wCSmaA+mvLwj9uCFSPutmz4x21oIRoVnlmIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lfvzxumMX8GZYmj1PJHBaPnkGMwtjZCWGV30UbLz0Q0=;
	b=ijnFWoJWU5xW+wb9BMlaBdiuQ644r6v8C0ikovNcDDSC5RMUvSvwOYU5D4z2znBCz9WT
	 CGIt835RX8ypTe4ntBdRW+08KJg/ZuGbIQNAviWmpuySlcECKV8DIkh+k4gBW24JMtWHJ
	 6bemhoCcANF6mrFxaqCVEGrTMsCy4kTeb5BWR1VFZN8OvPYb5dZwUPYA7Tc+ng9AxhuSy
	 YJlSqrCLj8yM2wRc8Y186G+9Gsi2lLfDwWgaVFBXX+IhMwiVXUKQaf3vXjCBzi5cJ+syB
	 BM474uOfYsRMWTOcerkYGKbLbQV7B1c6eP1Px7gKmk+4G/r3upPIQJLnKcpKNoCLk2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="hk7DKm8/";
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D03606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 17:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80D03606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hk7DKm8/
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac749e0719so976524a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 10:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519102; x=1793123902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lfvzxumMX8GZYmj1PJHBaPnkGMwtjZCWGV30UbLz0Q0=;
        b=hk7DKm8/HVQtDM7SfuNCgwbY6d9oYkVDTzKvh3xFFVJcjWgeTit4nQ3APKC6JcXMvs
         5b1sQ076nR/cD60jiZzZnASVUl2A1IZZGCAtZTv89HFO9xMKTFkmD6zhLqjP8L3wg7YT
         EZ+XvNHUBXYD7s1wo8gn6iYgnI1fN0liSodgV4PIsesSa9bemHyZzT4hLir3wzeKGmpn
         2cfYdmBPyJQrErJTZ2N9KyeYzowC/aQbw4VYo0vWXFp7rwMFbz2ltIGvlLTQQcEQD2Dv
         OdgjfMkoZTll+JU+ZxsujBTKAj8fDZLFfw03WYAg+wLvoNDOd2pzWmEdC15h4Plr2owA
         0SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519102; x=1793123902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfvzxumMX8GZYmj1PJHBaPnkGMwtjZCWGV30UbLz0Q0=;
        b=SsxuxbVlSJ/+pKqQNIWukSVUWwlsbJeY2m+bhAz3UJX8pa4fg8wx8AcZ2dtLRWfycp
         RDeKRvKi4SVOdN6wa/d3z/gOUYgQQ31I5cF3kevF4voNAu2eRoqRzsfLksDL5NZvI4cf
         2dtre6JH/oY1Q7ZC3syML/vJeMsF86uFlTahII6Xmi/V4FTe1MmRpEzkm59QZWfYhUQQ
         ib6kw7tu3bTuzgvCxldAMNFICk+ifD8ycshdr4MHSL/ztjJHY4FtlvroLhRkGoBUaFm6
         G1FLFu1lik4eeO4Qmk5CscosO29OAICH7LKlbjgJJ9yFCAxYLlly88ryjYAibkkzMo3F
         qppg==
X-Forwarded-Encrypted: i=1; AKwUvByyuvWCue4zqhLZrjnyKCF8V0wRXrP4y7gqOBIGgjH1LJsaCLxqHmdHTCzT1afiqYMsJj5iPkJ9KyxO0PvoW8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdexsoXCSs+wWXZNRbTwA4rNUNxautjVoDafLf4CeVzqW9b0Z2
	ZdtCVYmAr+FUaLSK2/k4QVfZ9grG/mX2IonC7t8JbwDzQMAUdahCSsqN
X-Gm-Gg: AYBFou35EqDAmQ/BtW7nqrZmk65XehA+rrvxILRC0qgkwIGzMSs+eJYPik0dTVFw5AA
	+N7FFpZT8pNPY526w6VM0SkK6zWr2sBSj1CuA0Li2IRYtD5YgplwIe97rrZw0YvPp8/mZm09Wn4
	AvY+lNjzEZEDn6CE76GP6Qkefyieb1iRk/Zm9WfOqxU56zFKw9H0K9gRiGwg4QffT9KuIJ5EDLE
	kCVJlDBneXkb9WbhzZ01oFkRnnYExhPDZw7oHMNSjY3fgm/cykJZXC4UaHdQ75Hqad0Zmo/SJIj
	Pu1qQ/YADcxIHhXPq/vVpI1yOMLuj1dqFy1uzss8m6qXFtGuh/nWI61ICKu6mKmmy3NnZnFVhzA
	Gq28S4xkyTq+p2tC3PZrjAzT+JZiH5sZcvnFhOfhxAAVUElM0NIT2+tns4bmBOnT//uux1DIkEY
	r8k7sbUhCMsB6gXtHaNDT873gXUr+aksXsnung+9LQk6DBmyL2BKXQHbojlRXKheTcuW3bNakn/
	0cfC8H4UQjbzkGCvmqYhta6HshZ2r59PdR7c5o2XSkcDyi/
X-Received: by 2002:a17:90b:4b09:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3aceebb4bb9mr10542274a91.14.1792519101713;
        Tue, 20 Oct 2026 10:58:21 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:6::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82f0c0b1sm133581a91.0.2026.10.20.10.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:58:21 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:58:13 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: Willem Ferguson <wferguson@cloudflare.com>, netdev@vger.kernel.org, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	ncardwell@google.com, bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [RFC PATCH net-next 0/4] tcp: carry a BPF-chosen identifier in
 TSval low bits
Message-ID: <atekzexnMd27Kctl@devvm7509.cco0.facebook.com>
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
 <atFI9vl5hy09Dc0t@devvm7509.cco0.facebook.com>
 <87a4oaf3mv.fsf@cloudflare.com>
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
In-Reply-To: <87a4oaf3mv.fsf@cloudflare.com>

On 10/19, Jakub Sitnicki wrote:
> Hey Stan,
> 
> On Thu, Oct 15, 2026 at 02:45 PM -07, Stanislav Fomichev wrote:
> > On 10/13, Willem Ferguson wrote:
> 
> [...]
> 
> >> Questions for reviewers:
> >> 
> >>  1. Is encoding an identifier in the low bits of TSval acceptable in
> >>     principle, given the trade-offs above?
> >>  2. If so, what feedback do you have on the implementation?
> >
> > Don't see any feedback yet, so from the top of my head: looks like you
> > control two sides of the communication, so why not a custom (bpf) tcp option?
> > Would you need that on every packet and it makes it expensive?
> >
> > Or any other field you can abuse maybe? IPv6 Flow label?
> 
> Nah, we don't control the client unfortunately.
> 
> Client here is any device that connects to our edge PoP.

I see, so you rely on the fact that it gets mirrored back.. Btw, looks like
there is already some similar tsoffset/ts_off infra? Have you considered
plugging into that?
