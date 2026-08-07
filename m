Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9136B38D3ED;
	Fri,  7 Aug 2026 15:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117382; cv=none; b=u1ABsOMcj39hAiGuIRoBlVe+nU7Ix819fqdWz65veuKh4wRqXo4RaZKfmDFuTBsaLr9tE4u58qGS/inDsjxFKNANZT034qxst69AEEDsboe57vnCiRHZhfXISsjFyigd9BDM1EblSV/Weirilt4BBaXIooGKCER8Lnx/DzDWX64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117382; c=relaxed/simple;
	bh=Jcnnm7VkmktJ41K4TCW7yowd09lHnz03qHJKrpLE0Os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YjR++qxpUfICK/KeAHVDd0ed2K1Ux4bia0WBF2JD4BG1U0Gv/Pi/gyNOFnR26RpiHxJFUoRe8MKG9I0yo1op9RBSkMJvv8Fv3aA2Vu1Ar4m2zlSi6lfBLYE34MPmy/Mj/6/WIQ+XbR8M+HQz9F0fLW6TjnN/yBD3ab5I1X5bhsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFImxXB5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFImxXB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23E11F000E9;
	Fri,  7 Aug 2026 15:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786117381;
	bh=b3UiILwB9Rxz85rD4UEk91LUAtaGAfQ48+KjzWPOZcI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LFImxXB56ll6Lx1VLvUbab+vqXIhkZzYN+7IhSa4H5U+xhIVy0x7wO/4y4snNY3bV
	 3bLSFNMgZO9ND/knCuvYlX87b5I0WYqVydF6eyXRKmc/QStXupzKowdalBwqvhC6VU
	 I6pSyiSzIzH+W3vlbUpxAunlJSJBZ+kmcFJR7Srb+hYim6hwAT4Y9u6JknQjwREGEH
	 YBWDvsymi4ecnO3oIyBM2a/rt35UvfbetV9TkVNP6NmHzwB2XVmjNHgz/Wtu3CE5gw
	 I/5ezvN8Aw/vwEGpOaG2rdNVV94u28q+uVLKqj4M4TlwOF6d3jAQ4QwqPlRoEKckM7
	 Czbyj0rrDQLHw==
From: Thomas Gleixner <tglx@kernel.org>
To: Usama Arif <usama.arif@linux.dev>, Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Usama Arif <usama.arif@linux.dev>, peterz@infradead.org,
 andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 mingo@redhat.com, shuah@kernel.org, shakeel.butt@linux.dev,
 hannes@cmpxchg.org, riel@surriel.com, kernel-team@meta.com
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
In-Reply-To: <20260805132831.2852771-1-usama.arif@linux.dev>
References: <20260805132831.2852771-1-usama.arif@linux.dev>
Date: Fri, 07 Aug 2026 17:42:58 +0200
Message-ID: <87jyq2dji5.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 05 2026 at 06:28, Usama Arif wrote:
> On Tue, 4 Aug 2026 17:07:59 +0000 Dmitry Ilvokhin <d@ilvokhin.com> wrote:
> The above data shows the significance of the patch.
> It provides a very meaningful improvement (22.4% of time spent in futex_q_lock()
> will be significantly optimized and will also deliver second-order effects)
> and has no measurable impact on latency in the matching path.
> IMHO, this patch is a free lunch.

Not really free. The user space access is not exactly cheap either
because CLAC/STAC are memory fencing to meet the SMAP guarantees.

I've tried that lockless read/test before and gave up when a
multi-waiter real world test case degraded by 5-10% depending on micro
architecture.

It's carefully written to minimize lock contention in order to optimize
wakeup latencies. The effect of the extra unlocked access and it's side
effects shifts the timing enough that it runs into significantly more
lock contentions than before.

So it might be great for your use case, but not so great for others.

Thanks,

        tglx

