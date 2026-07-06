Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E1434E741
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 12:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341507; cv=none; b=c2m0c3aZ/pEE6/7ucF4RLepYzizwIlS6NdmujPzpfM4hG5AJpM8w5mXXeKGimn2/GfnYZ09y+wTaI2CCfSZxPM2pFX1FIbOCarVqs/6+Kpn+/EARTTAKoqaGxslv4EuueJTFvVoaOoctb9IEbY2fKT+26QbGu3oZY4+EzoMUE/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341507; c=relaxed/simple;
	bh=hCPDHhPwY7eBV10/bdUAEaC72nbOOeiIO1RuPkeO/T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8ZaKeK/j+NGBd/j3ceZ4LAWHXrHHxZxqZwEF/ZCaIucVrf7S30mLlvSpXNF9ZXWxSo2sMcKwW93gyKFcs7K0/j36UG+amDzIgJuEekX5oId9JPqILvUgYbenM4/wcjrZKgax9LnKZVSVPIUyfuqfPI3dGkZoz1Ox8mdB6lDbfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XFRbhkKI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ntPaucDN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XFRbhkKI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ntPaucDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783341501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzGosQ0aZkrtstjBVQ1bx1uU/9xoCj7x84hi92ZCHDY=;
	b=XFRbhkKI8BhgcdFB/WbF5VKZcp/9/iiwVs6W1Ee2Ywdp/lGwcI1cAUm20znBqkWa7jD8sR
	DRgAUPNymQD8vE74xsLdb40p3/g/IKj+920HfFHracS5g/uv6tw6A201oK2GHOZ7b2t07C
	TLcgUJLGuhowC3HO9HzQQM8Tzhn0/qc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-BnRxUKNIOOGC_cczloNYPg-1; Mon, 06 Jul 2026 08:38:20 -0400
X-MC-Unique: BnRxUKNIOOGC_cczloNYPg-1
X-Mimecast-MFC-AGG-ID: BnRxUKNIOOGC_cczloNYPg_1783341499
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4740be00302so2418763f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 05:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783341499; x=1783946299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wzGosQ0aZkrtstjBVQ1bx1uU/9xoCj7x84hi92ZCHDY=;
        b=ntPaucDNUozbyo9clfYPmrKGfJuJ0xUBSnhTCk7iJKT6wNnXc7G+bWLNkn6jrozkM3
         m3W5cb3Aa6rF6zIgks/g16OnHuLDlvTi/6YUne+f/6JkpZRjWpyhX6ppgZgiJmewoWhm
         k7vFNFvErhGFhmAPiIYwkARVJN7He3tPBPVa2B9vbP0RUIdaDtO+3EHj+ft9EvWhYRm7
         FFrzxLCjonpNhOH4lhhrMuYZ5QvSGcKfX9qOkhMK3UtWCSaNRUIykrSFS/guIBQfK56p
         Kozn2bnNswDqsWn9Os7UjzyAaAzgN5dop89bhRw30R95RISAaNYNUuu1oMNHHKVL4OB0
         Ki+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341499; x=1783946299;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzGosQ0aZkrtstjBVQ1bx1uU/9xoCj7x84hi92ZCHDY=;
        b=T2gLCDvqbBXzzbYCTgVf+iAUmM7ECD2l/GRGX+/8l4TiwkDpsYo+C+8WApj6+5imXm
         2bTmSil9Ffb/Iu65elSRGPhhxlNO2/TuaZ9YjtN3oUhhDJfgHMl8SCIuemjtv88ea1wt
         GH2Ut8cspwL7ECir4bPiIY8qRZVfsJBY0C3vuc1KxNBmunFw1IZrjTF/r7wslRWd/olm
         pKTdvlpQS6dTq3NfyjhMhZKMNn7iGuHD2g2T44waR6eG0ozYVya15/RaCpB3le77kXfE
         o9T0JG58o7sAbHXkmn7Ja0k5LJnlTXhJmmpf/deSkZhvPNZ7EmB6s7nOvE+t3js777q8
         r8PA==
X-Forwarded-Encrypted: i=1; AHgh+RomhdRX8+28a94pvjDNtJWQwrRNAY2wKdrmy7PK+KWiWsVeMKKB45qsVxit1jlivMx5Gqti2gkdRL/iOAhD/e0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL3xYnhO9ZtBL9FiQudg2YftvwBX9qnm5rhSBKJsYzqyeXIK5S
	gVx2kW5SbCvBkSQXdlucp/QWSI4qCFsW1rYKXBnlOpRz5DDTIhA0kIQTZa8OqclrRYEH1x1Zmo1
	kBp+sljnW+Y+yko4Xx/yq/sM/4P42IQsVzsBZS7tIXfYPzqxw800O/6uuVbe6MNLG2XSjSg==
X-Gm-Gg: AfdE7clrgRruTvEPoO7rvB2UonUqlt/rC2a5i5jpIqYBIaWu8Pl6SKoBXyRq7YY08s+
	FZR8USebspEQiFMi15wHfPakdf7LILOiwpEgXGCmE4eA+Fl/hJR+A6YCqxKPCUF/gBEoElyQpZL
	M5ppZat26MX2xAZyORI6VDsdI/iBhVGM1xMoUEWb67O/EBvgSkrX3Ngw2Uoavw9eLvAmLnCRGin
	srAJNbQqNMqpx8t8TVpFZz2493Buatz+InElNGX6iOGnZNb8q/xM+dv/62FkFqkCBjSi46pFU70
	mBx0vps6FsKxOGv5/j6npQEnNa9ZBA1uP7mFm/G9skDYeuOTOZgugL2S7wm14AabJnsmIEDkzZd
	DGlpMnvpF/gQfOYpLQS3pBs1uXt4RRyWOO5P8xDMMMYcq8peMJLUmf8VZhH7m4abgkhgPv7knVR
	dzfruOCZDr/sRH
X-Received: by 2002:adf:f5c5:0:b0:475:f0d1:eb5a with SMTP id ffacd0b85a97d-47aace8f2b8mr9066929f8f.53.1783341499105;
        Mon, 06 Jul 2026 05:38:19 -0700 (PDT)
X-Received: by 2002:adf:f5c5:0:b0:475:f0d1:eb5a with SMTP id ffacd0b85a97d-47aace8f2b8mr9066898f8f.53.1783341498673;
        Mon, 06 Jul 2026 05:38:18 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm23738499f8f.14.2026.07.06.05.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:38:18 -0700 (PDT)
Message-ID: <0926f373-4e0b-494f-8364-51bb14feaf20@redhat.com>
Date: Mon, 6 Jul 2026 14:38:16 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/2] net/sched: sch_fq_pie: add per-flow
 statistics via class ops
To: "Hemendra M. Naik" <hemendranaik@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 horms@kernel.org, jiri@resnulli.us, jhs@mojatatu.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 vishy0777@gmail.com, tahiliani@nitk.edu.in
References: <20260630183702.170798-1-hemendranaik@gmail.com>
 <20260630183702.170798-2-hemendranaik@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260630183702.170798-2-hemendranaik@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/26 8:37 PM, Hemendra M. Naik wrote:
> diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
> index 72f48fa4010b..60e85c002ae7 100644
> --- a/net/sched/sch_fq_pie.c
> +++ b/net/sched/sch_fq_pie.c
> @@ -330,7 +330,7 @@ static int fq_pie_change(struct Qdisc *sch, struct nlattr *opt,
>  	/* tupdate is in jiffies */
>  	if (tb[TCA_FQ_PIE_TUPDATE])
>  		WRITE_ONCE(q->p_params.tupdate,
> -			usecs_to_jiffies(nla_get_u32(tb[TCA_FQ_PIE_TUPDATE])));
> +			   usecs_to_jiffies(nla_get_u32(tb[TCA_FQ_PIE_TUPDATE])));

Minor nit, only if a repost is needed for other reasons: unrelated
formatting changes should go in a separate patch.

> @@ -517,10 +519,10 @@ static int fq_pie_dump_stats(struct Qdisc *sch, struct gnet_dump *d)
>  	st.packets_in	= q->stats.packets_in;
>  	st.overlimit	= q->stats.overlimit;
>  	st.overmemory	= q->overmemory;
> -	st.dropped	= q->stats.dropped;
> -	st.ecn_mark	= q->stats.ecn_mark;
> -	st.new_flow_count = q->new_flow_count;
> -	st.memory_usage   = q->memory_usage;
> +	st.dropped		= q->stats.dropped;
> +	st.ecn_mark		= q->stats.ecn_mark;
> +	st.new_flow_count	= q->new_flow_count;
> +	st.memory_usage	= q->memory_usage;

Same here.

@Jamal: the patch LGTM, and I think that the alignment concern raised by
sashiko is not relevant:

https://sashiko.dev/#/patchset/20260630183702.170798-1-hemendranaik%40gmail.com

as user-space already has to deal with 64-bit aligned fields in tc stats.

WDYT?

Thanks,

Paolo

