Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B0F344DAE
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 19:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775848763; cv=none; b=nad7+EJUKgpn4r6aJz20MMrIl3veL5rIopHsmli3Cu5hBiglJp451HE0EPPeYyYS2dWb0jLCxbzzmb/la4EiZthkAezGJIxS7DN3Ua0M9i8Jl+IGKEtYwDm5cDWPT+vhZRP/hfDPq05B3QkOR8ARL8sVgAoZixGJTe9bibCbHWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775848763; c=relaxed/simple;
	bh=k5ZumHR02eepfJezSIqhe8isG+ypbh6AHNXxsyT/g5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPIv2JUtbGFFHJUN2lIGuBFxqjxw5BebSwhFfzYXjcgoKAyF14be1Z8hSOEsb17rLZL1jpByZXkjW9bsdmyb1hlPR+yTvwKlM+9FPQDaO8zWYazFcPsnDhd/EfU0cheoUS1jFZHmhjiTWk67G+76EeaDFxArNDJxs3YB57mua/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=giNxx1/i; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="giNxx1/i"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-68470763896so1261769eaf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 12:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775848760; x=1776453560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=liiHzz5YU4jNl+5v9Ct+tlRl/EZvkJ/YkQlCHPtfo8w=;
        b=giNxx1/iZv1xhPbHhMCOZk6edPvBeog0b5lbWQlIEiPzd6nqABW4lc+QSoEtSffJG7
         Ld40mBkZoEHUfMGY/JNAmcIaaOd4FC2mOb3jo1rvPXOllAG6f+zxQpGHNvSf37rSqPFM
         +3KfyCHQm2RaJPYETFtS+Z+Wzrea7SbgRtyUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775848760; x=1776453560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liiHzz5YU4jNl+5v9Ct+tlRl/EZvkJ/YkQlCHPtfo8w=;
        b=eYLi4dJmydVnEPhOB2dJDSBWxTnAJ7+hL6vN3mV+EWLSHgs5ZK9AQTiZWAc3zBxxSW
         da+3yoffUzIDZdspR1XbBgLCSg51ilkVLQf0SgOpEQ7kV8CZlgKuP+9HDt8pTtvZL0RH
         lJ3YdXY6s/co8AESxRaPqokuMcQZby9h67EtAZ1PzMjLaxpD1DeahsDrgvDfmx442hD0
         geXTDGWjEY+bZ8dXL/Sw507aj9zFTwr3Xb8HyUQL+EYu5mF2p9E7QgE2ru8n1DFb+EVr
         7yvhXt4RjeSg45vAJVQRMZLAW/icV/ZJUzoul4AUDblILF8m5Wdfqaas7xyRvqHSjkSx
         QHfA==
X-Gm-Message-State: AOJu0Yx2KkLlEit07LqD9qi+oNNroGEedc8/Ec64YAoE7LWGu9Sgoe20
	BFhWgJj6uCK8sCAIagYV8Rq1Fp2IaomZFSs/SXEZeGlRqThF40yOwT2FvwDgJzm4+Uc=
X-Gm-Gg: AeBDieuTH527HMNYf2B+zFG4/g+F8LPUVpfuTRmOIaPVbnx+QIZ3vL6oqGlsdh7yiTQ
	U2TcRMwenYY15iC9UJ5bwPJcUp3Pef3wB7WJequi0wZAskRdAvZtsUZo+Ql6h5OXrqldaKZWVjI
	cOC8QF8uTMXy919qlU8c2B0MNeDY3QdFTx6yX49FP/G+4gLYMWpt3qIDn9qxDLwHgkNT7tJ36Io
	rhj6JxvdYMbi14BTWhC41UUvs9AYKz8GaqCc4LqXK3Y/ziiqqylYCTsGWX3z26Ts+0Qinof6n7O
	B9JvfCUBL/vJFmccVR/KGwnXPTfqkrBw03Wrq7O+XDDmDOTeOg4oEfY0HHw3NE2USIyZee1+RPJ
	cqwUSdmynOkI8MjqLeZsdZU+BcgDqvWUB/XNwQau8AstmHW/VsLw8IOa7ZFZ8/QKV5lJ5tP3aqC
	DU9JNUEUbLC5vQ9Jr1HJrdKu6Z2kHQvb2axmg=
X-Received: by 2002:a05:6820:62a:b0:67e:310a:3638 with SMTP id 006d021491bc7-68be57782f1mr2272301eaf.6.1775848760525;
        Fri, 10 Apr 2026 12:19:20 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-68bc88c80a7sm1819630eaf.8.2026.04.10.12.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 12:19:19 -0700 (PDT)
Message-ID: <0db1075e-4273-4504-9c3e-1a9f35d37998@linuxfoundation.org>
Date: Fri, 10 Apr 2026 13:19:18 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] kbuild: remove kselftest output in mrproper
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-6-79144f76be01@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260320-selftests-fixes-v1-6-79144f76be01@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/20/26 12:29, Ricardo B. Marlière wrote:
> Selftests built with O= store generated files by default under
> $(objtree)/kselftest. Those files are not removed by mrproper today, so
> stale generated artifacts can survive across builds and be reused
> unexpectedly.
> 
> Add kselftest to MRPROPER_FILES, so that the default kselftest output
> directory as part of mrproper target.

Does this change remove kselftest build objects in-tree builds?
It didn't for me - also there is kselftest directory under
tools/selftests that has several scripts.

Can you test this for in-tree builds - I would like this work
for both.

I dropped this from my next for now. This can go through kbuild
tree.

> 
> Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
> ---
>   Makefile | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index c9b7bee102e8..91e6ec790a0f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1662,6 +1662,7 @@ MRPROPER_FILES += include/config include/generated          \
>   		  debian snap tar-install PKGBUILD pacman \
>   		  .config .config.old .version \
>   		  Module.symvers \
> +		  kselftest \
>   		  certs/signing_key.pem \
>   		  certs/x509.genkey \
>   		  vmlinux-gdb.py \
> 

thanks,
-- Shuah
