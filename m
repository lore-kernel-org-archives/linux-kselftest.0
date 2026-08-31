Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ADB3B8BCC
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164040; cv=none; b=KPHIWKICZ+Y5K/80+7k8rzneVmHjqHCEHTztDYBUm0s/6WKjK8UqrSWZ4/3jUVKwLnkxUpKZrC627hCu3GVWN6SzRQP61CybHuUYTqsHhokdZrZsyCBAZRTH0P+E0eez07xQyvqWASNC45ySZw14MUFLyEXyg1tlV9KTXg9qfIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164040; c=relaxed/simple;
	bh=nSpW9BfmTHNhgEttguu8dKSf2X+UrvTImngFQ4Y2OMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKWYRnyesNxpHPfsQG3AAjfi93h7L+kJElqxLsG8Hw85agwWnDZd/z3b9+xMeolt2Z04XKRi+r7hoJ6l4bv4o/wzE+8M9+9bxctmgfYXhxW7CLyDyGW9ejzDRPg1QfTCkv9vATiDab1iIIsft0ATW/RvjRM/xqLvth/DT15QR0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=Y8yj9esm; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="Y8yj9esm"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2533d83e3bso524058066b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1788164035; x=1788768835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrTpW37S+1M6EBPYov19PswiAAuwlv9L2hIKGUyEp3o=;
        b=Y8yj9esmg14+XCwE4Z6zym+S/kB132EGaStAj+lF9Q/SOACFyJwKZE4ZC3i5oxnfyx
         oXIvrYrO1T0H6ygmakW8qt2m+iIVSwtRIGmdxc+aI1FRFm68zopjsvYpMzp7NA4oD9Ks
         WbOUkZiEJpBJ5fqGLqZaUzEZUbYCVdhGSL85o0gsaU67+ppTBM9b1eYPjW8N+1a/mnxw
         z0yDwusD5TJ3XMpnIQWXT8tg4qJm0uX/d5/3b+vzlZoxWfKXKVrArDnXh9EkxH8uqbfV
         Eq4CfqPKbBXQnyWYb3irEVvXInmNf6vL7k33GcoobMxahb6mHej21q3AWul0BrHIh8SV
         GsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164035; x=1788768835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrTpW37S+1M6EBPYov19PswiAAuwlv9L2hIKGUyEp3o=;
        b=WpgjWSN29fPvP844xjuzoYcmb/rptM5BOjUC9dRh2L2HJFSJLMb3U2vF06Cn8gyLX+
         qmiDOqyygMfD1EC4SjnB/pLCRJWy0cVnYdGi/stW+DLii90MqqTJLiVSSqe3y+UcfdC5
         k/z9JlyyVaZ7oaV++Ere61aLMwMIaCcghfK3PDAbn35CbEa6wHiWe4BOrX4+uPu3LDhb
         CTeCsaXsY43zpcIxh0SZecsPkmquWGXYIVzeCOD+WD4h3Pm4smQHz3aQJlG6zbE6pxpB
         oiFCkTvKz2hnDes5u6YwVjFnf0uuX0PRhdxAUmjrX4PtAnGiD2g1CkRzzOSih2Je+io0
         0Ztw==
X-Forwarded-Encrypted: i=1; AKwUvBwVxFAt3QI0OXR7/F8q40EeqcgPz7jiiJvq7069TKnMXBLDpiU0UxE2xSoJG+IrynfpPUnmfr6J6OBsbUlLR2w=@vger.kernel.org
X-Gm-Message-State: AFuF++mTn/l4dmjZC940H7C+ifjSnGagJk25SBL4IxB+8qd9CoEsNelH
	1WbwFsP+aw4JyMro1DBCcaIpBapsTDLt/R/WzHaMvcqobKCf+vvMBLrCN7cyGH9oRw==
X-Gm-Gg: AR+sD10OyNHn1r/rZ6QPnXvbvCJB2KQTWsuvJ7Bsbz5yrwisSzSOZu41NxPS3hyGPYx
	LCTebodgFg3G8n2ZLqbR5wt+CRpIyS3+uW1JPWn+HY7Qfj3qsb1BnsqWjL9Ploc4bKoMDAdeJPk
	jgh5y+KGfeiR2rfr3RhoYpQgV/FjxRyX1KisTq/X8ezrk9hzOoO4IgXzXngxWqhYWp5TPvNx6Wi
	4nZz70U9wwPqnZDDypggaiOpHm9r5gwdLzYWeNUNv9ZU5sER3itiOYa6h3S/B2XV3g3cDQLP9MV
	AqavzzGVQ3L6Nq+ZMQkhPfB//+tuNPhP5Rk9HRHoeD6JUcyU52/VeAKLzkZx3UERC90FcseuZQ+
	lJg9EUem5tOihfIGB2ZJgXxUKjEpX6w05fX4yEFWgyluNRVcx6kUQkaVO0NKj9E4tWIac8Dg+87
	OXqlsucM/IMi/jNaEWV11bMgHIRAzG+/4I6q0IvoCJHDaGjhqQe1JovrQHWTHhwCJmILGko+IaK
	+MAYCYJ+3Wz+EFzFyy/csZETxECztVX87NC
X-Received: by 2002:a17:907:d006:b0:c20:56e8:5457 with SMTP id a640c23a62f3a-c25ab2f4743mr117117466b.6.1788164035012;
        Mon, 31 Aug 2026 01:13:55 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09c68sm390058166b.7.2026.08.31.01.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:13:54 -0700 (PDT)
Message-ID: <0b5cbed3-ce1e-4f8c-9a24-422eb8a55806@monstr.eu>
Date: Mon, 31 Aug 2026 10:13:52 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] microblaze: reset: Call POWER_OFF handlers
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-2-6dcdfe12eb40@weissschuh.net>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260804-kunit-microblaze-v1-2-6dcdfe12eb40@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/4/26 07:32, Thomas Weißschuh wrote:
> System power off might be implemented through sys_off handlers.
> 
> Currently these are not respected on microblaze.
> 
> On power_off call into the generic power off function which will execute
> all regustered handlers.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>   arch/microblaze/kernel/reset.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/reset.c
> index 2f66c7963084..3612a20ca16d 100644
> --- a/arch/microblaze/kernel/reset.c
> +++ b/arch/microblaze/kernel/reset.c
> @@ -27,6 +27,7 @@ void machine_halt(void)
>   
>   void machine_power_off(void)
>   {
> +	do_kernel_power_off();
>   	pr_notice("Machine power off...\n");

Likely it should be here. Or you will never see this notice.


>   	while (1)
>   		;
> 

M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

