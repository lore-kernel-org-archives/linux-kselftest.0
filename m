Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C958D56B848
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 23:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788909775; cv=none; b=GOSWpGVNR+b3BqhHWvtPNPtfiAtpZirP19lMmdolQyIPzVyJEkzu0gVYJ8GyuB0TlSP4+J1d8DMw6S11xpwdRhvhSUoh/0gupE8qtkpqE9Wy3Br8I3nUvaJsdrsh9OU/rF1bCI597pO37mCCz/FtZqg//YBu6ofErviLfZFlZsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788909775; c=relaxed/simple;
	bh=igRLaNLKATsv/xrFKZo/2BMOVmf77KFzzmgZ9es4sLw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ORzoOgzZfWKvt6OmeULj4nAw2khZXEuq3pKaVEaB2+G7x7w0H3nJ0RbM8q9CLhIfiGv/ntHBmNt8PZj6dKlcuymjRDg5XnNYL38FRJsm7e0vNn6zw14echTzuKxVoiHZJeic9Q+72FMbc54d+WssjNgF2gsmiaBPRBDhx3hCkkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fffKPUp+; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fffKPUp+"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90cd96389efso64180206d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 16:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788909770; x=1789514570; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1ZsRUEYFwJyfqiHg/NlJRFQE2q1GaX7lbKCnVamDOJQ=;
        b=fffKPUp+eqhcs644J1qFagKow4sBFSAbNUFWT5W7+9zaYvFy3l9ignd8fSrQtK9Wze
         GjeyrBGZpepn4eT/2hQTyQxFXNNTP4WgModLT+DPVfXd1Zsk99UjCH6VY3gjUac5d7su
         YrmbAekf5ulIpd8VA5JjCE7bnkhRd5G2J98IZmKjGjIbZkXbzWLDIiZMuiD8e5f0jaWn
         SmiJ2t61NyKl5JDrelX9kTAZWYflwnn9n3h5g0kQQorucRNj3O1G3oDAeeDimaDbHrua
         VzwTIXg1GbrNBoOOCFe3QkfFmN87poq+/hmkVmHciNZXSJ/as9hft8LuT7Npf2C9HRdr
         mlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788909770; x=1789514570;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZsRUEYFwJyfqiHg/NlJRFQE2q1GaX7lbKCnVamDOJQ=;
        b=iM713vsNbMBtcpCS5MEl7Kr+kUaBaOl2cDBaXRePtx2JdT1HucYUydqudAfvL8AiDO
         8gSGPofcOf0orVS+If2sz649dW94nAIr1xkihDGRve0/F+mJ7ygDq2x9eNI6U5AA1ZDV
         sTDuzYLxesWOGqRqvnbO/2syZMI4+eiD0NDG4rd4T6bKNnLj0Q/hIm0W+mXjPG9maBta
         uIZcu8sPGspR4xDmfUIYvTfPr1ozrnA6TVv7uzHNTSDR0Hq6VQ0C4qt8izLmwPcydKZn
         JkI8DYNC+SO/t65Z5KHdF5TUWJBTAE+P+UPPzuvmhZLGSrB9lLsVQtweqC0Lw7EAq8aa
         CcEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS/J9uXdH90Y22tVWNJSPwZY4e1Og8EEAQVHZOFcCqOc4XvQsmRvGBxgrySHZmC/MGVaCXA7sL9HmQeyVCDSU=@vger.kernel.org
X-Gm-Message-State: AFuF++mXK10iS/WdQ8ASHXj5fqSnqyQApPDHvvI4wovEDBEm1GZrhIsW
	MZ+7GxK7KMzvXlPOTFYE/9HTehnId/A8I4+2TKtzs/fblCVXNg58MFKm
X-Gm-Gg: AYBFou0eqVLZVI5JhAN495IuiIE9ONMZlhSa6Y1S7X9sb8ueJ5SkMYTRerjknfuKKK/
	NLjsIWxyZSt600gPNPBwulGbf/XxIX+mGdeZTCXNR1GzSLK5qeUZ0HQXUfWbaCaKd7+2UqXvrwS
	KZt3WtmO9B/7f1wf/ttIvUSjQUXSaJfH9LKm8/LnSGduqdG3FC+Pp/hAIuYhWbSqFw1xX/VDSHk
	rQqurem1LtOWygofosY887nXBlMwUdKcVMzpO5s9Eq5W4UpUjGzlau084xaaUwudUQLoxjTYzEi
	ugsdVNCG37euwxxrFRJBKbsLH6lz9jK8uKGysahO43QOX4li+wL1aD+yoBuU1vRnbta/XJWJNi1
	NsMLRYUe99Ax4LC48VMFHgO/zfO8PCiZt+JwF4mQgFZ2gbBhjzeigS4oFlgs49uo1uRF10nuA95
	KkKHBh4MFKDt02Z57BEbLPQNQnpIeYHJ1V0UJuJ8DyIMXopATJC+303hgGtjk+jDFeKg==
X-Received: by 2002:a05:6214:84cf:b0:90c:e685:d0ef with SMTP id 6a1803df08f44-9103eff8ca6mr419740676d6.23.1788909770512;
        Tue, 08 Sep 2026 16:22:50 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406b0f51sm128531996d6.42.2026.09.08.16.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 16:22:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 19:22:48 -0400
Message-Id: <DLABL6GQC9HK.2P8KU1JJRO1XV@gmail.com>
Cc: "Bobby Eshleman" <bobbyeshleman@meta.com>, "Boris Pismenny"
 <borisp@nvidia.com>, "Carolina Jubran" <cjubran@nvidia.com>, "Cosmin Ratiu"
 <cratiu@nvidia.com>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Doruk Tan
 Ozturk" <doruk@0sec.ai>, "Dragos Tatulea" <dtatulea@nvidia.com>, "Gal
 Pressman" <gal@nvidia.com>, "Jianbo Liu" <jianbol@nvidia.com>, "Kees Cook"
 <kees@kernel.org>, "Leon Romanovsky" <leon@kernel.org>, "open list"
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Mark Bloch" <mbloch@nvidia.com>, "Petr
 Machata" <petrm@nvidia.com>, "Raed Salem" <raeds@nvidia.com>, "Rahul
 Rameshbabu" <rrameshbabu@nvidia.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Shuah Khan" <shuah@kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Simon Horman" <horms@kernel.org>, "Willem de Bruijn" <willemb@google.com>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next V4 14/14] selftests: drv-net: Add PSP HW GRO
 conformance tests
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Tariq Toukan" <tariqt@nvidia.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 <netdev@vger.kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sabrina
 Dubroca" <sd@queasysnail.net>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260908065244.3799142-1-tariqt@nvidia.com>
 <20260908065244.3799142-15-tariqt@nvidia.com>
In-Reply-To: <20260908065244.3799142-15-tariqt@nvidia.com>

On Tue Sep 8, 2026 at 2:52 AM EDT, Tariq Toukan wrote:
> From: Cosmin Ratiu <cratiu@nvidia.com>
>
> Add PSP conformance tests using the same gro helper binary as other gro
> tests , but in --psp mode. SPIs are procured by psp_gro.py from a real
> PSP device and handed off to the gro sender & receiver. The sender
> crafts and encrypts packets in software, the receiver relies fully on
> the HW to decrypt, decapsulate and do HW GRO.
>
> Because the NIC decrypts and decapsulates before the frames reach the
> receiver AF_PACKET tap, the gro receiver sees the plain frames and the
> assertions remain exactly the same as other gro tests.
>
> So these tests verify, at length, that the device does PSP HW-GRO the
> same way as plain TCP.
>
> Additional PSP-specific tests are defined to check that GRO doesn't
> merge packets across PSP versions, SPIs, encryption-status, etc.
>
> Some gro tests are not included because they don't work:
> - ip_csum: the checksum is recomputed by psp_dev_rcv().

psp_dev_rcv() isn't on the hw gro path for mlx5, right?

> - tcp_csum: packets are marked with CHECKSUM_UNNECESSARY.

this also seems strange to me as the hw gro engine and its decision to
coalesce two packets sits upstream of this skb->ip_summed determination
in the driver, right?

> - ip_frag4/ip_frag6: PSP is incompatible with IP fragmentation.
> - IPv6 extension header tests: PSP doesn't deal with IPv6 ext headers.
>
> Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
...
> +
> +@ksft_variants(_ip_variants())
> +def test_psp_ver_diff(cfg, protocol):
> +    """Frames from two different PSP versions must not coalesce."""
> +    init_psp_dev(cfg)
> +    if len(cfg.psp_info['psp-versions-cap']) < 2:

nit: what the above checks is slightly different than what the _run()
below uses, e.g. dev supports versions 0 and 2.

> +        raise KsftSkipEx("Device supports a single PSP version")
> +
> +    _run(cfg, "psp_ver_diff", protocol, [0, 1])
> +

couple of minor comments:

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
