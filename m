Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC630C601
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 03:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233788; cv=none; b=HyFxizvpO0gYciH5Zou+FvMgWCEsUe6Q7WoAPr73UqSaZDy8NV/l0+CVXnSbkyXASyw6HpAaUK5Vaf/UkBAzky9DkbUb3S5iaSsgMNRQfxPIoS3sYzlL16oKbN+phGZpnwOWTpDZ0SY+aGgz4eCxv5m1omzmlKpTAE85WEOkUaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233788; c=relaxed/simple;
	bh=Q1YkebZUrPZ+GgQoBMbMW+kgGqhbdwwF1mvV7CgUO7E=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=srvW0VCWEYymuowkrL6DuqudTrdus6VhXdoYtaIiBzABAKdNs/PSw44W8R8qXW91pgnlJq5+/Xq8jeBUzqSd74ZuiiHxpvrIRyCeEDuW3WSMd9MsfkV54LTxNQn/qd3EUITz4IN4LQ5d03X6+9bimYENzupcpJ2GNVnmv4guOLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=PJMdyUWB; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="PJMdyUWB"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-91562bf6c12so60892085a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 20:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1781233785; x=1781838585; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xntfuOEIyHmvSchZsW5khUTybYSMKd02TC91c3C8o3U=;
        b=PJMdyUWBTAHPDTuTOi9JzGSrTzL8KFjAVV9flDcqb591cO2+vYn/T513vTlzJNPX9V
         eNbL6VEYy1hPvLMFxeoSvKOzPnr8izis2gcNUUsWg65SK6sn9quiwJiHvFI75Q5mxZ0t
         +wc3i8ryc5gzb1/tlnmUwDClbUT2sTmp4agkSre2EkJ0Kgbcc3ac6478VynbTDBa5cG4
         eqd8Nsb/HqhE5pXBf4DBYhkAwLMSamMrsPuqKXcZ2B6Cx0I52XYqIqkrJly/I+NdIDHh
         K8Zby/HU0nwR7ldU4kQbIsHhgvWyd+snIL3HYIXS2uLB3D/KKPsdmjq38Nwwu45ndLOq
         DP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781233785; x=1781838585;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xntfuOEIyHmvSchZsW5khUTybYSMKd02TC91c3C8o3U=;
        b=RxFfWJZF3bYvn4UKEfo0jbbRxfQpBlmCP94zdseSdIMb3t72S6sLGtCbqDhsrYdeaw
         jhmKcgIfEzuMC/2epLXz2S0QQqzUSzilGkDbRRcmcxz20tznV0rKeltSndbVomo3CNTG
         zRkeG+kE1NBtpeSFfqpCVh9sU0O4+SqjAy1bYAlLgUYHFYKKrfao//kaicwIybnyBDxw
         pTkXlJIfSxnJAjexoxlcUQIW54ed4sQUQ7cpSlgi7T0p95JOYj6y+8AaVqj9xOrS2Adg
         buNfPtHU4XSOqLOIGZOTO/ZketMF/rdWhsgm8HPWzaReYCM9RBH5vqWJrvySMCd/9x++
         3ABA==
X-Forwarded-Encrypted: i=1; AFNElJ+XlvmHdr6gze00GWNKNFVKKJgsqRGtL3Oczm9dg3yS5L6vM8Q6dnFC4FO4tChtsXQ8mGR0LHZVce10LISrdWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaezzZmNRHhhxBeZ2jjEQ2wcEY/vL1Vbtz4i1m8n6W1p4QMT3D
	P12wgFJJsXp9jMisE+dN6AvKAwRvgew5k2rf6dWCjtgd05E90/ZyvnV6ZlwRdZehvfA=
X-Gm-Gg: Acq92OFSBANmO6DuaXGkrveNFViHwEwcvm+ip4GFz7Rd5BFHwZsyB4Uq0Yf+easa5DQ
	fjhlEATh/qKyyN4Pd0p4Ak7zAdQ3m8rrdczXk/5MLrknabuOaRnc3So8+VehvYG61Tfn1onK22R
	qDa33YjnPE4WMeare6ggacI1Y2DPIcbiS657NCXv5Qm9LUJQdMZbVXHzi9zvjLYioM3+++Dyp6L
	RorGL2W8m9UcUdQi0lnyk/pl3gNC9OMZ6JrJu8h4Na9h/nyodcBVIHQWkl28ctLA2uq1kaozJGF
	KvyimaCjt2EoYB6HJRp8PrHpcfI7GaWQQZNP8Y/HBCDK8JHIuxVrZbDcMI1CTZ3Yjkv187G+bOy
	UxyICKwUhLvjg7yh1ddytKv3w6QL10QybD4/LGSaT3Y92M3YLmNbHSEQcKmIR56w1//eF3k0bTv
	PUeOKhrTekYDhTe1614Qlo/0b7a4ZYq75XhbVjBY5X2V4gbi7a/IwSP7x5zEbL
X-Received: by 2002:a05:622a:4d47:b0:517:6c96:8f1a with SMTP id d75a77b69052e-517fe1aa15emr12844031cf.10.1781233785185;
        Thu, 11 Jun 2026 20:09:45 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d301b271e7sm11280296d6.14.2026.06.11.20.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 20:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] selftests/liveupdate: Move luo_test_utils.*
 into a reusable library
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org, 
 tarunsahu@google.com, skhawaja@google.com, shuah@kernel.org, 
 dmatlack@google.com, linux-kernel@vger.kernel.org, 
 kexec@lists.infradead.org, linux-kselftest@vger.kernel.org
In-Reply-To: <20260610230909.876546-2-vipinsh@google.com>
References: <20260610230909.876546-1-vipinsh@google.com>
 <20260610230909.876546-2-vipinsh@google.com>
Date: Fri, 12 Jun 2026 03:09:32 +0000
Message-Id: <178123377286.908199.18067987861441109485.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=Q1YkebZUrPZ+GgQoBMbMW+kgGqhbdwwF1mvV7CgUO7E=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqK3h3yfnZ3jsS8JXkMaT63LIpe+05dXcE9vEaB
 MjDN1RDlxiJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCait4dwAKCRC7dyhM23N6
 3hcKEADBF8ES46NdBpAoiyCOsj/C0EyMwZsjl2QYNvWqEoOmvglcXhjyjEA/saicWvmlv2ESKK/
 cEe/l6FNqf+32DnjBDgCWEqDRtecDjgcBAv95FFSYGaMRrWBtrLBiYyOYrTcu1Iyeq/DWG33p6h
 5xcc7eplSuQZDaoUKMlfCVUo1kCppemkkwsEUHE+MoK+ak7tTciqzvhlQTJTkRgg6YTD0JCGz2g
 sWbh72GBFYg3+EIevwvEXJmekqatDlQiJQYxoO8C1TpL1qM5eNudiTdNRx6ccUrNBYWhV4vVeLN
 s0aNyYB0UjuLYNWinZu07/cToXq4Sg2o54HqojGGi5DOvAuZAHVP++KcGuLs4hRox44YPMqn2N5
 yIx9syfnW82SfCFqX6+P5gi4nsvZmmq+mBctMqe3BoDTnpfyOgch276qC6r7AbgKeE+AHv/lAVV
 NlpRJ2bVA9sF5KR1w5+/04jSXVw9INZGW1hQ0nVYTWWas6IR32j08JRWMJfRopCvoiLYqV8NFRZ
 Q44rnvJQOokVauCZmx9cOBA3NjXMl0sL5gS+VHnOD0B68r7rlArCDtEtmfrVZbrYB4Ha0vkStyW
 z84q9G264liybkQgdcVE4SEmggHpMl7psM75p+z2FU3n4qZbF8Eg0WXS0mm4qd0nxq4tOE6YVTB
 2sBcY5z7LmszQrA==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Wed, 10 Jun 2026 16:09:07 -0700, Vipin Sharma <vipinsh@google.com> wrote:
> diff --git a/tools/testing/selftests/liveupdate/lib/libliveupdate.mk b/tools/testing/selftests/liveupdate/lib/libliveupdate.mk
> new file mode 100644
> index 000000000000..0fb738c02330
> --- /dev/null
> +++ b/tools/testing/selftests/liveupdate/lib/libliveupdate.mk
> @@ -0,0 +1,20 @@
> [ ... skip 14 lines ... ]
> +	$(Q)mkdir -p $@
> +
> +$(LIBLIVEUPDATE_O): $(LIBLIVEUPDATE_OUTPUT)/%.o : $(LIBLIVEUPDATE_SRCDIR)/%.c | $(LIBLIVEUPDATE_OUTPUT)
> +	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
> +
> +EXTRA_CLEAN += $(LIBLIVEUPDATE_OUTPUT)

since this file contains utility functions (luo_open_device, luo_test, 
etc.), naming it liveupdate.c makes it sound like the main 
implementation rather than a test helper library. Using something 
distinct like lu_utils.c would make more sense.

>
> diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> similarity index 99%
> rename from tools/testing/selftests/liveupdate/luo_test_utils.c
> rename to tools/testing/selftests/liveupdate/lib/liveupdate.c
> index 333a3530051b..897c200f3845 100644
> --- a/tools/testing/selftests/liveupdate/luo_test_utils.c
> +++ b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> @@ -22,7 +22,7 @@
>  #include <errno.h>
>  #include <stdarg.h>
>  
> -#include "luo_test_utils.h"
> +#include <libliveupdate.h>

Linux kernel coding style generally prefers block headers to be sorted 
alphabetically.

>
> diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
> index 502fb3567e38..6bfd4e53528c 100644
> --- a/tools/testing/selftests/liveupdate/liveupdate.c
> +++ b/tools/testing/selftests/liveupdate/liveupdate.c
> @@ -25,8 +25,8 @@
>  #include <unistd.h>
>  
>  #include <linux/liveupdate.h>
> +#include <libliveupdate.h>

Please sort alphabetically

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
