Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592567;
	b=g65xPfHAFzf4d6xOgLnyea7Gi88Ho+PVW2zbDS8RwbCHWjr5oM9GE87ZszSeS5jMPGSQ
	 jU2aZKzGQNsCDKvR8L3dbSGthWiamVoVKW8k0jgdYxCt9kU+NyJx+FdTnJezZbQyUkTSP
	 0MeOhcQoGwjTzVkDz230x8+W/PbpjXPgavdIhdsvQnYuLxwebX5NfyAYiFpZlgzlgQG7g
	 AU4mkEItKFQ7WDzhfaiL/xwGLRDxZdbO4GaTFWEzHs0CeCo6hIhAbMPKBQy+eqblNJUEO
	 APjv1Gynkhvz1A/wBoHtxGbUE+x74FdOh2VEegBFBavEe3lqz3cSNsfBKmFtUBbXlmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592567;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Vk57SPWS/t6RVGCi+z0GkTQpZ5fp3N6nbyO7Mh1yZJk=;
	b=41bpl5i4Mr3i3JvvztgW5g2MVdFaQel4o8Kmu+Ykx4Gg5nRriNJW7xnHvjlC4cvVpy47
	 9JZ/PnrNvz0ON4ChFi5RG79wt1OuSzk043c1ujvfu3BXGa9jzmb31D3pkTWsZtEGI1NIA
	 oaiEUfHp/3aOz8H/AjtofrWcu7aPATiS8JgA2WmQUyHs0RapVO13IsT3NdXKipRPr3RRH
	 0nZe+O6GNpamy4TGtYpRP217PU76L0PGZHBeADwsn76gOUwaE2d96R+iGU/Q9j1gDSK9w
	 Ws86Lera7s7BasstdAbk1/xQTG7onY9q9tM8RsLFOzBmRG7EicVIE4P00AhqLhZIWdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KtRJFCGg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cvCd+Hyc;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B4D60A2611
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 14:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B4D60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KtRJFCGg;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=cvCd+Hyc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792592565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vk57SPWS/t6RVGCi+z0GkTQpZ5fp3N6nbyO7Mh1yZJk=;
	b=KtRJFCGgPZaDTVPYK4eZ7ikkgMCVfv7zWGCpbrlagFhFYZv+cp2XF6g3XXWufzuqWRyr2E
	YRQ8yh+Uojb+PeURSNSS17vsN+L2vqXDAVCuG4FuBb7O4ncJ3ThDBtRVx/bteNDar/1b9m
	YuWzElThicVWMT4dxLIbdSx0L8xp25g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-lxDzRADUMi23uXn1TzrO7g-1; Wed, 21 Oct 2026 14:22:44 +0000
X-MC-Unique: lxDzRADUMi23uXn1TzrO7g-1
X-Mimecast-MFC-AGG-ID: lxDzRADUMi23uXn1TzrO7g_1792592563
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1d7663a4dso6781905e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792592563; x=1793197363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vk57SPWS/t6RVGCi+z0GkTQpZ5fp3N6nbyO7Mh1yZJk=;
        b=cvCd+Hycx5ucC+lrH0hgSmmBnWOPeryZAT6Y+HpH4mnV7eqCa/u9cSW8CMwDvf3Eyl
         erVAb444YVYbNYVaCEWwXNDkZCrRK9wdHdw76T3X8vL53DumnEZjXbYUN78ul42b6xeY
         JBuEJKZ/RL1p3ssT1nOULRa3tZUKUSnuwHKMELDnOcRh4NSkXKuPjc9HYInGV+Tt8bn6
         XsvjR47ADTHQGyvAHzv5/6JvdGg4RQJOlD3Z3T6+z9ejcOXEiAvJggUjll6kueStd2PQ
         796S3cjMRyzSwoNuyP07IOVe/hjbipARwp9092q1vM/4lukE15nqGgk/2v/4Y0cddY74
         /0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592563; x=1793197363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vk57SPWS/t6RVGCi+z0GkTQpZ5fp3N6nbyO7Mh1yZJk=;
        b=I3ERmclDimm6/IS1XnT/QZL5L2eWye2RyusVYNRpcRsAn0uwvVmHjq00Q1oGxZHY0e
         E5DynB9tFoLViKYWCJQgQuBbN8MF/mmhlUYv1g/m16P24xn/YtA8rLQVtz6epAF7m0Mv
         9inuXk2laHVG2in7q4cSbwo7Fs5xt2+zgri6fY7jqU2NGJ4i758BJIxAJuPq+9GoJghs
         FFjeJOXKvz+Pjw+it7BgwPd+0AkhgpbwuBIyxF9iwLF4RxRopn6aik5vuLAhq31u251m
         FCepnPQYEJ+7pOuoVh+wu3Eo94Pj3g/bW6wfuVpbdOQbn3AG8ePXrmTjwygL98qO6+y+
         5SaQ==
X-Forwarded-Encrypted: i=1; AKwUvByyfgcPx4DWUsYslNPHFEIMSStWIHSyF1QxpK6hf1q3QMj/3H0KBry8gRC/Z/xG8J6IEwp7CioHkMlSMKsC/4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfGxkgn/ywJnDH19L2GaMGwJ7h7Rv5FOtgAq1wOn5SZGx/OioK
	oysgIRnxp7jkMCfdfWXIUwiGK6iNzkRukTcBAXAEuEQPjJaZrfhGeti07BsIKteFxDgDZdtw3LH
	vEKemMDy4TtXDKHxaDW6c8mxUCXuCeHP9aJKBvZ4JXqT6RrvWNkafuH5+F6//i6OjsyIXlA==
X-Gm-Gg: AYBFou2cXS6sefyK654pEPxO+BdgT1JdoGs0/T8ORNlR67555/AfRcXYwcNgvgBZxy4
	mU+WFnds9yL98cAmCMEdly0jCq/m7szDhJZnM6PtwHj0T75ovDR+PRqAMOwDOkALaYNTFfGox8K
	ziTqRpJuW5yXKLGqrUb8mAKu+qfwwgMNuTFsGDd4v9qyDsrgCrvc1o/ozC4csId0xU9Uk0Po53l
	MfCg0WMacxWumcJDZsRkUVWaIIm0ZYp+zbc9UeARkcKV53kll8kpsfpYjAw/QC3AcC6UYMFMNEA
	s2WaNm7KLL1A7uqwd8jNyB4JW6/Hh8EZGaXP6WWklQ5PzpvdVp8/MIu4LjudepSYJutuTnnlh2G
	/lts1DMZLdTkMyvBR9/qi7I7eRJUFe1ErmHLxEzR/uA40BMZoL3MUr5xMYfVnIBoltH9qZTDSOg
	==
X-Received: by 2002:a05:600c:3b82:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a1fdaf7464mr52006175e9.7.1792592563014;
        Wed, 21 Oct 2026 07:22:43 -0700 (PDT)
X-Received: by 2002:a05:600c:3b82:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a1fdaf7464mr52005605e9.7.1792592562546;
        Wed, 21 Oct 2026 07:22:42 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3666sm170631885e9.1.2026.10.21.07.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:22:41 -0700 (PDT)
Message-ID: <3ab59725-e34c-4243-bc72-d93f837bcad1@redhat.com>
Date: Wed, 21 Oct 2026 16:22:40 +0200
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
Subject: Re: [PATCH net-next v2 1/3] net/sched: drr, ets, sfq: skip empty
 rounds in the deficit-refill dequeue loop
To: netdev-bot+sashiko@kernel.org, victor@mojatatu.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 jhs@mojatatu.com, jiri@resnulli.us, netdev@vger.kernel.org,
 horms@kernel.org, sashiko-bot@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <QDISC-TIAE.v2.r0.20261015163454-1@mojatatu.com>
 <179244597608.3135.14866688728455017187@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179244597608.3135.14866688728455017187@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/19/26 23:39, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] drr_dequeue() and ets_qdisc_dequeue() allow only one bulk
>    refill per dequeue: `scanned = true` is set at sch_drr.c:414 /…

This looks legit.

Also is would be great if you could somehow deduplicate the code a bit,
(but I have no good idea on how to achieve that)

/P

