Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001529;
	b=0x1jsJ0a+YLWrM3yXbaBO0BPZrg87XX/JNWGN6+pa1bwnl0crnSG/M5mvTeA92FMqmYb
	 rz7HR+A6RVAmRuLF8hunhzk/KXqvLTb5eLvqpIIb7Zj9T58HUqnmO+DOdqOmiEg4USSKR
	 cx4p5ZPK7WTX0xvlWXiUvakNtAFSYZgEDPUDHCvGosSLyeyyEdgwidUJLbAWxH8qr0hux
	 X1GBoln+9U6lw9Mz42+08QPmDr0iEv/TC/CN29OzLNPGVZ4Y1K6fyt5Fn+KYsw+ODE9jo
	 bcpQFwIb8zsJrfh0vanjstSvWIHYKmCYb38oYZJntrLeDDqChSKFnE0QbzZerdohE3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Qy+l+P3/Ur6+HWnHNoQlQuqGZxsGTPMqagOFnx35yX4=;
	b=jUatYu3KmFen+/i54kHNi7TE4nO3e6+4dZ7n6gKd6C2qRuM2zqfZgRBulAIZC7jO0CWw
	 RkWruFV4kA1sXF81SES4iB9NeJcKe7oCmAoGhllkzR4H276j9VqLPcn5JSKHsN1th4Avj
	 Txpb8GxgQThPjjAOBN2tCsSy54BHz1iqrvHNtlfWOLXPqfSjELhws/rRSrJLwyOoRUPxz
	 b1/ngpRExnUsGhnJXJQH7XNKUEVtL4Ll2FYZrQ7V+qrW7UzFxmqpxAqBjK6QEc2gwGbZF
	 3EEJaKyplmsXj4TGs0riKOAxg/JQgNzVtCeiwZDZdOtmV5ay+KpIuCREtEbLZgiQS7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=JhBY4Kpu;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5C6606A320
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 07:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B5C6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=JhBY4Kpu
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e0d1da913so2060533f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 00:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1793001527; x=1793606327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qy+l+P3/Ur6+HWnHNoQlQuqGZxsGTPMqagOFnx35yX4=;
        b=JhBY4KpuTb8AB7KiwzftXNeqirFzEIxFpxEZIiFZzWEFmfZSU94eBuSFZdmf9CZd8y
         uddB/AFRX3Q67r5jexNNnB9kII4vlxzT0b4z8ZJdlPu8y9XP/DV9nItnKNymMYIpfeio
         LlOeMmZyD0/JjjclK0290FZsTxObBB4+M7bKM9QLZHLCi/SMCzZ/bfoH2qKPZW+OY7va
         HVDqA4INsP6zaexrA1AupraSc0OjBvSmM28yXQxOvZAUUTenVeOWgbaD4pm5gbJo6ACA
         ll5pEg8Y/2GL1MzDv7RCmoKkhWP8yQh1vG4hxiYpg6XV4FGqbHnWb6QRSpTq2oLboQ9Q
         NekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793001527; x=1793606327;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qy+l+P3/Ur6+HWnHNoQlQuqGZxsGTPMqagOFnx35yX4=;
        b=IhY3DPnSMPQbqupkFRvqs6eRe9C5rI/7odbn7RYXVccw/6BZbdChYivWLECtY5U8vw
         /bwDcJfnd0noW4+6BcmlQvMeTrFOJZKad3IU7t+82+8nOO9/T4aF0ed5AJB/uHnwDRB0
         iCLOl6+QagP0qp6OVoAQm0J+yhSeNzSX0YelqyjQVfivOrANeNP555YZpUucelkP2Zf2
         mPbHyvDyulrKBkCrqjHV23AsY8FvTxHetlwavDz+1UceV3kPQ8qr/Ao5cJ/AJw+lTPGj
         W/l2u523wRLOep6pw+wBgRfhmoGUFb4rvkg6v9+fYVhHDB+UhRT5SsR9XjCh3qvConRE
         Uu3A==
X-Forwarded-Encrypted: i=1; AKwUvBz7RVh8bOynnjZIIiq8nShP8zsoxsXYgv9y7kNiIr7VZIy2hTPpt2AZRNE9ciNsacWAbHGEhvUYye1QPefdZDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW/RlA1yO3RSkG56LZYiU/EmY8Y/QkUOXarz0BxWKQIaFRwdGq
	cQqyOLSN6GvThTTK0+i6EYLJ4xMFh5VPMIVpCTs7fivSeoe/wVvQp9Fx17XLY83/A/g=
X-Gm-Gg: AYBFou2fjq7cYYH4wLH6FFruv7SMcfwALJwc1fs0jzUk7GnxNKLVvp1kaWWvVe7693H
	D/W3v5TvQF7O7EtxUyF9ALG7jFwejkSF50jTAU34ft7v07xDXYxuxkTDJLIYD7TVlARQ5SbmF0P
	AWsIJsM2qcq7/gFXZZrp3EDK0/jD5TM7gQ80gSidn7Vv6u9CcazBoe2djselzAXsoUkgVGsCU3I
	jPtV54kHmmnnBTwP+AQvJIzetdiSPsPUZ0LhMmy4S8QvPJ3WTPQ6usApoLKgU7MhZke9F+JhXwh
	UK90DrypgkvZh8kvCBcTY3vZokmKA/bYlXDA7RL291cZtARAXA/bVXxslFnBA0qkd7qHIXKUtXT
	PNSaV3idKtfVyGM4YG0ZwP8KbxDp2/Bu2ciCs0JOTDNEeBsubLYKLe6G6KIvFchKK6fqXqki/7k
	DOE59OSs3FYPt71gEZs9HsWKFL2VYmQnHKUFxhIHEUDKoW7Cckh/IOcYn9Xbtx+6kgGh+xYnlo2
	A2/fLb1KeNOjeUPaCN5Lkj33plFjlEsPcMJ4GWG6z4aQ1+vpcpPYlIAf+0jFkmUlX39Gnj2fhjo
	REisuoX+L19FSdQS3sL1NpAFUCwRJvY=
X-Received: by 2002:a05:6000:3102:b0:48e:1ceb:e8a4 with SMTP id ffacd0b85a97d-48e3ed32b8fmr12097363f8f.17.1793001527070;
        Mon, 26 Oct 2026 00:58:47 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm15095984f8f.52.2026.10.26.00.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:58:46 -0700 (PDT)
Message-ID: <af8e4351-d8ac-43c7-939f-810adf35c760@blackwall.org>
Date: Mon, 26 Oct 2026 09:58:45 +0200
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
Subject: Re: [PATCH net 1/2] vxlan: keep reserved_bits across changelink
Content-Language: en-US, bg
To: Hannes Laimer <h.laimer@proxmox.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ido Schimmel <idosch@nvidia.com>,
 Petr Machata <petrm@nvidia.com>, David Ahern <dsahern@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
 <20261023-b4-vxlan-changelink-gbp-v1-1-f0d13951c09b@proxmox.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261023-b4-vxlan-changelink-gbp-v1-1-f0d13951c09b@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 14:14, Hannes Laimer wrote:
> vxlan_nl2conf() derives reserved_bits from the extension attributes
> set in the netlink message if IFLA_VXLAN_RESERVED_BITS is absent. A
> changelink having it set is rejected, so this means that every
> changelink will reset all extension bits and reserve them again.
> vxlan_nl2flag() rejects setting a flag on an attribute that is
> create-only on changelink. So also setting an extension attribute will
> fail before it can un-reserve its fields.
> 
> The extension's header bits being reserved again then makes
> vxlan_rcv() drop frames that have them set in their header as invalid.
> The device still reports the extension as enabled, because only the
> reserved_bits are rebuilt and the flags are just copied.
> 
> A simple reproducer is
> 
>      ip link add vxgbp type vxlan id 1 dstport 4789 local 10.0.0.1 gbp
>      ip link set dev vxgbp type vxlan ageing 300
> 
> After setting the unrelated ageing, incoming packets with the GBP bit
> set in the header start getting dropped.
> 
> Keeping the reserved_bits on changelink is safe because anything a
> changelink accepts leaves the header bits enabled extensions use
> unchanged.
> 
> Ran into this when adding support for the GBP flag in ifupdown2, see
> link below. The device kept dropping packets after some time, it
> turned out it always started after a changelink.
> 
> Tested this by changing ageing by hand on a vxlan device that was
> created by ifupdown2 with the gbp flag, and checking the reserved bits
> using
> 
>      ip -d link show vxgbp | grep -o 'reserved_bits 0x[0-9a-f]*'
> 
> Without the fix I got 0xf7ffffff000000ff after the changelink, and
> with the fix it stayed 0x77000000000000ff. The following patch
> contains a selftest that fails without the fix and passes with it.
> 
> Fixes: e4f8647767cf ("vxlan: Track reserved bits explicitly as part of the configuration")
> Link: https://lore.proxmox.com/pve-devel/20260828134708.692354-1-h.laimer@proxmox.com/
> Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>
> ---
>   drivers/net/vxlan/vxlan_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
> index 278d41f58d89..223539099778 100644
> --- a/drivers/net/vxlan/vxlan_core.c
> +++ b/drivers/net/vxlan/vxlan_core.c
> @@ -4488,7 +4488,7 @@ static int vxlan_nl2conf(struct nlattr *tb[], struct nlattr *data[],
>   		}
>   
>   		conf->reserved_bits = reserved_bits;
> -	} else {
> +	} else if (!changelink) {
>   		/* For backwards compatibility, only allow reserved fields to be
>   		 * used by VXLAN extensions if explicitly requested.
>   		 */
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

