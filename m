Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C571A1482E8
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Feb 2026 02:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770516051; cv=none; b=DxGJkDdvqladXA3qKMV+9EVq/TePRuBICVppfN8ZzNUo//vXPytO3PRfuq9RMANJX8ie1JUt0JoKKpYmOIe8hAnLrk/gILHwWOxYEwAwLGx3+XyVABD7uAGvQo6DKd+CdADZbVVCuKt7DUplGqp3J6MJPOMflIC7nCC3HYHym6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770516051; c=relaxed/simple;
	bh=k/52INH8GyEadxGakCCLL4rMhjYRUVyVZopaV2PxmcM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z15RopKb5UY+aYU6MtEfdmqcpHgQvHl9MdCAs5zH1Yh/kBGZRz5gUzYyrrmICym1wH0IYhMavFZ3NYPbdhhbS1WKyVWImftqUwaNJECGlojdOcESD94bccsSBAUH7MQJmp3k2ePIliZ3zfhXU1umOZ1IJoiFl65c5sRrhrJQc7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LVakoOX0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qxNMvmAN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LVakoOX0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qxNMvmAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770516049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehzROgKFMFthllC8CHPpVVo0jz1By/sLiuctOrPjOCs=;
	b=LVakoOX0TIa8jRc5PtSn810t/OllS6jLk8ag9HOj9KbJZ4RN9JkMostK9obWebpt+u9WeX
	0ejKpTkK+C+H0r7wmwB35jFIQXK5rjVBNmKKK9TRU3myOYQyFLjjrz9VY+jOnhx1LpdyVD
	swemRQVWmZEpE6mrYfFdWf8Xj7+s0LU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-d1GuM8bfMTKtIi8sUCXQgg-1; Sat, 07 Feb 2026 21:00:48 -0500
X-MC-Unique: d1GuM8bfMTKtIi8sUCXQgg-1
X-Mimecast-MFC-AGG-ID: d1GuM8bfMTKtIi8sUCXQgg_1770516048
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5019f8a18cdso113230771cf.2
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Feb 2026 18:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770516048; x=1771120848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ehzROgKFMFthllC8CHPpVVo0jz1By/sLiuctOrPjOCs=;
        b=qxNMvmANY3glUigpsAx/cb1UY71K4dIFNTA/TQr0iAn81IWhRI+B2xSyRYk6I1pZ0i
         l/JZwYFDzvjPMD5mgtz2+SEyRnzYJ1levyQsTA73mehdlL+++go5Q2TCtG8urFg4cHv/
         Jc/w4ALwHishXwXt96owXYOmPXn8X8Ay0V1axYfXR8H2D6D8C0272prTKQhRgCmWbsD7
         Jyyl/mNbyWyGiQzXUG+w4KBUsfPuipTHYGJAjX35abAJUNCd4VX7sbuIIgE4Dd2fK5G3
         IdZgDhxWNTNg9zpt5qkcnsS8dxaNaM23pMK9972NZwesYizc8XlWQoEWypxQQdB0kWsg
         ztKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770516048; x=1771120848;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehzROgKFMFthllC8CHPpVVo0jz1By/sLiuctOrPjOCs=;
        b=jufwiu+SU2RCZAg10BTHKDHCNYmfMOtCGWo8/arRVvqAXJ3ZIQiIeAD3AS26VezfXP
         zXpt0hdEV5x1x1LSxSTLHAa+GAZvA4zNvAC4t1u4ZPGP7v44bbjsf7LhtmW/al67/bHY
         CGN2FAZlSKZcv9a2Rh3rORT3nAKF9qqYRWx02i86I5XxdTAlWudjgU94gTIA1mKWNpiK
         tSWyjzkgZ5hYQ40Du0a4+jN3eZIhHgCjBNOaLqsjmaeRS45njFXOnh4db6vbCn/MWqtq
         T5OFVL819dnKPuZ2GwgREz29F/8zo/Wb0rJ5mYeJMdZ2rnx0jKhDBowSsjL/9GNRiPAg
         AFYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8asX4AoqNtUO41iXF14IXDByOLVB+6828NXowKsonZXQAxAZUcWFM84DoA3y2P82dCUFowrf6KSQ74cjHE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmPsU6rRJQxXqokBaUNR3SI4rGNXdhEl8b6oSuio564IJX2H8
	cGpDZfnZCgvC29yelk/PXZ55L5f+lRrR8njTfanl7iA6Ymmw07H81DW1LbwYaRogLqwYp26OSZB
	4D4ka3lOnlG1XrBPpP+QfMRIOntEmz8qqSWM6b+4FrIkbBSfOqd2W6bfemXhVaH2GyNmFUg==
X-Gm-Gg: AZuq6aKo9zoGHTjM2vTMjtQDYwFZxMGA8MFxwEqPUc108byuLJJ8048Lw56JL84Csg5
	yB/k/wCrpb5akoXF4V+P83jvH/Ik/YCsnsVrQ5Hz64inN4keYrGlXIuaYkeys8KolYIt7BYWKQ3
	7dsBscT9fNqX/GyJMTAPV7wEzYPTk2O72G5bSniQFxX15kxPgPeNE2aR0S6LLh3aYk9T/pR0xip
	hMQ8/ANwPkSUcKJ1XFAgfqTcGy2qh0h8a9ZILqc1XvBZgd9jG2MJGjins7/h0S24iVXTiE5Yl6q
	SSQPwMPlSgCRTs/v9Euo7yk3npJv41BfzBJi0xSV3gOqotCzT/ntANopgZE3GUV0Y9Jbzwhzbes
	DXjWsClNl9DwE1h0rKLDQ0Xug52+SgPHJSdH1oni8pa8cIVULjlBI0so0
X-Received: by 2002:a05:622a:13c8:b0:501:3e5e:b027 with SMTP id d75a77b69052e-506398fe05emr101988871cf.19.1770516048048;
        Sat, 07 Feb 2026 18:00:48 -0800 (PST)
X-Received: by 2002:a05:622a:13c8:b0:501:3e5e:b027 with SMTP id d75a77b69052e-506398fe05emr101988501cf.19.1770516047672;
        Sat, 07 Feb 2026 18:00:47 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cafa3bff8asm493432085a.51.2026.02.07.18.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 18:00:46 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <d1e4b070-9438-4152-847e-ef6ff6aa7820@redhat.com>
Date: Sat, 7 Feb 2026 21:00:45 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v4 2/4] cgroup/cpuset: Defer
 housekeeping_update() calls from CPU hotplug to workqueue
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Chen Ridong <chenridong@huaweicloud.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260206203712.1989610-1-longman@redhat.com>
 <20260206203712.1989610-3-longman@redhat.com>
 <aYZrJaIIbTX4E-nO@pavilion.home>
Content-Language: en-US
In-Reply-To: <aYZrJaIIbTX4E-nO@pavilion.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/6/26 5:28 PM, Frederic Weisbecker wrote:
> Le Fri, Feb 06, 2026 at 03:37:10PM -0500, Waiman Long a écrit :
>> The update_isolation_cpumasks() function can be called either directly
>> from regular cpuset control file write with cpuset_full_lock() called
>> or via the CPU hotplug path with cpus_write_lock and cpuset_mutex held.
>>
>> As we are going to enable dynamic update to the nozh_full housekeeping
>> cpumask (HK_TYPE_KERNEL_NOISE) soon with the help of CPU hotplug,
>> allowing the CPU hotplug path to call into housekeeping_update() directly
>> from update_isolation_cpumasks() will likely cause deadlock. So we
> Why do we need to call housekeeping_update() from hotplug? I would
> expect it to be called only when cpuset control file are written since
> housekeeping cpumask don't deal with online CPUs but with possible
> CPUs.

It needs to call housekeeping_update() only in the special case where 
there is only one active CPU in an isolated partition and that CPU goes 
offline. In this case, the partition becomes disabled that causes change 
in the isolated CPUs. I know this special case shouldn't happen in real 
world, but I do have test case to test that.

Theoretically, we can add code to handle this special case to keep this 
offline isolated CPU in a special pool without changing isolated_cpus 
and hence  HK_TYPE_DOMAIN cpumask. In this way, we shouldn't need to 
call housekeeping_update() from CPU hotplug. I will probably do that as 
CPU hotplug will be used when we make HK_TYPE_KERNEL_NOISE cpumask 
dynamic in the near future.

Cheers,
Longman

