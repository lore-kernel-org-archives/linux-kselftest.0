Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618446;
	b=kTs7JFkrBd1TbbYMAmTjHwPdp+8N5oNuNzexzj/L+85YgL7xbiqQx+rAwFIA1/jKrZPW
	 oHQF4AjXdcrqwy/2V1HPW26zo5CLatMRJNQtAQO6Swv6EP/gr5N53RiY02aChTTvoqY8f
	 +u2nf0bZqbJzVRGFYUDvA3jTZFkvLgyge7MEOQtDlXy0SAFCO+37htdAyDavjuQwc8u3q
	 cvWLAUvsWyk/1JNk28fvM2aM83rylUoYUFuL1f9I7D3z27s2vLYhY53zdObEZg+UdpvDd
	 1gife0HQDMVRwj2caPqu8IW8cL2d7vAoaJSoqmauFocQE6L0ka1sFfRhtgnPG24UgTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618446;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xx/dstjB6qlhxOOM3bpSPNtpLhsmfhhwbO7i7MimD/o=;
	b=d1VgdC/Ccfcj5yEaDXiMNjIX+njbTzyqe5CgsxUL8hknuqNCu2SCxpoz2MFTQgB4khia
	 IhpISCiiHRn1uwQcugYZmmW2cTRh1Gpq3z9ZrKUGxkxLd5hMKrdkCG3G1tgmgznB3NtJp
	 z2x2J3DP1ne7anM4UT4kmHkQqkXyF53iApUyCxtoSIFTeui3D2XbrIcdMbWyvidEKxlUe
	 z0kx6dpQtGQoiVTFmSs4d4dwskq3+co3Wr+fJ1ak2xJJNlVSo7zFYJ+4GnnoCNxaEJXSH
	 /IKbfkhCJuda8HD2BI4yYeqp4MW6NA9Ms3MLr5/z6Ip+Mvx6gPZizNozNQvu18w61aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e6Is3A4U;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pn33URwv;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB2E606A327
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 14:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB2E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e6Is3A4U;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pn33URwv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795618444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xx/dstjB6qlhxOOM3bpSPNtpLhsmfhhwbO7i7MimD/o=;
	b=e6Is3A4Uz5U6XD/u/HkV5BG/gjdZf8qlKno/fv4wDJmuQ9nYqAA+TAT9v/kHTy74fWFb8R
	2BO7pGrtdw0xsBJHStsL6+IkklQMsi9Hhq7vTHNHguJkamtM638uQbKM0TjcRuXr2inuzU
	szJIuHoOUoLqA2V7wRmkEw395gnwJmk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-iU18BDMQPlW_mwnyl8iXmA-1; Wed, 25 Nov 2026 14:54:00 +0000
X-MC-Unique: iU18BDMQPlW_mwnyl8iXmA-1
X-Mimecast-MFC-AGG-ID: iU18BDMQPlW_mwnyl8iXmA_1795618439
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so36454845e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795618439; x=1796223239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xx/dstjB6qlhxOOM3bpSPNtpLhsmfhhwbO7i7MimD/o=;
        b=pn33URwv492/HgJMJYAPaj3LAp2loLgbZN6cf79qpiyUas/ua1yZcjWlBXoQmio+DO
         pKWG+CSXc/uz0MLXP5nRb1PRAT7XlEx55YX27md56PbAjzhh+0zeQ0fLtChkeGQ8Mylg
         3ngI/Q8HpTi6tNmxTHVELnwFnVP+g3fc5T8gDg4G+GLZ/KDHr/alx7ryyxYs5qT7dUVe
         DPr+Tcld1O2+DvGYGHz7nnsPcDhcGHzgxfVd79DW8tQTQxAPejz/RcmOJgSGq35gFODh
         pgxwLkiAZGWR1gz5VzrtGJEOcPLgdRd+OV3o/ngQRzV4IScRAHflB7uJzWSQp8R/iBIs
         oXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618439; x=1796223239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xx/dstjB6qlhxOOM3bpSPNtpLhsmfhhwbO7i7MimD/o=;
        b=o26wpMup7NB+uZOr6mREMUCoIlD3QUi3tD3zDCc7hoyo2IbbBjlqjWyZdFpQYE11Rt
         fysCkAvKCCR7sPhFEYfQxLwTZB/AG473DnZXdhpV/IXcKZkrlEk4M7xvZhihKPyEtHyS
         Q9mtfVzzblNFyBLVvcwkiacWFBtf/tfmTYW0rp/wpddQ2lDGyLAfJdO03rac6OLdHtRJ
         szbFyVFxb+DDy4tAknYoQzb01bDPpxqN+cR82CxVXrjHjw3vAOsoL/bZXzeY41RBJtsb
         oqRAh9Q8UAxFhgGpTyPfTfonHmFXgx7f4xZOToZELYYkx5LjwUqNa6GhkEc8ikEJuH3R
         FZ1w==
X-Forwarded-Encrypted: i=1; AL+hErGQM4DD0A1SoTArFOV4P9/waEd0bYpZN9XpxLQPZZEnkAPKSsjXRiYPlYlft9LZjdAR33B3WuJkOkSWwn7TryM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SUJqmSrgrT1weGrn4jz+EgnRHWK/zq61GVxsg5xBDmhuRI+c/
	oOKfhu7LmcQyXmHrfqyeF6jlWkthYNVb5CIWctuuHrXxU+HqPyTuuL5CgOSwO+0KYjlPvhKDGNV
	5XR/v5xPNgnrxWMRDVFN+iy9fvgW+BZkMN8yT6LFmj7GpP6JFfx9+pSDJGE5tPqmS7nABxA==
X-Gm-Gg: AZFdTZfMwJTPoCLJR37nDR3cSQrZ+vTK6/egoZ17ryLf152HTlNhBZw3hsnj6C9CB9h
	qr7vZee7WbNtx/VXPjWwp8yPP6Y/4lktZQjraSf97PNWAGcBoVXPNE8h6X8BTy89Qu/FtpbrrUH
	eyQ16fG3wdqjjAg07pUfCy+C0P0+cBIDNOwOUIAYW3mjoNNBgZqbkazDCVkKTDICBGcUfrH1l0L
	lqyC1CnsTdyjFqm0cZkWIP0CcB3OiZ7A+eMsMYlY5c4Z/BPb5ixj2W/63R3haXbS1mwsCNySCiH
	7ABfirsPb1InaW6ppxqxVDGyAknbwEYOfuBjrdtiFZDfetqJnmu3Z9X4G7Uy3J6M+d3Y43bTWRh
	Gc6dWYja5xf6Tthpc4OsY6butsKEawRKNQq3JRtafheXaa7UD5mLJvFqMZJ6tQiAwtxbHUQjPD5
	pNwxwnWedhXCsJ5wOidROv65nwURpTKUbnRy/Acxk+eq5k
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr442506145e9.12.1795618439049;
        Wed, 25 Nov 2026 06:53:59 -0800 (PST)
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr442505685e9.12.1795618438641;
        Wed, 25 Nov 2026 06:53:58 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm33028179f8f.18.2026.11.25.06.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:53:58 -0800 (PST)
Message-ID: <31551b64-3286-4f75-8b6c-b18e42286545@redhat.com>
Date: Wed, 25 Nov 2026 15:53:57 +0100
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
Subject: Re: [PATCH net-next v3 0/2] netdevsim: add TLS device offload
 emulation and test
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261119064902.242502-1-jiayuan.chen@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119064902.242502-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 07:48, Jiayuan Chen wrote:
> Running kTLS over this already found a few bugs:
> 
>    b17cf742eaad ("tls: device: fix out-of-bounds write in tls_append_frag()")
>    ed642349d87d ("tls: fix the open record check in the max payload size setsockopt")
> 
> So I think it is worth sending a formal patchset.  v1 [1] was asked to
> wait for a selftest that can also run against real hardware.  That test,
> drivers/net/hw/tls_hw_offload.py, is in the tree now, so this can move
> forward.
> 
> The kTLS device offload path in net/tls/tls_device.c has no test
> coverage upstream -- selftests/net/tls.c is software only, and the
> offload code needs a driver that implements it.
> 
> So teach netdevsim to fake it.  Patch 1 implements tlsdev_ops and
> advertises the TLS features.  Patch 2 lets the existing hardware offload
> test, drivers/net/hw/tls_hw_offload.py, run on netdevsim as well, so the
> same test covers real devices and the netdevsim pair CI already uses.
> 
> No crypto is done, like the IPsec, MACsec and PSP emulation netdevsim
> already has: TX puts the plaintext record on the wire.  That only works
> with netdevsim on both ends and offload on in both directions, which is
> what the netdevsim environment of the drivers/net tests gives.  It still
> covers record assembly and the offload lifecycle.
> 
> [1] https://lore.kernel.org/netdev/20260901154914.11637-3-jiayuan.chen@linux.dev/
> 
> v2 -> v3:
>    - fix the build with CONFIG_IPV6=n (kernel test robot)
>    - address some of the issues Sashiko reported
> v2: https://lore.kernel.org/netdev/20261117140642.4008-1-jiayuan.chen@linux.dev/
> v1 -> v2:
>    - drop the netdevsim-only selftest, run the upstream tls_hw_offload.py
>      on netdevsim instead so the test also covers real hardware (Jakub)
>    - rebase on net-next
> v1: https://lore.kernel.org/netdev/20260901154914.11637-1-jiayuan.chen@linux.dev/
> RFC (July): https://lore.kernel.org/netdev/20260728125658.390500-1-jiayuan.chen@linux.dev/
Applied, thanks!

Paolo

