Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D027923AB87
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 03:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037803; cv=none; b=AK0ctzcAt+7SpGz7IBFmpZZ9rvXy2i5Wrb6KKzKwnUIAogur9veAESaEDoTcoHAuCZYMPpJB8EDEEJjtBlO6kjZuqxP92y1yTxh/CGsEuo8ekvU7qWSUqji1ge2mzIttMTyP0YottFyxOXnSM0ZU4Uljo4WvP025pQ0WNjV+MOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037803; c=relaxed/simple;
	bh=gro1tgE28Fc/qjek0el5snz+9jiIIyvH3WDnoXYxqus=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=lvjh0VRA95/LiYkQ7R06hEFuytrJo8JqtuCHirmwmAvEEkU5cH/l+qH4k0r5s++PIkwxY30HA4cGChKR2ecoGTTt1bxnUF+5Rb8cNwSx7aS9wqLHqZjcT1Hd7XZn2/rsP/nYlZmJEsyQI41DeRQw4EnzE0MQPUAGuI9dbOsoZ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=k41ZuLTd; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="k41ZuLTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1778037794;
	bh=dfm+yA8xtAWePk6SeDHKzRG6p1KJ+kKRsFkbfgQgvRI=;
	h=From:To:Cc:Subject:Date;
	b=k41ZuLTd6LD/YTIeLkWvdZWd4PfiN0rEcFYo5RGYnowy0zYTDJh7FEBrOPSj5p+iF
	 7XIBZ3ErAFK1Ujd12vjQ5Fn7Q03Kukp00hsPOXlv6ryFsNHlvTl49ofX+z9FVrZH0H
	 lqlOdn+/3Nhsd6S9n155WCtr6WPwrDeQqZQUClFs=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.73])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 5CB0165B; Wed, 06 May 2026 11:23:11 +0800
X-QQ-mid: xmsmtpt1778037791t8bnfu01o
Message-ID: <tencent_D6D5FA3C2F6FE52BA6ABA1A88C1B6E1CC605@qq.com>
X-QQ-XMAILINFO: N6IfSeM/PG+t1cG+1Em2KwPO3w4fkyvRCwH94vbFmhMvLNJjAzB7GssEvsy8y1
	 oSUQKEl/cP4cmI0fyj8ffx/MJMNSxhXaLK6mZgP8tqK+WWUudtGKcF6iFYx4CFsccTd3yuqRBtBB
	 asYoOqSw1PSo36ScpWuv77rnJF59Qy977QScIYNJvb7VZiA3QcbQNiNt/EIXznlliodgmjk1N3x5
	 /6TByqvyPPPyTYyIO+CTD2u9IzVJNqc5Vf2trQF3GudTTniyCfOKT2UH9Jg4532BEC4fryRU3kVT
	 g+idBiqlqS8BvY1+k7vW7kbjT39hIRxzN64GE6qrCUXQASom6ufTgNAxFe/71egKN6Y7T90Lu5U3
	 af3l7Wzp7RVVbEQWT+t3RtC78wqBmXzmssDz9BAsvzuxKZ6jyYr7wISiJmwAIJgsVA8+IXiYOCCL
	 UG6xmXJg1wS0KLNU49ohjr1kAdVUzlfUWCAyP+P9WMRFnRfYAuS2DLPaJJWZdxgiChVQxkYvrWOo
	 ReIy9mXM0SipP5eUaZrPaTPPaNfFQoFq1ge3T1MRbhe180q8MuJoOREptEFLiDwjMXCq206Sqccl
	 Al97RQn0chrdN62FicNG/HAR/3scOgDzbaOfI27kGYHL4Kz8jUtnuji2kbyjtI1MKPFkDg2+hnNL
	 iQZD4CrV9UC4JCg5+zUbZSwlZWvjr3Z/LqZGNK10c1DB4qtjk/3wK7cWdhZTOeDRfhkTLjozPEvN
	 VgbUeWd0A3cJtF2XdTF2AkJpgAbw3Se/1D46owB3WHC6TlVWg/ahAw2kXdujpymzcLmCu/UDakCc
	 DNni6bTJ3L1GaxTUEcL3zXYOP8Nzgk2h0PqmoZ4C6um1fx2L3oNUgH8+RTvnWr64jxn1thRrpqRO
	 EGJZ+r8WTxBksXFc/oTsOkWIp71mKWxeVLeQxXi128WSNKt4bvacluB6o1ccIzl1Na5mrpqxYjYY
	 Y+GakzcBEaAPdkAspWELIIDf+P8MZy+sseVqdnFr/vsZ3M1z3AifsTkgAjth6FUg437BOQK4eW78
	 GJm2vzeHZhEXPUXPTI2s1tRb+yVPP/On81jkPpFZwEiFxOT3kMzBgN5uPvD5UEitvIXRtjBry50b
	 I8Zpa46M33d4IKuC26XBCJiGdCLswHWIReeGDFtAYWkq/SQKQ=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: akpm@linux-foundation.org
Cc: andrealmeid@igalia.com,
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
	wakel@google.com,
	ywen.chen@foxmail.com
Subject: [PATCH v6 0/2] selftests/futex: fix the failed futex_requeue test issue
Date: Wed,  6 May 2026 11:23:11 +0800
X-OQ-MSGID: <20260506032311.3984223-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This test item has extremely high requirements for timing and can only
pass the test under specific conditions. The following situations will
lead to test failure:

    MainThread                  Thread1
        |
  pthread_create--------------------
        |                          |
 futex_cmp_requeue                 |
        |                     futex_wait
        |                          |

If the child thread is not waiting in the futex_wait function when the
main thread reaches the futex_cmp_requeue function, the test will fail.

An attempt is made to avoid this problem by checking whether the child
thread is in a sleeping state in the main thread.

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

v5->v6: https://lore.kernel.org/all/tencent_35CFB8AE9D4BE7917D95763D15B972638C0A@qq.com/
    1. Add parameters to the futex_wait_for_thread function to support custom timeout periods.
    2. Even when the proc file system is not mounted, the test case can still pass.
    3. Add timeout time comments to the usleep function.
    4. Reduce the time of FUTEX_WAIT_TIMEOUT_SECS to 1 second.
    5. Add the necessary header files to futex_thread.h.

