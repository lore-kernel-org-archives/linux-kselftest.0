Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E226F28D
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 01:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426870; cv=none; b=a1BwkHM6tLtZxazQBJzAQt4vUZ3Nyb53Hx1RrciyYDCb9BFmB5j0sAWWG0RnTjor9hz+8W++DTvFOzpjvfumbI10uk5pftPvBKiiaiTVUzg+lwbfMVyir4A7jErq2wYe3bKxbv2vs1MYCRkMM8ZfOjbKolZ6b3OsYqWyRhCWURY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426870; c=relaxed/simple;
	bh=6kg0xODckSjKvHWfp2tNAEksRsNPLWvrV8U9GS7yaXQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=LA4T8ULRZiKU/bMNk5ziwEH5IryVQhwWvJ6lLge6PZ7XJWdaCDlGtscQgyS5jbXRVTJF9w/o2EvS16xqQvBpKLU+Pr/THJpamDefpB2qzG2mWsDFF8bOkSboA7GYtVPTKORKbyZa4rGAi/mzhlkq0QqYbiTDEyoneIGqypzM6Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=AXbKaFrD; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="AXbKaFrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1777426858;
	bh=o2OnIy6iGWFVEv4KKS6yx9SKkjksxkAL9A0qASffOZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AXbKaFrDbkt+uq23cKmO6DLydu/wJirRq6PPSnIRR60Ryxg667qrMWEp+3arwsj1W
	 TNKeqVoi+CoVM+3SG5oFqcU3+U28xVl+2knm9WNDxPuSCUIVqsQU0YTqo+4R2Meo/S
	 kKHAvI+gwdxLcrtVuxqLX2WBNCORpZUOjPQ2xltY=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.153])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id A368AAF1; Wed, 29 Apr 2026 09:40:54 +0800
X-QQ-mid: xmsmtpt1777426854t3fyj5mil
Message-ID: <tencent_510ADC6BE374AEF5E77979785F025D314508@qq.com>
X-QQ-XMAILINFO: NC4p7XQIBeahkcy7s5IuBGKzZRs6NjX6Oz1bJZGR0EghLfqHhYvyA++yRANlsD
	 7a4W00xJXRnxYAWjLvika/dlawUkk+ZF7hAMqhausgAEOY2LV8xPLB08QL8AtrEBaTzS7velQBtw
	 +8ubrnfvzcqIPK1pqyROnQnDKTDQRA9HnNJJOxxjS8KUPeUa0iVo5IeobrfNt2cj4uCaUiSEwz5w
	 4A96RiIMVlwpi5jbaVFpatp7A39N5pE5GEvQsnWrp2cLRm6ZnsawL4r2EtW4lLxdnFMtvYZIAhFF
	 XK5hyAQIpXMWSaRURHzllqZkWPzFkOtGUu5dkwZxo5fBzX87ZAIeGCJp6SMEto33BB9EJWXks0l+
	 8Y9V1RfVbhhjYHU1uholK7O7MhBPqP/Vop0s0OR3u0KDviixuDiN0mnpC+D5hTzWMpmOjMhfOq6n
	 uXamkQkV3UTCq2wdodvevXPRiJA8b+iGQCPLQDLG0fFdgwoqN7Nar9aKquOm7YcCzpLXzxKoU884
	 ZTbJgAj9algbfEQ2midcuVfVqzGj+yTpIiLJTG+FYpkycnDFtkXQQoVDvCTt57GCK68Mrvxls4cY
	 DR7BikY1QbrpMci9S9Rdzjk2PvRM0A1eeoT9/T9LM+CXgWuM4mPgn+UVQ4nJ3Jf+CZ8fDTZXWMb5
	 0D5rWhiGtG+nFtuZL55vC3CbSlvs+n2Hf2jxmKLNWQz6PKbhwmt+WBZC7vJiYRjOlWdmRBMUiOXX
	 zTrQKFCnNlusIoRAAFx0paT1p5ack+zy5vPsdtansXpE/3C1fYCxJQlmxp2CBh5Xw0zSeTj5JTzW
	 MD4TghLEd8sQuhzF1TCn1mpaCvc5QPxB/Ht9UtVhNeWGeF9d+Eyp9d5mGnVQWRgmljo/wC71mM6a
	 bSapBpVLztAVxe2ULqPIBs3Tj/HFQmAT6psXAGZ+9hIB+ZqsM3JA9TkeOzr4jM/cS+BQpjc6tupo
	 Fm6N0TvyYKJeiUsFMbrar1I+8aNY7YBdEaDjhabCGK0YAY9g5n13Or8uHG/vZD8NZp+SSKWuhcvR
	 Om8iyi5FkQSFLT8340b649C011/SOwkTvS86s8+ZFS/BlbUSodaWA2Iun1wojpNnn8QiLgh9kHXi
	 R5fyxqxxKjFhkyUPY=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: bigeasy@linutronix.de
Cc: akpm@linux-foundation.org,
	andrealmeid@igalia.com,
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
	wakel@google.com,
	ywen.chen@foxmail.com
Subject: Re: [RESEND PATCH v3] selftests/futex: fix the failed futex_requeue test issue
Date: Wed, 29 Apr 2026 09:40:54 +0800
X-OQ-MSGID: <20260429014054.124539-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260428105801.dwKmqgaQ@linutronix.de>
References: <20260428105801.dwKmqgaQ@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 28 Apr 2026 12:58:01 +0200, Sebastian Andrzej Siewior wrote:

>> This patch avoids this problem by checking whether the child thread is

>This patch.

Sorry, I haven't submitted patches many times.

> The pthread_barrier you introduced is not enough?
> You also increase the wait-timeout to 3s and parse the wait function.
> You could describe what the expectation here is. I would assume that the
> barrier on its own should be enough. But the barrier and the state
> parsing is a bit much. This makes me curious what is so special on your
> side that it does not work as-is. Is this some big-little case where the
> big creates the thread and does requeue while the littke is supposed to
> do futex_wait but falls behind?

Originally, I also thought that using pthread_barrier would be sufficient.
However, according to the actual tests on our platform, it's not enough.
After adding pthread_barrier, the problem occurs even more frequently.

Based on my speculation and actual tests, using pthread_barrier still cannot
guarantee that the child threads will reach the futex_wait stage.

>> +	EXPECT_EQ(0, futex_thread_create(&waiter, waiterfn, NULL));

> Why this ASSERT_EQ -> EXPECT_EQ ?

Sorry, ASSERT_EQ should indeed be used here. When thread creation fails,
the subsequent execution should be stopped directly.

>> -	pthread_t waiter[10];
>> -	int i;
>> +	struct futex_thread waiter[10];

> Couldn't that `i# remain where it was and that waiter moved as per Xmas
> notation?

Of course. Thank you very much for your suggestions.

My native language is Chinese. I can't perceive the subtle changes in various
expressions. Please forgive me if there is something inappropriate in my tone
of expression.

Meanwhile, I'd also be very glad if you could help make some modifications.
I've just joined the community and there are still many things I don't understand.

The following link is an earlier version of this patch:
https://lore.kernel.org/all/tencent_35CFB8AE9D4BE7917D95763D15B972638C0A@qq.com/

yuwen

