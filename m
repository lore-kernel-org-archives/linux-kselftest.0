Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C3C30EF6C
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 20:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366883; cv=none; b=j2bw4bTL6ouMU/l/5WGtL56Qlf3CwXM7Z7HveRZQ/cIM2IaSLa1k+Dnk/1gy5zbjmOQJRbwySqhpkUflokB5cfUfRpqRfVMhnWchIoV2aPXPIM7f0ZKCZ4vcjuQCCnpbTdocyyp4oBPlAH73B++++6ndDt5NSeNKKQbhF+FFfY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366883; c=relaxed/simple;
	bh=MkCbV2C/+Z4zSk4k/R/6Wh6vMD0Jf/jg3bhgXczLsLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnfYwP/kmjYZusOleTnHOUasOgBYqFLCi5q+h7k0zLOsvOrc0VUnE2fUPCqpsu6oFfwaJfpFHWtNM9lsU+vGczzusyRNa83qPz60TXV9loeXxn/TrAtvKzbvmpCsuKt1CUbWXnSobQY0ZBRZp7F25PBn89f4E7flNMXJZOjP7z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gnjCrU1g; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gnjCrU1g"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so7656645e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 13:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790366879; x=1790971679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYKp+bFSterpr+lY2+5QJKDt27P8MnJ6X1EK8+K6uLs=;
        b=gnjCrU1gtBzNm1n5C9GbEiQHuPxlS0eMEHUi52vM1m+1wLK5p1LvWJ4O/QUFKqITXd
         Qa6Qv9KNc7SJ2GC3E+DdYBiZ2LpyU6B/TMbgkHc2cjTgU+gTFvrmHawEtb/GaGElYP5k
         8zRibF0HaDBIXo7bvJHbg6b1ZEQ/37Lt1eWQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790366879; x=1790971679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYKp+bFSterpr+lY2+5QJKDt27P8MnJ6X1EK8+K6uLs=;
        b=EkD+RnfQYVPfxiTNJSwvvr7g7eeg0lXxkCbyVig9qvwKQtG0rI0QWwCBu0DJGr7n2k
         oqNClCDxhKViAJ4xL3pkCq8u4n6EaLxxhT04A5qtbN1rk2aP6lVTAZ6TSSOqbmY1n8Q4
         p221tYRqc39YjhCapXapA629oKzOJUdMuPsI1Rz4Mpq4EmT9ScYZ5+87iKQo2vjFfnle
         Fj9QbgGC0z8jspMamv+QIT/18BJpX3rtaFOqeJWgX2S1CnpoHJdJlRBnLBTOm4UgPJpp
         MTqLdyfXxoVrtbbjcUez9K0+TV9smsAlLcB0wcdX5KQ+xdNau50ZThbnjpNvAinmKW1u
         ZkoA==
X-Forwarded-Encrypted: i=1; AKwUvBz7oP/SRdg7Y6KWBmdgJa8KYFwd86T3HPQ+UGA8EQzA9M9OulW12jLjROtz0QGVaeo54HW66hzRPt9QTg1drDA=@vger.kernel.org
X-Gm-Message-State: AFuF++kzfgCMe1lb8UUOvFBXGBPN7rVB2Xk3miHxn0Hmcm3umyaihhe+
	bQ+nyfNwePCGJp2fypW+ybVZabPLFPx4LrdTklKLNMdzx0tZxSH2IYFy8DOuDT6A5+M=
X-Gm-Gg: AYBFou1ZFdN/6mp6iNCGzcC7SmsjsHSg2IRq8FK1Cn3W2OtLY23ZYZpMmQnzwG5qOPe
	a18Ted5t8AfeUVrQuTWDbJYfjYPCgzgFGbhuu/pEvgVJ3ngxXhb4yv8gqHybWeBvvLuOl/wf9pL
	2Mvp/GhLFIWY/mfI8uRW7A09LgNzv7GdoZRAyMZbMzO61czoTnC6KmoE3cumN99ueVQL0FsvLCM
	IIEw86dIoV0nBXl/2s8v6tEokXwBLOHcLKlgvoYNN97Cs1fPBDezBs2wn3ov7p0hli1DcvHTJer
	wr2i/HLb0617s59M2JoUMFbz9bDKKbtNcXLMRY6ABFxlzXx4m2+6oErz31RnzYUhftYAqPK2V35
	kkAsEbdYoozKxYo8XZ8LgY8TimXPXYAQs0e34VvqXbcGReEiKoBh6AXdsoBGueHq0i+ALRkZO73
	fevVGh3nnaJBrfqZkgHLK0uObLODib7wi+//PW03ZPqYwVpqH4CIK/Bs66//ZMyYkIssGzrKQkQ
	RVTW+R8jD2PYV3eD+YlfAPSy98OwVBggzxjgEXqtczlxMV/d0KmPLU/5VM6Dg==
X-Received: by 2002:a05:600d:8653:10b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-49fe70151ebmr89606855e9.9.1790366879427;
        Fri, 25 Sep 2026 13:07:59 -0700 (PDT)
Received: from [10.188.175.252] (cust-west-par-46-193-46-178.cust.wifirst.net. [46.193.46.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4271sm251705165e9.5.2026.09.25.13.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 13:07:58 -0700 (PDT)
Message-ID: <78508c04-c9f9-403e-b13f-220a3d74e956@linuxfoundation.org>
Date: Fri, 25 Sep 2026 14:07:57 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: resctrl selftest patches ready for kselftest "next"
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Shuah Khan <shuah@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <92c35a79-1c8c-4543-8fa0-0ab78b05faae@intel.com>
 <CAKRRn-d+72is6hNnyTvxUWg0mRWm_BDBcqHZY0+ahdzoNJV=bA@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKRRn-d+72is6hNnyTvxUWg0mRWm_BDBcqHZY0+ahdzoNJV=bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/25/26 01:56, Shuah Khan wrote:
> 
> Hi Reinette,
> 
> On Thu, Sep 24, 2026, 11:54 PM Reinette Chatre <reinette.chatre@intel.com <mailto:reinette.chatre@intel.com>> wrote:
> 
>     Hi Shuah,
> 
>     There are a couple of resctrl selftest patches that are ready for inclusion:
> 
>     "selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists"
>     https://lore.kernel.org/lkml/20260821003908.12977-1-icheng@nvidia.com/ <https://lore.kernel.org/lkml/20260821003908.12977-1-icheng@nvidia.com/>

Applied this to kselftest next branch.

> 
>     "selftests/resctrl: Add dynamic linked list management for IMC counters"
>     https://lore.kernel.org/lkml/20260801092429.533956-1-wuyifan50@huawei.com/ <https://lore.kernel.org/lkml/20260801092429.533956-1-wuyifan50@huawei.com/>

This didn't apply. I am guessing picking this patch depends on others in this
series?

thanks,
-- Shuah
