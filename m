Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529483;
	b=yiZu/r2FMVypC6ykJNcJRkK74PINOjvLa/BNCZMoHBDu8ehrGGOfh2Bu64g/QMv4RuMy
	 ZSPgsByQ7ZV4wn6hDT8yNGCXzXi6TOU6YTJdiwDTAISBHQFsA/hWUDUAisPd6piCSX3gE
	 pkaa03XLA126DySKwyvLDBtmq/FrlxD31pTE+3A03t1iGcL4Ao5essoJDFg/5XP84nbH/
	 ZQ7chZPFSSCOrmRMJo4aqwH/EaUtc0F4Uw4xHMkSltKWzyp1ifnA4+DuEJz0VFlmgr3GV
	 ORfBPieVH3ZfD/IAXPhT/I3RY1VeFPgtwkgRUABuGe5GQphoTbAfexJFz9+vB+g5RVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mGhkRCw615KqlCBkyhl7izYjlZJ6697FMj2w/c0mOoU=;
	b=FQBcEHxcs3HZ9gh54GjtdsONmjuDUEvwLQhhUvmWXfRtPyqz/vLdYvII9pob4I169aUk
	 Az2CrQOyTXKvgSPaD7IMA3qhb3tvSQ2MqduRqDEDXwYYnS20dab1oCehchyOnqS8loQ6Z
	 0zLkhNVeJk+3HmSsLuVcHJ2XJM+xM5OU3I+a11wuIr4XO48du7aqG/25/HrMqF0SR9t2a
	 DnS6CcLlZR3duYndMnIY3qWzg9AmR6viZhsN9NbduJK0q5GklUQbzOVOOLjjyTDrTRfEK
	 uQkfLrUSCTPcxYM6APbKlYYBeQ/N4z2ExRCTDC9puFfIbNlsZpkNwc0bdposQ6jwO3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=UqGS2jrm;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24F4606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 14:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A24F4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=UqGS2jrm
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a8eed31158so380022f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 06:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1795529481; x=1796134281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mGhkRCw615KqlCBkyhl7izYjlZJ6697FMj2w/c0mOoU=;
        b=UqGS2jrmomUXTfSDQ6lU8rH1S4h5PwOcG+jyYnSApYEu8Vqs1dR3qJasCCgI88ZKxP
         LACCySEQCDFbJ41eaG9DzZh/tZinbuHkXgs71GpgL69xwyxYpWgCeXtkYPfloFcOhk3p
         +rtJUhyRhAXY3tvDU23/ZAEJEFwhtl7Iv+Fud9pwqyksdP22YBjS0MPpxRKY8vGD5JIX
         AaSsrU6qFOiAs85CwG8ORJzaKfcKNG/apu0sVLbwWutWrMQrbwDEvSjHKR8qplD67i10
         SJdHEfpBixq6/mvg1bA53jZ0iWUHPu3X3Lqgx+fbv0DpRwmTUtPlQEQ1mTYn2h/I0iIZ
         +9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529481; x=1796134281;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mGhkRCw615KqlCBkyhl7izYjlZJ6697FMj2w/c0mOoU=;
        b=s14O1LF+XsYGMVxn6ur2wyETBSdycqw3MgCYf3eH5UAE5lDqpWfceAol/irJCr87zu
         sWGwH7XI6uYwlbX44GN3cYwd5dWrpwhxd5JhlYBSFTL+cPe5Yx+5dRhqV9e8fXtHd/GW
         lTdtoAZx+Nr+eDq+LoRBCr62LHTToMGoBkcB2ZS6IMHHinZJRTM+yIAhrlhA9fR0MCYf
         i1OuqjTnzB/3oVTYPpdQNMUcjcb0EiMksVRErZejfrvVng2f7N0LZjL4hAqJAtaj3y3J
         mEVPYq2xtDILjhL+PtWC+n16kQiR6uw0ZnsFlbZcY+9o2UhcV0xeAk/+r7NIn/KuvsBN
         xwHQ==
X-Forwarded-Encrypted: i=1; AL+hErE+CLuBN/mmsed4z+8G6voudcVqze2PbU66F5KhquZSlPuQiM3RaEzJjcCJ9Lg3rUbYujYTeLYiDqyeEESUNoc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/mSA8Nhzc2m6q2jzypWFUxh+QByeru4eIJAkq3oYtZoUfNh6p
	ym07AEpVulgSUvSlaw+NURjGrj2anQKlJ4Z/m7GLEy42kMIqBGwbwE+YHUsX2lnBDvU=
X-Gm-Gg: AZFdTZf/yZm4vhP6o9fpbrwBh3+DSQHvay5Av36DXBoGf8Wb/+ZYToRtoYKE6YcXIdo
	mdu39LH2zNrof4ALoaW4pbgIf8Jgwll72ONExn6gc2Ic8oDsnOvgylqP9hbI6VeeYBoZCIMBdws
	NQxX87Y7CeOWXdGklkD3StzFKWsoI7GZyXvZ2WOTFio0rEaVZxFjQh1Pwk6//TjVw2Tx3hJmrhZ
	p7Jz07UPJF+edhLyynlqesESGQFwR1jPT1kQkEUtIQKV7nQCmW1ZBLkIbwn/KoVKzvL1C363KVF
	VxacMGZcdPRpjG6JNMlu9fF6JdmOBRhBDQH20DSoGdweSZw+gr6WYeu6SusGdtDkHiolRVH2sy+
	SJb5IPZnuqk9u+cE3YrTDTDp7LLUBqUbCkpCMVJ9NaIb+LPYbGDdeIwpEsNWEB2TJqfwU7WPIDF
	ARA/NL38K1t030z+CTJYa3wyruNSL5jww4zB3rEtn24J245tHjeIp5yjKcdQcXR4YqTi7lf7g3X
	cbzc42PRtA4f4QqHjqycpouG0bFXBGeKDV+fQik04ItcJNuyGn7Yu7bRlC0qkcZnI+i9YkrrpvX
	0Yu15S0fXBKiS9MgUtRA4n7EuWuKcUcLdz/DWWYDqGvXaXVln0tAT9cYEMGJEu7dP7IFdkFofI5
	bzx1XcgwdZf9qtY6qpn2PQyKC968=
X-Received: by 2002:a5d:5d0a:0:b0:4a5:d259:4c57 with SMTP id ffacd0b85a97d-4abab7df50dmr33724301f8f.2.1795529480872;
        Tue, 24 Nov 2026 06:11:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm29001139f8f.48.2026.11.24.06.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:11:20 -0800 (PST)
Message-ID: <51cf7a82-6680-4ac9-b714-8bb28afb65fc@6wind.com>
Date: Tue, 24 Nov 2026 15:11:19 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net 2/2] selftests: fib_tests: test IPv6 source address of
 a VRF
To: vjardin@free.fr, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-0-f667ab150ade@free.fr>
 <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-2-f667ab150ade@free.fr>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-2-f667ab150ade@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 23/11/2026 à 15:30, Vincent Jardin via B4 Relay a écrit :
> From: Vincent Jardin <vjardin@free.fr>
> 
> Check the IPv6 source address of a route of a VRF through a device
> that only has an IPv6 link-local address:
>   - the address of another device of the VRF
>   - then the one of the VRF device once it has one
>   - then the one of the output device
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
