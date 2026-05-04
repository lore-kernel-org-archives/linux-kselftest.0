Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26F838757D
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777936370; cv=none; b=j/NAuX313JtLjQDzCF3tnZNHby2ukj+lglsGp9VhD0x9h4qgwMW6bkbKbqyFp36HdY10PJE/KEbqxyupvrj9MH06y09EJ2uUz4d6MntdjfvvxuK8EPRhnCol0Zlbr4dC43mYzWZJz3saiGWi/uMCadBRPR2tbaSGQCYxY2Nmvs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777936370; c=relaxed/simple;
	bh=51YSDVpCM4joz7DXQSMRp69btRBFH1OAF2Z+FuTebAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=glX4M/vcSTO56zoyA+kAKrHCu1DKx7cYOPmsu7rt4nmtOFMCISgQhcx1oVDVwcVDRJFmkseivFAskegEnEk92/k145WNp67+kU0tCaYf/+s7ZwaMd0kgLtxiE/XVHeAEfI3Tf3HQ7mPAoRC6dnXnpGV2zs4LLleDfOC8kdMnPls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dK6fubt3; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dK6fubt3"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7de46b8e432so4439954a34.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 16:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777936368; x=1778541168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AruTxQ0hr+9q/sh48aA4uF5Lj1SVXlCYuVqwgatGHzU=;
        b=dK6fubt3Ycoa7VVi2x8ePtg1a7Of6yp/ngUHUVh43TBR0miLMw6lxaahTe7DPRvGGO
         k50XHdKUqfk2nSblxaRbthi8opaIDG9fbymtzcUJch28IU9a6CGZjBHgy3+ApGDqHPlC
         nc1hUOV5MvtrbvYRN9mbczflSiWjRe6FqnkvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777936368; x=1778541168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AruTxQ0hr+9q/sh48aA4uF5Lj1SVXlCYuVqwgatGHzU=;
        b=gfj6MpeCIqypOqomBgUXNgyjZPGw/8yW8PZ/WXRQlKkCoDw4Rj8dDjIau3ikgww4KS
         PRoweHgbeuOVqb94JnZsRCTx4ssJg8gZiVQj2nB1WQmHaZyG8sUWUei0ZRINBlLPeuHI
         q7OTAefWEL0p8eVniAMhPnMoXTNUE0ACIFFC7BlnHoRjrfttNk5J9pIaPc/+U/Tpg3Zu
         eSvoqwL4ayqeJk59O0+UY93ic+P/slSNVON7Q2gGRJpHNhStg8gTlENERlCjBwS+eDol
         ZKZu9ksY+m4rLC/jgW6ToAU2GLikWpFADTY+peTp/WdUEoJIH6BAIA54tFcEa2+mfIEx
         +dNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eMSc+A8MqkGLl+9HHXgJOFN99Vv84BOf3oMZzSuACRa+nisHyLeMeO++djBMii8hBX3QMrxtgyxgTYW0Q7no=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw7VSDtx+3pcZin2jQTgmGqBAdznyWNIKDLxYqm8/GztkZQ0XT
	YS4gU19dUqeqiORhYw327B3rpmDZATj5ppy3HI8qjiytxeuIBpBFzTZjInyTCc0nVio=
X-Gm-Gg: AeBDiev0VrsdF7pxhn8qdI8yleCmD1pFdAH0jk+F/IZqwdKY8iA7JrUgs9vaLd7V9iT
	AF9Cd7bPMLsuY/cR9b2+ok/02Zqayix+RVbYZfMsveI3RQTmnZzsRsVg+ip1oE4QBM64/+fSZtg
	cuOcUQCpH38sv6SElOKCGBgTEg2DMjcINSmv2BbJnw0JjGXxcCOYmVnllu520G39vsepE4i5j79
	jf70J4h5Km6hYoG2ZgebtsuBqQGp/xv9+SoA21RjyA3VaIh6/3nNbQ5OnIlW9EF5nJ4QhlpIkBt
	QlX6YJA0L1v1SD0p7iTRp9MnhlAgOb0sHAOdmHpc0ePL8DDjjELe2P957SBrM0rAUjLOrBLUwAo
	hTLUddgN6+qnQItz7ymKd0692PHTd06trkcQJlD2p/rVZYBBT8VGKeSZQ8aZ9Ui18VCHwUtOkAZ
	Wo9CXHjO6EmP/OVpe6hgI34HfTXEMx42MuFGDRFFTItw==
X-Received: by 2002:a05:6830:6401:b0:7d7:f13a:761c with SMTP id 46e09a7af769-7dee14371b8mr6223816a34.23.1777936367846;
        Mon, 04 May 2026 16:12:47 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deca7a902asm9073293a34.5.2026.05.04.16.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 16:12:47 -0700 (PDT)
Message-ID: <4e9175ca-1b1c-40ba-83de-f9ca8c9c9a28@linuxfoundation.org>
Date: Mon, 4 May 2026 17:12:45 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] selftests/resctrl: Fixes and improvements
 focused on Intel platforms
To: Reinette Chatre <reinette.chatre@intel.com>, shuah@kernel.org,
 Dave.Martin@arm.com, james.morse@arm.com, tony.luck@intel.com,
 babu.moger@amd.com, ilpo.jarvinen@linux.intel.com
Cc: fenghuay@nvidia.com, peternewman@google.com, zide.chen@intel.com,
 dapeng1.mi@linux.intel.com, ben.horgan@arm.com, yu.c.chen@intel.com,
 jason.zeng@intel.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1775266384.git.reinette.chatre@intel.com>
 <2598acd3-542f-4c90-b46d-dc64c6cdc700@intel.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <2598acd3-542f-4c90-b46d-dc64c6cdc700@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/4/26 16:57, Reinette Chatre wrote:
> Hi Shuah,
> 
> I confirmed that this series continues to apply cleanly to current HEAD [1] of the
> kselftest repo's "next" branch.
> Could you please consider this series for inclusion?
> 

Quick note to say I will apply these to kselftest next for 7.2

thanks,
-- Shuah
