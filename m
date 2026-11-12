Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520026;
	b=MK/MGX1LWr4enGFeZSQJ9NoAPbmJAPF87lXd6ANI4FM82Ncxg4PuuZ2ghwff8hEC9c3R
	 5TDxzxio83YR5ktN3PmyMcl/LW5c4EgqjOBakaOghmZYYad0RBzrowOX2/yNi1sHgKoDU
	 JNpEdsxcPG5nBRaou86QGQRTKIAImO4+dLQXcSJZEbEGpMv78BxJ4GaDq0Jj4lnli27KO
	 OofOBVqBGcwU2wGfzzj6eb7WBrh/n4yLuc7WvMr4z0Kr5XHwrHDzSELb/dZZpLgOsxuq2
	 BS6j6xmidI+fnEjv2bNEWr2IiGWypxzwpOlxw7l5SKb84NhzZN+ddRXTP+CR4Adoh0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=MRvrBEIopDqvuVb/vZ72s+DUNbn5hAJVvZTwAj02wNI=;
	b=N+AhIGo7VCadEyh9atgOymcSyQMLnUmaYCj4ffRAj6J/0WkqzYCWLEQTbu1WcKYzMO8n
	 GIhTHRF8OE2eKoisg0oDEVLBsOIrVRj8S0mUDY5wHvyP3DIiHT+8FBC5kf9LYRmqXQ2hJ
	 i+n0RGJiS75TCbJl69HAS1F2jiRKquQBLtBUT7i88qyQUpezbIT1Lk+ukdbLj9qR3T4xs
	 PU73drgPkXlokQKWZDVNky74R3Z7mWuXX3dZwemvCiQSEv6IkU07OzT1TKsemaJiUf6RY
	 4RMwzHq6zAurVVJnln8+vSEpcRkg+OmfAdVoTvxjN8u13a+NpKqO4riK+2sDmoHe2mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IqQicUBc;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FEB606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 21:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82FEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IqQicUBc
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so128366a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 13:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794520026; x=1795124826; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MRvrBEIopDqvuVb/vZ72s+DUNbn5hAJVvZTwAj02wNI=;
        b=IqQicUBcHFfASsPeC/FaWkK7/Crm2L2UYyn8/PxIFh5d3NQfwGTsj1ea0yYEQ647ZV
         /ccaegp04k9hdkyY2Ail6N4rBeUM3LACMz8nX+7douczOTVskMzZJ6rF5iaIrVQm2heW
         JeAJJRZGwbkWIX4oCdCOf9PAKsBXWkvG0Qf/0hEZ5qTZmjRSXZseI6akOjoL+PPSYmfs
         n/o355gYSqEM305OphinxwQkhxOcncDRdESkE1XHs1UYEEh7UGYPCzuqJ/L28TVUC0U6
         aJlfLAOYc0LEA5khjKc7nJefwozvr0lPgi0RdEjsCmQOzXego5h4dYanuiOcrof8EvZv
         aU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520026; x=1795124826;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRvrBEIopDqvuVb/vZ72s+DUNbn5hAJVvZTwAj02wNI=;
        b=1x2Qpfu0pMvEHMPe4zLDu4i+ShB2q7MjgZ0+jYnstWxRm41+yqpnE4yk0BvUyrYqaZ
         Djyb82mSmJJqD10Abat5BTpoSWfiAXde9rwc0FuwcI6o8CNrcyNDuOteZiO6Zp+nD5Ky
         cy0IsSu0vrjdleHUtNTn6YVxNVbIzB40wGEw8qT8LhSnGup5YgltUqN3/PMsomXLr0sY
         QerJembCFtqZdjefy14qmBhXQ+0A19+h0qf6kL/Vh93XpbnHVwGStLCWfLrU0pNxTsHM
         Jgj3czRysgeHnmODGptXlEGz8FdVuhiA5MGhOaUnod9J9J5TORdya8Q41yfhvTK5xmZi
         aZjg==
X-Forwarded-Encrypted: i=1; AL+hErEbw6Kde07MTrS1FJIXGTZkdvILD08XncRgzEco60y7wKQUwk37EMA4Dqi5pd7ouZa25ScgUhOjwP92uxvGZQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lpYHvEjc67KhEBlb+QNu6HAe/ONZZAvqVGoDd5jnB5Ugv04ap
	jQ7yKM4qcqnc9jn2wVzIepmMz+F+ybdheKsJrEg09bZnwqWuw7ZSska/6cKPWKDpWg==
X-Gm-Gg: AYBFou2lgI+UUn7yaagLWJ4leOPQst1uOHbReMkDMQgpokPWHWZyecIo2eSMTed+7BW
	wG2Fqer3evt+D4egJyBgJkoetfTJ+pQX+CFBhw3OkWldP53ke/uJ+7E7xt1pRcFqHwOtxO9hjCc
	Ji5sCrnGzpLG+dvIcaBhoYm6yINClEIXESLhv36uL/Hk0BfTvQBiW2Cr0kpRo/YYjx2+69SfwVa
	THNu43klF2fOpsrezLCA7VqTVYSQ8bbuG+SzZpmEPFPVADE77WGtixiJsC2VM/Mhyox2x9i2B09
	hv+fPUr/9CTLo+I+iHbrZCdhOD3n8Gw1ccNB8Ngxhkq5KYvC/ZvqcFV3Q90M7fmnK//704H2Nmv
	U5KRVAlBPM5CGD0Nlm2QL55OszVgUYfJt70z9nOvAN1RlBxrGd3oIqAeKLBI9ihgIJF2MniqWLj
	tDtbp7Q4NPxrRc6le2wvpVAf4MxsuPFIUmUHas9I2rWy+RCCPPiGm+DA8+1dkvQI95uwtRZAZ8+
	Kk/DTu+05Yukb5gaYuiptkiDfHuL+Di6Me094Zn8vgPcBvdnsJEwCywh5xpt8TrThvosY87hCOP
	GHXjULBVHMU6HGUFhw97GisYcgkTu05MhW0IL9j+CCCmn/r0bCn9cTxfBpXUknzNeLMzVprU7VD
	DK11XD3D9hw==
X-Received: by 2002:a17:90b:30e:b0:3b0:97b8:d6bc with SMTP id 98e67ed59e1d1-3b1b0a0e889mr278699a91.16.1794520025137;
        Thu, 12 Nov 2026 13:47:05 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d257a0sm6493095a91.11.2026.11.12.13.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 13:47:04 -0800 (PST)
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
Date: Thu, 12 Nov 2026 13:47:03 -0800
Message-Id: <DMTK99TDM9AM.SAM3Z4COP9WS@google.com>
Cc: <dri-devel@lists.freedesktop.org>, <iommu@lists.linux.dev>,
 <kvm@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>, "Alex
 Williamson" <alex@shazbot.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, "Josh Hilke" <jrhilke@google.com>, "Kevin
 Tian" <kevin.tian@intel.com>, "Leon Romanovsky" <leon@kernel.org>, "Logan
 Gunthorpe" <logang@deltatee.com>, "Matt Evans" <mattev@meta.com>, "Matt
 Evans" <matt@ozlabs.org>, "Mina Almasry" <almasrymina@google.com>,
 "Samiullah Khawaja" <skhawaja@google.com>, "Shuah Khan" <shuah@kernel.org>,
 "Sumit Semwal" <sumit.semwal@linaro.org>, "Vipin Sharma"
 <vipinsh@google.com>
Subject: Re: [RFC PATCH 0/7] vfio: selftests: Add peer-to-peer DMA selftest
From: "David Matlack" <dmatlack@google.com>
To: "Alex Mastro" <amastro@fb.com>, "David Matlack" <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111192411.4133780-1-dmatlack@google.com>
 <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>
In-Reply-To: <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>

On Thu Nov 12, 2026 at 12:35 PM PST, Alex Mastro wrote:
> Hey David,
>
> On Wed, Nov 11, 2026 at 07:24:04PM +0000, David Matlack wrote:
> =20
>>     Is requiring userspace to re-issue IOMMU_IOAS_MAP_FILE the expected
>>     uAPI behavior? VFIO_DEVICE_RESET (and runtime PM transitions) on the
>>     target device also bracket the reset with
>>     vfio_pci_dma_buf_move(vdev, true) and vfio_pci_dma_buf_move(vdev,
>>     false), tearing down any active IOMMU_IOAS_MAP_FILE mapping of that
>>     device's BAR even though PCI_COMMAND_MEMORY remains enabled when
>>     VFIO_DEVICE_RESET returns.
>
> There was some discussion about this in the thread below. My understandin=
g of
> Jason's point is that the current behavior, and differences between what
> revoking and move-capable importers see in regards to vfio-exported dma-b=
uf is
> somewhat incidental and not necessarily desirable.

Thanks, I will read through that thread. It seemed like a surprising
uAPI.

>
> https://lore.kernel.org/all/arMBqyI4XNfD+q1W@devgpu015.cco6.facebook.com/
>
>>   - Physical target devices and P2P topology checks: mem_bar_descs[]
>>     currently only matches QEMU's pci-testdev, and
>>     vfio_pci_has_p2p_path() does not yet check PCI topology or ACS to
>>     verify that P2P traffic can flow between two physical endpoints.
>>=20
>>     Suggestions on physical target BARs to add to mem_bar_descs[] and on
>>     checking P2P reachability from userspace are welcome.
>
> FWIW, you can also exercise the "P2P" path with just a single device if y=
ou
> IOMMU map a device's BAR into it's own IOAS, and have the device DMA itse=
lf. For
> eventually validating aspects of Live Update, maybe you don't necessarily=
 care
> if an actual peer device is being DMA'd?

The way I designed the P2P selftest support requires 2 things:

 (A) initiator: A device that has a VFIO selftests driver.
 (B) target: A device that can provide a memory BAR (vfio_pci_find_mem_bar(=
)).

So far I haven't found a single device that can do both. But you are
right that theoretically a single device could satisfy both
requirements.

I can relax vfio_pci_has_p2p_path() to allow initiator =3D=3D target.
