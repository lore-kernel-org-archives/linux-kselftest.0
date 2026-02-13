Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D665324718;
	Fri, 13 Feb 2026 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971144; cv=none; b=Ly4s6gfeJHsHC9E+MBzOERKRkzTMdx6VK2ncmI+kUjUcrdpRyAkkU7r8paFM6CxUhR3i61ZuBT4CVyI8kSNm5ZvCJhiTrwFYtTLg0skCZfHWxOJ6TalSDunwN1765bmuZAO8swht2thzKgWxuF+QEoAoJGxNIQN6BXmqZXME1bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971144; c=relaxed/simple;
	bh=CY0Jfwt0xWXKmsrgxJkrVRvcMD4iIf9ccvujVW8gwGs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Bw7fn8KloeYQu55i8OkBOLiEwnG3bPwPI/LI9xovzAMH8ABOk/AmcV2in6IJVzBBX/uNAjtPr/Wwd39J0qWqtGFXJpJFa/vzsfs+PUwEE06y63ZY/uFdy708z+dlqcGb1UsKXoceKGw8y5aTA3P19ItdEme+74GLuwnYEyYa6Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trRwsoDr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trRwsoDr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F431C19424;
	Fri, 13 Feb 2026 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770971143;
	bh=CY0Jfwt0xWXKmsrgxJkrVRvcMD4iIf9ccvujVW8gwGs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=trRwsoDrRRF7lKzdDFa/pxFvXsfzE9MGnee6m4fy79RK6JTwnqqtYK5DH7BhgXjzL
	 12apsmAwazf1rlpdJuEKWzCKb75AVEPh8w7UYt5d/DZZizmunaPJxvGwhHRazgzAWg
	 0Lo8MUOrsWJMAXrRN6cU57HcrN0rvgb3YCa8czufP7m7lGl4sx9hTRP7lDet8QQZxm
	 5xs9VtikGgg3UTdhRPubyJQkFGpdgwvp26Mr3Ei2vP6WV9V/VvUkmXnZj2DN8B0aQF
	 6c3Qz67ky+aX3BDpTD4I3QuOhZWzT0HXDEXwX05t2Q6krRenaaiwgmuFKZzKN1EPMu
	 YUjC01pSDqnUw==
From: Thomas Gleixner <tglx@kernel.org>
To: Yuwen Chen <ywen.chen@foxmail.com>, ywen.chen@foxmail.com
Cc: akpm@linux-foundation.org, andrealmeid@igalia.com,
 bigeasy@linutronix.de, colin.i.king@gmail.com, dave@stgolabs.net,
 dvhart@infradead.org, justinstitt@google.com, kernel-team@android.com,
 licayy@foxmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, luto@mit.edu, mingo@redhat.com,
 morbo@google.com, nathan@kernel.org, peterz@infradead.org,
 shuah@kernel.org, usama.anjum@collabora.com, wakel@google.com
Subject: Re: [PATCH v5 2/2] selftests/futex: fix the failed futex_requeue
 test issue
In-Reply-To: <tencent_7F45D13FB7CF789CEBCCF945DEF897481706@qq.com>
References: <tencent_35CFB8AE9D4BE7917D95763D15B972638C0A@qq.com>
 <tencent_7F45D13FB7CF789CEBCCF945DEF897481706@qq.com>
Date: Fri, 13 Feb 2026 09:25:36 +0100
Message-ID: <87ikc182yn.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Feb 05 2026 at 10:09, Yuwen Chen wrote:
>  TEST(requeue_single)
>  {
> +	struct futex_thread waiter;
>  	volatile futex_t _f1 = 0;
>  	volatile futex_t f2 = 0;
> -	pthread_t waiter[10];
>  
>  	f1 = &_f1;
>  
>  	/*
>  	 * Requeue a waiter from f1 to f2, and wake f2.
>  	 */
> -	ASSERT_EQ(0, pthread_create(&waiter[0], NULL, waiterfn, NULL));
> -
> -	usleep(WAKE_WAIT_US);
> +	ASSERT_EQ(0, futex_thread_create(&waiter, waiterfn, NULL));
> +	futex_wait_for_thread(&waiter);

This is a horrible hack. If that wait fails, there is no point to
continue.

