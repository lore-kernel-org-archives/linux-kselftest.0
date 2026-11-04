Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793810113;
	b=Wh5Yu64zmP9UeYxV30ZmAUSdG+4+lzigPrzULf4kcuyVyFTlxmSTZ+IPcqIul8Ev39m2
	 V4lRJoz0n7XBF6C0igV214XWive6DysqR8FLbgScEM8DrPC4o/NaJFMqxJuNQms6dH5BX
	 /UVyB2xw/8tT+F3THYiiDVAh93GKoRxfkQOQ4CuqXul71RSNAqtaPiT6UdbRFM/09M2U+
	 /wduI5RgcG2IThw/O2qLbJPAfC7l+FiVtwoVkTpXCt1G1e33NYXBzS/IlMMxPsWKcqFYL
	 eOnOk5y/bNXdxuFWcg+p+jbWEWVNx5bhUwWw1Qq0UJYOVhyBVUvew81zy9uWWlUPVzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r1Dhv/Jl1KwjwSgeC5h/yWHauZP92LHd9bdUwOqpNVM=;
	b=CvSCt8ZHYqdwo5HGWDnlscyyCfOk0fs/to2KtMIwGfM4ydXZ4GCDT/KZey1MLplXQdQT
	 w8HPb5MzULOBvevf0CDOtEvS/9payVmGOHewW0ftQbiMSjJ3lD2p3CgX7308vWxeO+Gbp
	 +mp36M2VzwSuW9IMgl4qyMBHgJExxeewtGHBfYQh+997KmbczOKJDdMcku0Jn2kCa7JG8
	 TbdCiVTbsj9yovuVvN0/YoT9gXL12Lb4nFXCc/UQHY5i2EXhoq/0K5M/TPRl2k3Vg4spq
	 ilpJ9OTZO1utgmVEXUa4uYN5KOdCk/U9O6MSZEjAFwwo4le9M4kctUEQhGCh4OpRgyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k/Ap2ipi";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773E2606A32D
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 773E2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k/Ap2ipi
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so7422055e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:35:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793810112; cv=none;
        d=google.com; s=arc-20260327;
        b=oAsHIKUe8RrnEZwgOZzajk4qsuXs/xfQgLcwBodgYdEqtvp+MDxXeaTT23shEV1Hdb
         BAETLW/OgdBLcD5GEJ9KgGLknEZPKBV48YpCriFqouIPzDj+IJ4zHLaP98Rn50viyG91
         A0+VQegsdBDWeOjuHsXhMmbehPOq8Aq1vu7Dw0RtH36Rlxg8VEeInpIU2ED9oc0/xMLH
         fPoQRPubBtb5f1YE1R/yxZKL3FE1UdETV13TmctycV45Fe4vyS3jHSINoGy2Bt3wVdiy
         tJkarvG+hxvLvG0Sq9Z5I6eSFS2V0mtBp7CT+fNmWAvk7Lj891cvgHiYXnk2bYF7cHcX
         6V9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r1Dhv/Jl1KwjwSgeC5h/yWHauZP92LHd9bdUwOqpNVM=;
        fh=ldwTh9X/QYowLUKRPk2JzGEADVNpqUifpm3VKIDy6Yo=;
        b=asQyc1yNmwrPiofr1NZvWH/ATcSFJOhJtP3VEH4ww6Furvvdfvklzg5e4Aixsgh9Vu
         QV2JzIYlwT2fDtki/VkXI5KEK/+G3sXEMYI2Dqy/6ZEY6yPR4rTyYLP3zlXLxBS2GQ5o
         7voo7xQrUfi736O6vV0NnKB5T0Wvfz/bF/B/NFSt6rcngXGQWukDtHM34OK2nce/DFNG
         jstS3GCKfskJIDoKPdYAyAUlU1d2Buww07RyOBaDcmt9Cm24bM8LBNP2A8ed5KtOx7QU
         5RitNxcn4JrNz1sS6bDQ6ObaNqfUoIY059OvTgIukvQW8qQdtLq0dn7jRko6MDz3KMrS
         Y5dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810112; x=1794414912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1Dhv/Jl1KwjwSgeC5h/yWHauZP92LHd9bdUwOqpNVM=;
        b=k/Ap2ipio1jUCr7hxSrGcd8xb0Gq8lTypwNjw1lqjro0NRz18F8YlDsM7HiNnCrFEi
         /vm6jltU94UiorOMls9tUOhiUmC4AOyQfjobjB6JZxrLT1KXhNJJcpT+qX+61OC+1IKN
         YAqzR3UE7fxjTamB8udMYWWXXeLdPyEeqkXh49Q+FEMhJKIYZBmZOkJbU8vDdg2QWP5I
         csSN0oDtIczRxv7wm16bMx6N1/xbT81ZIvFLsaJOO+xoahN/0wl0B6TUIie1cR/TXVsc
         FHsluw456OtPMGxM39SdrU8hon8fOyA3tC4Na01Tp6YGM/spTgpi2gRXAZ2JlBC47rEZ
         k3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810112; x=1794414912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1Dhv/Jl1KwjwSgeC5h/yWHauZP92LHd9bdUwOqpNVM=;
        b=uwqfFQgqF0OOOmzNj/ntp8oDiarwvwkfnLvfx1yvu2pYlLXAvQKv046nqQzS0Klqtj
         Zv/wun/1VNVh18hVMHFcrK9lM57L731vMyAHYFYMGV10G8VsFRrdqqRP1aO8iBKBz51B
         kb8Mr8TVnGMJIFJSGP97y7o99qtbk1YbTCAWTx6iRCFx45/JvnJuSGxAxnBqIvD1P7Hj
         zLb0qOvoOnxNXJVEWVz2PLFAvRlZ9Qq6fhPRyLauL184hijDk8H8F8KZodfwJEB3fbwC
         hKKErSkPCLmk/Y0ecRewv2Rcl6qkinfHeXb7NNF6rB048AKwWbQ1329t7dAQDN4xkrcp
         HaZg==
X-Forwarded-Encrypted: i=1; AKwUvBwgHKStoE9twF6ox1jzaW17dJJQgl1NdRYanaVRHTUyGKE7bAwVWmsbhuhARvVbaPgz4MMK2WQoSV6b0xBfPoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QepNUXhG/esfqhC3xYQ0CB+Wr22W0r9kWjIHyMmqlPIU1kJaJ
	PUUbR1rr4bo7xnOCqSsqoFrnFs9ztIKAcwG1sAMaiVIjqPZ6RmAV8UBgpsf/5rYY/VLGiLNpnB2
	skDcsyITeZ+SCoGvLIreHx+5OP0mXg3U=
X-Gm-Gg: AYBFou17qDdi1UV3493f3ZJ9n4xmxgwCPyARpa3WGFJbS/xHwAGWIfqdRpXz27MBr1y
	q8JwTIfNCPmEb6KmrKlQwn0dt+B2N9QJQcTXiL/cVJFqBLGNc70c6frkr4mxzI8XgvSYedQN4Hm
	Y1B6aiZTLhe+Ko2YVOdEA8gYQ2udRo9DnYZxBH5cPIpth2/4wrPv+JyiHFNpAS68jOPNQzH3ZhW
	ZQVDUPQqvkNXyrGGo/RpmJQ1IHpGO57QholgOS1QvDC3PHTYcn+Y7BAwYfHvvWNXXGS0RtLSfso
	tpezsw0fmOkWSEs9c6xhTZnWRY9PhUrN+Vdv+7lYNPe6ag44xJpbLauW97jvVqDwVQzqBQpOTGN
	jB/t13QEHgl4Vr5z+ybhaGjhd20E2jBaKqe/+MyjnmVB62MDgGAwF35G4OVdcbnaVnCpEGldbnp
	0J3NNusOWe/zjXsqfkG47lUXwk0IzUbd90dn48mV6ig8TCaedhtx3MGWP0+gKauLe3Hu2MW5lUq
	g==
X-Received: by 2002:a05:600c:4715:b0:4a6:eca1:7d5c with SMTP id
 5b1f17b1804b1-4ac182dca82mr384625265e9.32.1793810111530; Wed, 04 Nov 2026
 08:35:11 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104095315.2326-1-zhangchujun@cmss.chinamobile.com>
In-Reply-To: <20261104095315.2326-1-zhangchujun@cmss.chinamobile.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 4 Nov 2026 09:35:00 -0700
X-Gm-Features: AclHuK9XCOvhLBDiROBbZxHR84Wbx48lhNSlCdNeopT450arvK86EzOe3nZed14
Message-ID: <CAKEwX=MyLZ12jtwWOYWvf+KK5dyOOG=RWJb9Q8-DEFy4-twNgg@mail.gmail.com>
Subject: Re: [PATCH] selftests/cgroup: test_zswap: check malloc() return value
To: zhangchujun <zhangchujun@cmss.chinamobile.com>
Cc: hannes@cmpxchg.org, yosry@kernel.org, chengming.zhou@linux.dev, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 2:53=E2=80=AFAM zhangchujun
<zhangchujun@cmss.chinamobile.com> wrote:
>
> test_no_invasive_cgroup_shrink() uses zw_allocation immediately
> after malloc() without checking for allocation failure.
>
> Check for NULL before accessing the buffer and use the existing
> cleanup path to report test failure, matching the handling of
> wb_allocation later in the function.
>
> Signed-off-by: zhangchujun <zhangchujun@cmss.chinamobile.com>

Acked-by: Nhat Pham <nphamcs@gmail.com>
