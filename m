Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D882B46D0A4
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785852537; cv=none; b=pFxh/grjrCxIcZms0H6PwdjqhSB2W0xDMXEUA9ajcpmwRwf5qUPCkBiwvYge1i3UPcSkdnvfUZq0nfUYZ4DwpmBSd5/MK8jlkiwkWoLTuQZjNmNKOEhdvjMaMVOMgBaQZKe+DQfAZf+GXH2aAwnUqAAjh/5I31X9nWIZNwQBumY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785852537; c=relaxed/simple;
	bh=cgYDEwDnXNfrwdk9tVNIwmHDQi12TweMs/BHwBg9tBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oBJo+RCWhYaqfTQ4cxdpwJprn02YN+EBYnK47fBiLdJjlPcBQuH0sd7yuNNwFqGWyShGAnjeo5/FuDC1J3/fM072Rh9CofZIBCDKGRwOf2ilAaVAuv6+UHHauDQ2UtDk9JS9T+JXUxaUX6hTg0UEbFo4LPNpjQb7xIXSLuETaN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U+0OoOLq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H1ZCJj+9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U+0OoOLq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H1ZCJj+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785852534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+LsPDhvpVxFRqbtHPix39kF9hXTlQ+yjqttW+ufqj24=;
	b=U+0OoOLqOG/PPJQHnVPnubMyVhy2iZllukG6WDCacQY7814H6C3K6fkxg3GYVgAVs3Cx6q
	MkAWMre0rDQrLxVe2ESO5+3OVnXcAlzCYf2lSrEvGuQn4+yZnNBc7lKxdCK9reGWvw6zrO
	fwZgT140roaTs+nh5KN2VpQuICr5rM8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-f3pHBp7LOeSI6Tw8Ja0Ftg-1; Tue, 04 Aug 2026 10:08:43 -0400
X-MC-Unique: f3pHBp7LOeSI6Tw8Ja0Ftg-1
X-Mimecast-MFC-AGG-ID: f3pHBp7LOeSI6Tw8Ja0Ftg_1785852522
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47162f83c75so608194f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785852522; x=1786457322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+LsPDhvpVxFRqbtHPix39kF9hXTlQ+yjqttW+ufqj24=;
        b=H1ZCJj+9eEdt4Ke3XwFvc43boHUk+mwdavvplDRItJLJSkv2u3oQFKCobwQ+9fkyWF
         5pTv/f6gCiUmihyLcvoh9EaHzA8aC4TjiftB6dcQAs9P4XhmjPUCOZKvzDxjHr6TJDWZ
         BHItE3OtP7Uq2n4TIeSSpqRCmSL4UM8dKb0v4T0YIjJxZ4rq+/ECG815U1OjUOwc2id6
         pmCPIlTb5xfI93+fVtBr9YGRhyQRQ063ANk2aHZMNX8WziTbATF3M6NMbDY8MDNm78Q5
         jk/jzPwS9VowkwLqqH1uvEhd02px/SkdISVwarj6T/c4p3Zflm9NVgTp7E0GdLWD6ThJ
         l9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785852522; x=1786457322;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+LsPDhvpVxFRqbtHPix39kF9hXTlQ+yjqttW+ufqj24=;
        b=LCDKLh+pDV1FEtL2Ry6QfnshXJEPbvCHA+0KW3xA6/PQ+obseM6kPy97b+PzoecVyo
         gTkj+jqaqLS+ioBLepVG1ayaDBycwdOqaJnInlr4AkhKJRbVB3ZGZ8kZ4SL+ZluxORPU
         NLp43hi76ovx2ijAmL/na0L3GmFItJYFfmd8o6Ndl0IdAQhzAh8eDGI40rennw18KaNN
         YnlU+szQPKjqVrlcFN5+EvUhK7Oa7kNd+vwSJxeT740vpI7EH/HzGn9PSnNVrXT/ANKI
         hIXn41lKAMf20cwkB21AFXuMN9ON2J6jfWiJr45oC8M+bMzXGfIRBoh74YOEjhzV7mYx
         LuZw==
X-Forwarded-Encrypted: i=1; AHgh+RrD8g4HvHWZSobp7Rlq0gl0JYEmSGYUMpGvhP2SxfcrlWv7HBfVBOBAHecnvZaw3T1i4woV7hr6LqNEE75Mvug=@vger.kernel.org
X-Gm-Message-State: AOJu0YynaqvFEkk5X0juWMj+jEnS6DK/x4hRSBvSEgGzPC7aoau6rf6w
	zcSEc5N1hfJ63dnLBlrBo348kwOBToJo+ant1fReFaawp4XQwnHLirNXj8LdrAHAnfxPdno7ca+
	X8yhQ6J4h1Ubh05uBqjW2/jBEaG5dmORlwWMg/l0O8GXdT7kNkmS4ywp3nlKWAZYWvtfA4Q==
X-Gm-Gg: AR+sD13r9Hh6sMNFTmKZdTqef11bhY79YECSgMTgrx9IQmWewxkXxcs3pQFKI7yYqMH
	xMWN1tVFhYaFSC8vUPROP61PSAk4r6BSuhNTufIQnNyQg7OIKoKNHyR8lVktciAGZeeUBiCTrXQ
	WidGeGBxuwpv50GBJw5SviOT8HcSq503QnjguvJJRiMm0jWyGOZG+NhJ3jsuSI6CCQ46SyiM7/z
	S4vwH3tt4zGeQ0sHFrXqCehyqewK2eiLSZGm+kgDWjC+e13/wIVscHahSEoHr8h0X+yIJGowzEe
	bl7KNSovpmq9kcnOq40nbexoXEmidM3VLnFJ3dN9nIiZULAt3/0+AMAcnJOLQ07i44XZx5HSQ+8
	9QBZ1n/WYjG08flgncljt9ADDMohid56gpGv8/1gC0ZykmwThQw0k3iPJ4dG87iHhYRYQFTRKOm
	8=
X-Received: by 2002:a05:6000:1842:b0:47f:6e8b:699c with SMTP id ffacd0b85a97d-47fe81c299dmr11454159f8f.14.1785852522268;
        Tue, 04 Aug 2026 07:08:42 -0700 (PDT)
X-Received: by 2002:a05:6000:1842:b0:47f:6e8b:699c with SMTP id ffacd0b85a97d-47fe81c299dmr11454036f8f.14.1785852521894;
        Tue, 04 Aug 2026 07:08:41 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm45228918f8f.19.2026.08.04.07.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 07:08:41 -0700 (PDT)
Message-ID: <3ad893be-c46a-44ba-bcb4-8665eeb41fc2@redhat.com>
Date: Tue, 4 Aug 2026 16:08:39 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 1/1] tcp: Replace min_tso_segs() with
 tso_segs() CC callback
To: chia-yu.chang@nokia-bell-labs.com, emil@etsalapatis.com,
 jolsa@kernel.org, yonghong.song@linux.dev, song@kernel.org,
 linux-kselftest@vger.kernel.org, memxor@gmail.com, shuah@kernel.org,
 martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, horms@kernel.org, dsahern@kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, jhs@mojatatu.com,
 kuba@kernel.org, stephen@networkplumber.org, davem@davemloft.net,
 edumazet@google.com, andrew+netdev@lunn.ch, donald.hunter@gmail.com,
 kuniyu@google.com, ij@kernel.org, ncardwell@google.com,
 koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
 ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com,
 cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com,
 vidhi_goel@apple.com
References: <20260730114919.658373-1-chia-yu.chang@nokia-bell-labs.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260730114919.658373-1-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/30/26 1:49 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> This patch replaces existing min_tso_segs() with tso_segs() CC callback
> for CC algorithm to provide explicit tso segment number of each data
> burst and overrides tcp_tso_autosize().
> 
> This change provides below impacts on BPF struct_ops users:
> - The callback is renamed from min_tso_segs() to tso_segs()
> - The signature gains an extra u32 mss_now argument
> - The return value semantics is changed from "floor value passed into
>   tcp_tso_autosize()" to "final tso_segs value", bypassing autosizing
> 
> As a result, BPF programs shall be updated, because returning a small
> constant will now directly limit the final tso_segs value instead of
> specifying the minimum value passed to tcp_tso_autosize().
> 
> Signed-off-by: Ilpo Järvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
Sashiko nipa has more feedback, that looks relevant to me even if it's
tagged not hi prio:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260730114919.658373-1-chia-yu.chang%40nokia-bell-labs.com

/P

