Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0013446B3
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770123047; cv=none; b=eNEo2tL1kIIewgfTo9MZnDzsac/bXt7dRMuq2yIoEYuExAHXtWkE3kCsiutXx7gGU8JFqJBKhQptptmxo+7sp0va17iMS/9Vkbb3fPzGIoDJC6eJXXTgE0wjWQ0E7S6H4nXQna2YKm0+rDdAxvc+IGl2iHDECtZlJV9WQpA1wVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770123047; c=relaxed/simple;
	bh=8KynJT2ddnzGhgGZ8pfYEVkha/4ppnwD3PQCKPf3fF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dFlKc+VAAyF23aQ/+r9tX3On890IWoD3fv6E7uJj0a4AXN/0EB34SPkvncr4c1rmvEgjQ7NW5UdHoA0m7AK9MlUbmVTfy2jXtel5pQK+JHk0ew+y0A/c+MUY0C92Gul6HP6CwW3RnQAiC3oX2N2Ml5Q49CMGRFAH6vEvS8coR8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bF10yEl8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IMxrHQHs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bF10yEl8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IMxrHQHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770123044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEWONWPgIK5PTen/Dr95JAV9SFIx8z/zmIXZPCQZI9g=;
	b=bF10yEl8QA5shqdNZJzhrbmBo8CZ9uVbrgNs0xOhinG5t9g4TptvgwOkTfirb1mudi4DDQ
	u9v/J+jrMl5Gthdt62XzyYW59iBITvRHitGuUQeDq+t6x2JSOM2njopaqCLWRPB4TU3P9e
	sacBraryAcegH0aiEC4JM7xt2AP+yUM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-837Wm5AgO0iCBvCbgaMNnw-1; Tue, 03 Feb 2026 07:50:43 -0500
X-MC-Unique: 837Wm5AgO0iCBvCbgaMNnw-1
X-Mimecast-MFC-AGG-ID: 837Wm5AgO0iCBvCbgaMNnw_1770123042
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-59b7888640dso3521830e87.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 04:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770123042; x=1770727842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cEWONWPgIK5PTen/Dr95JAV9SFIx8z/zmIXZPCQZI9g=;
        b=IMxrHQHsA0ZqTfNWdggKaeqWMpR6zYgedPADfwgtQDIjOM0wxzGkzaVAz1kUC6Nv7h
         2tV4fD+KxeAQY6J4zO0gp0sZ2E3KIyBY9OSi0dA9eIDDfo8qnSCa+65o/HWWXybArrPS
         jRvMPOGzV336ckA2rOarL1IYXai9ZDrQVpM/5M5KZUQQP0MKGSlQ/paIOEG4ZjVEzeAf
         qyq7Vef42Cr5QDjDfvIAAHmGzdLLoEBgQ/+S93rbJWWp6yGrHn1ZGLbl2P5bm1cgJAWz
         zi9MWKXlAv/8SKk05DVRyNDbEoMDfdjURs/LM9jZfaRSBAF5M3aib+Sz/4jVOYQt72NU
         TiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770123042; x=1770727842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEWONWPgIK5PTen/Dr95JAV9SFIx8z/zmIXZPCQZI9g=;
        b=ubPLN4PT5IgdkMYUW6iwdXbzxaAQeJtg8/dca+Je5TBftWubrwZLUfVsFkoM+tviqz
         r7FFcEy5a8k0LaMRQkYz0Oib0/SYylo26nmpb0UDXsDo8usdnFIIL6twsaUKmQ6nc6In
         tbk/8CwiNrAxedIuj1godDs/YNIcDh5Q1HBvID6hmEeqmAESOjictL4BUXUjO+uB1ur9
         7CyqaZPGeoyoIjmVuZcEIvXRtlJ7RLJCJnKfMI9dVI5eQ+fxtWyAeKtBGWC9B/Jz8Dyj
         D2jR77WpVa1sXz6/nmxr3QfO6XF6Gg2LLsd+6zdYswD1QT4H0O00xjxXkLtQ/NBd+r5q
         4hbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfsnxTj1GGPKp4T6JvoFj53FxYvYKUPxGHEucTv80IrPLrAq6/xTJGE73txIXfco/JC5raoUewRwrmuKBslKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzReHskaga/P9LzIDX1JrgVoLOvjVnUVMFBHitKKwJnDVgRWDeJ
	cj2+f5no4q2Zq7CXODYaN2Uf2JHXDmYkeY4gu0j/1PlvuWHsApzx/Op1cF+IIAeGSqy/o5bcZ2K
	D6Io3jQGL+i1/BpvM5I3DlKRp/xz0KG3As6rCrOr/hBZXPJv3LWh5r4irs5B5HEuTBSsnSg==
X-Gm-Gg: AZuq6aJHxiJJxwxsX09sZb3SkKQJahbvz+eGV/VkAB1hK3r6F+bVuBg1dp00e33le6X
	pR/ElX4XDWojI+7sdieC5H4q/U3yVLWfFSIDkQ8evkhD47BAtaTrb+/bzLyHWuTTGMUlv38+z9I
	GRrYukdMmUS/EcKeOe6LGRKhtbu1WqfT1lfL0g2sNiTnOxpPCOcC0UPvqGY9b5znvFB0oIZmYFi
	Gs7V5bd3yBkDbr6XBkEY6fUgUOkxvLVev+Dscszl6CUt3wYKyymf+Zqp/jigPF5xDHvLsB5+Sd8
	tPn5QCloXVlbJYotrUae8fGIjpDgde1vzm/ynF5lfcLdy7deR7KGkFpPwuBp6FkMNSA8alQAQtx
	po1sSTNbFzPU=
X-Received: by 2002:a05:6512:3f21:b0:59e:429:932a with SMTP id 2adb3069b0e04-59e163f573fmr4674354e87.1.1770123041885;
        Tue, 03 Feb 2026 04:50:41 -0800 (PST)
X-Received: by 2002:a05:6512:3f21:b0:59e:429:932a with SMTP id 2adb3069b0e04-59e163f573fmr4674323e87.1.1770123041407;
        Tue, 03 Feb 2026 04:50:41 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e0751bb68sm4024086e87.8.2026.02.03.04.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 04:50:40 -0800 (PST)
Message-ID: <7df9baf9-040f-41ae-b292-f3155842b5f4@redhat.com>
Date: Tue, 3 Feb 2026 13:50:34 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 net-next 00/15] AccECN protocol case handling series
To: chia-yu.chang@nokia-bell-labs.com, edumazet@google.com, parav@nvidia.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org,
 dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com,
 kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com,
 jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch,
 donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org,
 ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
 g.white@cablelabs.com, ingemar.s.johansson@ericsson.com,
 mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at,
 Jason_Livingood@comcast.com, vidhi_goel@apple.com
References: <20260131222515.8485-1-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260131222515.8485-1-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/31/26 11:25 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Hello,
> 
> Plesae find the v13 AccECN case handling patch series, which covers
> several excpetional case handling of Accurate ECN spec (RFC9768),
> adds new identifiers to be used by CC modules, adds ecn_delta into
> rate_sample, and keeps the ACE counter for computation, etc.
> 
> This patch series is part of the full AccECN patch series, which is at
> https://github.com/L4STeam/linux-net-next/commits/upstream_l4steam/

Beside the just shared feedback, the AI reported a bunch of other stuff
that are not relevant:
- fixes tags, IMHO not needed since the touched features were just
partially implemented before
- uapi breakage, already ruled out as irrelevant since the iproute bits
are not there yet
- pktdrill syntax, which is a little inconsistent but AFAICS correct.

I'm not sure about the BIT() macro usage in uAPI, which is already a
thing in many uAPI exposed headers, but does not look correct. I guess
it could be handled with a follow-up, if needed.

So the only feedback the could really require a new revision is WRT ECN
flags handling on retransmission - and I'm not 110% it needs a new
revision: please double check it.

Thanks,

Paolo

