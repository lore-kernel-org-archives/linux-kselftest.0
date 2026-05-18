Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03F3282F19
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 02:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779070535; cv=none; b=Yt6pU4UtWahni/bUmk7yBE7hQySjOWVfPXwxs7DqESvcIxKnKizzhrssN5sbtws4lXYzZ8jjrJbMz6fHRPbSS4gpo4yTJAZqZ50aLyZajc0L/fZwVa3BFlxDqfMfM7MQOvkrppl++OXdva9n43WkORLGdkmaeWbo+cyT83PCkn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779070535; c=relaxed/simple;
	bh=C0lnk1EG96aV5J2KecLb92bNt444w8S8AvX1gi5BCgg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=CqI4DyB4CgIFKYSehZr+yqxuFqO87J/+D2+NyZFUnIwBFLXbcUcgB1qxxZzQilrsjGgU1gZrpfn7+TZLgYH3aKrH0hI5Ec4Fa5NKDVJ0R2hofNRf9Th72kI6Uftpud6Gmm3v+nxBCCJoqgUAMyQaluHa2bGmurZlbd1qPxUy98k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=RVdxzzWW; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="RVdxzzWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779070525;
	bh=EnKu1g61DecpOV/4tSB2C/vE5+QO/zP3rPaOA5p+HEM=;
	h=From:To:Cc:Subject:Date;
	b=RVdxzzWW2xIre+7JkcUq6NBS4XZRCe7hKrAXSDGPrEFvtjUdqeQVyNXvCzVGxXIku
	 DmxvpeQDxgR6x4MfkvZ9CIsywkHOTUqznEJO7BXIUSNZPKVXbTz6Mj3MS/l/BcD8ms
	 4Mc/lQdyPM39izBj+z0SIq09EuK5Oixs2FYATQJs=
Received: from meizu-Precision-3660.meizu.com ([112.91.84.73])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 3D58E851; Mon, 18 May 2026 10:15:21 +0800
X-QQ-mid: xmsmtpt1779070521ts3q36bd9
Message-ID: <tencent_A68F2BD3395C9EFE1759975A511BB7D9F806@qq.com>
X-QQ-XMAILINFO: MILSKRzDrLPbdCISlLHJYEfS/cLtscpDNVDdEOCPbcojM3N2hGgxT6QDpEMpb3
	 CKOtoY95LIskD30NCEn3wZXZGrSlq5cay4L4gycTKRF+6yPD9SVk8RC3txtmDbqUYaCJvNme6jbd
	 r9oM6qutdjA9cj2bKdUQgoA/a/85HvyaxFLWEbPPi4Z6WyhozsreyPij9An1eYovaYxFD5xo3eXq
	 QYYhxbpWoq7VZZgElk1IKZlAi6/LqN7K+e8yGjTNDuT2YVcTKSPNPjfsRkxhG1M+DgK9BWVuntYb
	 e0Dl0jvdkac3U3l0Ruhq5cSg/8SeJshDl1qRtx5cKGSoO9GMkUg0XUX1b0XayZu8vLUPuN/QcQlk
	 BePD8ztVYoFe1eta1V/8ixBXqlxOYsiuCNdLU+EyzGxz8gx18rJPMS4UgPwSVD4BCLLLgjqBeGQh
	 XKRc/zo3CV2La9zj6RR87cZGRS2t3swx572SHh3mydEwNHPBZuCSsxlawaxbJJt0at/GP+1pfzyF
	 GuGp94BCYH1BgtbJd8fK/HZC5bXE32sB3DSu4yVBphdCKvZkm94r+Q4lLsXVPyF2ZyqQRnSssHnn
	 s8LMplIZ9lxYmoSKA6ycwlHQwE0POheLS1kbfcNXJTQ7xx4W1I7JjpII1VmlCBmCysO0r0Ib/e9l
	 xQrLDzfODJj/b2/DCIcUeGQO7ICz5TOdxtANEmOOva1luXaHrm2AhBctKwBegx19+feKWirbImpY
	 Xy+qsh6vMIED6DtseTU3zWiGZWHVUbFqRE4oRaxskq7S+GHZDEkX3RTbo3ydiUEkQIByFrNUqzb2
	 39u7xUNofYJ3rC0wi3Rwbb5YQMBtWhNTA2vSAkE0EACrgiK9raEMSO+QssBDh289Gfq/GZlVL0+P
	 uU6aPM2pp23F5AOeMYyGgzWC8WOg4JK4DUWqz4TZQEpTZPmg/EjEr4Mvaopk9U0FUFOkdJfqjhO7
	 p/ScRwDGQbk2hML0mcbeyBqFJQpjaWp0uLZlrQisfoit7lK9ifgHyt1FDCTHu4fL62rzai3kYGOw
	 1tbYQyox0YYfBzn5QoTwb+U3UrAr3DB3ALWplBTI660/kDAL1wTEh7jnBiNJbcReA8Voul92Bu24
	 kHrfOGD5k5og2GHV1P1Bye6D5KWTXwe56/uadQ
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
	wakel@google.com
Subject: [PATCH v8 0/2] selftests/futex: fix the failed futex_requeue test issue
Date: Mon, 18 May 2026 10:15:21 +0800
X-OQ-MSGID: <20260518021521.283654-1-ywen.chen@foxmail.com>
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

v6->v7: https://lore.kernel.org/all/tencent_D6D5FA3C2F6FE52BA6ABA1A88C1B6E1CC605@qq.com/
    1. Changed `static` to `static inline` for all functions in futex_thread.h.
    2. Added `sleep_time_us` variable with zero-guard in __wait_for_thread() to prevent
       tight loop when timeout_us < WAIT_THREAD_RETRIES.
    3. Removed fallback usleep(100ms) from futex_wait_for_thread(); moved error handling to callers.
    4. Added return value check for pthread_barrier_init() in futex_thread_create().
    5. Added pthread_barrier_destroy() cleanup on pthread_create() failure path.
    6. Unified error checking to `if (ret < 0)` in both requeue_single and requeue_multiple.
    7. Added comment for the break logic in requeue_multiple when /proc is not available.

v7->v8: https://lore.kernel.org/all/tencent_0C775F885D7D4560DC59E359AE7DE74C7908@qq.com/
    1. Increase FUTEX_WAIT_TIMEOUT_SECS to 2 seconds to avoid timeouts.

Yuwen Chen (2):
  selftests/futex: implement the interfaces related to threads
  selftests/futex: fix the failed futex_requeue test issue

 .../selftests/futex/functional/Makefile       |   3 +-
 .../futex/functional/futex_requeue.c          |  46 ++++---
 .../selftests/futex/include/futex_thread.h    | 114 ++++++++++++++++++
 3 files changed, 148 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/futex/include/futex_thread.h

-- 
2.34.1

