Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1473C8C71
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 06:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782456137; cv=none; b=XQ/bXCW3DjH4HeRty+2uILtMqg2V0yxLH86q/qIXt9v67j4XjuCRwvK70EU48GL+9k3CFK32CdRrjwmXE5dBEopWhlKrmPuWLtV9aPvmhijH708ffMlwk4Oehu8X0kS+qpkjFqZK9lyprXjvUwA8emP7T0pdmmCceLzNBo+eOD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782456137; c=relaxed/simple;
	bh=fje9UXyWv8yL9YNs3YAeiDc/M9FDtyBCWEc+3DeCnmc=;
	h=From:To:Cc:Subject:Date:Message-ID:References:MIME-Version:
	 Content-Type; b=bwkk6HPKA6CdPIoHAyD3v5aWPB62UmOJHvf1ATPImTpJgi/vQo4gwGpvOk5Z5IGH6V7UUH/eS11qaWo9m935Pkq2cCjTjxBesW4OgUT0ioaNYitLpJirit/bJLCu7CvlnfaDtfXn3bzRHASI+ELj+5t4BLwnFPvTTXHuvbm09jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISo2Ik0P; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISo2Ik0P"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso7823505e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 23:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782456134; x=1783060934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=56xRi217GtHBHYQHJbgA7YLUn0MAQQE1vLXLfDs7/8U=;
        b=ISo2Ik0PSI7NsnY8GaQtAqk6chmMk1HDC/GMrq0RI6GawERtsBdrxDQ+szzbV+layS
         73LWpPcLREOQEbyDilRwOHRDWY37V7Gyd2hL9ThFE0GaOPE+4kUGEjRRvPGf1U2xxd9B
         AjUFPp9F6oDqlZgS+oKn8hCmaPeD/HYm36U14bs2GaKBdZr97uioB7p1eYDbnLVtUkJw
         wDoMqlc4fb987E4NU6dg2xjkviiwPdP0WkSCbMxDmkFZ19I1vCjLSBWhwLrG9gqqcvAH
         dXavnd6NIsqDGRFf+rCTZJOx8Q96vU34p6F69iN8xJhq8pi2HFKW4kIEW38k43nDXDCI
         uRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782456134; x=1783060934;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=56xRi217GtHBHYQHJbgA7YLUn0MAQQE1vLXLfDs7/8U=;
        b=g4Qy/69L+ycNZBfer8DQSGlstISEj6NXSJt863o5M+Vv0r2FPJrnzrg1ZLOuaMP0V+
         uHfH7FgSkiD32HekQNv9vqGnrMlcMaDrxojIk2akXVVcuGbvUx8lYGgGYacFJqid8rW6
         Z6mFj1vFAaSDGpCywWneHcEJRWaV4RYKpxibLZ+tJoI6+yDaysZnZWDx5q8o+vVsrXTG
         7FBytwEPWu741rh46ffLumVmSUOWtm5+QoicLfRCAvs1zi2z6FOkVzATYLbQaOinkDYU
         Dmy6vvk7M/AF0tWFoeVkt2/J5cV9RuX8I2Xk8EcaWXLEJ0jTp4q+I6mfb2GAt4R1ss8T
         FF+g==
X-Forwarded-Encrypted: i=1; AFNElJ+G8ezOEfCHY1BcXVjbaMr1SrMyd6pQtgumhSnS1nZFVqE4TXJqWplAUD4Yp2qT2ekH3NcGw8lk6HyazzHa2h4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuATJvd3D3bfmlY11p9Lk3U+/S1ITzbg+dbh//5T1qrUdcrCAb
	sNWE3Eb64Dw5OqBKuOG8np94FVbfDEGWSgqF9gR7D+P92mZbiuwCClF6F/Bk+t4rkWZnUQ==
X-Gm-Gg: AfdE7ck35MQOwUuhrm6jQNWqCaQ5fEIWjk8SXNiATYYaqBjFuVA5yaGsya2+XXUS8rI
	b+UC8pL6yzEsD3TYScJgXZexDXgWDfjowD98owcQ3oXKnbcXSUmq2YWcbFrTnt0xn139a2HT8Hh
	RBsPJ5M4cR0snWSQAyMPUxBkYorvXEyP/Dzhjg/g/AR+gJYbm3NVvszp/cp7zjMASgwbWlPtPet
	cy0RSThU/U4C+krAj1E4XnT5zkyWio8tNrGchWyPaTgspN1jIYSvMA+M0zEnZ2rNGxecDXMlYul
	dubjRkgZ8nsLW3B/6OgNVVAG4gkKQfvmyvczwALULmbvWfDt2XuUcciMIo0YUNiJTKPH8zmlRTY
	3P0pWv8WZbq7uc47jYVMiuKqOM6P7aOSkHQZgdoQ/ldjilYviXYM9cdEjNwUEy+cYkwjzM9aDzl
	x+nDBsJ6POaVL7XRfAwAg=
X-Received: by 2002:a05:600c:a55:b0:492:59fe:4a15 with SMTP id 5b1f17b1804b1-4926687e800mr77770015e9.24.1782456134354;
        Thu, 25 Jun 2026 23:42:14 -0700 (PDT)
Received: from beast.localnet ([2a00:c281:1461:c400:bf16:e4f3:7fa:c2dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960991sm15326122f8f.6.2026.06.25.23.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:42:13 -0700 (PDT)
From: borissh1983@gmail.com
To: Sebastian Reichel <sre@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] selftests: helpers: handle multi line in
 test_sysfs_prop_optional_list
Date: Fri, 26 Jun 2026 09:40:37 +0300
Message-ID: <12928066.O9o76ZdvQC@beast>
References: <20260625125237.36605-1-borissh1983@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, 25 June 2026 15:52:37 Israel Daylight Time Boris Shtrasman wrote:
> Modify test_sysfs_prop_optional_list to allow multi line parameters, in
> order to comply with checkpatch output that limit line by 100 chars.
> 
> Allow use cases like:
> 
> test_sysfs_prop_optional_list \
>         property_name "value1","value2","val3","very_long_option"\
>         ,"extra_long_option" \
> 	,"even_more_data"
> 
> Signed-off-by: Boris Shtrasman <borissh1983@gmail.com>
> ---
>  tools/testing/selftests/power_supply/helpers.sh | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/power_supply/helpers.sh b/tools/testing/selftests/power_supply/helpers.sh
> index 1ec90d7c9108..8535cb7ed094 100644
> --- a/tools/testing/selftests/power_supply/helpers.sh
> +++ b/tools/testing/selftests/power_supply/helpers.sh
> @@ -108,7 +108,7 @@ test_sysfs_prop_optional_range() {
>  
>  test_sysfs_prop_optional_list() {
>  	PROP=$1
> -	LIST=$2
> +	shift
>  
>  	TEST_NAME="$DEVNAME".sysfs."$PROP"
>  
> @@ -118,9 +118,9 @@ test_sysfs_prop_optional_list() {
>  	valid=0
>  
>  	OLDIFS=$IFS
> -	IFS=","
> -	for item in $LIST; do
> -		if [ "$DATA" = "$item" ]; then
> +	IFS=",IFS"
> +	for item in $*; do
> +		if [ "$item" ] && [ "$DATA" = "$item" ]; then
>  			valid=1
>  			break
>  		fi
> 

A new version of this patch now at 
https://lore.kernel.org/linux-pm/20260625160556.54830-1-borissh1983@gmail.com/



