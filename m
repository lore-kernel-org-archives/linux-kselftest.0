Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457A564;
	Sat,  9 May 2026 00:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778285129; cv=none; b=Ue1m2ve5EKjPFpNw+njD68AYU3EVZaeycjG+NySAqRBNgakf510/jAW53kobQ3OpUPVgpKbGYB/VB0Y47ZFBipqf8iUfR3DVDiRcCOO5D64ggHFTxNUe09+k6GhIfdwqnWBzX4sj2hbe4YiXNUxQkg1NXPbf4AryUVdqshXNOfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778285129; c=relaxed/simple;
	bh=A/1whejIccbdXHwQ15Y5hCblsGnXS8kt4r3OIrPmsj0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lZIk6zEFsSsB9Oqh+ksPVBteCk8yGU7/abqsvN0TIHv4bjwA+j8U9MNS1Zk15lD0cyU1Ul9heZAczF/ENxABA+KIU2H1Hl4CN2bU9vxuxXHB3a5BqkWLX/Nssywh/a2kdzpm4sYkulgdUXPWghGP7Jqy1W61o1PSnbi23t6vaRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=P6oIQaEu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P6oIQaEu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3053CC2BCB0;
	Sat,  9 May 2026 00:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778285128;
	bh=A/1whejIccbdXHwQ15Y5hCblsGnXS8kt4r3OIrPmsj0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P6oIQaEuZ8IK7wc5402rSQj6avJVY1A/zF1QQEbOcgFRVC7Luq6wO6gaTPplW38gZ
	 bChBlqjPV8HO0XNw9BGAbUoTnyTknyzMEtN+0wmXbWebcjl5IHUjlxOB5ocEs80FWb
	 24Jy5ZFWTH88sGDahM+cHrFjyMYDUsfXpzAIg2Nw=
Date: Fri, 8 May 2026 17:05:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yuwen Chen <ywen.chen@foxmail.com>
Cc: andrealmeid@igalia.com, bigeasy@linutronix.de, colin.i.king@gmail.com,
 dave@stgolabs.net, dvhart@infradead.org, edliaw@google.com,
 justinstitt@google.com, kernel-team@android.com, licayy@foxmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 luto@mit.edu, mingo@redhat.com, morbo@google.com, nathan@kernel.org,
 ndesaulniers@google.com, peterz@infradead.org, shuah@kernel.org,
 tglx@kernel.org, usama.anjum@collabora.com, wakel@google.com
Subject: Re: [PATCH v6 0/2] selftests/futex: fix the failed futex_requeue
 test issue
Message-Id: <20260508170527.4165ade239fbc16959e90370@linux-foundation.org>
In-Reply-To: <tencent_D6D5FA3C2F6FE52BA6ABA1A88C1B6E1CC605@qq.com>
References: <tencent_D6D5FA3C2F6FE52BA6ABA1A88C1B6E1CC605@qq.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  6 May 2026 11:23:11 +0800 Yuwen Chen <ywen.chen@foxmail.com> wrote:

> This test item has extremely high requirements for timing and can only
> pass the test under specific conditions. The following situations will
> lead to test failure:
> 
>     MainThread                  Thread1
>         |
>   pthread_create--------------------
>         |                          |
>  futex_cmp_requeue                 |
>         |                     futex_wait
>         |                          |
> 
> If the child thread is not waiting in the futex_wait function when the
> main thread reaches the futex_cmp_requeue function, the test will fail.
> 
> An attempt is made to avoid this problem by checking whether the child
> thread is in a sleeping state in the main thread.

Thanks.  AI review has a bunch of questions:
	https://sashiko.dev/#/patchset/tencent_D6D5FA3C2F6FE52BA6ABA1A88C1B6E1CC605@qq.com
