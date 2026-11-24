Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519594;
	b=zsaylGlDwWj7h3iapCAsG6UzKuIR4bpE8ReQKtkfK2xs49vhMzjHTpeUwPBKvI3fdIq+
	 4VyLNT4udrGUCZPEP/U2sw1iEqJM0iO2aiPVpdulrBlEmfZvsZOLyduRYreo3a1VD29DO
	 VJr1HzdmjiUzCzf0zhckJ8mx7E8q5722NnatwChAQDfw3cyh826e46qKDh5PAmM216/G1
	 cFYVWFCfcqSIy/LCxOuenjzsgmqoTHRz9yaRUyiqEKHIf6k6WakP1aiIQIItf4qQh7qxd
	 s5G/tx34LBmDTdOT6VwmpM5vdL/QKCJMVRKK6ZE02/fQ7n8qxGhYpvdVsvA5TKJdE/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519594;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=a+lZip1PEoK6ULVO96IvFxnV+pDL7SQgPm6Y/ZI2OpQ=;
	b=RKHmgxTWgzAChgegjQcwI1RIIGJ5ZqhafwzpNLKv1Z8soxANDF+Oz5Z48rSmEWiY9E+i
	 vk0lDVweTsKErNXa9fxQEyEOrVRd3agrVECcGfbPbsRTNT0ZuLBrT5cw9h8qcUfoM57yW
	 NelxmGvS/xcwkt1YB/7TVzCzjm+g6uQ0Myvj7hufAlmD5iAnjemAWRYAhSBQ+sxCuD9Wg
	 yYLYq46nAK+Aa6qD8RM1KEnVPT6/i+vhvdS4XAExZdsnKI5VOXZ1tjiZ4k/owXJ7klqqf
	 /SIvvy0Jf8EqOky4Xp4sEl1frpBQlkpRRYdiesBI3MXCDkDmlffiUlYzu5wW21WIyFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQIh3wVj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kuIE650C;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF1606A332
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 11:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EEF1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQIh3wVj;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kuIE650C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795519593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+lZip1PEoK6ULVO96IvFxnV+pDL7SQgPm6Y/ZI2OpQ=;
	b=hQIh3wVjfmTMBuKhkKeAYBzt7QXlgRNCYXhuUkNTP4zaMXNE20Ftw9ADREai8JBil79YOk
	jekhr8fR41JYu6ziXZ5yLZICTyZf00IpS6/SIc8cHHSR32M2nOmbpsAvWBI3V+w9GKLgE3
	fvT3AeIckurGxK4hJAzbdIBHvk94bbY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-ne3oNS99Mu6qbENQmxKsEQ-1; Tue, 24 Nov 2026 11:26:29 +0000
X-MC-Unique: ne3oNS99Mu6qbENQmxKsEQ-1
X-Mimecast-MFC-AGG-ID: ne3oNS99Mu6qbENQmxKsEQ_1795519588
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4aa0500c979so2672333f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795519588; x=1796124388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+lZip1PEoK6ULVO96IvFxnV+pDL7SQgPm6Y/ZI2OpQ=;
        b=kuIE650CMBpg7TQOLbDu0lbpR9m9UuLhm3UEt+kfvdx32LWbfOOGj8IX3S2XhULHwL
         uJHY3qGJXbK1dBbBlKRiTymslcLaysSgxBUHCiUZCCjdin6sX8Xh3H0Cbkv2+Qv+3QIb
         IDe+yz2nHzK9Za4N5VQL7G6lkeLMza58P7hOqshJYE2DI+C0psBhEFQvgtGcrLJiTZYU
         PDaCD2MIC/Hqxkme/fNtrZ/kVmts8uRber+1Zx86fVcKLlILyljxe3tES6EK/5Gpbldf
         dfvcDX89TaqY0uznyyDNenvAgaoEwJDdIme2Hq1ZxTYPdwURsKzW3R8hROCE5dqMBQ+j
         w/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519588; x=1796124388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+lZip1PEoK6ULVO96IvFxnV+pDL7SQgPm6Y/ZI2OpQ=;
        b=Fa/D+WXU/rv2OUN4LfdgjpHZkVvSfXCa75wiWy0tAMQTENzy99vBlCqrC242JKWJ9B
         8JXlbnj/QoTKj73ssPZ0BzXs0gH7Zn5xVqARr24smIlVA4YwHJGCV9ONUSwXcAWKM0sD
         JbsYH1BjpRjG3eAg1WVIvTYUCKkgCleK9nWJjOOEscntpbx5knepRdtSw8VsGZV+vvpb
         v7+PQAZf8KYHSoYalUMf21Rk5zDcrRE9lQ0HwQVT0IFXuOuf3PSKb0bo0EU8CoxtbwZt
         SXlZhuTfZpgkH2fwZTS0z35d/tI8Hj6hOuuBTcoh1AnpbWmcN6L0e1JbUJRT9E5xT9Va
         QZ9w==
X-Forwarded-Encrypted: i=1; AL+hErEPmwJuIrzfeSvAeIn9odJnZX1r/0WoUz6Tc8iYK6p8pNIWbc287hKcsqiSMIHo2UJ4a+uwiRRCEWfq7ePaaXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vki6Fi3y+OJjGsmXBATjtxxu4IXyKTJ1aqtRVo3f2wsOtAhxf
	byPVari4ppov+NEVKiNJLw2KTnubqNuSv0X0IfAFge1B08Wb8Nr0mqrDqtSxL6waVj7KaqBrD2w
	g5RPo0LAYcZig3inDA65Dwqo0C4+g8CVjbSbpD2ZkuEyK36m2KReigdI3uXxeqs5YjuRorA==
X-Gm-Gg: AZFdTZfKlmN59TTjZq2XBcXqO2M5k9dfQrrsfX/ejfdaV6UEB98UXQvC8JhPDRmhLuT
	d7eQ4EM/77UcdxP+uwfSPcGhS5Uzj08W0QDrMDRg8T7L5gOHV5k6ZNXgJQ7l3l+u/lWX7u193dk
	xZlhUdRiCAvyEuzWP46fOjziqsu08pZdbEsQM1TltKFlW13Mtdi2h81KFj4GVvW8FA6P6d88toa
	m9G4/vjanpKRbPzdUmfCYgM+icZX+TRyGa4i9+tkbaSCuHsTqE+qyoURoJfroXms0SQtOziJAYM
	MMr+HjN0tPz+RBrVWd63XYgAbeTn3dbRa3Gl2xZfv1J9MJzKl0VCTdc3qVFYmbefq2C5OesLTRV
	nRxDxJ1Ts+RDxgasdROzgTp2yrfW6+T6hh3x32x6RubtPwv6VXFuCM9ZLHlpIl0ZaIpeU7IrkCR
	DDBvs6JTzdvdJ1gWCd5/vDz8qf4A5gDx/P3V9isSdKz5Hl
X-Received: by 2002:adf:f009:0:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-4abb44d3428mr20501160f8f.35.1795519588066;
        Tue, 24 Nov 2026 03:26:28 -0800 (PST)
X-Received: by 2002:adf:f009:0:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-4abb44d3428mr20501124f8f.35.1795519587587;
        Tue, 24 Nov 2026 03:26:27 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm27131081f8f.38.2026.11.24.03.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:26:27 -0800 (PST)
Message-ID: <0ccdfcf6-84c9-4b65-b3d0-b2cae7e8e559@redhat.com>
Date: Tue, 24 Nov 2026 12:26:25 +0100
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
Subject: Re: [PATCH net-next v4 5/7] net: devmem: always populate bind_dev and
 detach both devices on unregister
To: Mina Almasry <almasrymina@google.com>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, bestswngs@gmail.com, daniel@iogearbox.net,
 razor@blackwall.org, dw@davidwei.uk, sdf.kernel@gmail.com,
 bobbyeshleman@meta.com, dtatulea@nvidia.com
References: <20261120045918.1239746-6-almasrymina@google.com>
 <179540996620.3135.3612533688050456273@kernel.org>
 <CAHS8izOptCEaijuhQxtgj-3WAjKQxchNn2Pe62r8ihgdF9b0=Q@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAHS8izOptCEaijuhQxtgj-3WAjKQxchNn2Pe62r8ihgdF9b0=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/23/26 16:09, Mina Almasry wrote:
> On Sun, Nov 22, 2026 at 8:59 PM <netdev-bot+sashiko@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 2 potential
>> issue(s) to consider.
>>
>> Critical: 0 · High: 0 · Medium: 1 · Low: 1
>>
>> If you believe none of the issues are legitimate, please reply to each
>> issue of Medium severity or higher and explain why the AI is wrong.
>> If any of them are legitimate and you plan to respin, please let patchwork
>> know by including "pw-bot: cr" as a separate line at the end of your reply
>> (one such reply per series is enough).
>>
>> - [Medium] Undisclosed user-visible behaviour change for leased TX
>>    bindings.
>> - [Low] The commit message presents this patch as fixing 'issues' found
>>    by AI review of the earlier devmem unregister series, 'confirmed by…
>>
>> --
>>
>> net: devmem: always populate bind_dev and detach both devices on unregister
>>
>> This patch always sets binding->bind_dev to the device that bind-rx or
>> bind-tx was called on. Socket teardown, queue close and queue uninstall
>> now use bind_dev, and net_devmem_dev_unregister() handles bind_dev and
>> map_dev separately, calling synchronize_net() before unmapping when
>> map_dev unregisters. net_devmem_get_binding() also now requires map_dev
>> to be non-NULL.
>>
>>> diff --git a/net/core/devmem.c b/net/core/devmem.c
>>> index 6f85b90950f8b..80c3e149cd762 100644
>>> --- a/net/core/devmem.c
>>> +++ b/net/core/devmem.c
>>
>> [ ... ]
>>
>>> @@ -252,20 +255,33 @@ void net_devmem_dev_unregister(struct net_device *dev)
>>>
>>>        xa_lock(&net_devmem_dmabuf_bindings);
>>>        xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
>>> -             if (binding->direction == DMA_FROM_DEVICE) {
>>> -                     if (READ_ONCE(binding->map_dev) != dev ||
>>> -                         xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
>>> -                                     NET_DEVMEM_BINDING_LIVE))
>>> -                             continue;
>>> -             } else {
>>> -                     if (READ_ONCE(binding->bind_dev) == dev)
>>> +             if (READ_ONCE(binding->bind_dev) == dev) {
>>> +                     __xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
>>> +                                     NET_DEVMEM_BINDING_LIVE);
>>> +                     if (xa_empty(&binding->bound_rxqs) ||
>>> +                         !netif_is_queue_leasee(dev))
>>>                                WRITE_ONCE(binding->bind_dev, NULL);
>>> -                     if (READ_ONCE(binding->map_dev) != dev)
>>> -                             continue;
>>> -                     WRITE_ONCE(binding->bind_dev, NULL);
>>> +             }
>>
>> [Severity: Medium]
>> Does this change what happens to leased TX bindings when only the virtual
>> device goes away?
>>
>> If bind-tx is called on a netkit device, netdev_find_netmem_tx_dev()
>> picks the physical NIC as map_dev, and bind_dev is now the netkit device.
>> When the netkit device is deleted and the physical NIC stays registered,
>> this first walk matches bind_dev == dev and clears
>> NET_DEVMEM_BINDING_LIVE.
>>
>> After that, net_devmem_get_binding() fails here:
>>
>>          binding = xa_find(&net_devmem_dmabuf_bindings, &xa_idx, dmabuf_id,
>>                            NET_DEVMEM_BINDING_LIVE);
>>
>> So every later devmem sendmsg with that dmabuf id returns -EINVAL, even
>> when dst_dev == map_dev.
>>
>> Before this patch, the code from ede1618064a9 ("net: devmem: detach TX
>> bindings on NETDEV_UNREGISTER") only cleared the virtual device pointer in
>> this case and left the binding live. That commit gave its reason as "only
>> clear binding->vdev so no new TX sends match the virtual device while
>> allowing in-flight TX packets on binding->dev to finish DMA safely".
>>
>> TX bindings have an empty bound_rxqs, so bind_dev is cleared here anyway.
>> net_devmem_get_binding() would then only match map_dev. Does correctness
>> need the LIVE mark to be cleared in this case?
>>
>> If the change is intended, could the commit message say that it reverses
>> the earlier design, and why? Right now it only says "first walk the
>> bindings to clear NET_DEVMEM_BINDING_LIVE to stop new lookups".
>>
>> The same goes for the synchronize_net() added further down for the
>> map_dev case. ede1618064a9 said a grace period was not needed there.
>>
>> This behaviour is still the same at the end of the series. The selftest
>> added later in the series (devmem_lease_bind_tx_unregister_check with
>> remove_virt_first) only checks the dmabuf attach count. It does not check
>> whether sends through the physical device still work.
>>
> 
> This seems like some kind of hallucination? AFAICT after this patch
> we're making the binding not live anymore, so we don't match it
> against new TX, but in validate_xmit we're checking against map_dev,
> not bind_dev, so in-flight packets should be fine as long as the
> map_dev is in tact.
> 
> Also, I'm not sure we care so much about what happens exactly to the
> in-flight TX packets when the binding is being unregistered. The
> application is probably ending tx anyway.

My reading it that clashiko complains WRT tx transmissions failing
after netkit de-registration, while previously completed successfully.

If so, I think it makes sense to rephrase the commit message outlining
the behavior change.

I must admit I find all the commit messages here hard to read, with
too much code description and lack of clarity about what the
addressed race(s) look like. A commit message rewrite would be likely
useful in any case.

Thanks,

Paolo

