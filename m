Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468734;
	b=3aGu4yrcF49WKEBuv3bzm2ufkZb5O+hS/TIWTXCW1+qcRT+HIGSP67XmtF06WCbtlYyB
	 uj16x1ol3F7VWmidy6mQMB02jSbw3HRNjm+RtsLag6aM1a/Gw5GQdl0ejYoueOCieC9NQ
	 sffgoLUqTbLdoL4lZeFtAoEzsE76tyJZwGYjIQjPkv2IKkncCw/TjFR+pBOvKlQ8xGrCc
	 r7iHbzGfdKzuWUMX1KoXLbBDfMXDW3zlcOPgCuzXXz6MVOMYMG8IMCS2bmAlg3S68NHlB
	 JDn1a0ovVBgd8BHjWMcCXBxRfo0Iatyfwujv1YS4UNwGQt/nB04P4TfI+LCHj0yQjHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=UdbWtdWbnHAnBe9m59yDmsAfmbDCGbDO/F2rxx+Kr/w=;
	b=hmDNQUYou4cByZN5XZKeRXGTJAecRD9/uZclH7nEqOsU1r7DCs3k7l8pupgaKAVPSyZ2
	 kWUyi+LW5WMQGyOv5mI5dROg1ypRtz51EbcPtCjcPdW5oEMEbiFBnVf4J7/cqU6ywhdcz
	 3vk7A1SVeUZyKFhwwxFur0KPD/pNKrWRPEJdLLCCy0LQzbif9n+Ae7pJcUz26K2GedMtb
	 dyTEfVGvDhSw9x3ykq22oQ/JUFGVnclLvW0ZDN8yA0DH1zXlcNTU34W2iXCG14sWxkaR9
	 Ml587wvUhGuADtWDkwhgv+LkbWaAt9mkGEeu2RwgqVOmAcVl/27naTK5GP+QE8ZqXoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQBhbA9a;
	arc=none smtp.remote-ip=209.85.210.67
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D107606A326
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 21:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D107606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQBhbA9a
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-86103aaac12so2682557a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 13:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795468732; x=1796073532; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UdbWtdWbnHAnBe9m59yDmsAfmbDCGbDO/F2rxx+Kr/w=;
        b=MQBhbA9abCEm2W4n2Sav0twyTWtHL9dlzCuGMe+dGXr+Bmgsqse/NRFIyOVfR6kdc4
         UX5Vlwam3jCbCoRj3cJmsGOZzo9BU8ufbFW+1KzByk1lTtB6Lu8kgr6C2z6452t4fG18
         SnRWJUAMIpb8EuBZxehw6staapYIft8RHTa50htw8vH/dTmOhZDUlI7Hc2e7BQjEM6Fb
         Q8IhVefAvcdWnpYWzYomK1MWevYD6eIHXQnODB39jOrXmnT77+/SyIMNi/1qHwME2J5Z
         HkR4ho/r/3wjX6fZPuCOxcVdG25oAMq8Iiuvw2lACgNuqpxPZ+SEjg/LiAMsUMVs/7UY
         tZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468732; x=1796073532;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdbWtdWbnHAnBe9m59yDmsAfmbDCGbDO/F2rxx+Kr/w=;
        b=M/8Raib62zkktCAIr8tNi3wIQhGcNud6dDU0/6Sur0g7lGbR8Y/p8C0HoHQ+JXkeXz
         sXoOfIJNtqSl++5X1wMBdZ1EyzOl5IxHOOH5+A3PjkLC0nKHegYq3l3HirBrRB3IGv7C
         UdloGRDTIjCItPUakkdGkvUNup3tGkywb1Cft31/RmHIoAaPKFBfp4yIIP+5VW2NPcI/
         lamoQKKK7jKzDbcpHG+sct0L7XiR17bwCRRYKZ64+djxxpcFwvRw0O63WvaGqQWfz5Z+
         9HQxlgzV1rKWx3TltI6mR4rFVN8Q51Kjs+H3sM9+Lt7Y5/T8o5lpjOzZE9Q7Lfkk3a0M
         GMgA==
X-Forwarded-Encrypted: i=1; AL+hErHdoxURB2WjsHYBkWtxJnYoxaaY+9++muq9lJc+qNiKJOPQj2MCuy3Y8Eqa88JFijcaQ87Spi1w+mDMw61wAuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZXdWiBp5oGV7wbP+Mg58ewd7I9ElJU1Kp2K+3na77An3HSR51
	NzMfYj+I60WdRW9Yc0+OAYO0jQpWegPWUTfwZbG6ccdxnRMuwD7OZpBd
X-Gm-Gg: AZFdTZfz6XS4xkF/fi8gtsL/wGaz2yM6iTDtmXihh7+N56723EIdRyqlbA6UwzwT8Ol
	Qpu6eP3Ew590yI/qktvQWlcimraBbvPWuBc6YOFCsROynfQwEqLqMkD4Vy6Yx2+WGkhjcRWDYg9
	mZypFTFC6Y59ZKXMeUbRAl77mlSd2IhCLtF6y6K6J8nWxrXzjn+0PLY8ueWwWL3RZXVUjMexDXF
	HDI6yizSh9X7dewlorfYERDhEfDnWlPxSA75wfmGqvt9AKE4Tpk5Z6k0AvfiRHEqHWZPqKrddLP
	ml72sl+DsbnAz09e522Q9tA73wHiO3Fw/Z8H/VlClehT9fuKWLVAw6VKXTimNteFT54TtNzt5fn
	mHZRHRdO6KKrK2AI7bW2nTplF2prcJ9BOMzeQv2iXwNSPENbVezTnt9wJN01IXqwgFcGhnmRU3n
	GjVyuPBRRMbPJvGYWwIv8CInh/8Y5ULwLfnBZfAt9oInQvmklO+kCCiyyMV8SLOXpaIc5v++IjY
	3orev7eH4o990igZ+SHQQ6CNBUnjqIokTMD01ZOp/U3IqJmyfpp4P/UBMsVVD2vFvKizDdDl8Le
	r8D6NHjt48hi5xzbGLW0cOAfzg6FLO02lNwcwz9W++DkvDQu6yWIlk3IuAiCNJbtWyUEkj/YDW4
	ZP3RkbySfePo8CECTbO4g5FyCaR7llIaT1wc=
X-Received: by 2002:a05:6830:82ee:b0:85b:895:a015 with SMTP id 46e09a7af769-86309065b5amr10471283a34.4.1795468732137;
        Mon, 23 Nov 2026 13:18:52 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692d9f7sm9734033a34.24.2026.11.23.13.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:18:51 -0800 (PST)
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
Date: Mon, 23 Nov 2026 22:18:48 +0100
Message-Id: <DN2WJMWD5G0R.27OOI2IBOXA6M@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Andrea Righi" <arighi@nvidia.com>, "Xu Kuohai" <xukuohai@huawei.com>,
 "Andrea Righi" <andrea.righi@canonical.com>, "Bing-Jhong Billy Jheng"
 <billy@starlabs.sg>, "David Vernet" <void@manifault.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Andrew Werner" <awerner32@gmail.com>, "Zvi
 Effron" <zeffron@riotgames.com>, "Andrii Nakryiko" <andriin@fb.com>
Subject: Re: [PATCH bpf-next v3 4/8] libbpf: ringbuf: Add a caller-owned
 iterator
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261120-bpf-ringbuf-fixes-v3-0-ff7ca15d6c37@kernel.org>
 <20261120-bpf-ringbuf-fixes-v3-4-ff7ca15d6c37@kernel.org>
In-Reply-To: <20261120-bpf-ringbuf-fixes-v3-4-ff7ca15d6c37@kernel.org>

On Fri Nov 20, 2026 at 9:33 PM CET, Tamir Duberstein wrote:
> Ring buffer records are exposed only through callbacks. Callers that
> need to stop at an operation-specific condition have no non-error way to
> end consumption early.
>
> Add a caller-owned iterator that returns borrowed records one at a time.
> Each next call ends the borrow and can publish consumed records before
> inspecting another one, allowing callers to batch consumer updates.
> Implement callback consumption on the same internal iterator core so
> both paths share the record traversal and publication protocol. Allow
> iterator-only rings to omit the setup callback.
>
> Preserve callback validation, so callback-based consumption of an
> iterator-only ring still returns -EINVAL. Keep the consumer-publication
> barrier on early destruction, including bounded and callback-error
> returns.
>
> Keep overwrite maps out of the public iterator; handling a stale
> consumer position requires a separate resynchronization protocol.
> Require iterator users to observe exhaustion before waiting for another
> readiness notification.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---

Hi Tamir,
I had a similar patch set in flight, to ressurect your older changes (which
explains why I sent out some your fixes which were landable).

We can compare notes on the API design and decide on the path forward here.
Feel free to provide feedback on [0], I have put you in the Cc list.

Thanks.

  [0]: https://lore.kernel.org/bpf/cover.1795467315.git.memxor@gmail.com

> [...]
