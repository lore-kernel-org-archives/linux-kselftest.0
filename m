Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866CC37C912;
	Wed,  8 Jul 2026 01:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783475689; cv=none; b=rb4gPM7CdVCfbYHGBnI7XjOGu/98DI87FuWZDkjCCDGBcFBLFS5SQBfVVuji9ZTyiE6WozueXCNSihnHSzq8SMYKu3hY0z78+65IW6W086aNqo4JkslFbniJcE9Zun9XlpbFCxVV45vpPX+tSEm6MxUtTkHYhKSDrD8JxJpBrFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783475689; c=relaxed/simple;
	bh=ezSo2s8J84oSOzaGRrRDBaT9Ou1x9hBwc6XiIatCj0E=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=U74D4GWVfTUK4Lc4eI1l5FnDtUqOnSDDpGu8tEVRX/bJhmv1ehgi2T4Qpepuep/q0PTv1h4v+8KrzRqvYKgswyZZdAAg3JnLGP6owE+llTIZOfBYUeIYwamMt727yc5rVu3qd057dLUPNz98qO2vzjUqL5x4EGnEMLpDPbSL4NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=EwsbdKqH; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="EwsbdKqH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1783475674;
	bh=Vjg9NXgO9MrQ31Pkpy/LFaNqjZrfegwoToH3rS8tBgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EwsbdKqHeFd2jzbMx2xiCRcfCo7bp23dz6veIPVaHcoTE6IgaGhPmDOCv17iCijW5
	 BWh09x756mvHP4/PaUPP6Y4TxoX6AOhqv4WXjNQSsvj64XhrLLII1GoeSkO49OPsJS
	 IvCAxRUK2kzfIspTYOPlfYqcxRH+lDdMV6MSG8pI=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.153])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id D9D84CCD; Wed, 08 Jul 2026 09:54:29 +0800
X-QQ-mid: xmsmtpt1783475669t8ay06xbe
Message-ID: <tencent_9C5F035DDB450CDC0CE3ACAE39E75E796908@qq.com>
X-QQ-XMAILINFO: NT7uTz3cNku2LFS4dFBWF8LZvT6i1ZFD2wh7AX1UOE1SSrtvQiBaEUFIg24t7J
	 P1K9ifEZpWrOHdBbRMb1vlX9n0oIBh2odYQDKBA/Qdd4aaR1dripdE/UlYe9WOX7YRWdii+vVA2/
	 ZvI+hivEf8hIEGZCZOwltizqIY9hu+fQxna7CONeddUG20luSyA/wj+tHTHW9AG3sjwHbFzL31l6
	 QZHbxVgqF4rYO/04pySFEF83/8qsQIrscdTqJqdRCq0To99Do44eZIuTHsFA3cbo6LOd0To1sk57
	 z/U8CF1RQ605gkPEeC2XTVIuxWOw3Y94aNetlfwfgVGPNI6NB82w7hVuY4LQub+9YqvO8eSdp7CI
	 ImLV14xwd7tS7/Nxe+NNDKfCtkAbNzklozDri8FyJUaJmtDD3611O7oDyioK2u7h3BMhNu6raeZD
	 ZxRCj7ZbuBuFqkxpexB21kvJu0vbWGCb5vXnBRL9r6l/Z1jzas1hr42Ot75k1VgfNRvJCcVkptm9
	 MPqHWh2C+/SEdI1SL/T4Jl3z6jR7CgePCqJme9QdTbf+AignwNKL6hj2T6s9KxxBdC25s7BoHyiJ
	 67IYuPSlUBsOwp9Yt+lwX3u5JKQOPy/624cTr3xO16KVt80mUzl8Rr8yObwyCXfUfzNx2+cRH+ny
	 zuqVNO0gu0M8W4TOSLYUrpSNWSH3RiqORqlmnzR0qEJ5heV5FDwAweQPNNMDVtoO04WJd/0m2pkC
	 TLqib8s3iyKCpgBoN8EyWfReUYsaxQokxeOQvncw0FDp/R0/z8t7RhMCA12MY3Zru9gURyh81zCz
	 yUl4q5JAmSLuTvc9aXEwsAIuJXhhrGU5UIt+W8QrHiwePigsUQVxj9BprieFLFX/9gMhUm9NAjYv
	 /sID9hPh2QxXlyLyNbfr8Qz5RNhHCGx8TA534+8vSD1PiS0f/cbicUtAoRN625LZBs/e2TA1kUn1
	 XC1sYBjHqgBMmRYlkIMWQ4w0XFnAkr4GuffPiBaGK8nUsD3QlmYeVUopL7Ik4gWoNNhV7uNJkE8n
	 6Upl8G2cbsL5qLqVDFAo2VqM192SXYd2+uMoxnrz8Nfr8NI51F+a7U13uoHhP96CfGDi265g==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: tglx@kernel.org
Cc: akpm@linux-foundation.org,
	andrealmeid@igalia.com,
	bigeasy@linutronix.de,
	broonie@kernel.org,
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
	mark.rutland@arm.com,
	mingo@redhat.com,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	peterz@infradead.org,
	shuah@kernel.org,
	usama.anjum@collabora.com,
	wakel@google.com,
	ywen.chen@foxmail.com
Subject: Re: [PATCH v8 2/2] selftests/futex: fix the failed futex_requeue test issue
Date: Wed,  8 Jul 2026 09:54:29 +0800
X-OQ-MSGID: <20260708015429.2690179-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87cxwys7fi.ffs@fw13>
References: <87cxwys7fi.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 08 Jul 2026 01:31:45 +0200, Thomas Gleixner wrote:

> Do you have /proc/ disabled by chance or is it not accessible for the
> test case?
...
> Seems to correlate with the test case failure: Connection timed out :)

I used the following patch to simulate the situation where the proc file
system is not mounted on the system. The log is very similar to that of
the current problem.

--- a/tools/testing/selftests/futex/include/futex_thread.h
+++ b/tools/testing/selftests/futex/include/futex_thread.h
@@ -62,7 +62,8 @@ static inline int futex_wait_for_thread(struct futex_thread *t, struct __test_me
        int res;
 
        snprintf(fname, sizeof(fname), "/proc/%d/wchan", t->tid);
-       fp = fopen(fname, "r");
+       errno = ENOENT;
+       fp = NULL;
        if (!fp) {
                /* If /proc/... is not available, sleep */
                if (errno != ENOENT)

The corresponding logs are as follows:

  TAP version 13
  1..2
  # Starting 2 tests from 1 test cases.
  #  RUN           global.requeue_single ...
  # ../include/futex_thread.h:71:requeue_single:/proc/$PID/wchan not accessible, continue with sleep()
  # futex_requeue.c:28:requeue_single:Expected res (-1) == 0 (0)
  # futex_requeue.c:52:requeue_single:Expected futex_cmp_requeue(f1, 0, &f2, 0, 1, 0) (0) == 1 (1)
  # futex_requeue.c:53:requeue_single:Expected futex_wake(&f2, 1, 0) (0) == 1 (1)
  # futex_requeue.c:29:requeue_single:waiter failed errno 110: Connection timed out
  # requeue_single: Test failed
  #          FAIL  global.requeue_single
  not ok 1 global.requeue_single
  #  RUN           global.requeue_multiple ...
  # ../include/futex_thread.h:71:requeue_multiple:/proc/$PID/wchan not accessible, continue with sleep()
  # futex_requeue.c:28:requeue_multiple:Expected res (-1) == 0 (0)
  # futex_requeue.c:28:requeue_multiple:Expected res (-1) == 0 (0)
  # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection timed out
  # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection timed out
  # futex_requeue.c:28:requeue_multiple:Expected res (-1) == 0 (0)
  # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection timed out
  # futex_requeue.c:28:requeue_multiple:Expected res (-1) == 0 (0)
  # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection timed out
  # futex_requeue.c:28:requeue_multiple:Expected res (-1) == 0 (0)
  # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection timed out
  # futex_requeue.c:28:requeue_multiple:Expected res (-1) == 0 (0)
  # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection timed out
  # futex_requeue.c:28:requeue_multiple:Expected res (-1) == 0 (0)
  # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection timed out
  # futex_requeue.c:28:requeue_multiple:Expected res (-1) == 0 (0)
  # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection timed out
  # futex_requeue.c:28:requeue_multiple:Expected res (-1) == 0 (0)
  # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection timed out
  # futex_requeue.c:28:requeue_multiple:Expected res (-1) == 0 (0)
  # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection timed out
  # ../include/futex_thread.h:71:requeue_multiple:/proc/$PID/wchan not accessible, continue with sleep()
  # ../include/futex_thread.h:71:requeue_multiple:/proc/$PID/wchan not accessible, continue with sleep()
  # ../include/futex_thread.h:71:requeue_multiple:/proc/$PID/wchan not accessible, continue with sleep()
  # ../include/futex_thread.h:71:requeue_multiple:/proc/$PID/wchan not accessible, continue with sleep()
  # ../include/futex_thread.h:71:requeue_multiple:/proc/$PID/wchan not accessible, continue with sleep()
  # ../include/futex_thread.h:71:requeue_multiple:/proc/$PID/wchan not accessible, continue with sleep()
  # ../include/futex_thread.h:71:requeue_multiple:/proc/$PID/wchan not accessible, continue with sleep()
  # ../include/futex_thread.h:71:requeue_multiple:/proc/$PID/wchan not accessible, continue with sleep()
  # ../include/futex_thread.h:71:requeue_multiple:/proc/$PID/wchan not accessible, continue with sleep()
  # futex_requeue.c:80:requeue_multiple:Expected futex_cmp_requeue(f1, 0, &f2, 3, 7, 0) (0) == 10 (10)
  # futex_requeue.c:81:requeue_multiple:Expected futex_wake(&f2, INT_MAX, 0) (0) == 7 (7)
  # requeue_multiple: Test failed
  #          FAIL  global.requeue_multiple
  not ok 2 global.requeue_multiple
  # FAILED: 0 / 2 tests passed.
  # Totals: pass:0 fail:2 xfail:0 xpass:0 skip:0 error:0

I suggested adding a parameter for the waiting time to the futex_wait_for_thread function.
In this way, when the proc file system is not mounted on the system, the old solution
can still be used.

Thanks.

