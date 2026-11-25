Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629804;
	b=depQe8IqaVkPN9kNLs7eFWm8r/0elV8wVqnm4gKSAscRlHxYsnBXhDNWqPx+LG10zFxE
	 xO/HQBm/Lpq341qrENOpTmOg/6STvvU4Xm/5ByoIxZiP9KTfzwKD2o0hZVIBb/f7MFhaB
	 1yOggwZRu7fnO88uZIk2heSarHHSq1X5ypol3CqoYszDGMFPUXJruSWNgx+WUNdQ+oJgi
	 6zZcoBPjIUKhV2ND+H2J8MaBqx/3M0KwEEyNYqEIVMQyB4oLW8t0LSSvZtBU+U4MBKIkz
	 iceVVkko3cMpvFI1ddKGiJS3OetGK6Xwo1NWShn03R8GCSHcZht/9R02kRRLVnbZG2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=X+1AYy7Mp2a7SBL4ePYq/G5iDJIRCdCJCue8L7l5f3k=;
	b=zCO97s2t//5+lWm1x+0W5XPVOztBDyfSDYxTPuzzIh9m+scAE3oHojcSXjzMCejbAELj
	 54sKp5aa/sy+M7eZKI6ifeviL+vbtr+dRXB7Jj+vPxiW4Bydc5yJshHeNGYGscI1O9jJ2
	 aHd5aSM1Ijev/DVTjQ7MM8+YK29j1/dt+wKT7DnIaRuEZgXTjefpWtk+w3H4Wi57dHRVV
	 g6Rg3I9nnfd4mtSqEPeQXNwuQn3PWQQ96ks2ODApKMM1dasRijWBhAc+Z8KZ4eM8ViGgF
	 85edyr3gIjfP7ZUYaSFnenRJa9WlSvKAuY5INEepbJWHbWgD2FQh6MkeV/aauPnmwwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A95H94SU;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48165606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 18:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48165606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A95H94SU
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f0464dd6b6so37765925ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 10:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795629804; x=1796234604; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X+1AYy7Mp2a7SBL4ePYq/G5iDJIRCdCJCue8L7l5f3k=;
        b=A95H94SU9aU41X9Qdw1IDB9XFy9sE+pVMkssDqz5UP6xSP3vg85yutqk/5Ml20CrFx
         8csRNqN1wMi5HgLKS+Za1S6ObBSTEG16G5Wadl0S/zdF+vZuNph+oXSFiv5qjvVqsHCs
         /+QNk36QzE0ZAeuPGsRdGF5/vNYWdE5/DNEYfiPVfRivzQTnSlIiQfpXE+6Nq6HLZQD3
         I726J+6XoLyFWiRRWW1cLvOUnTi4MsweX+FHvrqFfe2XJ9ihDPu8JNrm9da3ym2IIWq1
         QfQY75kYGmaA/GkOicVMnxrkmTt6nz3SpYVpXZRuI34K+WOMApV1T46NwXAed7AlVt8h
         lqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629804; x=1796234604;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+1AYy7Mp2a7SBL4ePYq/G5iDJIRCdCJCue8L7l5f3k=;
        b=n+cqVR+5CtAxFWDJGOfcoEY/yN90FW0WpmoHYj/D0T4q36+I0H2ENt5ADuUeXniz/w
         2+hrPUcvS7iQA/J5pnJS1nVyb+9ft3ECAgDTjweIe4zI5wUuexDm3yGBXYLMWCGTN6ti
         aq5WP3/oZ+ZTunRV8oYxrYx/o7u7VALmUslSfyM/cQfRC7Xq2axbKLNa3z3sTHKX/ajv
         pl+Nzn60OYDzy83FhkbpLeZvQn0nhaDllY4Q6D0whYwAhArD2FW6zF0/AK87+TmaaGSz
         21SM453ye7tmzCAf5KUTmGRZ10fi7FyZX8KecBKkqm5kSGROTxqoqgHymQ5/LB2mwV7G
         oTDQ==
X-Forwarded-Encrypted: i=1; AL+hErF3NzGM1hvaLi0p+1qQAnrB6/Dr31cSqJgdzrtMDM77U0Azr1tacy3bNjGvYVWivCfkmoOb7p4ltSCPey8XNq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PkvLsAkgiUs4uQTzqEbQPYhzoplOvGqDTOhrN78UrYnoW1bZw
	A97TtSXq31eYLbw55+M0nNNZ70TyAubGErF29vmqUk3WEIRWgOfgUUzST5VcKRcT0w==
X-Gm-Gg: AZFdTZeV35UX4ZttiYsAawVTARCVH6DxqpIX+iMXKkPOoU7zSJ0iag3rf4GvsT+yUKZ
	SuyeWJlQRS86SZzptozif7OMMa2kiKSgGK9yA0r7VakBVJS+LpXrAnZJVzVpiY/yUjOA+dH21YF
	7sx2+X1cU8MhAF/YuQY09Qh9i17On+ZxJMfCwlZ3i10Q4enDQbQrBHE7lYKaNGA7+WTvfs/RkgN
	iUaQtmxGIvVW1krg6tP3iMKA3+8K5y9R+II6nTAttpB/OV7i+uRdeSoBG8RTyIALb8xq/FBYI/w
	mCyGyburgBYZxOLcnTpVjcx/puC17Bg+1c1GAVcCd4dTJWx1nqPdbwfwubXXeUUwFaJZu2BZKAB
	MOGUJX8k92n1hr7Shi6ys748OJDTw+korFLm+TGcrKT2LpISCMaXDGGRtI2FtUac2num29gZkFX
	THeVWPpmbNeLldp4UX7cXbCZf2V8sH3X5LbkWUldzg6JmIsXPacmp19DuqciLKgdQcN0D/mOAIM
	M/487+7KezKxRznE7FpmiUmzp2pUA9hPc01K0x54JlYeNeBX6AtCCJmFwRJhzdJVEQ/qzuR/MoN
	jhvtS3wG701zrrhy/FikQXisWW+cREZvcc5wXE8oTreHniStmuLxxlndKykTQ7qrBw==
X-Received: by 2002:a17:902:f54c:b0:2e8:9820:80cf with SMTP id d9443c01a7336-2f03f1cfbe5mr188390265ad.58.1795629802894;
        Wed, 25 Nov 2026 10:03:22 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm91361725ad.75.2026.11.25.10.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:03:21 -0800 (PST)
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
Date: Wed, 25 Nov 2026 10:03:21 -0800
Message-Id: <DN4HN2W6ZVES.289H6BZD9U7KB@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, "David Matlack"
 <dmatlack@google.com>
Cc: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <graf@amazon.com>, <jacob.pan@linux.microsoft.com>, <jgg@nvidia.com>,
 <jgg@ziepe.ca>, <jrhilke@google.com>, <julianr@linux.ibm.com>,
 <kees@kernel.org>, <kevin.tian@intel.com>, <leon@kernel.org>,
 <leonro@nvidia.com>, <lukas@wunner.de>, <mattev@meta.com>,
 <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 07/27] vfio/pci: Preserve vfio-pci device files
 across Live Update
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-8-vipinsh@google.com> <auzftbPFO_6XBYVw@google.com>
 <20261117220059.GA2250529.vipinsh@google.com>
 <DMZLLYOVIGOU.1RXWYJN6UQTM@google.com>
 <20261124234830.GB3545683.vipinsh@google.com>
In-Reply-To: <20261124234830.GB3545683.vipinsh@google.com>

On Tue Nov 24, 2026 at 4:22 PM PST, Vipin Sharma wrote:
> On Thu, Nov 19, 2026 at 04:06:38PM -0800, David Matlack wrote:
>> The incoming kernel computes its own virt[] and write[] masks and
>> requires both to match exactly with what's in vfio_pci_core_device_ser,
>> otherwise it fails the retrieve. On take-over it uses the preserved
>> value for bits in virt and its own freshly initialized value for the
>> rest, like your option 1.
>
> For now, we will be rejecting any changes and in future when we add
> userspace opt-in mechanism then we can loosen this check, am I right?

Yes, any difference fails the retrieve.

I don't think the opt-in would loosen the check. What changes is the
masks the incoming kernel expects: it builds its emulation for the
device with the opt-in bits recorded in struct vfio_pci_core_device_ser,
so a device that opted in to new emulation still matches. Devices that
didn't opt in get the baseline emulation and keep matching older
kernels.

Separately, if we later find specific differences that are safe to
accept (e.g. a newer kernel allowing writes to a bit that used to be
read-only), we could relax the comparison for those. But that's
independent of the opt-in.
