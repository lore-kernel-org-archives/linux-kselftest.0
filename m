Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100070;
	b=03yc9QsjEw+ZdGmoO6bYkfmeSNAbyk88ppS3f+tou2EDCrBtWJgsAAiYy/1gxGPokUgl
	 9KPoEbWL75us3t6EJdkGFERMsTDn3VVCYSbbm82IMy3tIgZJljb990HrmsrdHccZMAlu9
	 t7Nua5OTAecURtD7eoAtTsZ8jZA2EjwbDtAQh/aFMOsWiIs5uMSGh0g+QpSm1fjB6TQA1
	 NLKsKOE0aJG5Yiko4UacE8uvYAFnOwaoo/a2PuAiFmtmrBZjPeXn1ghscd3GL8t6LL/qX
	 tsvB/XoQJGzxIqzvTIvCO6RlQj7neTqWHnGXPc0QLd3ZnnKDSnqxua5QQCwLedY731A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=mF/CN1MwkKAbj0n+aog+XXJlGwsq4jMzPf88n15fnBI=;
	b=hC4o99WwYEvXLS79Im7I4FvnkZM0vql8+2yaLv4EOFw0SJKiFObV+XfM8S2wEfqx5Gy6
	 N8RW2XJAD1Jl8yZFOuLnMP8/DxtOhait7rph+y7qsyLsHnAbLun2K8hUtHiClggg2WTQ0
	 Lqb0Sl4HvE3sM4wtH5BOpmX81ctsEgD1OWkhHDKXzLzAOH2arwpTTLlJ7sF9EdBToBvpp
	 3hyna5kh3kRUer+mm9ve79eZpKLLaiEEb/c8DCVgG/nC76zfgxHGikwKEdX65rQ9JrunA
	 omQ8fjdL4LN7zsCOOQEjVV1u2zNiWo5cIqYrmaRFBJrRV6M8bkfHq3ah4alstheZQDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=I6LPAIeX;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049FF606A336
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 14:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 049FF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=I6LPAIeX
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-945e6d9ceeaso204575385a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 06:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795100069; x=1795704869; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mF/CN1MwkKAbj0n+aog+XXJlGwsq4jMzPf88n15fnBI=;
        b=I6LPAIeX+5AEjUj2jih1ACvF7QNbKEZSSWEQHvV1cx+j9LvgW93X3qemhuduWcn0D3
         wzjjkTCPSi8Rgf0iuqK8xc8hJddhWoVNo21OQxjCP7w+/nVX/0sSFgNp6T16VosZ8l8m
         HAxC3NLC6MhIkDBmbKV8klY8QvYuZ/Xb43ZoIKvvEvWWV6qHPqKqKpSCN1Va6vVqIQ/u
         honQkjaTAMAdsC3ea9n10KbyFizCpOLDvHQAp3NtIUNsuoQsfY2rOKBvBaTmm6gqubgm
         nGFTgPM6LG7FI1IqREsQ43EHzZnUjXfjfvYzru7SjxiKuf1M/4sgL6+m4kdJklSo01+f
         Zypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100069; x=1795704869;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mF/CN1MwkKAbj0n+aog+XXJlGwsq4jMzPf88n15fnBI=;
        b=bNPK47OyJwOiiq2qr5ynIbdFq38K0cOnSgys/32GjvfVXol3Z/y3NG8qz7CP9d8k4V
         RGL5W7hHS4CrW7UinUFZTCKaD7jMKeNRVVzxEwkQuJixkf5eWjlD3wS1HTNKJmlQQXAa
         1kQG06/ngtSnIEFHzogiVwiDT1fKySiaWLTOxMSY1tO1/uoPEtrD3lcRNQLTyK1m4Iim
         zty+SpLpAr1IWaF8Tx+waeIRlYdSycnQFhf85R78p893bVbchH9D9hn0P+UCFvpqnQ4U
         OhegctbL88IeZ3cEV3w9qrnZz1sz0ODHGvCt1FbmfWZ/2Wc/HZHOrruGT+Cd1S6i8OIJ
         WrJA==
X-Forwarded-Encrypted: i=1; AL+hErGa2GHMpb+/F5uuuNt2zq6DQnoz/aWj7D8n+2bBEpjeFI8ZcGrEsXtZ71b4BaTBoPd0Yv57OFKzWgnZFenwECc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eZPaQ7eqmeajs601u5b6KDKjNFtcD5DbbludLwW6rowjXHldh
	x9jI3mlO4dM8AwuhNxd8CJRMfr4quz8Q3YYid8+PS8+XV2weR/b3DGx+UKjogbs5wHs=
X-Gm-Gg: AYBFou1HB632Um9mbzXrDY0dFkM5PtGUTgqPbndO1q4/wm7ijfXE+QhNvkyYdos2jwE
	1iqjzHNyKMlyMLmQ8mQYPqcy+2C0tMzYUNf9SFjrH8Y1GLT0E3VWgbCccSaUztm8QLdtmX8CoNP
	xI7ZFySfWo0OfZNY3fnhaIaHd3hXLrGE8VFlVF56J5E64V6PGVDfNPgvlNLJrvRkb9s2MBaywjH
	JCLKyQiwLSnQaX4VbnVQd8BqyXur+UDRsKAw/H3TSgQS87yyJ/sOy9lHmFOacMLNLwLmw2nqLDE
	wjqoU0B6hfVyP2Ua+70pd2c0ZA5ZlHyNGz28KsGtix1VgJ0xTX0v7b91pE618tP3N4ksk6j1lXN
	vieiMxnnGj0xaTfN3osiiAqfFSe1T/QmJ8tLq7MOBXz9D57SpxdWZQRam4hEhg12/FoIvisMtvu
	TBrA+pTZSoRhds0pxw/IKgNULcDKHesTKQj2d7cf+pZ0p1kDNCuKq0pjDhbGjJKHAHtJodKZ1X5
	owUWr4JX3QQ9swulGmA7BA54iq/u1tFfnjSsvPfUXOPMEb4N0RuDOBGATEU9eLDzu9qX0DbSSM8
	kUjjO0dMdAP3RILwwxF6j4oPvZVE1Ik36E+SWPo4rhaiVZzqsek53ZmLpdfFtISR2nTYsgMiB5N
	SgApGqeaHqev5MVxI9btMJA1nGdpSaH0=
X-Received: by 2002:a05:620a:6e84:20b0:949:a7d0:e6b4 with SMTP id af79cd13be357-949a7d0e7f1mr416234385a.51.1795100068869;
        Thu, 19 Nov 2026 06:54:28 -0800 (PST)
Received: from localhost (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949b9a5370dsm10296885a.23.2026.11.19.06.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 06:54:28 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 09:54:27 -0500
Message-Id: <DMZ9V6MU9XNZ.3J23SCKTSDHB@soleen.com>
To: "Chris Down" <chris@chrisdown.name>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Mike Rapoport" <rppt@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>
Cc: "Breno Leitao" <leitao@debian.org>, "Alexander Graf" <graf@amazon.com>,
 "Baoquan He" <baoquan.he@linux.dev>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, <kexec@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-team@meta.com>
Subject: Re: [PATCH 1/9] kho: Reclaim the metadata page left reserved after
 kexec
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <cover.1794383544.git.chris@chrisdown.name>
 <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
In-Reply-To: <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>

On Wed Nov 11, 2026 at 2:52 AM EST, Chris Down wrote:
> After a KHO kexec, the new kernel keeps the page holding the previous
> kernel's kexec metadata reserved for as long as it runs. It only needs
> the page once, since kho_in_kexec_metadata() copies the previous release
> and the kexec count out of it at boot, and nothing reads it again.
>
> Free it with kho_restore_free() once copying is complete.
>
> Fixes: 76aa46b9e404 ("kho: kexec-metadata: track previous kernel chain")
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
>  Documentation/admin-guide/mm/kho.rst |  4 +++-
>  kernel/liveupdate/kexec_handover.c   | 10 +++++++---
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-g=
uide/mm/kho.rst
> index 902d171a780a..f9d2cc5999ee 100644
> --- a/Documentation/admin-guide/mm/kho.rst
> +++ b/Documentation/admin-guide/mm/kho.rst
> @@ -120,4 +120,6 @@ stabilized.
> =20
>  ``/sys/kernel/debug/kho/in/sub_fdts/``
>      Similar to ``kho/out/sub_fdts/``, but contains sub blobs
> -    of KHO producers passed from the old kernel.
> +    of KHO producers passed from the old kernel. A blob disappears
> +    once the kernel has read and freed it, as ``kexec-metadata`` does
> +    during boot.
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec=
_handover.c
> index eeec298aa9d6..3046b89e5db4 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -1808,6 +1808,9 @@ static void __init kho_in_kexec_metadata(void)
> =20
>  	pr_info("exec from: %s (count %u)\n",
>  		kho_in.previous_release, kho_in.kexec_count);
> +
> +	kho_debugfs_blob_remove(&kho_in.dbg, metadata);
> +	kho_restore_free(metadata);
>  }
> =20
>  /*
> @@ -1885,14 +1888,15 @@ static __init int kho_init(void)
>  	if (err)
>  		goto err_free_fdt;
> =20
> +	if (fdt)
> +		kho_in_debugfs_init(&kho_in.dbg, fdt);
> +
>  	err =3D kho_kexec_metadata_init(fdt);
>  	if (err)
>  		goto err_free_fdt;
> =20
> -	if (fdt) {
> -		kho_in_debugfs_init(&kho_in.dbg, fdt);
> +	if (fdt)
>  		return 0;
> -	}

This re-ordering can be removed, now that we applied:
https://lore.kernel.org/all/179508700586.361583.12491114908870226409.b4-ty@=
b4/

> =20
>  	for (int i =3D 0; i < kho_bootmem_cnt; i++) {
>  		unsigned long base_pfn =3D PHYS_PFN(kho_bootmem[i].addr);





--=20
Pasha

