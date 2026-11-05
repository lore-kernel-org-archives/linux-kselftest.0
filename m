Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901355;
	b=nhWcjK0n4Gtfucm3ZcWep/6XRjv3Onxx7BuQP+E+CmtfrisSq05+FLm9Sz3g5UdrFlHw
	 aX3WkMXZL+nqmKinDdBy478s/1e/hBDwK5EYqVEu7XyrsH9CjNq8Zy2me4XBI9dTI+c7h
	 0LbQJ+hfAu0h/S/jccyTxMc1s7594/OvgUPbAVH2+V6xj67YgEDW1fFagks945SDDqWA0
	 DuclXG1ObHXyfC01Uqvs1ZAwAgdCDATfJ7w2NEhCm8XvcmkI4C98LCtJjAKQWl8PYhWGs
	 UsaFV3I/UzTPcadaUA5SwHOHRJqnkJKfgPW6Par13KDfkk/o7N1gHqjzXp4v/peeHmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PT8+knV5liWy29BtrumvMiHIoxRWXb5eMMdqevncVAE=;
	b=cwEW9j+SckBM3TavLn9U40i0ev/3P6qIMViV+eQegDgNz51a0/GvO/z5rDMnJV/EECgW
	 eaP88+a6WO8RAyZ/JtDEGIPFH/b/8osfskOjJgNccL6nsa3welWEelZq/Lk6B/7pmuERV
	 tliJTKKrRZWojpsZv+6IPuarORkFOb9IgcFXgF49Ur59fL3T8DuaiLqMMpFcLyK4dQ3Hy
	 McJGL2McdEx09BuyOKHqIasGyJCqhaxmyC3MoX3KbLDmuBGG8uvaeopUc35LpGVLgq4Qx
	 MRhsDh9C2KXI77xogl+Du18CgBjlRDO3lGVShr4LglrauUK9wJcn0whutVRqJgUsd6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gi5uigdr;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52B2606A31B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 17:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C52B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gi5uigdr
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36c9919c659so2738759eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 09:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793901354; x=1794506154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PT8+knV5liWy29BtrumvMiHIoxRWXb5eMMdqevncVAE=;
        b=Gi5uigdrYHN5rA77ayiD0aV/+kPtnwiZq2VcYinUAKrMWWhGMwvJ6ckGfGqs7dqoVZ
         MAT3/y0LALIyPtT+pg52bJpy5nsZWY8qLzhr07n9YhDsldJWyg0P3rjaNjZCc9ntZXKp
         34qXrp713xEK2H8v9TuNgqRXM7yDR/D96VFWca1T7zJG2qMPy39TUHfTmv0XoiM9c1U9
         CtFy4S3TEYUOUcjK3kwOTfiTW4C3iuJgStNLb53U3kvm/1muJi1picQ9Vh+pUU03akr6
         HtSDoYxKdM2TYf9Ar95rPWT93gStbVqFrdPX9Z0a9aj6WJxEqzmbkdbqjkFBiQE9KpoH
         qyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901354; x=1794506154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PT8+knV5liWy29BtrumvMiHIoxRWXb5eMMdqevncVAE=;
        b=RPcxcWdJayNVUU1aEVHRcKV6okNiXishjFcIEKwyBWR6YgcaSa1p+gFMRKUo/OVRFo
         RoI2es0gE/es5g/lS3R1FlgxOuMHZP1w8bCJrLrUznNGJOCOfmn4K3GIo3uVUquhF+N9
         tS2O9BAPlNkqQ56q0xs5+qfc95XbnJ2CJ6McdELrxxIAAvlE5nORwKuryDL61NNR8pSy
         sapUJ/nWRU8iPlr3CnJkeEpdXWMyk7XVtcjUgGgTkdRmFMPjzsUGWwBxZ/Gvyo9+1mM5
         VkuLhR46MxSXUqP5+aTvILkb12qEKQV2jmnj2aG+XGz8wVftnoB7g0uqTjqd0hJ5ldMU
         FYlw==
X-Forwarded-Encrypted: i=1; AKwUvBwP63mozrfvJpC5qt2IcpN3TXv68+J33hEKNEUjcvReZngDS9Pif7HpX1RtIAPQ6HwNJy5ECh7BG32yyd8zDuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bQ1Z0oJP2ZQLX7RXY8qJ8AhMazb02614OFk4GHM0VVy+zx9XV
	tbBXNJ7iQzGGsXMCSvmes8fEbGi13PfciA8Gwvs/q3MAsDVU6aOqzcKm
X-Gm-Gg: AYBFou3tR7aR8k4/qG/+O/xbgpB2UVi6mq0B7KuNIyUJW0FmynzZLgWGoD7SOIZH8yr
	eQEOnZWNOhWfNg510Up8Bp15Ed9jI7RYvCMlxtYM2re7Bf5TQcZ7XJXnFq/THRbukxLmCzGhEIo
	K09nmPuTKSBqhZUIL3oj0n5DXjM1BnJIgCblNfW96Fndff87itwLDMoYvMMB37clAPmRu+rb9M3
	55OMmxtbv6qdH0IDtE0/gAaPewPTtZqmwpecSECAqo9BHlYAO2NMO42C3yVfswafkRw/wcvfGAi
	ZbIunRwtwbiMlt/w9iaWLNCNSSpwVlWbjmqSzB2gkuvkTO/d1VO969yw6CRrS5F6pwqMKhfvGv8
	d1aIere/Pje6bLmw4xaYgPAkdUb6KNEk6mDNfSWQG6c7NuPwwVvNszxPfVcVzVyNW8mZx6Zip8F
	jhRrGZ8Hq9c2Up9Hpt5wxBAVsXUQ0BKzSU0O5y+1xpeE4upIQdDdQ2GQfWxEwZ/d8JmsqhZQl6J
	8/rl9LoXEMOEqegzaIBNe92ShqdjqmnPTaO18R30ECdh6Y9enCuJW7uAEDrHMJCDRdMpJ3yhnus
	zTD3tNWP5qIrOAq005l77g==
X-Received: by 2002:a05:7022:258a:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1ac55f2d3cemr35929255c88.1.1793901353699;
        Thu, 05 Nov 2026 09:55:53 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25100667esm9741999c88.19.2026.11.05.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:55:53 -0800 (PST)
Date: Thu, 5 Nov 2026 09:50:21 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	almasrymina@google.com, bobbyeshleman@meta.com, asml.silence@gmail.com, 
	razor@blackwall.org, daniel@iogearbox.net, leitao@debian.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 7/7] selftests: drv-net: devmem: TX from a
 hugepage-backed dmabuf
Message-ID: <auzBkdVHfk33JlF4@devvm16445.scu0.facebook.com>
References: <20261103235152.1904727-1-sdf@fomichev.me>
 <20261103235152.1904727-8-sdf@fomichev.me>
 <51381a84-de40-4d4f-982d-9585a2344119@nvidia.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51381a84-de40-4d4f-982d-9585a2344119@nvidia.com>

On 11/04, Dragos Tatulea wrote:
> On 04.11.26 00:51, Stanislav Fomichev wrote:
> > TX net_iovs are now sized from the dmabuf layout, but the TX tests
> > use a regular memfd, which usually keeps them small. Add -H to ncdevmem
> > to back the udmabuf with 2MB hugepages and a TX test which sends a 3MB
> > buffer from it, so that frags end at and continue past the 2MB net_iov
> > boundary. The payload has a 7 byte period to catch offset errors.
> >
> Why not add a test with a BIG TCP GSO test as well?

I hope we eventually will have all this tested on NIPA with a "perfect"
config. Here I did not do big tcp because I wanted apples to apples.

 
> Nice improvement btw. FWIW for the series:
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>

Ty for the review!
