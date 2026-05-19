Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22E0224B04
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 02:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156380; cv=none; b=HOJF6f7ojkck2qTSJdeNO8s1Uae8q6IaoEvK8i5Vn4FQQzWFboKwZgiredQtJ534ecHSFECcHmL+2uRQTlgeddWB8rfKBhmd8evFiXc58DWy/C+QTAi9X+KTyV+jRflEKmqE0PSu+0eDtJd1xP9i3tWipHbZBk3J3qdlumQO1sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156380; c=relaxed/simple;
	bh=vMWhXjDFdcyWai6+SC45h6hLAMXOtiJoPVQt9FQkU8M=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Evi8cDA3D1RnvnWyVZl9vuoOy9CtLFW7O7C1f1dquBfkQQlUsrG15LJeOYeMdg/6PCg7fBdjLx2Sw2jobowodkNMryPra86xE5hRy3mgJ0M3SiAwikvnfzmAUt7VbPF6nS7Uq8GyzxTD0aoFr/3mkvKjp/ykWi59udR7kV8WvX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=mwJCWCA8; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="mwJCWCA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779156373;
	bh=iKJyfBTWc1g6gqw3fCiF3+Ymtl4xPXv3+1MC4ctH3sg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mwJCWCA8mks1SVacupBXFsQnjpFjW356ZtDJ9b8YtSfvuE8/0kcABRKlOvyHgRERM
	 N6aL19hzdvvd9JBa2riD+LvC8bYlYqi+hfcirgzcJNOOFC/s5vGQtlVJHzOr5laqHk
	 bdJyOUnty8UmFqKmsJJxbCSgVDI+OIXs0xw4Jn1Q=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.73])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 1893D097; Tue, 19 May 2026 10:06:09 +0800
X-QQ-mid: xmsmtpt1779156369tkwlrysw2
Message-ID: <tencent_6F5DEF4517DC01E315AE26E71C79E15F4E08@qq.com>
X-QQ-XMAILINFO: NwU6Bou9okj/CcgsuvAJVgEq333S79lwU5tSjR9UP4JQIFfyQZCJZJkRgPLiGw
	 d8fUgYXXqTDeyRuWiB9POsvGWVH3Gr9kIRFrWe7M7Q+G8bg9fQgbzatj6LRMl4jWquw87mkES+rb
	 rBVRYCQZMxhsslK/gIHZpnGevMtK2qDkKL1t92Ry5VsbploOwJT/OByCuOzRB0DjtnETA/IJCGV2
	 ZnmP3NOw7Aw9ITeSkDIjstUqIh9XLRV6onwZovQTJ0IiE1rJvsvTBHKP8EfHNZOrcie93mvK1lBH
	 9hhlr29A0tR0PUloctOQG6yvqsRoi1Ol5zbNtismV+pJ4kahsuG3eUnpwp1CZNh9vF9vhCMxJCWv
	 C315iMqY4yDaR5lW/2BXOterirq1HGHGsvc6ZOpfu0LX+XO3Cgk9fBCLi8juPRE8hatm8kbH8T/T
	 mxSnYu2qTl9U56k+cWKmtOzEmYelH6PjbS540bXWvsSL1VhPSr+F4hOwu47Rbr8aevw9a+RGVDnW
	 Z719OaNCtjs4xzzNSAeTIb7KdR4bSscsUAD14uhbFHO87VicBawFy6cY7kaaD19njVAsQJnn0gP9
	 QyL+g7rSHE0tJXCVvWJpgQy5uJsXNlECgXB4/JoNmsQQBN0g6VpsU/b1spUIw8nDxlZcQnpXhmZO
	 0vIzN/W2I2JGIqeh+9ArgxYeMMXBGIdg898ovIKm/KkXiObYBgW16Nn+xld6ITp1XEVOwcGYd7eK
	 eMy5+v46pDvh7mm/GOQCSdKJBSnHswX8e2rB1d0Zc900WVJ7Mdy05LfkUEV7F0oULdror+4SuVdM
	 fhqgIMlQWmBvgS7oD/zcIUtfkhe037uNaVDIN35+mx2y3Ql/+3XXGt9CDQNAd104s1Tk+4YDEk03
	 WRbrgGlYWyr7OZhAKTYoyhSNngfS2Nmtwc2aYMC2lrGAYCpJgMdDaudelfFdRBj8W6SAug7GJRGJ
	 BqgJP4DpR0yijO/uvoVM+61pDIhzVDy0nX5+E0chvCjyx2Cmh/tga+mYz/aGRN/jtpGtZugK2x/E
	 wjzYt1f5bS4zso9nqQVumvF1EEw0iS8PkEj/SpQSqSAZQr0gBjZJNBdfO0lxssR/SFQ1wXgGe0/s
	 O3gR73aD3HMC/O5QJ0JhC5DCGCl535NU0euel3RsmforQtcnvzYd3lU3FHIg==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: ywen.chen@foxmail.com
Cc: akpm@linux-foundation.org,
	andrealmeid@igalia.com,
	bigeasy@linutronix.de,
	colin.i.king@gmail.com,
	dave@stgolabs.net,
	dvhart@infradead.org,
	edliaw@google.com,
	justinstitt@google.com,
	kernel-team@android.com,
	licayy@foxmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	luto@mit.edu,
	mingo@redhat.com,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	peterz@infradead.org,
	shuah@kernel.org,
	tglx@kernel.org,
	usama.anjum@collabora.com,
	wakel@google.com
Subject: [PATCH v8 2/2] selftests/futex: fix the failed futex_requeue test issue
Date: Tue, 19 May 2026 10:06:09 +0800
X-OQ-MSGID: <20260519020609.359555-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_76B9DE9C9FE5C57F6D74B5149970DF8CCF0A@qq.com>
References: <tencent_76B9DE9C9FE5C57F6D74B5149970DF8CCF0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

on 5/18/2026, 10:15:21 AM, gemini/gemini-3.1-pro-preview wrote:
> > diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
> > index dcf0d5f2f3122..246404b73ad86 100644
> > --- a/tools/testing/selftests/futex/functional/futex_requeue.c
> > +++ b/tools/testing/selftests/futex/functional/futex_requeue.c
> [ ... ]
> > @@ -62,12 +70,22 @@ TEST(requeue_multiple)
> >  	 * At futex_wake, wake INT_MAX (should be exactly 7).
> >  	 */
> >  	for (i = 0; i < 10; i++)
> > -		ASSERT_EQ(0, pthread_create(&waiter[i], NULL, waiterfn, NULL));
> > +		ASSERT_EQ(0, futex_thread_create(&waiter[i], waiterfn, NULL));
> >  
> > -	usleep(WAKE_WAIT_US);
> > +	for (i = 0; i < 10; i++) {
> > +		ret = futex_wait_for_thread(&waiter[i], WAIT_THREAD_CREATE_TIMEOUT_USECS / 10);
> > +		if (ret < 0) {
> Could this error handling reintroduce the race condition?
> futex_wait_for_thread() returns -ETIMEDOUT if the thread does not enter the
> futex sleep state within the specified timeout, and -EIO if the /proc entry
> cannot be read.
> Because this condition catches both errors indiscriminately, a slightly
> delayed thread that returns -ETIMEDOUT will be treated as if /proc is
> unavailable.

Personally, I don't think it's necessary to handle these two states separately
at this time. When a timeout occurs, the delay is at least 500ms + 50ms. If the
processing requirements still can't be met at this point, then this test item
should fail.

> +			/* /proc not available, give all threads time to enter futex wait */
> +			usleep(WAIT_THREAD_CREATE_TIMEOUT_USECS);
> +			break;
> If the loop is broken here, the code skips verifying the wait state for any
> remaining threads.
> If those remaining threads take longer than 500ms to reach futex_wait(),
> the main thread will prematurely execute futex_cmp_requeue() and cause the
> test to fail.
> Should the check specifically verify if ret is -EIO before breaking the
> loop and falling back to usleep?

The reason is the same as above. I believe that waiting for 500ms is long enough
for the child threads to enter the test state.

> > +		}
> > +	}
> >  
> >  	EXPECT_EQ(10, futex_cmp_requeue(f1, 0, &f2, 3, 7, 0));
> >  	EXPECT_EQ(7, futex_wake(&f2, INT_MAX, 0));

