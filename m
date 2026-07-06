Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB89337CD2A
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 20:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783370978; cv=none; b=QWzT3H47crsfwB4OTthTIumWc/emco1TaqtDXETT3ZdYKntaxGSY5LeqOUwf780br8KlNFutDfQ80nXA072p8fi7k5Nu3Y3Rko6QrtaetsbdSYozHBa4UGUIsrEDnSpMN5KwgSjKoBlZ1kMhMsR9zTW1xy1Fe4VWBpUmkRmUywY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783370978; c=relaxed/simple;
	bh=d4S7sDiFbTc53OqWoIai9pPjYCRzDsWspPHPSQWAR9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbWFWkKtvNqFi8yCa/IDCYWrkeiut2+JzCWORIT8/eEXsnL2ssi1OMBcfY7kRt1y1TVhPyJ9IMUVCFfwzA62NIPAiyCOrTUC3N2uIMZ54Oy12waN+ZAMaCpUfhEi5LxOnHvPnXd6JrZ8d+UL5EefsZwQRuPfqOWBTQuKHM3hMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OY1t4vVq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OY1t4vVq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so35461865ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 13:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783370977; x=1783975777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dsAw/f66PDO6A23XewR6r4+zQzL0h2Tt+CMeAp7uytE=;
        b=OY1t4vVqWzXz2P2S0YE0yDxjR2ucGA4vXE6BjGcBif3ysuJXYB+ZVgozYKtNxDu7cf
         2F/eLTGMmzzc6fvRlfIWV1AaIVdNIDuilgCk4kjCUnd8YL5iZo9cxlu0N1dDoC5Yrgk0
         sZej3/FI29aBt4nFwdUFg0ZNx4oOPiFAf7CF7SGvemWK39Rkz2GQulWpIJ15qP4Ti8gg
         7IEUHBGchhNLZvDXZA2VOc6KzHnfirEQoZRDQnOBWsidJ2vsiYqSrQQ62xvA9et4Tjd4
         3p1vwPX47dF1qFJyFvAtL7QPS8Aa9zdFSZ2gsMRR+W2XGrS52Xt7GUHQEpJ7ir3dPJK0
         M2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783370977; x=1783975777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsAw/f66PDO6A23XewR6r4+zQzL0h2Tt+CMeAp7uytE=;
        b=ZI9oPphoUDdWgWP5OeBAMgme6abJT5/tqKxXdSv68oHHO0Yjn6X9zCyJ6fJo7Qw8cO
         p3SEe9JckWES5jLsvmkhUu7Rn5N1LfEZtlMdu7MdGhZSL8IPfLxT++9AG3b3SCB/FJLJ
         0hROTFr2/IhZcVX5HH2fUvCQ2evcLjmO0Sbz+Blejkx8yPVy9K2CLVhIkfXyEiy6IA8w
         3SaXH21VBqVF+nM5TL+6j8zUf75hT+jCZA3ly9TDsUyi9bbNXhGqL+g2EbiuUObpoNCW
         trD2R42kwRuxzrWz0gw8k5Esr+YGTZ4+ZkCXwy38N4UumCmFOfnLKcBHkJgeKZhP0lsR
         IRTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmY1BdtH4pnD6devpV9n0WQ/f7phJYU+d0ydgGmlysSzd8umQHwV3/XcGr27AnIeRQlYryb7i3ymMiy+WsZGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw6uy90BrIQgFi3EV2ZO0d6y5p20uwcoC3eqoDPrvoBE20gz3d
	hzVJnrphBP57vZrwC3l/BtYa3YW+XFNTQnz66MRXAitXwcBugpdSN8D6dIWpq2d5Bw==
X-Gm-Gg: AfdE7cmEWbDw0NKB1SaU4JtC2cCwj7NUO7AAb0VMYDWMG4MegneqLESvmkxYLv6qmj4
	0leWQuUCEucfQA9Z9aejTGiJ1v6aU/8efMH3NRMUOMeUDpsrwbpds2AIO/mMfhm4XQAS1c+EQiM
	oqTgnszpHvONOb4jHwNwgt5qPULcd2jaUdQA/a+EUul7G7VAqgOwGHtFcfRwLU6M6meb0ixK4Re
	II0z9CRujGAG6gcAK+JrbyKYxgBjNhI2klbceFpzsMpa2r2fVAuPnhI/SRIEQ55G7/sD1QvjQ+D
	ejJrxR84/Fac3uySTIu247jnO50S9eYFVCF7PNexDqrZjHf5i9QbquPtvtSoery3My/mteNnuiD
	qHv3UbMk8mYlCtxlH5Jr+bVbYFWHMmXCRA8CVNuE6i/49xeU2+VwDw2WMEXyq/RNe1p2Qc9Y2FC
	VlY5ROti8pCubvC5VasKagwaakzShkiCIFEW2qlo+97l8F/ON06lY=
X-Received: by 2002:a17:903:390d:b0:2ca:d151:383a with SMTP id d9443c01a7336-2ccbe729b2bmr26058305ad.20.1783370976544;
        Mon, 06 Jul 2026 13:49:36 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3da55sm302005ad.71.2026.07.06.13.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:49:36 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:49:32 +0000
From: David Matlack <dmatlack@google.com>
To: Josh Hilke <jrhilke@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Vipin Sharma <vipinsh@google.com>,
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 10/10] selftests/vfio: igb: Use offical IGB headers in
 selftest driver
Message-ID: <akwU3DIBQlPCXFmQ@google.com>
References: <20260526235417.2058313-1-jrhilke@google.com>
 <20260526235417.2058313-11-jrhilke@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526235417.2058313-11-jrhilke@google.com>

On 2026-05-26 11:54 PM, Josh Hilke wrote:
> Include the offical Intel network driver header files in
> tools/testing/selftests/vfio/lib/drivers/igb/igb.c and refactor the
> driver to directly utilize standard E1000_ prefixed registers and macros
> found from those headers.
> 
> Delete tools/testing/selftests/vfio/lib/drivers/igb/registers.h as it
> only contains duplicate code found in the offical IGB header files.
> 
> Assisted-by: Gemini:gemini-3.1-pro-preview
> Suggested-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Josh Hilke <jrhilke@google.com>
> 
> # Conflicts:
> #	tools/testing/selftests/vfio/lib/drivers/igb/igb.c

This should not be in the commit message.

> ---
>  .../selftests/vfio/lib/drivers/igb/igb.c      | 159 +++++++++---------
>  .../vfio/lib/drivers/igb/registers.h          | 127 --------------
>  tools/testing/selftests/vfio/lib/libvfio.mk   |   1 +
>  3 files changed, 83 insertions(+), 204 deletions(-)
>  delete mode 100644 tools/testing/selftests/vfio/lib/drivers/igb/registers.h

Please fold this into the first commit to avoid adding registers.h only
to then remove it a few patches later.

> -#endif /* _IGB_REGISTERS_H_ */
> diff --git a/tools/testing/selftests/vfio/lib/libvfio.mk b/tools/testing/selftests/vfio/lib/libvfio.mk
> index 1f13cca04348..0075749e2f12 100644
> --- a/tools/testing/selftests/vfio/lib/libvfio.mk
> +++ b/tools/testing/selftests/vfio/lib/libvfio.mk
> @@ -23,6 +23,7 @@ LIBVFIO_O_DIRS := $(shell dirname $(LIBVFIO_O) | uniq)
>  $(shell mkdir -p $(LIBVFIO_O_DIRS))
>  
>  CFLAGS += -I$(LIBVFIO_SRCDIR)/include
> +CFLAGS += -I$(top_srcdir)/drivers/net/ethernet/intel/igb

Please create symlinks to the specific header files you need to include
rather than exposing this entire directory to the VFIO selftests default
include paths.

e.g. Take a look how how the DSA driver does it:

$ ls -l tools/testing/selftests/vfio/lib/drivers/dsa
total 12
-rw-r----- 1 dmatlack primarygroup 11648 Jun 11 21:18 dsa.c
lrwxrwxrwx 1 dmatlack primarygroup    49 Oct  6  2025 registers.h -> ../../../../../../../drivers/dma/idxd/registers.h

$ head -20 tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c
[...]

#include "registers.h"

[...]

>  
>  $(LIBVFIO_O): $(LIBVFIO_OUTPUT)/%.o : $(LIBVFIO_SRCDIR)/%.c
>  	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
> -- 
> 2.54.0.794.g4f17f83d09-goog
> 
