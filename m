Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A0B3469F6
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158268; cv=none; b=BHbgmcpLePwPb+ZlaOd3I9Scq79Ish+h6qlUYheb4m8BJbtkdMoULCkqSjYQeFWkYvv/52uGJVrejhCYM32LxXot+wroa22VTihZzPtBSVHE5zs+NzU0Exz3fybG6LBWoCKJCAc6fSmtz4kuYl7phFRGyW+VMSQqQbW1CrZLSV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158268; c=relaxed/simple;
	bh=y9RBwNlL7JFhRplM8GzxiuHZYoF1Od4tFFoLb5d65OE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DoN5R1M5y+l3N3016Nhl2STJP4gkwVfDLcwbiLR1JjJe7+1v5AtbyBomjQLcQyj175AA9LMWKfx1le15BtfC2pwPVk/Wq1Zn2dm+hh0zkE8TdCfMNt0PNlBAeBkTIpxgIQ7BWCTkqOSvFgQTLRJWhIP5kuYXCUH7qn1jx6EpV7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PXb9T8Pj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2D3WG+x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PXb9T8Pj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2D3WG+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776158265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8o+jTcPee9ytS2fBNgNkDGXbrpoLlX9QLHbrMcVIiqY=;
	b=PXb9T8PjQrlpvT93q8c0B6rv2otrPLefXYMTDpmW8vMLFnZ1gHmm/9QoJ8058bqFMdUe//
	XURhNqAJBzmA9DnQYNrBq1lNmtAihkzqNUxqT6CE37izcvpxihJ2amF1sy94E/Jwj9GPuV
	oja0Or83mVb4H7ncyQxD5rD27INGU68=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-faIKCPcXPj6t3q2CSr-Pag-1; Tue, 14 Apr 2026 05:17:43 -0400
X-MC-Unique: faIKCPcXPj6t3q2CSr-Pag-1
X-Mimecast-MFC-AGG-ID: faIKCPcXPj6t3q2CSr-Pag_1776158263
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488ba2f4094so36551015e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776158263; x=1776763063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8o+jTcPee9ytS2fBNgNkDGXbrpoLlX9QLHbrMcVIiqY=;
        b=U2D3WG+xLbxBDcflMW/7RIsu1hpb1bX7i03/sFi4cuQC5qZmlAiJKC4vA/JggHRfOz
         +f/2M0gggTjhtypa+v+ZILkm3KTqbAM4tcWWaNkw/+xK3ioXwe43WChH9ITYIrG+DJvV
         68iqfSXUmVfbb1mV/SxfBeORnej0WqE5n49t2v5QdWuX24WJ8JDEgcbEwGic5qiE/LR7
         BjZcfzjm/5YSgq80anjgC0EFMG/X6XyFWjMnWHEtCoIhrI0+nHcVsdSd0SQHhaqtUM3Q
         BKq2x+R4qAGmuMs3+5Lsr+w+py2oKZLFKvXBZ69d38QVgdHoM7fYRuccsl+qav4tTGcv
         GY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158263; x=1776763063;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8o+jTcPee9ytS2fBNgNkDGXbrpoLlX9QLHbrMcVIiqY=;
        b=XOdQRidX82Xpd1J3piSXGlOJj0eXPV/0wY0iNFAxEC0+RDs2eRtnJZdVIH98dfidsz
         OtFhkqx7lrlw09grruUnMfzVSu04SC13mueWcN6p7++JKNv991oKHtWudtBUzJQKfQal
         TiEihHErHfDNNHgOWYt7Iizv9AuabE0SC230DpqGnwR2HPa+zYMphmvNfjhIX90Ygpvw
         DLTgZ9QO3VxbidlXC7boP0mP89eN9Jn6ZdV3YAGGDAJQGffpV3/xWA9bK5ktSf0gaAC9
         sJph3+HRs8pEfqJWYaAqhz5zOukTZAuHEZcErI8IxG6/UWuCI5xdkQslfmj9SUIwE8Tk
         ID9g==
X-Forwarded-Encrypted: i=1; AFNElJ8aavOozYlw+H51ygIwUxDRdtwFiFSdQMXY8UCp03h0hXgZyauqZUGGZ7c9BU+cpG1PtWljU8Ae2T9F96lDCe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzyhT6T3ZOLNxUbZkXCp+WxVuhItdNbV7FyF0EqKipzsjQ51NU
	ANhAKchWP1Sw5NvOOtsQUzqSe8ISfhUc7zNwhZ3c9EB3aO9VBjOiLh2um/y5LS61JBQiK0tCCS/
	Q4Ex70ztEZRE01QfFRwD2Vg1H7PPcHBlMtXCqz+eYW37KiNG8bOwKplzVQ19VczODGFWMQg==
X-Gm-Gg: AeBDieu3Wffxxzn/6drnFna6tkzUrFcVwV8w9dcRrrC+t/jHVEbVvfu+UFhc6dFaSCc
	l/xuwPRoMHhbW5wEbPH7pOrd+8wyc6SCGwKaH6JJg9UJeYc96cugN3n42Q/TRtHZSawZdjN1Nt7
	WIVdXwde3QyLlYxJRynAMJWZom0LkRygx4F+0KgvPGcaSpo8xDUyBMthcfvivkcyZo2t/l1NRSn
	vZLRAtZM1PH69LeBNQ1UsPjKfcxPWUfUeRWyo8i1r0fkvncCAkEcwhzfCNTUicDSMiIKXbsYODr
	Rnn88guIo1rhd6Wfk9bS3yhK0GMpUD3wjeKWqKYNTQxvGH6TUY7UPNOoKqcHALMMlHPkHveWXvu
	1SWW1iyTsSx10Bhmxensr/HvHvToKwx5S/wCoZeIDgzxBrlGZ8eJyKZzA
X-Received: by 2002:a05:600c:a404:b0:487:1108:48b8 with SMTP id 5b1f17b1804b1-488d67b8d97mr197779245e9.2.1776158262602;
        Tue, 14 Apr 2026 02:17:42 -0700 (PDT)
X-Received: by 2002:a05:600c:a404:b0:487:1108:48b8 with SMTP id 5b1f17b1804b1-488d67b8d97mr197778675e9.2.1776158262108;
        Tue, 14 Apr 2026 02:17:42 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede2ba5asm32868935e9.12.2026.04.14.02.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:17:41 -0700 (PDT)
Message-ID: <04cafd50-7af5-4835-b0df-67393d9f5a51@redhat.com>
Date: Tue, 14 Apr 2026 11:17:39 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] selftests/bpf: verify syncookie
 statistics in tcp_custom_syncookie
From: Paolo Abeni <pabeni@redhat.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, Eric Dumazet <edumazet@google.com>,
 Daniel Borkmann <daniel@iogearbox.net>
Cc: netdev@vger.kernel.org, Neal Cardwell <ncardwell@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260411013211.225834-1-jiayuan.chen@linux.dev>
 <20260411013211.225834-2-jiayuan.chen@linux.dev>
 <CAAVpQUCCZVogDUUTfr3k-JxV52kpVvdYzqFC68-J3n6_ugd4Uw@mail.gmail.com>
 <6b22a595-cd65-42ec-b332-c835273bc174@redhat.com>
Content-Language: en-US
In-Reply-To: <6b22a595-cd65-42ec-b332-c835273bc174@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/14/26 11:08 AM, Paolo Abeni wrote:
> On 4/14/26 7:50 AM, Kuniyuki Iwashima wrote:
>> On Fri, Apr 10, 2026 at 6:32 PM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
>>>
>>> Add read_tcpext_snmp() helper to network_helpers which reads a
>>> TcpExt SNMP counter via nstat, and use it in the tcp_custom_syncookie
>>> test to verify that LINUX_MIB_SYNCOOKIESRECV is incremented and
>>> LINUX_MIB_SYNCOOKIESFAILED stays unchanged across a successful
>>> BPF custom syncookie validation.
>>>
>>> The delta is captured between start_server() and accept(), which
>>> covers the full SYN/ACK/cookie-check path for one connection.
>>>
>>> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>>> ---
>>>  tools/testing/selftests/bpf/network_helpers.c | 22 +++++++++++++++++++
>>>  tools/testing/selftests/bpf/network_helpers.h |  1 +
>>>  .../bpf/prog_tests/tcp_custom_syncookie.c     | 20 +++++++++++++++++
>>
>> As you touch bpf selftest helper files, please rebase on bpf-next
>> to avoid possible conflicts and tag bpf-next in the Subject.
> 
> To hopefully  minimize the conflicts handling I'm going to apply patch
> 1/2 to net-next. Please resubmit patch 2/2 to bpf-next after the
> relevant net core reach there.

Uhmm... the original feature went through the bpf tree, so I guess both
patches could/should via bpf-next. Hopefully conflict into the tcp code
should be minimal.

@Eric, @Daniel: please LMK if you prefer otherwise.
/P

