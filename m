Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392E122CBD9;
	Thu,  5 Feb 2026 02:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770257075; cv=none; b=GS3v7zBBpRsdbg5rMiojTyYjFMHITg3lTPpAbASbdwr4OiXTTjIQ/Bs7syDbAfURCdSLSmNHjLtPKtMLcYpDb+MZbFdLIPjG7nOb3hJA8KxGEvlTAH2xb6DjwqzKdUn/svaY5jlqh2hs8n+K8JvWcKuNAWAP+MRZX7/9WGEykWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770257075; c=relaxed/simple;
	bh=xkmRbIXdODdc3sKKgWm5dUnPLT2mKDf57i94AB3LXgw=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=ebUy0HMu3zP3tyt2Z72qDWQfap47xQuwXi5puQtTGDs2rpCtkGuiKo/kEA3utuGOvBh/MBf0YyD5KZTTV7+2Ogg6/yFoZRcjuifhRywq60DXPUKTLxbcsRdiGjgA1QYXxW9ua4P7FNIeX0366kvdQyGSLF1RZbyft8fJM1apBx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=pyRm9vct; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="pyRm9vct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1770257063;
	bh=097lNhljVmbTkEEYPb3lzz09QPVwAD1qq/GVIch2LME=;
	h=From:To:Cc:Subject:Date;
	b=pyRm9vctbOI6FJCCwMLCURVvoFYo/PNLM/kdn0NxL8GqjIvpkf0C8+bBFr2th6oMT
	 CFVVG7Hf6AQb0EnXV2dhZVr4L10Mq+ABUEayjQxGjXGd+KzMgDyYFDVYVSIYDXOzQr
	 0oniCNplxXeelaEzqaFgh42S/IEJY0nEmR+7Or1A=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.152])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 3225EA6; Thu, 05 Feb 2026 10:00:50 +0800
X-QQ-mid: xmsmtpt1770256850txj2jfxdo
Message-ID: <tencent_35CFB8AE9D4BE7917D95763D15B972638C0A@qq.com>
X-QQ-XMAILINFO: NT7uTz3cNku2JOKtnNtqxFpbXFycUyRfrrNPAM5IePfxTwD7EW8VneDdciYz7b
	 wl6RdewizTU3RvuxBwQXW3M+wL51leaQkrTJj6E/w6qvNuohU1UQ5+rxSQGPoP7knVuwBiswu5+N
	 uKxD4WITcjHeFojJ0Ru/DnM1KSVWc602tvP5WUVctAYaxKJxkeQOiqsTlvkDqfzDwXD1UFGWF95E
	 NQtzvADPjtwhwUP8VGEd6TFd7ORTq/vYROa4tFqfmYBa+y0bRA4i4hBlFqOHEVOubJP4whvrCcMx
	 4MmYnHDRrDS5isYZt/5kdD6/cONSwWVMEBIQIA37xi4CAcbF9fASDNdUXYY7Ms3WVhdyqIbx8UYx
	 Z7aSUB5xRxAkRdqaxPkNVJYpTSMF1D+iUCxs0ALGQQjV4SRimC2Jl2QEUWDSpdFnNJLnQbGTY3tB
	 M4T477ScWJu0svofvTD9eXYtao4wUcXPBk0+5ETX4o4Sd6NWFv6tE4u8mh7C51xsaQt+7BBT+QAJ
	 4hFAjeG7gy6JpBD8vRHgL0F+Y735NlHamhOhmBDuJw0NtJR4YRl2ZO/TY+1dbxXf62MaKHeJDE3F
	 3v4PqmqFhIBtUXFZEk+f4CPXvDan0Z5/Ul7kywnge3E8W+bkZZ251fqtKaryBYMxzVSEG9jURF7t
	 ojFUNyN63TtjhZqyOM1+ec922t0LZjHKPr+WLKIbJgq3AGL6UK+vJ+jhxknLs0NsSwm8mvlZRd+h
	 yltDNVHEx6JW4HxgIQinyKJ/s4oYTETHd444uuDf+65W5k1qLmyAaoxhIlcVhQ20PhU/8RL8hwgD
	 Yi6Zb6ystAwd4VyFZCr8s+7T4Bbp6tRfZWNcraO/MY+BWSVjBC9JsXB8+c4nTDbPpNjhKmQ4O5PO
	 Q6JcAsjD493F4OvFkJSOoLG2IuaigoS4cd2AkVybD3uios9+e3mFL2eEh4mW66YI8ZH8TgMDz5Q1
	 O+bouwCI2YHwdrsWzR4m6/kXo4Bnv5Ycb3BuwLP3OuNsxL3b43TWDZHEAUagitnmw6eB9mhjxdWR
	 u3Nj6dgsPXjCZ0E7W8aE/X7CKpvLIOSNhXmgHFcX7KJmIt4brULpwDhwsxryOnPGUh6SjFN4CDRc
	 /b357TVB5N/AqWKDI=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: tglx@kernel.org
Cc: ywen.chen@foxmail.com,
	akpm@linux-foundation.org,
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
	usama.anjum@collabora.com,
	wakel@google.com
Subject: [PATCH v5 0/2] selftests/futex: fix the failed futex_requeue test
Date: Thu,  5 Feb 2026 10:00:49 +0800
X-OQ-MSGID: <20260205020049.72688-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

This test item has extremely high requirements for timing and can only
pass the test under specific conditions. The following situations will
lead to test failure:

    MainThread                  Thread1
        │
  pthread_create-------------------┐
        │                          │
 futex_cmp_requeue                 │
        │                     futex_wait
        │                          │

If the child thread is not waiting in the futex_wait function when the
main thread reaches the futex_cmp_requeue function, the test will fail.

This patch avoids this problem by checking whether the child thread is
in a sleeping state in the main thread.

v1->v2:
    1. Fix the issue of abnormal use of fscanf in the get_thread_state function
    2. Add timeout logic

v2->v3: https://lore.kernel.org/all/tencent_B9DBF2ECBE56BAB68BDAB949C6935D01CE09@qq.com/
    1. Use /proc/[pid]/wchan instead of /proc/[pid]/stat to check if a process has entered the sleep state
    2. Refactor part of the logic to facilitate code reuse.

v3->v4: https://lore.kernel.org/all/tencent_FC5FB35D2545AFDCA6E377AE4DE75C79AF08@qq.com/
    1. Add a new futex_thread.h file.
    2. Add a new function named futex_thread_destroy.
    3. Fix the issue that threads are not reclaimed in futex_requeue.

v4->v5: https://lore.kernel.org/all/tencent_204540DCC2E303AEB6E77679C05F5C5D3808@qq.com/
    1. Split the patch into two.
    2. Modify the thread interface to support returning error codes.
    3. In the test cases, check the return values of the threads.
    4. Modify the macro definitions to more understandable names.
    5. When failing to open the /proc/%d/wchan file, delay for 100 ms.
    6. Modify the parameter description of the interface.

