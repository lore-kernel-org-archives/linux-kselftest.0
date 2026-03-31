Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D34F3A4532
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 19:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984388; cv=none; b=aP2JOHqfTfZnZa14FqYHiPPJGGPqgpYDmTgbYsn4Rue+g2PR2zAttkwduFCAg+GznrFE3al5+yNpkj7SWdwMsHp2H3dCMNotA6jKdj1c4SsNiB5rngIajs3+JDM0FFCxz5uRnmXLUHyU5U9qgsK9nSxeM73C6AH+aPjt4LyX6SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984388; c=relaxed/simple;
	bh=hl8AtJX6I7d4e7IwG035sd2dO77DSoqLPGsnHW6EB0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJzuPTsOUr+ZWaBDcT0MBTX6+rgvQKVcrG+eIfMBwmAtoVMSHcs5wyV3n5sJ5kvuqLYt45ZbdK4i05D4cNi1Chc/pgNlNftu+Y+5VKOWFMQWA4fKqFs6m7ZKZXlpUnG3a3VLA8YG9yy9xPhyFEE4hQMmxInE+vPIkoEF5pGQp3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GMTBYy1b; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GMTBYy1b"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-67c2045c0f7so3017603eaf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 12:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774984386; x=1775589186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JFbNda8GpywTskESpPvkrm6fXAaL7MDAY2UtfW+3Q7k=;
        b=GMTBYy1bYAMSTJFxJxAG0jWo0B1B7gY1Q6tAyoR8fd3ISAjPqN0AgcMBnhr3QiqxHk
         3Es1DX9MJ8HTFK3PpWPd6IIA6VX9XeLuYOTHVk05INpJvknImOLeZhNoEzI6F5/ONmUP
         JwogIJoxxN7or0e/lGmmiQEhfJwx5gpIAIuEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984386; x=1775589186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFbNda8GpywTskESpPvkrm6fXAaL7MDAY2UtfW+3Q7k=;
        b=TKw9nVzwyFeRsR+NRbYVUbD5P0XoiKxL2HG0+bCERpqDKAHKIPjlb4kkIWGjPnwCeM
         oegBXmVJHjbBMtFiXJXqsEA8FRqYjRJO0OO7cLjqPL84m13pZT9HxZPD0M/E18tQPaZa
         ENRFxJ/ZPjpKJBCzMcYuY/YZoKo93QpJi5u0qPdqLc4HLZsUjRCce9TviB+lOLgghIT8
         +bgg1OHRmsYwzL+Qz7C+24IZviwRs/Ay1OY/I7WjrxZqPBMtDuoNHyiyZFTp0Cfhp+1B
         reoTk4cg0Nic3/xJTGIMw7AMcnYj9wXtkJqb1gLGVIhI9WLqEheDSWJiEhaPVPT+44gg
         SqmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTMYWqsidAJ0UWKmfH0c1PTNXkW6RkpS1J5YaicqyC/eiohqv9s3YH56TOeTwrLRo/t/TeREEImUiYTQ083rE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSNJGsbPsyVQdCwaO3T/P118XPD6R21Cc6Zj6AC+OBcK+uJAEG
	gHC/6eJGS2P9VSlz/1aXSTis3ibBpVuxJc8aOak1E9muhdUZh1cdn8hck229laMMwxg=
X-Gm-Gg: ATEYQzyBE6GKo1Tmo7bwqDZgfQB+ew7GZVFe9J043TAbvJxYxMKz1dco9ZCRE2cdUki
	JnzzM6MMC3gt/CnJvTfi9VnSVJ0OpwKhmU/FuAf7RU2/KSIWNWkHKUnYdfZA4aV5GC0MsVLp8SF
	fj7oRBPLOu9lXDYNlavwEz5h45V021Ad1bF6EhoX0qQp0kiPZW8Hy9Buvn3Rm6H72QWTH122YqY
	4hSB3omcdUp0iPHwHD1A/3XLOOiKrnt0+dy1dvpaQQnbOVg4y0DYqiT6gOSCwLcBLn0i11Aakro
	v59K8uGbUHd2v296iVSh/Obgv+zM+amuoydUyioUlYzpyH/j99m/WL8EQgJRgO/j0Cb02GyISiU
	k9fasQgfsZGJBjWcWnCqdmXglaAWrdM3s5C4EeIJrgxe+HbY13+lc3NKn2SOibOtL3OrUpO7N0F
	mOFK7z/Kp8ca1K/aa/sMBfb+N9+tQPoBEKoOnrz2jR61I+8w==
X-Received: by 2002:a05:6820:1a0f:b0:67e:160c:36a1 with SMTP id 006d021491bc7-67fabca3628mr286496eaf.31.1774984385963;
        Tue, 31 Mar 2026 12:13:05 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e2305db5dsm7419592eaf.4.2026.03.31.12.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 12:13:05 -0700 (PDT)
Message-ID: <17b0f9ea-ea81-489c-8a8b-f3118d3d28f3@linuxfoundation.org>
Date: Tue, 31 Mar 2026 13:13:03 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] selftests/resctrl: Fixes and improvements
 focused on Intel platforms
To: Reinette Chatre <reinette.chatre@intel.com>, shuah@kernel.org,
 Dave.Martin@arm.com, james.morse@arm.com, tony.luck@intel.com,
 babu.moger@amd.com, ilpo.jarvinen@linux.intel.com
Cc: fenghuay@nvidia.com, peternewman@google.com, zide.chen@intel.com,
 dapeng1.mi@linux.intel.com, ben.horgan@arm.com, yu.c.chen@intel.com,
 jason.zeng@intel.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1773432891.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <cover.1773432891.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/26 14:32, Reinette Chatre wrote:
> Changes since v2:
> - v2: https://lore.kernel.org/linux-patches/cover.1772582958.git.reinette.chatre@intel.com/
> - Rebased on top of v7.0-rc3.
> - Split "selftests/resctrl: Improve accuracy of cache occupancy test" into
>    changes impacting L3 and L2 respectively. (Ilpo)
> - "long_mask" -> "full_mask", "return_value" -> "measurement", "org_count"
>    -> "orig_count". (Ilpo)
> - Use PATH_MAX where appropriate. (Ilpo)
> - Handle errors first to reduce indentation. (Ilpo)
> - Detailed changes in changelogs.
> - No functional changes since v2. Series tested by running 20 iterations of all
>    tests on Emerald Rapids, Granite Rapids, Sapphire Rapids, Ice Lake, Sierra
>    Forest, and Broadwell.
> 
> Changes since v1:
> - v1: https://lore.kernel.org/lkml/cover.1770406608.git.reinette.chatre@intel.com/
> - The new perf interface that resctrl selftests can utilize has been accepted and
>    merged into v7.0-rc2. This series can thus now be considered for inclusion.
>    For reference,
>    commit 6a8a48644c4b ("perf/x86/intel/uncore: Add per-scheduler IMC CAS count events")
>    The resctrl selftest changes making use of the new perf interface are backward
>    compatible. The selftests do not require a v7.0-rc2 kernel to run but the
>    tests can only pass on recent Intel platforms running v7.0-rc2 or later.
> - Combine the two outstanding resctrl selftest submissions into one series
>    for easier tracking:
>    https://lore.kernel.org/lkml/084e82b5c29d75f16f24af8768d50d39ba0118a5.1769101788.git.reinette.chatre@intel.com/
>    https://lore.kernel.org/lkml/cover.1770406608.git.reinette.chatre@intel.com/
> - Fix typo in changelog of "selftests/resctrl: Improve accuracy of cache
>    occupancy test": "the data my be in L2" -> "the data may be in L2"
> - Add Zide Chen's RB tags.
> 
> Cover letter updated to be accurate wrt perf changes:
> 
> The resctrl selftests fail on recent Intel platforms. Intermittent failures
> in the CAT test and permanent failures of MBM and MBA tests on new platforms
> like Sierra Forest and Granite Rapids.
> 
> The MBM and MBA resctrl selftests both generate memory traffic and compare the
> memory bandwidth measurements between the iMC PMUs and MBM to determine pass or
> fail. Both these tests are failing on recent platforms like Sierra Forest and
> Granite Rapids that have two events that need to be read and combined
> for a total memory bandwidth count instead of the single event available on
> earlier platforms.
> 
> resctrl selftests prefer to obtain event details via sysfs instead of adding
> model specific details on which events to read. Enhancements to perf to expose
> the new event details are available since:
>   commit 6a8a48644c4b ("perf/x86/intel/uncore: Add per-scheduler IMC CAS count events")
> This series demonstrates use of the new sysfs interface to perf
> to obtain accurate iMC read memory bandwidth measurements.
> 
> An additional issue with all the tests is that these selftests are part
> performance tests and determine pass/fail on performance heuristics selected
> after running the tests on a variety of platforms. When new platforms
> arrive the previous heuristics may cause the tests to fail. These failures are
> not because of an issue with the resctrl subsystem the tests intend to test
> but because of the architectural changes in the new platforms.
> 
> Adapt the resctrl tests to not be as sensitive to architectural changes
> while adjusting the remaining heuristics to ensure tests pass on a variety
> of platforms. More details in individual patches.
> 
> Tested by running 100 iterations of all tests on Emerald Rapids, Granite
> Rapids, Sapphire Rapids, Ice Lake, Sierra Forest, and Broadwell.
> 
> Reinette Chatre (10):
>    selftests/resctrl: Improve accuracy of cache occupancy test
>    selftests/resctrl: Reduce interference from L2 occupancy during cache
>      occupancy test
>    selftests/resctrl: Do not store iMC counter value in counter config
>      structure
>    selftests/resctrl: Prepare for parsing multiple events per iMC
>    selftests/resctrl: Support multiple events associated with iMC
>    selftests/resctrl: Increase size of buffer used in MBM and MBA tests
>    selftests/resctrl: Raise threshold at which MBM and PMU values are
>      compared
>    selftests/resctrl: Remove requirement on cache miss rate
>    selftests/resctrl: Simplify perf usage in CAT test
>    selftests/resctrl: Reduce L2 impact on CAT test
> 

Let me know if this series is ready to go into Linux 7.1

thanks,
-- Shuah
