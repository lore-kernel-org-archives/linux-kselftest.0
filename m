Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12CD223323
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 00:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770080395; cv=none; b=tkKvyDEQ0fFHSHzmoYoZaXh2eXcfpDk7OuFFt1cp45RdG/RAVsPh3DHqCl9foeo7aF3F7Pj2zomK/npQ6lVuiN8Wr2daLqABSp6Eix1pUKiPDabdZvlf3L8EjRXGGMatu8CS26C3Sf7OOLuy02+/4PZ+bFdUBjpqEQFwaf6RlV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770080395; c=relaxed/simple;
	bh=gpORPuaOpk6tojkOwt62hlPXrsXqI7Yp6L3YHtKbwR0=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MArTPEJ0UamnI5s+Gn3XGv3ZczwiL//6KnTRdCMvpRpCZQJMPFhGw18AfNWF0/Mn+dlhS2Yb2NqhaQXn992uSAY1KciBPavZ9nbpnhRT4x6ECkzQrFWR/kMj8mE/EO6iY0aXvMWMcFQXMoPgLE99pnWe7u3zq/glWBGSUGAJAj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y74EcxfG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VeZ9+QIn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y74EcxfG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VeZ9+QIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770080393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKRfDEEvMLgrDWFTBlm5/V6r5Jaf/qoxoTLe5hblhdE=;
	b=Y74EcxfGYIIhnL0Krh9JjlbTgHGxnZgm76AWvaPF5KyShUrCuMo9tKzs3nbs3n65+Wp0+7
	QAwpCucf47JFTxP9+NB2gGrHHuKnzB/rsqSvBL2ArQ1dfzFVpe16i4WKUVZPFFDQxEnkqj
	snSI/DTjBB3+cSdDhMrzhDuJsDb3d+w=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-FTi60Ud1OMuh_fmE0rjXDw-1; Mon, 02 Feb 2026 19:59:51 -0500
X-MC-Unique: FTi60Ud1OMuh_fmE0rjXDw-1
X-Mimecast-MFC-AGG-ID: FTi60Ud1OMuh_fmE0rjXDw_1770080391
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-502d38a3e39so65832811cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 16:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770080391; x=1770685191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cKRfDEEvMLgrDWFTBlm5/V6r5Jaf/qoxoTLe5hblhdE=;
        b=VeZ9+QIni7chDO1l4SrTEIyQKhIslA3Xw7uLgbgltsclAAWH93dUnCHzjejagiF0Ml
         X5wHArfJn7kLFi5escB2ajiDRsE4JMhII+sc2YY2k6nBBLsVt7ZVLT19a2AecWX8Q+NB
         19wsQuOJQUAbuj6LfUsPYBUgbcWv5b4FcaciA1EOu075RPuDf2bmKjyCB45jkNj18E9x
         Y4WToMZ0JyeVBUM7G2y/lq6pM/xZH6t6gWEPrcBkswTrPLp9BLT5aFguQpwMcG907fJi
         zh6XHhL8FywviKa7vDkCm6yaCZyfqUwch6M1sPn5OnHJgzEveyfzbGTLtyse35JOnNWU
         SMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770080391; x=1770685191;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKRfDEEvMLgrDWFTBlm5/V6r5Jaf/qoxoTLe5hblhdE=;
        b=BIYohsjFGJc2OazRV8kNQP6JFEr3DVPaIWg9KBeaWafgfKUfFBrIAld+y2UA9sXLX9
         iUKHeskEnBMqRcWbkOzDaiYWBBebnYfCuwicYsR6JqAiRpVD7dYkauCY3RgVAVHIgR2I
         lCtpewgfB5giv6T4E/sYWs6+0wk+iUCZFsN4L1zOVN7AHzVnJdwKitePoENfuMw02fAf
         Ss6Mvzryb53C1MQ/NCe7mA6ClpiPZLUQJ3H5kXCYNiS+Iu55VrZCdfVWb41MsOtRsfmR
         HDaC+4MUjNSWCZb2BOJaUGV7DJ8YYhcu1UBN235MLzUQ4Kxp5keXWd10Bv2YQPNAm3Ty
         4Rpw==
X-Forwarded-Encrypted: i=1; AJvYcCXf2ae/rGAiKK0bgAf8XWWcLOzcUdZbxMUhfjcgQtJTx2f0A1wyKVchbqGHOHgpcc1jtLQqgIueFsiwd/t2K00=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/BH7IBYwyTECNPtZbIBFmHxrApmZWQQFuth/FvWAIdzTbrJh9
	yWm49F33gypX3NLZon29MBKUP2C1sYymqMTWOKuZ+RqMtI433IMVkTHUdDXx8DSI4kHtUuE+lo0
	GMr5CMfmfcRxYqwpxhLgk6kCuEAwKcghxLYEo51/M+Ha7ow9Re/nQiUnpuw98D3BKCkqP5A==
X-Gm-Gg: AZuq6aK5FsTFRDs1wngE8UqZi2xjdUBUecAwDmk0aV2O0qeONRni6MkRoo21q7xTWGj
	HoV+YX/8fuYKb/z9So/EwFkYQvMFXYBAlg34dgo7Ln8MiiCrBX+pWvipGQxSckgGSOgWO7jMo/e
	wK5hvpXWQKmdrcdyWG64JdRDcNqIfPae0NX8geBPIQ7Bm9wtZVVti0N9k9wOQNkIC8S4NlGeiFe
	JM+m+x82khFFVHZHpa8eoOlOopMqA6S/mzZzplMJ/psECGE2vczVNCGxbx0Cl1nBi/pG39hF9Z2
	qY6Am8YINp7mtBywgMJ0BY+FUOYe4lb+lbGj1G1ePYDzwuZX9K21vpmlTsHZTUTPXWT765/PZhS
	Cd0I2nOLIe+2DFkWq0OpdGXo0CFKe5qjihVBWAYEFJKCKAtlvGBTEBrxj
X-Received: by 2002:ac8:5801:0:b0:501:4b67:1210 with SMTP id d75a77b69052e-505d2291118mr190414501cf.56.1770080391372;
        Mon, 02 Feb 2026 16:59:51 -0800 (PST)
X-Received: by 2002:ac8:5801:0:b0:501:4b67:1210 with SMTP id d75a77b69052e-505d2291118mr190414341cf.56.1770080391015;
        Mon, 02 Feb 2026 16:59:51 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337bb9d21sm115683351cf.26.2026.02.02.16.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 16:59:50 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <c529e9e5-9ba4-454d-bec8-40f39d456ed6@redhat.com>
Date: Mon, 2 Feb 2026 19:59:48 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v2 1/2] cgroup/cpuset: Defer
 housekeeping_update() call from CPU hotplug to workqueue
To: Peter Zijlstra <peterz@infradead.org>, Waiman Long <llong@redhat.com>
Cc: Chen Ridong <chenridong@huaweicloud.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260130154254.1422113-1-longman@redhat.com>
 <20260130154254.1422113-2-longman@redhat.com>
 <20260202130526.GE1395266@noisy.programming.kicks-ass.net>
 <ca4e6c43-2bf3-42b9-91eb-dfce4777b5da@redhat.com>
 <20260202200457.GJ1282955@noisy.programming.kicks-ass.net>
 <20260202200610.GD1395416@noisy.programming.kicks-ass.net>
Content-Language: en-US
In-Reply-To: <20260202200610.GD1395416@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/2/26 3:06 PM, Peter Zijlstra wrote:
> On Mon, Feb 02, 2026 at 09:04:57PM +0100, Peter Zijlstra wrote:
>> On Mon, Feb 02, 2026 at 01:21:43PM -0500, Waiman Long wrote:
>>
>>> Yes, I am going to remove cpuset_locked in the next version. As for
>>> __guarded_by() annotation, I need to set up a clang environment that I can
>>> use to test it before I will work on that. I usually just use gcc for my
>>> compilation need.
>> Debian experimental has clang-22, but there is also:
>>
>>    https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.0-rc2
> Damn, copied wrong link:
>
>    https://www.kernel.org/pub/tools/llvm/files/llvm-22.1.0-rc2-x86_64.tar.xz

Thanks for the link. Will play around with that.

Cheers,
Longman

>> See: Documentation/kbuild/llvm.rst
>>

