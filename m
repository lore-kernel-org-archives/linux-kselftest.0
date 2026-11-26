Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694774;
	b=vKi11x5njpY/XZwejibvUON7syVLqXn3cCo+LrpzXTcmWDMBDZTvGmr8/AxSTVZhLT+W
	 iJwjMp4hPYtT4/L4tG9nPJZ7VxHMRwtTw7+mURoUwcTTw09CNgGnxbQtZrsQcycEJkcRZ
	 ttOPdSSWtwpvODlAb5i9XX+R2SmSdegf+CDFZGSp15cxRspO2JTrxeubumUcTfE3lJNoX
	 Izemy24ZF48Q7BaMSeMvCaxcyKWIDn4BSx3LXLYhEI7hGUApouE/8MtdiAOMHaaB4pW0A
	 xPzEVcyIt8Az5deqXkOt0cwSLvxqWQnwIdGTDP19Vtf0/JlEWdv41ZZ9Q1WSfttGo6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694774;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aGCxCoeZe65dB5lUqjeJJVfPXWY7DaXikZwD3RqKibo=;
	b=v4DTmBPQmptsdR2jR61c4RKvV0Jk0DIoJzOZtFPXu98A5kE0ErB16tkDwyQYt0O0FWp2
	 EpClBlw+mZdpl98LIGAKKw2asCIUWXy9HgPtZtGol1mLvbuNJLUiuKmcYrv51t/5WEi8X
	 m8KHMFY9Zw9ArdFWB32t4hMni8BhkTzIqW28/iDu1HTVN+xF+w/5P44TyLGHnTT/SrA1Z
	 viY6OYbyZM+0r2qqE3ssdLqeTgX1VhDyUv4tzYlMmfnM97y1aXJBASNrhb9srMAvBMpWm
	 FELbqbZNXMgKxGgrqHEgjnmh6GHR6uLiBkgBRt4hvPzPdFu8GPNy0sexmRSXfNuSbOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ym7SwNoB;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="I/RvHwGy";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667C1606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 12:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 667C1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ym7SwNoB;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=I/RvHwGy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795694773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aGCxCoeZe65dB5lUqjeJJVfPXWY7DaXikZwD3RqKibo=;
	b=Ym7SwNoBAMpU4sYpZXpmCkcpdrjDepP9/KGm1mszzGfPDr/O0qB0XPxp4JH7XNuxjT3vic
	VDfAmK2HlSaDk8VGaaBKCPj2n6wgC5xguF3cnlbcUaDYwxoU1wqzoIvt0EQAihiXbuar41
	HQAvkrJTMHtcCXTpbRYI1pbeQsnS2HA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-H7tOHD2yPGitmwMqGvnnNQ-1; Thu, 26 Nov 2026 12:06:11 +0000
X-MC-Unique: H7tOHD2yPGitmwMqGvnnNQ-1
X-Mimecast-MFC-AGG-ID: H7tOHD2yPGitmwMqGvnnNQ_1795694770
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb9379a835so32515785e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 04:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795694770; x=1796299570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGCxCoeZe65dB5lUqjeJJVfPXWY7DaXikZwD3RqKibo=;
        b=I/RvHwGy5c3yowHB+raES4ruWoUUYv9yp24rrXXmjUkJJ/z4hyZnWJqs8G7aPeo9Ga
         ePyLxPCq22iEqG6drzrlxIof7uSKwVF2yOnEGSF8wJszop6esvUq6h2tGHnj7J/Tfitc
         8nzPX+kjuNewFfCZNvreZirjbQYepvqhi8TLvTqVc6eBXswf5JvsftO2hvIpTsCc8sWD
         UwgAE+8y5wCHWS1fiwJXEPf3Tmg99Gw/beChc1duSC2WszZ5kHCL2+PyDNsJrj4wfaXT
         udRQbjjZfDSbaf2u849Dpt0GgL8hB44xJZzYfCHCt90VCBDMEJfsAwtDzxVzBTxdjuS/
         ubVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694770; x=1796299570;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGCxCoeZe65dB5lUqjeJJVfPXWY7DaXikZwD3RqKibo=;
        b=ziLJmbgcb240hIp0fQ/gbdnNKdX1aWkhVKo39KLMO3AOs/1ZZfbluaBcSf2xH3Adww
         d0pgClKSztD7Gq64h9eK7bTnI5l528qpjs1jedz2oWUaZrm8MYPlVPJ+Umqv2k2EP3zm
         TTKOh3owUEUrsKIi7Vhl679cNaRrTs9FRU3VVbtfk0mT7abhnrPjsIsqXzvI2vxGg+/x
         vRR1aqUZYN5hXnwwyR17e4WFdcsqmCxn+cdocTZlWofmEMOTGWVfHagl/KTL2Jm1nkOA
         YK/+Xx1CEaRe43+9SgujOinBKDOxkgPuSEiHB0yvFLBMOvdMaeofJWwd8e3zGGoDdnII
         fLgQ==
X-Forwarded-Encrypted: i=1; AL+hErEa5AAICsph+6BSTp6IWhC5uO/mJYBSihPXZRC78dZ4MJFDC1a2swMBfEq+R/aiWR+TpOqev3DXROZrHe1BF5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pZdlW/z6k92WP9r81fx+IwVOQOUSy47q8wps/JkzZo5ooLQkG
	FvKAq3f8Oc1J3P6XqGTAqIhmdHrs5hBJze9P4RaCS4YDZxFmsBpmxhqxDiycWUpb1C2lgCoirQy
	/dRvJ+FLLyREAUrgLcWEagM0wJJ1ImSTgQhSWtYlBiwz/yi8NXDGAuJ0e52zbD/B4cdE/cA==
X-Gm-Gg: AZFdTZc8LxFVbENHMY3kd8NAd9mFrsVRtmNZYAMHuuLkJdeHyr7jsOdIcI23pGNn9Mc
	Kln9ZmB+yOcLFGqBcVRe3ssNgVgJEqj8aDFKbhxcMB7BNZtRMrghVg5Z3HN7SwFt4wKQEOuOzDG
	l2LmpANsaboyjdIjRt/e43G0DKCfP74ma2QncB5z+8tktmvO+3GzwgnPbvUlW4Ho1TGVRo+V2Le
	qfr38MPlPuueeUN4Zo5oMmgWUJJZaOOOqSJyeKaGH0VPQVM2ifHS08UtcMBHHyfGo+GUoxzC+8w
	1vSFOTBT/hTHj/A8A3mErPEj3VMktIVmXTsA2M7umm4bgZrZXoGKa5pl78IB4PFyTIMjg/qq4Du
	wvBqtnXxKaQDsrYtugfPaeWgYZpz+lZO+f0ZzbIECY4R2iX177nOvEczfTNzx06a7Fhs43PtqZ8
	WgDUlsXd+4CCRNkbHsSOl14mai+J9Z6m1rDmYqTKpV26DS
X-Received: by 2002:a05:600c:a087:b0:4bb:60bd:53b2 with SMTP id 5b1f17b1804b1-4bb887fe7bdmr427507295e9.6.1795694769886;
        Thu, 26 Nov 2026 04:06:09 -0800 (PST)
X-Received: by 2002:a05:600c:a087:b0:4bb:60bd:53b2 with SMTP id 5b1f17b1804b1-4bb887fe7bdmr427506665e9.6.1795694769425;
        Thu, 26 Nov 2026 04:06:09 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm405303285e9.4.2026.11.26.04.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:06:08 -0800 (PST)
Message-ID: <dddc8e30-73fa-4ac4-8467-ec39184a3fc6@redhat.com>
Date: Thu, 26 Nov 2026 13:06:07 +0100
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
Subject: Re: [PATCH net v6 1/2] vxlan: reset the remote's dst cache when
 snooping moves a MAC
To: Zhefu Peng <ilskdw@gmail.com>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, horms@kernel.org, kuniyu@google.com,
 mschiffer@universe-factory.net, nicolas.dichtel@6wind.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261119095256.42005-1-ilskdw@gmail.com>
 <20261119095256.42005-2-ilskdw@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119095256.42005-2-ilskdw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 10:52, Zhefu Peng wrote:
> +static enum skb_drop_reason vxlan_snoop_move(struct net_device *dev,
> +					     struct vxlan_fdb *f,
> +					     const u8 *src_mac,
> +					     union vxlan_addr *src_ip,
> +					     u32 ifindex)
> +{
> +	struct vxlan_dev *vxlan = netdev_priv(dev);
> +	struct vxlan_rdst *rdst;
> +
> +	lockdep_assert_held(&vxlan->hash_lock);

Since this function has a single caller invoked after acquiring the lock
the above assertion is quite redundant, please drop it.

> +
> +	/* The entry may have changed before the lock was taken */
> +	if (hlist_unhashed(&f->fdb_node))
> +		return SKB_NOT_DROPPED_YET;
> +
> +	if (rcu_access_pointer(f->nh) ||
> +	    (f->state & (NUD_PERMANENT | NUD_NOARP)))
> +		return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
> +
> +	rdst = first_remote_rcu(f);
> +	if (vxlan_snoop_same_remote(rdst, src_ip, ifindex))
> +		return SKB_NOT_DROPPED_YET;

You factored out a shared helper, but the other checks
looks duplicate as well. Please de-duplicate all of them
moving in shared helper.

/P

