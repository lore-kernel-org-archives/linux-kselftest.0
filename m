Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133977;
	b=GA82ptGhQi7+2qdPyhIECGjSdq3WTKc37hOVDhLOupGl02UqPgjWSqKdIsraFQPsPoPs
	 O9H8dlxDMRxrObLX9vMAtrZjBCX/eoSX+OcwMg9MOkblTZ3FIFPGnCRrDRM9XRaqw4i+r
	 PIffYQ7491fHbPmFAK69HJdlw7CXCRj2RwIslwapxJoz0t6cNO7k1lBihtTtqlxomKo6I
	 gll62kggxHHkvoeE6uAIH8ZAyj9wg107iW6W/qk8fJHkqZDsXheIl+AchB4mHvlpiKxWa
	 H+ES1qEiyX1E6PeKtn4xZF0W6HAQny1g+AnFQEdaZ7rqMSQIqVCGNO3wRm7rJrsio7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=n7l+AyO/cRMVQJwJa64VigJKwgCGiEZe5FhWi4AHvFM=;
	b=TWVOegwoV0j6YsdEEHB0BFUrMy3Cm0Eg+oolwwbOyZAdIcltkcH84JGCKPi68Y+NbZMS
	 20fQArQnNHe78UFHqzAa299OKUfZlZAN3bebvs8msZEF/lrO+Gv2Ct415Qd9S4CoUinIq
	 uucjnlAqZBnwcXgfSf/pHTaKZP4/1K7m8+d/e/80dt8tcwLtF5oTYaFtEjpaZr4d5x8UK
	 PmEtcNg9H2ZldPzo1izYxszo1BkwXoBdSQGplCxPxOxlE7pC+LEVWmpPKZ8MMHAN+4/tK
	 K7ELx6Sywr9ijwleIhUTI/4LSvGujcT8/AevYjF5JEl0vQ/PjGVPBg7AZztp7+rTQwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PdhTt60H;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA53606A334
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 00:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA53606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PdhTt60H
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed408b0d9dso1312955ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 16:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795133977; x=1795738777; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n7l+AyO/cRMVQJwJa64VigJKwgCGiEZe5FhWi4AHvFM=;
        b=PdhTt60HfDdlbgtnPHfsSmeHBydQzoPU7kBA2tY0Ozd78IUkx0lFNNH2yQEnk+t921
         4E9Tm4vx1WTnyn6wVtiNLws9au3Om8UjAH+aHWnF9UWUCSm6dRehNZtZrRMRyiJKAdfQ
         YnTwSvF8Sds1TTxbi5V/mZOO0ENi8tkjlt9pqsZCHwuUE36BF1CfNzDd6CjA1gvbCV0K
         t8tBNb4lXwSyQhCSx3AtuTpJROIDOnqKE7PXyQm+EW6Ikp8UHZwMZtLLhZ8OhuurDTSV
         31cPFPu1KFP9meTVUMuhIsGXcN1R94M301aF17ZwKIG89GFOnVfy1AAlTXsPDOoCWZDL
         cbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795133977; x=1795738777;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7l+AyO/cRMVQJwJa64VigJKwgCGiEZe5FhWi4AHvFM=;
        b=X7roLfacfQX5FGOcgZBoOw4q4f0XL56QHgCiASHpNHVSspP1eLtyL18eJO6Te5BkUk
         PTQwjewgdm8UL/ewXRuVnrsqgKToCOl7iSt5E49jkSheuRZrfLwlhiBzLotli99Za9aX
         j6cACqpSUXzWpYXiiYbw5K13gK3aKF/qi1dj9KdRfHK797D+Yg2NsioCQB/POQWnW5oJ
         P030hnbC/YWJAHWv4O5Hp1YB5jZOeNV6FuG81EyvcW+zBoJ4IWdm9Id7SAQas5x5rURy
         UEOxp0grlMT4bb7IuMGJvu2ql35MCk9YJAO0pDtodgxnopBPWiaw+5N1UD16CmBqtdxS
         Ufhw==
X-Forwarded-Encrypted: i=1; AL+hErGuj1R4jg6Ey0biHDcXIi6BZIzSdw55hvgelDuo+W1VqyKUBWWE2MIxcMukcnNVEX7ek/DV3yhRh4sL1eYvtU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WogyBisC2TZQBEajB7iS9W8KoZ51kFSXPzVCw8OYuJwrxKcwK
	quRucXZjKAuw/BImqYQzMz9p/813dTy25mN2aRTQsSFvuuL90mngJAK4Qql5eJiHYg==
X-Gm-Gg: AZFdTZdi7pJV1D6PRf739/zVp2q4J9h5uXQpQaj+HVIe/xnfN0MTK8stNS2WFrbdYHG
	aYRKl/ESw4NhQObJbX5q9XH+1cpd5w1sbN5lxDcO8w3KATyidnO8rfOMl+goov+L7Ay7KNSZFCV
	YOA4juxTdkCx/nCNivsrXR4bzWVm8k8RhYRfwF/rVo26ntI3OoeHLQQW8PWhlyouARALmbPp8/C
	jgFaC2NW9eahwCT9Gh7EDXPmLJFUlBjdl2PGMvR9BdO8Q/LNWznSV/heWbPSXT7j/NSj/1KP9cM
	2IvFRdGTgjDhHdO4nZthkGQgdpcb7aklfwpkfKyBNG3MvD9qlzw2Jz4enT5FSK3w2wFIpWNpDNS
	6SNk+331NzZJTD8kJuXpEuIha+UP675U3cy4rkXwp8nsrUakvYpA+rgfkTvCUSzTFTunPv2e281
	rw4n05R/2iXnyqisLnoIbhkzNJMR21+PyJBzrEDIioBTAW/NEjUS6pjR2ORVn/PJPNtc8nDRgRm
	HlebMSZr3nm86Q2TMnb1k2k6PPY6k92Dtaw3dduv+ixe7lg6dcnFB40lOl6kO4TQaXEcwpqOdFZ
	9U1BSP6jI2rWEOaQqO8k78VANOcrpfgqz1Utv7HZ7RlImevPu8b9jhxvI2B0ddtc
X-Received: by 2002:a17:902:e542:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2f03f1a4967mr13941365ad.30.1795133975980;
        Thu, 19 Nov 2026 16:19:35 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0ddf40sm5969655ad.37.2026.11.19.16.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:19:35 -0800 (PST)
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
Date: Thu, 19 Nov 2026 16:19:34 -0800
Message-Id: <DMZLVV5YW6GW.1HMW8L8NIQ1XR@google.com>
Cc: <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <dmatlack@google.com>, <graf@amazon.com>, <jacob.pan@linux.microsoft.com>,
 <jgg@nvidia.com>, <jgg@ziepe.ca>, <jrhilke@google.com>,
 <julianr@linux.ibm.com>, <kees@kernel.org>, <kevin.tian@intel.com>,
 <leon@kernel.org>, <leonro@nvidia.com>, <lukas@wunner.de>,
 <mattev@meta.com>, <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 12/27] vfio: Enforce preserved devices are retrieved
 via LIVEUPDATE_SESSION_RETRIEVE_FD
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, <kexec@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-13-vipinsh@google.com>
In-Reply-To: <20261102153656.1431701-13-vipinsh@google.com>

On Mon Nov 2, 2026 at 7:36 AM PST, Vipin Sharma wrote:
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 12557d45dfee..e6ca4c3fda06 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -11,6 +11,7 @@
>  #include <linux/cdev.h>
>  #include <linux/module.h>
>  #include <linux/vfio.h>
> +#include <linux/pci.h>
> =20
>  struct iommufd_ctx;
>  struct iommu_group;
> @@ -446,4 +447,21 @@ static inline void vfio_device_debugfs_init(struct v=
fio_device *vdev) { }
>  static inline void vfio_device_debugfs_exit(struct vfio_device *vdev) { =
}
>  #endif /* CONFIG_VFIO_DEBUGFS */
> =20
> +#ifdef CONFIG_VFIO_PCI_LIVEUPDATE
> +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_dev=
ice *device)
> +{
> +	struct device *d =3D device->dev;
> +
> +	if (dev_is_pci(d))
> +		return pci_liveupdate_is_incoming(to_pci_dev(d));
> +
> +	return false;
> +}
> +#else
> +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_dev=
ice *device)
> +{
> +	return false;
> +}
> +#endif /* CONFIG_VFIO_PCI_LIVEUPDATE */

No need for the ifdef here and 2 definitions here. If
CONFIG_PCI_LIVEUPDATE is not enabled then the compiler should be able to
optimize vfio_liveupdate_incoming_is_preserved() to false.
