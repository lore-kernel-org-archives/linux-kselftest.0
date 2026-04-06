Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBC230E0CC
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 23:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775517599; cv=none; b=LUPs7fAw0R/phigcg0pSVq0juBOCMAa6K5OWX+jFznixZXzisS59aNSKOatzdI9iBoxhNR1MMchzsfT070a3JQiSlW/xxZOBMyJZH656Qm7+weZg2hdGN0uGZaCCGAVDaNXPzebhAFVFtMKnvyXCHi6VBCobF7bVaQL2rhS+nmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775517599; c=relaxed/simple;
	bh=JSi5LjkR76txsPyakVLmmA8nchrLec+P9BgBPbcaXhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pknSroKOfEli0fMiajvesYv/1ybWxr1JDA441q/qoX/LO+73M0agEFEpzaQlkpbPpwQbb96k2px43u7WMFTI1U74aMfWr3GNnOc5BpueEHDF/6DJR45oopiq0dQlx6b/ID4yYD228q3qAFa1Tzvr0wiZmGBMiRITiN6NSRVX2Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tQkRCLyg; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tQkRCLyg"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so2981429a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 16:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775517598; x=1776122398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8HzzZacCRYi94tMXMTYIuvOMhPahDnXa/u6r4ttErhk=;
        b=tQkRCLygTCtWTb+9tw0dYYw74XmjIe2kXWwUHQd9+KRVy3vTBeUOqCmHp79OYDPZiJ
         zgugG5bH2dcOKz4W55Cc4+/i73O/VcOx7wLrWa8ITWr8TKp3JwA6ZhXv+U7ehXIE+4yN
         qDdAkiiFLLPgdBBg+c6c5c684RDb/BRLp/B9TOlKzWhpzS10H7cV3DWiDu5bu3pOtovg
         EBSZT9qZgQVr9un9UkPtpjkihAbFPydQXxilwf491YbZYqGBhtVFL+QSIKfvQDjX7nby
         aL+qQ/HPUs03/n9Qd25J0X6v1nLddloqLzOyU2CC+h7dpjZVaQK1VN3N1DXsTvFXs0Bq
         RZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775517598; x=1776122398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HzzZacCRYi94tMXMTYIuvOMhPahDnXa/u6r4ttErhk=;
        b=gEEL274LSjulH3d/0oTbWbRC1Bs6/Uv9jBQ8P8siXNPLPYgOmOjZDktwvSjqxeky8E
         I0mU/NuKDJgwepR5AibpTQYV37qndKlgn/KY4CK3CMKM8EVbYQk59tSrtR8Nu6OO1E2u
         ccMKZWrg59seJnNkT2BWL053VlljVreXHstOd+DAfPepUL2eOuxNssV5AqO67CdO7p3w
         a7i9OzBP350W97jBIt2JAACQqkpFzA89Is99URRNShupwUDpIWjxmDVXLL0R94AmfQIy
         IBguf00wT7O69Nxg8Q9PnZjKWLupTWYtWnq6G6ORc4ynLW+mGB0XSxvAOfECpecIT0o4
         IH1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeKTraUN5tCHhbtda+nJSEixcQh9SIF6ZXbXQRXMwL4IA9tB6gD2CXt0JKKcTObzh8ojtBnWR+txS0gwkSeDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdA7NkULT3dU8vP/nfGvTd+BHB6L9EN0wA09GWCyMsX8ivZqC0
	oz8NCmit3ZsUk+R6cGX9aNQjN9Z2NRzKDRLyeQCjjyNhD9IQbVktcSfWQ7ECd1L2kg==
X-Gm-Gg: AeBDietTzuVl6Czh51XoS/mIvpRbmP3VocV5ZRuVmg+jfHyx/+wq0R86D/aBvBxj0HV
	lCKBZ3ZOy3POSxFkyijrmNvQKEByGHiV2zkfw1ViwHh853WhMnY46WCD1uNDS48m+eWcwwFIuLa
	pMxXxP5lYWjG1Q1KQW8QgHOjiVzpV4h7yJHnmjeIY233QB9UXT+GKTu6llcRtZMY9woHadR3fb9
	RkodewkhsvpdwM1s2kc3sXqqjs+beqHb7vFTqgmcEQNBSv+GaYbMSl0iB38srL8OOg22ZlASdvY
	+r0TiGVOPZYmyj6UCmc1QGQUV8k5PSuLWt7yTcXi+/x1gxz9glDn2gR125cuWYr/e20AQlGcsff
	7TdMDILVZAU2qABYtJyPEs0QA0Hqjvlt8TRNNlWtXn3DnO4J/vjUPBD87zdASgwY0K5wK5e68wS
	1b4HNSlulvbALi2xlF++JPQM4PY6lzFgnUhFDdb2DcuyqLiQXqcUTZl5HlPUvRVw==
X-Received: by 2002:a05:6a20:12d1:b0:39b:8ed1:eb4f with SMTP id adf61e73a8af0-39f2eec3ca8mr14985907637.24.1775517597360;
        Mon, 06 Apr 2026 16:19:57 -0700 (PDT)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65995a9sm12981866a12.27.2026.04.06.16.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:19:56 -0700 (PDT)
Date: Mon, 6 Apr 2026 23:19:52 +0000
From: David Matlack <dmatlack@google.com>
To: Rubin Du <rubind@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/4] selftests/vfio: Add generic PCI command register
 helpers
Message-ID: <adQ_mA6bJI03CagI@google.com>
References: <20260403234444.350867-1-rubind@nvidia.com>
 <20260403234444.350867-3-rubind@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403234444.350867-3-rubind@nvidia.com>

On 2026-04-03 04:44 PM, Rubin Du wrote:

> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> index 2858885a89bb..e5e290eed510 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> @@ -65,6 +65,16 @@ void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
>  #define vfio_pci_config_writew(_d, _o, _v) vfio_pci_config_write(_d, _o, _v, u16)
>  #define vfio_pci_config_writel(_d, _o, _v) vfio_pci_config_write(_d, _o, _v, u32)
>  
> +#define vfio_pci_cmd_set(_device, _bits) do {				\
> +	u16 __cmd = vfio_pci_config_readw((_device), PCI_COMMAND);	\
> +	vfio_pci_config_writew((_device), PCI_COMMAND, __cmd | (_bits));\
> +} while (0)
> +
> +#define vfio_pci_cmd_clear(_device, _bits) do {				\
> +	u16 __cmd = vfio_pci_config_readw((_device), PCI_COMMAND);	\
> +	vfio_pci_config_writew((_device), PCI_COMMAND, __cmd & ~(_bits));\
> +} while (0)

Whoops, missed this in my previous email.

These should be static inline instead of macros.
