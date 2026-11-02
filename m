Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633385;
	b=5CBgYkJL+Y8rlGAT5Ys5mJYOit38dW8VbgIZsU6wQjIKxGTRplGzxB0VEluyeM9pmemi
	 d4LELrmWwdGxK+OPPs++9pF+AxV4pkGpLHQDvHje33k/ifYKKU6rXeelrHApvw3Mn8FlO
	 3TKBwEm0aDecju3sG5R2vVhKzA+oLLRCw1jWAtjB13G5yE2CYCSo0arCowP4sjucacfOE
	 quJ1q5J0pTRW/HC3hVs9KMBFUCzAuRRT0SOdd5M/1c/ZZvPWpdgDQ/Hw3BdvhSiTA2G+p
	 KxyjNG+U92RAKVTwbqS3NnC4n4Ei1TjQUcXeI2lPV81vEh9jF9ISwBxKI70j7Lq/7TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633385;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1ttXRStBxZjXNHjuvGXMWk9I1gtHZhhcUuBKOaR2A9w=;
	b=0qPyOkIMElJ2SsxlcxvhiNaK1vzVH3Wa4zSpURF/fuRToNnHKCGYf4ezMhRyjb7AMd/J
	 CLiYG8Lm4bGM9OXEe5IX62/P6zf6Vxrk/QwuK+317+EOepJWPkQrM59XqpJAqq/89iEhv
	 Y4YOFJioffDAV5DY/kP5+STpu9KO+N4JoObSOKVr6odeyymbDhkORMF6WUuz6ZupmIYOI
	 AEqZmY4AM8vsfWrJQHUh5r3DwzK4kVNFXfVAOMaIFsMAUlO8De5nvb0JoBUsoyoQgqwrt
	 EEvBvj87ULOJmnSyF72wOuanfXQcKy/wwJLXSkXGk983Wix+C6EbVrhHOGzJEPGlGxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cvXQHGIB;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hcBLURsf;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01017608694C
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 15:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01017608694C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cvXQHGIB;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hcBLURsf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793633384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ttXRStBxZjXNHjuvGXMWk9I1gtHZhhcUuBKOaR2A9w=;
	b=cvXQHGIBaOY0vkQQL+xRf0PdTa43xJoAqkHe5yvohAycfi0JDDbt+Y2JwdmQGbkXAkhAiV
	5qXM6FLS4aZoSg6M9M/RYo25GT8VY+6NUpL5cODiVTQg9ZY4NBbH8YTwm/AAtJjn9XWFtF
	dMjpfvyFFQofXumPVcVneGThZ9JkMuI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-8xQOTjGyNa2j5gojqPT2eA-1; Mon, 02 Nov 2026 10:29:42 -0500
X-MC-Unique: 8xQOTjGyNa2j5gojqPT2eA-1
X-Mimecast-MFC-AGG-ID: 8xQOTjGyNa2j5gojqPT2eA_1793633382
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48b0a199b20so2611808f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 07:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793633381; x=1794238181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ttXRStBxZjXNHjuvGXMWk9I1gtHZhhcUuBKOaR2A9w=;
        b=hcBLURsfRtjg2HuuwMAZl7i4m7ZriuFIrzulk1WO/LbySuSilVcgSb0b9AOaiuyDNo
         HtkClw12MfC9nVtlcOjmcdIcX/Kj0jiB93zBsDVi+NOUFVuoSgFbz+enLXX6uZ3Q4pty
         8JfFEDlwzZ8/F/OqvPYM8QhgShCEguOXy/FFllVBRMV8JKBYEsR07wW1Yhi6jzhvB2Pd
         7LMpUjGJYX4Fys8YBKp/FsRJZlxmqxj6/4x6y2aoqVdMZOGbyO+eye8GKcZc5AR8fKR8
         eVVEHf72KhAgUUx4awabpwWdxNXvcWd8p0YAj56XTs2pr7arY1D47AQcO74IrFMv+V04
         h4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633381; x=1794238181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ttXRStBxZjXNHjuvGXMWk9I1gtHZhhcUuBKOaR2A9w=;
        b=RLQ5X15WWGFSGJodwzoJhDcoJWt0XPKpP3hix97bR8wcpqiVPl+Nny07g5C8lbLG/M
         pI52ti7npj9OK9gNcEkYvF7hMlbXrcNU8B7hCfPzpfTn2J2dBXGX7mSAaqP5cfAVcB+W
         TtXeS8e5SDF4RXTCxJPmmMata4CsRkLycxXURb0z9IaS3zPmr0yYWkXrNIBRZ2s1Tk4v
         0uPLHcpLDDUhiuyBhzHusYnR6uBqilR6vrDWQVrlTNbblPIIXkkEr5g0nYeHE66VpDVW
         ZWlWLrqzbe48BD5EqGfAzxGirq7MGLoHPUc+YvD+ey/KHdexKUBuTUPguK+Z29J0RHVM
         /wbw==
X-Forwarded-Encrypted: i=1; AKwUvByBOx14DZlL0m/DTesoGD4l+7ZJUxKRR3BVO16HFq4gQfRxl8AkCZETFAA8IE0XfBCKeAG+3my6LjqC4Lr7EZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBr2C3TTF+4BbnAYKcWgFoRs1L0JkqFVFvPDqvlhOfKd+cZieb
	gly46+TDzK1vIfqFtQCWalkXk5UMhcd0C2ADdcFGG5m5e39ifX90Osy7huZTx1ryYYYUzmPdz5z
	vC4lPBCSKSjniPQxcyCh9CzLdmj0im53lw3XzYU1kbWAlaeHrVgoMDb+kUW4un8y2RwGwew==
X-Gm-Gg: AYBFou3wFtwTwjlECddFhRbhWUdC15K0Ls2S/cZTxli9aCwgt+ymDTmSRZVyRXRKBRo
	EsJ10r6dWkNSegmknVBzVjvkJX8W/AXXLFqG/HR16innjPKNKxWJGoQcMPOk3zyvU/1HoHnG+d8
	TpoKD2F8pa1GZyS/L56/uo3g1vraOqY1YY2ipQJhgW+OzAfNBZsRdtqO7WebBK8FaG7WU0u2IYe
	tXK+z/zDKnZlY1zx0JUAN+POXoei8xe+p3Ig3FS4NwZbi2w8YoIyKLwompHecoy/qZ8YBhzpzM4
	cwdHwx4Mr2+r5He6DsE9e/CDNIO/5jq32eNBZba5/buZ0Fl55L/Hx9b3G5HjvRfAN7D+8SLG5Ba
	hNso09HOk+aY2UoKwTQopDxWS5R5Qr41CdHSj53iXEIzIfIt7P6quxGJkitjhI2jYYcRXtlsTT3
	ps7ioNA3hnQShBjysCArNg01+xrrUNvf1lTZ4jiNaYCBY=
X-Received: by 2002:a05:600c:628d:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ac185bd243mr241030295e9.17.1793633381464;
        Mon, 02 Nov 2026 07:29:41 -0800 (PST)
X-Received: by 2002:a05:600c:628d:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ac185bd243mr241029635e9.17.1793633381011;
        Mon, 02 Nov 2026 07:29:41 -0800 (PST)
Received: from [192.168.88.29] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm352011105e9.4.2026.11.02.07.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:29:40 -0800 (PST)
Message-ID: <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com>
Date: Mon, 2 Nov 2026 16:29:38 +0100
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
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: Mina Almasry <almasrymina@google.com>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sdf@fomichev.me, kaiyuanz@google.com,
 kuba@kernel.org, bobbyeshleman@meta.com, asml.silence@gmail.com,
 dw@davidwei.uk, ap420073@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, horms@kernel.org, shuah@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org,
 andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org,
 ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org,
 tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
References: <20261030083539.777877-2-almasrymina@google.com>
 <179357408146.3131.2882435952119280563@kernel.org>
 <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/2/26 00:16, Mina Almasry wrote:
> On Sun, Nov 1, 2026 at 3:01 PM <netdev-bot+sashiko@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue(s) to consider.
>>
>> Critical: 0 · High: 1 · Medium: 0 (1) · Low: 0
>>
>> If you believe none of the issues are legitimate, please reply to each
>> issue of Medium severity or higher and explain why the AI is wrong.
>> If any of them are legitimate and you plan to respin, please let patchwork
>> know by including "pw-bot: cr" as a separate line at the end of your reply
>> (one such reply per series is enough).
>>
>> - [High] The dma_dev use-after-free this patch says it fixes can still
>>    happen for RX bindings made on a virtual device that leases queues,…
>>
> 
> I know about the issues with leased devices. That needs a bit of a
> rework, which I have done locally, and would like to send out as a
> follow up fix.
Will such follow-up rework the code touched by  current patch/series?
how much? I'm under the impression that at least the fix for the issue
reported here would be quite overlapping.

/P

