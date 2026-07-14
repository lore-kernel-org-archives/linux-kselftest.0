Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3F73C0605
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031439; cv=none; b=mPL9Bz22dKLo1dl2PRis5iM1rj/4F5dKjXFAd8pqRgxFWwaJVuRlxtA3grUuvsLJ18xtQ/gDCm6jVt2n18e62Xm4XoEM9bEEp9ueTF8wpTDnr2uft8NZE+bajRO9CWd8RX6wRHSu9jAKwQRo0It23A0aGDC5h6RCj2TVe/2qq6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031439; c=relaxed/simple;
	bh=YEpNs6pmYVxz4PQh8SzmAkXFrjWAYq6cWXXi9C3jIkw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=u6SGF3E0hMlOwXCbdmKceqDoC16awAHw9IXcG5ddWPUzQ/fKxCryc7l7wxvtg363G+9ALfiloNMu8wSfHDoYxBSKE6Ql9jmNCqCxCRKnxHJN/Tuwi00jyqVRRjAH0tt2u0tLaMvGTrFKOf0pzVwDGAuTSnUQkkO4hX49EVQl28g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-493d43b6c28so3783225e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 05:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031433; x=1784636233;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egZiSxqHD1w/P79BBVFkvOie28f1koI4NWZWuHndLxE=;
        b=DwHBarnsCinOJZ/V7YY44nHmNSHHqCCXzB+i0s0uZWzHajumZN0bmc9vpSu1id/WR1
         8Z9XTZiit24AJ+M3z0z/tgf/6GVybkszfhwMHJzCVon6Q1fiRjFuAXz/mWGfrK6uv23j
         SMsYDoxjDM8BbPBTG+z6t7QmKIljvwjCvNJ9LTEU2qvUBTcXhstfrXKqVVmrnnI/kbpw
         zTgbA3iHTuEL21NdIFJKMLh44lqlCs4tPm5s4A+jA0fcv4Tzy4Gw9QIuaqPo4l/fJXfQ
         W1qt9LG9eSSnKE/SoW5uGLzsTpEw1d/oLLtO4kpfdqEbAUVypb/m+1BAVFUlFMT6/8h5
         I4Qw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+qSWUDg4eyN07m6wHSE1Q7avwq6D76fZNQ4TLCcFJZVToWmICgVzePM/R1OsymITdC2J8WhgtGTnlI6d3GJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBbY99tFaSxi2DFD6ecW8u3m4OUKxFdxNL7Qh9OR7u3qvEJAPU
	KFT1dm3oDG03rKaie4+Z5fBMCBNB5SkhnMkDduReTMynlZBrGPg2tlI7
X-Gm-Gg: AfdE7clW3QiSUHz66SPI2wyhQT6AOvp7/HbVKw8/lZ291EJ1SUn2HBEgS1kK/RZSXom
	y+Or9QhvrlZBMRR/lnJ4Jnd4HwOAYue9ZHoGl0vp061muSQrCg0tVIB0uq0uYe4ZwCNpJkTjXb5
	RkTtvAPzPrYXQgUUxuVAh9avUh1dboAjsUBRX8Gvqfl6kHTWIf6ECP+eLAFcth20xfUEzpsvaid
	lrV2lVFjzXnhrBKNCBWsWaI1XI2RrYpliFLABm71gtxdZ+fFt8aEwmuNk9oZeGAW2nIK/y/fjdb
	sSqXP4i2E9UEARrRc+5yWFIob6KzhWEPetYxz+pGnMBT6yrTVcEJ0O7jIBAO89R4UzEarBs/0aW
	ybCe+Y15odmk/PakeCvfbN+Gvqf/3ynERDyY6Y94j8xuuxGrPCuePl5asZSWWl2+WLx4jOn30BD
	605dyWpUj4bNY5Ew7RNsDtm8CzXiKfuQ6dnfeFOv+3s0MbrhDhmA==
X-Received: by 2002:a05:600c:1f87:b0:493:f870:fbf0 with SMTP id 5b1f17b1804b1-493f88b3693mr166046515e9.34.1784031432765;
        Tue, 14 Jul 2026 05:17:12 -0700 (PDT)
Received: from [192.168.88.241] (78-80-108-129.customers.tmcz.cz. [78.80.108.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950871cbd6sm84393335e9.3.2026.07.14.05.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 05:17:12 -0700 (PDT)
Message-ID: <87f03ccc-5f60-4e8e-a6ef-8f5f8dcb4e12@ovn.org>
Date: Tue, 14 Jul 2026 14:17:09 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: i.maximets@ovn.org, dev@openvswitch.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com,
 horms@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 davem@davemloft.net
Subject: Re: [ovs-dev] [PATCH net-next v2] selftests/net/openvswitch: add SCTP
 flow key test
To: =?UTF-8?B?5L6v5pWP54aZ?= <houminxi@gmail.com>
References: <20260707034718.2717982-1-houminxi@gmail.com>
 <f92c4b8a-601a-4e22-822a-ba00705fe60c@ovn.org>
 <CAJ0BgHeDpvS1-stvrDp0HpUgQY8ZSdJZvAiw7fLpL2EHPeRwHg@mail.gmail.com>
 <CAJ0BgHc_3fRLFpaUkb2P2jY4avtB3XJQmk0jE-4UC=1abtKLaQ@mail.gmail.com>
Content-Language: en-US
From: Ilya Maximets <i.maximets@ovn.org>
Autocrypt: addr=i.maximets@ovn.org; keydata=
 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
In-Reply-To: <CAJ0BgHc_3fRLFpaUkb2P2jY4avtB3XJQmk0jE-4UC=1abtKLaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/14/26 2:01 PM, 侯敏熙 wrote:
> Hi Ilya,
> 
> Thanks for pointing this out.  I looked into this and found that
> nc (netcat-openbsd) on Debian/Ubuntu does not have SCTP support at
> all. The upstream OpenBSD nc only handles TCP, UDP, and
> Unix-domain sockets, and the Debian patches don't add SCTP either.

AFAICT, 'nc' in netdev CI is the nmap version of netcat, it's not
the openbsd one.  Does nmap version support sctp?  Google seems to
think so at least.  The test should be skipped though if sctp is
not supported.

Note: sashiko had some comments on the daemon pid handling in v2.

Best regards, Ilya Maximets.

> 
> I see two cleaner alternatives that already have precedent in the
> kernel selftests:
> 
> 1. socat: net/netfilter/nft_queue.sh already uses
>    "socat -u SCTP-LISTEN:PORT STDOUT" for SCTP data-plane testing.
>    Many drivers/net/ selftests already gate on require_cmd("socat").
> 
> 2. A small C helper: similar to sctp_hello.c used by sctp_vrf.sh
>    and conntrack_sctp_collision.sh.  The shell test would call
>    "./sctp_test server/client IP PORT" instead of ncat.
> 
> Which approach would you prefer for v3?
> 
> Best regards,
> Minxi
> 
> 侯敏熙 <houminxi@gmail.com> 于2026年7月13日周一 11:02写道：
> 
>> Ah so many thanks for your suggestions, Please forgive me,
>> I've always used ncat to write test cases.
>>
>> I will re-spin this patch.
>>
>> Ilya Maximets <i.maximets@ovn.org> 于2026年7月13日周一 10:39写道：
>>
>>> On 7/7/26 5:47 AM, Minxi Hou wrote:
>>>> Register OVS_KEY_ATTR_SCTP in the flow key parser so that sctp()
>>>> can be used in flow specifications. The ovs_key_sctp class already
>>>> exists (with src/dst fields matching the TCP/UDP siblings) but was
>>>> not wired into the parser, so the token was silently dropped and the
>>>> kernel rejected the flow.
>>>>
>>>> Add test_sctp_connect_v4 exercising the SCTP flow key with
>>>> port-specific matching: sctp(dst=4443) for client-to-server and
>>>> sctp(src=4443) for server-to-client.
>>>>
>>>> Wait for ncat readiness with ovs_wait instead of a fixed sleep so
>>>> the test does not race against ncat startup. Use grep -c on the
>>>> listening message to distinguish between successive ncat instances
>>>> that share the same stderr log. Kill the previous server before
>>>> respawning to avoid EADDRINUSE on the SCTP port.
>>>>
>>>> Signed-off-by: Minxi Hou <houminxi@gmail.com>
>>>> ---
>>>> v1 -> v2: replace sleep with ovs_wait on ncat listening output,
>>>>           kill previous ncat server before respawning to avoid
>>>>           port conflict (Aaron review feedback)
>>>>
>>>>  .../selftests/net/openvswitch/openvswitch.sh  | 102 ++++++++++++++++++
>>>>  .../selftests/net/openvswitch/ovs-dpctl.py    |   5 +
>>>>  2 files changed, 107 insertions(+)
>>>>
>>>> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh
>>> b/tools/testing/selftests/net/openvswitch/openvswitch.sh
>>>> index 2954245129a2..9c364eeb2ec2 100755
>>>> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
>>>> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
>>>> @@ -32,6 +32,7 @@ tests="
>>>>       dec_ttl                                 ttl: dec_ttl decrements
>>> IP TTL
>>>>       flow_set                                flow-set: Flow modify
>>>>       action_set                              set: SET action rewrites
>>> fields
>>>> +     sctp_connect_v4                         sctp: SCTP flow key
>>> matching
>>>>       psample                                 psample: Sampling packets
>>> with psample"
>>>>
>>>>  info() {
>>>> @@ -443,6 +444,107 @@ test_action_set() {
>>>>       return 0
>>>>  }
>>>>
>>>> +# sctp_connect_v4 test
>>>> +# - sctp(dst=4443) matches client-to-server INIT
>>>> +# - sctp(src=4443) matches server-to-client INIT-ACK
>>>> +# - remove flows and verify connection fails, reinstall and recover
>>>> +test_sctp_connect_v4() {
>>>> +     local t="test_sctp_connect_v4"
>>>> +
>>>> +     which ncat >/dev/null 2>&1 || return $ksft_skip
>>>
>>> Not a full review, but can we avoid ncat?  We already use nc in other
>>> tests, using different implementations of the same thing in different
>>> tests doesn't sound like a good idea.  On mnay systems nc and ncat
>>> will be different implementations with different options and behavior.
>>>
>>> Best regards, Ilya Maximets.
>>>
>>
> _______________________________________________
> dev mailing list
> dev@openvswitch.org
> https://mail.openvswitch.org/mailman/listinfo/ovs-dev
> 

