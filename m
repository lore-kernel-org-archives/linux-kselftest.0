Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECB72E62A9
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 21:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856440; cv=none; b=P/b63bjmafSAscKodQfdywm36rTTgzFS5wbaXqHGrbrLYOB2FG7iq/5/Jv0jx0a6k8Xg+PEN6rViBlj0+m+xy8ccLGBvlJdZtos0bsCE+3zPKqiMV/Z0usbtJTBGpsuDUEbFt4GDYipGspNKxwnxy4yuIHHhABv41JXkJmJH/Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856440; c=relaxed/simple;
	bh=2JOhToTdTr6yVs4wAFQ473V3hSoFLZW0ifRgTNN4e/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiIFppLbwcaj6qC0k65u+zd65nb6cH/sn4Z1DM9ki/3f3D/KxuVGZvJUf9gSc+o7tlYKUxvbjg2KRtNY1hfPBztxWY5TFmHoMLHAMXeiJJjBrneKCcK5ENu9YlN7YQ/kTMpRRg5YEd3cKe2pqWqHfS2PDdxUMOVU+MAXPEER8uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d8i5fqcj; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d8i5fqcj"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2d17b8fbedaso1131068eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 14:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775856438; x=1776461238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IBvZdikgBdRF+Wn4G4dECwW8X4wf362wNDlrhZsu14c=;
        b=d8i5fqcj/QJ4W/UEwCICT2MpxBPWWAvttWXu228GRTjgjdw8/8xLIqy6d+51A9DWCg
         VhdRbG5mEK3qdALZYup8RKPjVSBSreJJaRhvFfuoPKCPMLifKI5efcMRqk77+4JcC5Fx
         HxCgIx4iknlnsAL0MGEkp/sPYqGC2vx4P+q3kzyNDVXL6aZFpQMoEXpn3fj8kKvfwChK
         TVn7f6uNybVWwXBPeYxHGF8eCX90gE/MqiGZ9MzOV8kfNOzGSDjGzqY/kF+TcGs++gpV
         AEo1CPfR4BS95C+VhH4eQM5Znq5RWn8o+crYl09YSPRPRv9jGpZlQdBjbJ6Bfatuf6Ft
         rSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856438; x=1776461238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBvZdikgBdRF+Wn4G4dECwW8X4wf362wNDlrhZsu14c=;
        b=KiRCz7zRa4lbQEbJOKWN1+p07DMSEoEtIvjBfCsDPjrCUU3hoEYWo+WZzlAE1CmrN1
         kmlv1w6FKs1GzxA8VEGDNUvNpASs9YwOFLLhxDb8Gvoqy0dugDoJT2i85CUWbm2wnUS0
         tBKtYKL2z3FpfGN4Dd2VX3WG0/XPjksuhmP9y3QlzVcSzV+gryfjHZK2E1n5SL3hdhCI
         Wu6Ty/+Vhl78f7GYgW2hK1Lwpj4NK5d4EnLK5SMGbCUCNyAkEDsnhMbmhBzfM2fn+p+R
         dc4aiViG5aGAq8xW+VePC5I8tnpTBXMEDrShGkWiaOjv4+MtQFuBeKzjskd1PHD+L22d
         eqKw==
X-Forwarded-Encrypted: i=1; AJvYcCXcICkIGILcb1jloANdoJEbCLFAoDsnKdKbG8Sg7UtGnluIIf4BRnQn4SCO4Rz04UJRJzlblVmHq4BX9fNnhOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZls4Vw/P9aiyljOCbnINoSOe1bFBC3GJXKm8VMXBzSis1QPFc
	G8/iSiVc7rEHKi/9hhfg3swfQSavjynWO4jZH6feeix5cMGTkEbOLoqH/qw01eKuSA==
X-Gm-Gg: AeBDiev6Y/N3RVNv+8OhJXz0pZhXsMUTHGlSL10fWs0g6fcM+Xs16KC0I4dFeQZ8EN4
	hbVZDdXOzZXCp4UUJPPy2dGocEYFUDErHj0cd0H+4OzUrqTqh6AFwsZpeDhcwGK5yHZbJoRHk96
	NIfBSQlpyhMpGQnzr5CApLfW+G1th4vfN9T2iomyFcS9lTOQLVzxNunvS30NYC2bywOgjCmwG0n
	tSBwrUaagUptmUiAWU7PuJABMX+abg6TqzOdHdtjLi6OwlBwpBdtrhUfUT+az7cZTXd969x35qy
	8Blfhmf+cm/rtaZJSZoMMWA6cRIqD96d8nVy/43Sgw6tC28FzwLbOqvMuq9VjN3Xyy5hJtpH44W
	VWNmec6qLTNX7cQDxpuyMn5pRG+WkPmmbfcB+NhJZsS/1Rxth+qO4BbE1Wrzswvk9hO+tZnRxCH
	K+8h5fpjYAWCItBxfgM+5lqHMfs9CJuBvb87s3D1qubPssHcnhSN14gNzysDL1F3uVKv8=
X-Received: by 2002:a05:7301:6884:b0:2c6:67b6:3acc with SMTP id 5a478bee46e88-2d4101c7714mr4323460eec.15.1775856437082;
        Fri, 10 Apr 2026 14:27:17 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa5257sm6066771eec.9.2026.04.10.14.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:27:15 -0700 (PDT)
Date: Fri, 10 Apr 2026 21:27:11 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex.williamson@nvidia.com>
Cc: alex@shazbot.org, shuah@kernel.org, Rubin Du <rubind@nvidia.com>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/4] vfio: selftests: Add generic PCI command
 register helpers
Message-ID: <adlrL-Iurq5_ikkY@google.com>
References: <20260408225459.3088623-1-alex.williamson@nvidia.com>
 <20260408225459.3088623-3-alex.williamson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408225459.3088623-3-alex.williamson@nvidia.com>

On 2026-04-08 04:54 PM, Alex Williamson wrote:
> From: Rubin Du <rubind@nvidia.com>
> 
> Add vfio_pci_cmd_set()/vfio_pci_cmd_clear() read-modify-write macros
> for PCI_COMMAND in vfio_pci_device.h.
> 
> Signed-off-by: Rubin Du <rubind@nvidia.com>
> Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>

Reviewed-by: David Matlack <dmatlack@google.com>
