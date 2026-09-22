Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8853C1D78
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083819; cv=none; b=nFpMp1T2V3Mod1cP4gtJDWLYOYuCGjfMDFdrcV7SoWFi37RcMVnKzArgOuMyW5clDlJf4vrheD/AhNukLoElaXSIpM1cvr0GJLeMoOh9XuTaLS31DpQK79bsZXdWSYPpEoYUDGzCZAaBsAAjMkswnURShZtfEzWZLeIn6hL600A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083819; c=relaxed/simple;
	bh=Ovh+3NCfWArkDpk02CBsC6ZVrby6mZuDUCj0rpEsB8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3etDGPXMcb9oVSrprh2bv/5r4Vq6R8sTm77PWLsUWlA/06lpgfwu/umSj6kSQUnzDsNGsB7ip+u8jtRcv5zrM2l+u+3x9APFuUzH5lg+OIuRKWQCpepPrreUFRxOTE2xRMCXDSGXGkGXOT3snVddPKT82U4N1wHWOkYlqh6CpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BGYgc9hm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e79cjbxE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BGYgc9hm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e79cjbxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790083817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f9g6BjyVGZFd66XuNlSGdvaV1BKMkquG3R7mnAoguds=;
	b=BGYgc9hm8i6Cg4j/IJQS/9GSTmWrVhmeNQP3kFYOzZ1FdAqOFjsskvHeN9zQo3CWziFqiH
	c0a1aXnpBvaMJX5ARgDf4zBXGb/JWEIFmodQysRBXe0lFa0SLefZ6Vcrsw0Lqg+p/HrLAm
	XahMELlCw8aU3msOz/h/XhPGW/34gYQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-BU0q-2RnM8CtFj3-F7u_Rg-1; Tue, 22 Sep 2026 09:30:14 -0400
X-MC-Unique: BU0q-2RnM8CtFj3-F7u_Rg-1
X-Mimecast-MFC-AGG-ID: BU0q-2RnM8CtFj3-F7u_Rg_1790083813
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c29d3ad6b74so248733866b.3
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790083813; x=1790688613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9g6BjyVGZFd66XuNlSGdvaV1BKMkquG3R7mnAoguds=;
        b=e79cjbxEs8tDta9SrCtambNJ/Cs0O/RffSJJMSmNBnyjI2oAe7u1CHdwC1+ajPAhuY
         ++80wiAp9u9TsVGgmiiHTrCtvZU+YbV4wr4ol+cBiJztie+rVsqEe4x+fb/DeurqLspO
         jrjlClw6fNBZB1ZKgSzXFALfoBj3GbEaWiY6I9DmaX7Th2OGk8ewZcOGGtK+cIrYi4is
         GrQwiE+CrC47JO4Z8sLbFW56Q8xPlwKa4IMmcnSSw3mZaqnvDmAZS+ZNknF8ff+6EC/y
         nVXWWumRA8cz2NkW98bY0NBysW8JEDZj5BeEAge7gHdF3Lm1IznxbnIpTUeP+6M2f/8i
         75Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083813; x=1790688613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9g6BjyVGZFd66XuNlSGdvaV1BKMkquG3R7mnAoguds=;
        b=E5i1REPEq3Hhx8iteHJiOPpaWGqzu/BSfh3gb04M2zdttBAMSrZ2nV0bUs0CENz8Ec
         1bVA3UmISN/L0xgZt/p36M6J/1UwasxUUVbq/fiXWtnRkUmiJZzkErpZCEj/PDRTTuva
         VMj+vgQQLyxam8UYn6g37+RQ5Rj550F1yxc1So8CGFqOGMntEF1q90pOUFTOyVR0Gj4P
         S2+P6hMQY6tyOb8I2DtJPaGtdAttnXV0g6QIeA40muJQJnNaQUUrH5lGR0UTWIoWseNf
         l8CsuedDPRtG4oylvDCtqrfpR5wv7E5P5GRKziSlbIT/m8rFItYD12GiKUyvwaFav68r
         j2rw==
X-Forwarded-Encrypted: i=1; AKwUvBxch2oIG4uMZFGS9MXBV3knGcvc2w2Ma47KtXB2QhqVki0kxL0Oq5xdj8giz5Pf+HxOlo+vWChaLOT1TGQIgvM=@vger.kernel.org
X-Gm-Message-State: AFuF++l6s6xlzGOJKcacvMVF22Ixm2tE58KFa6Kw0f7KyLkIhOc+VkuM
	tS6IXIIjUUFg/IuxlHQnLHqRh16bzqzelxGAz2hc1I/R3RYvqZ9HR23sE2rgi7oytyqarn2omts
	IGT7RP2CRfm0WYY21eH43mKW4a/7h/Z73UCKgbCrxEVdkS6bfcxBILt+kK2el3C0avBLI1A==
X-Gm-Gg: AYBFou024use13ZhB0y1mE4cZGVovjKBUXeOWLyGOXeThFNzZLj9nFVsUWOrp3I7bX8
	kGBqNWo4oiKw4SnU0B6tFwi4SnJyKA4C0gfRI7XtVNKOCevmFX0SRSl4r6HEo5sW3ddcOhBuMxT
	Vc+nfl1vsm0I/8ej4FUuaEhGefeRC7jmCNcn1Fy85GH1Hk3c6U4EMPMwRwHstl+nHlYJlyZDCEt
	VX+SLlVmoF0SNsj1/ctkXolaBmhptLO9oAQleo0n+nKD4XZDfvj4icOaBC/RuVXXtgpVOoJ9Fyo
	z+bBu4zVL30FMpNGbjtWaScLR3ubXgDjJBy1rlQ98NMxb8RHby0jdneoM2u8R8ZSSjxi6PZeuSR
	Q2fz6wYJGNhVo12E3yKXGPZ8QEfG5njTdB8BULt8bzQU/CRaNUxax31X999+feCBtUm0rrS39sw
	==
X-Received: by 2002:a17:907:72d3:b0:c29:f5d8:9c70 with SMTP id a640c23a62f3a-c2a158019c7mr1066564766b.31.1790083813129;
        Tue, 22 Sep 2026 06:30:13 -0700 (PDT)
X-Received: by 2002:a17:907:72d3:b0:c29:f5d8:9c70 with SMTP id a640c23a62f3a-c2a158019c7mr1066561866b.31.1790083812536;
        Tue, 22 Sep 2026 06:30:12 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5832fesm88079966b.30.2026.09.22.06.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:30:12 -0700 (PDT)
Message-ID: <d6cdbc83-86a6-4c2a-ad99-29cdb83566dd@redhat.com>
Date: Tue, 22 Sep 2026 15:30:10 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] mptcp: support MSG_ERRQUEUE on the parent
 socket
To: netdev-bot+sashiko@kernel.org, matttbe@kernel.org
Cc: martineau@kernel.org, geliang@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 netdev@vger.kernel.org, mptcp@lists.linux.dev, linux-kernel@vger.kernel.org,
 devnexen@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org
References: <20260918-net-next-mptcp-msg_errqueue-v1-1-dd77e1738248@kernel.org>
 <179001595171.2160803.3670624686905872378@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179001595171.2160803.3670624686905872378@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/21/26 20:39, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new error-queue splice is dead code for MPTCP-native data:
>    its only accepted input (SO_EE_ORIGIN_TIMESTAMPING skbs on a subflow…
> - [Medium] Forwarded TX timestamps expose per-subflow identifiers instead
>    of parent-socket byte-stream identifiers, breaking the…
Sashiko comments look relevant to me. Basically this work makes sense
if proper support for mptcp-level tx timestamping is enabled and the
and sk_tskey is resolved at the msk level.

I underlook at the above during reviews on the mptcp ML.

IDK if someone is currently working on the missing work/bits.

/P

