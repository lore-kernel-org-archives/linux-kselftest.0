Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504802;
	b=s4h8r0+tjBYf9IIq+5g80zVvrSN8kWvxVMJ2KbPvIrsF/u1O/iCmBiZPAsD8zuMS4O1i
	 WllW+2J2cdo+YsQ6q6M84x/lefTbkjhj0CoBu3Q32oyv5lQb50UAOXGk0Z2AJd2AUuJUe
	 qXhmz/TgxkC790E8za7c+K46z6P9AJyIwtJTHZ5vZhpi7csi90HkEtB+omd5ZzJ20i/Ex
	 0aoS8M25EII3JvLngUd1WsA2ZXG2uoziOKr1jXUEYWMkQ8Q+A7T4wUdQkqU7GxOfHieIf
	 I7bhVS5g7KkiJ8JmqM4lFY5ZX6DQIvBY5L4CIsJQ+RNmPaOXCutjMGuQe4b+QX594yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504802;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
	b=as/DI+LiGDAZz8e7/IagtCbbpoOdn3AVKlVzYg5fanqg+TMLDmIW4iIMrMdNfO80jLZx
	 llttp0xJB3FDOj0O15cZGlMur2mC2z/lvr9hFCoNUsx0IFOhT7wrLhyyGlz4zmLwv3zkT
	 mb18HgNX8oUYoITQY8dGPlP/ALyT763S1qOXKvjERJmGJoproNTsEsvDUNBinednQKREO
	 iZ9HNC3CJ8V+KJ9wue1wft47gxVIUrcB6mkPWobqKBp6TwUUl9DvNfMSkldTCShdJ+Wk/
	 8jYHz687+EdUSOk2uSa5/Xf8vQzp1GCxOZlb016nC6aaR3z3LQGIn+aOaf9n2Aqs7PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d9vYlLx1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mR8JAM6D;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF393606A338
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF393606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d9vYlLx1;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mR8JAM6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792504800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
	b=d9vYlLx1uJfQpOLx3cae9BhEjSKAJrEJ9RcFJlRlYz7g8vr790qjfZnywlZeZQ2dMEad8P
	tt7XZUJ2cdZejWWgQLSlU1l+t9Vd11OUucNjVU82OllWk3l46WmpafYZ//6bdbMCmJabSS
	cSrvGpCL/r4LWoX5pb2aFyWO4uuKAPk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-u6DSsIp0P1mWRjNkMcNmyw-1; Tue, 20 Oct 2026 13:59:59 +0000
X-MC-Unique: u6DSsIp0P1mWRjNkMcNmyw-1
X-Mimecast-MFC-AGG-ID: u6DSsIp0P1mWRjNkMcNmyw_1792504798
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1de9dac94so21903585e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792504798; x=1793109598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
        b=mR8JAM6Dx+SPWbfkeZnOuGFetgjlmDjbH+LFq7jAyJiAKciZVgzTSeI6Ngc+/YyH0P
         mCirkApaIVqwGqDQdP2i06rvMK5Lzpo/0kN8K5u1fw/RGJHTSQa9GjEofK8nUNDMiR+8
         R2Gb3eriJjl0yEV0gN6e3mnMU+2KU+03pZhqTDSW0iKY45Tof4QGCbXBCBmRfrOJGxN3
         SDa1e9D2dcwGvBSzSTbmKB6Y7A/s8AxccXVSNLU6bh6lQ/ZgeRH3t3pU4xR5+F4KqSna
         74f949/TZbz4xCOso7OpWx31lR91CKkQO8Scbt1MpT8t8+oiHGy/upa3vJ7adtQbFopZ
         7D9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504798; x=1793109598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ykT13PSVdEhkpSDogty+KQ6PO4mrXSOM4DldWxwlI4=;
        b=htnlUjO98j0GvA9jtrNJqk2F1YGqTgy/waA6MxBTv183G9aNv+1guRwMlGnwM4G/yr
         AM45VaqmvF+pqgzEZWXhFxAa5UvZLCw2bnVgyh6204GgaR3nOEn6uCQa2Hhg/BsEPUHk
         IV/KdYHg4Szi0D+sIpSzqiQDNgJjDdfsaZyq6NoF+cc205JHBozyWb+7RnHe63dZMwCN
         NQBdIwt3dwrNvWBvdvtcMr2nKHEAq3a3I4CkW/vpa5b/hYBHV0qc/uT+wt65ToQl1Eux
         aVkKUhdii/+Mu1cj22Z8mRDknVPMuaRHPBekYNdTlNef/kYCmg4BKDFpDnJQxQlmY8KM
         FzSg==
X-Forwarded-Encrypted: i=1; AKwUvBwBwHUZT7Cs5f1mewxUgWBImLMNOCpC7Yg/91xr3QeJiG1KM/H9uxYsFTaluHIlQ0sWqcMEX3bAvnJHmTWdAd0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtjY6j3EltaT862a20ouS/Rd7Q3IZWxLA45yT6IgXIwYILwp7f
	I7ie5Fdp3CzdEYxaghTQWhxLmSqBtCFsQpFxjrqr2ymHbz37kYxpCMldJbft561MGPM6cCKHlok
	7xIMKvvILo2eL+Yq54aVbEs1akR58kXPgtWlEDjhAdDUSWihdwUN+SXU3f9F5qNIG1BcV+g==
X-Gm-Gg: AYBFou2lac9MhjF14jHitN0Oj3OkS5ymTLWDZNErOjB3mtS/5KaFJu8jcdB1XmCnVo2
	VPFlMffYbCp/r/GK8f8aIPr2xl4ISMcJXE6zKwjiISphhlyCu4t52Ic+jVfmmeKu/Mss8ZKF/Ca
	zPjBYUe+fgv8pV6wtgqcKWN5v64FnSgTBOtxaNfzcrUFoxa/2hG5leeMW+X02HnFz6JttHXNgDm
	QlKUcjh94Fwh4l65iZ4tZS2Q8x0n8GkWo4shQ8s76yQv5svAdZhyAcI9oTObAiRoplqygwzwPdi
	lVWfFxxO1lq7paL3TCxMo2C7CGLkU2vdspBliXJkIIvuDHkoGoimgGSsTzz/RP+5Hutaqm0fo6t
	GCMeNNpDX6l1sOJ0RISbx5S6Iec2F2WxC4JPFvRtWakeJn9SOw0HEbccj3zxFisZWnHmCmROvqg
	==
X-Received: by 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d7464034mr234316735e9.0.1792504798220;
        Tue, 20 Oct 2026 06:59:58 -0700 (PDT)
X-Received: by 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d7464034mr234316075e9.0.1792504797756;
        Tue, 20 Oct 2026 06:59:57 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d85a9bsm82778815e9.15.2026.10.20.06.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:59:57 -0700 (PDT)
Message-ID: <106b3ab1-77e2-4656-a124-7f78ad890ee7@redhat.com>
Date: Tue, 20 Oct 2026 15:59:55 +0200
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/7] ipv4,ipv6: convert the getsockopt
 switches to sockopt_t
To: Ido Schimmel <idosch@nvidia.com>, Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com,
 kernel-team@meta.com
References: <20261015-sockopt_expand_out_v2-v3-0-7d05ef2df448@debian.org>
 <20261019081907.GA2725184@shredder>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261019081907.GA2725184@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 10:19, Ido Schimmel wrote:
> On Thu, Oct 15, 2026 at 03:05:29AM -0700, Breno Leitao wrote:
>> This series continues the migration to sockopt_t, as described in [1].
>> do_ip_getsockopt() and do_ipv6_getsockopt() still take a sockptr_t pair,
>> and everything they forward to now takes a sockopt_t, so convert them
>> both.
> 
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> 
> Given the user visible changes, the fact that the merge window is now
> open and that this isn't the last part of the conversion, my preference
> would be for this to be re-posted after the merge window.

I agree on the above, also clashiko noted that patch 7 lacks an additional

CONFIG_IP_MULTICAST=y

/P

