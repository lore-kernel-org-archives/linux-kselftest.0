Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995A368D49
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 07:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569886; cv=none; b=oAMVomiTvi/F5rlVXVZ04mwgMJby6bxSoYHjz16aBYJLBmZ9mg+/fqaw4IQ0EXFtMfXgMLgMo4QSTyqGKpA8ck++JlxjaGMZY3Uia0PvyFggpr8s/+bvMegR4FT2YNMbtKKhbxdDx1j0LURDF88MTjuNPrcEZr6qxN0wylF7oGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569886; c=relaxed/simple;
	bh=Bsj0NTR+ZG+LANI3ETze0Xe8Nhdh1LqOf/igRwUXDnw=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=a6kuT3CGvvxQowXMaQcd/+l8YvXZ6nFz/phxL6o/IlTXlLILLyuch7zdV7pv+m57KAtSTnO0/RJnCA5RwbaN/EQKpQ3tmp6Fa2kKXxwp9GK+pU98hrnIUFl47Hdm98NNZIBEKtxvGaTpJWzvZtqr03NNZcL6FrT8O9jHr8Alw5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=PGjIOiBV; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="PGjIOiBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1778569866;
	bh=2yIleFOrSMd0WsxFhzfMZS0EbCTfVUeXJ8YlU2crcEQ=;
	h=From:To:Cc:Subject:Date;
	b=PGjIOiBV2DWDOv/ajHxdtP3pSTxI6wCKFxa0iYWxYjfkSKWKR1uYS+YYakuJ5ry1A
	 eoIGGuNZiKSOHuprQDQJLQtBz82nv3f/r/VB1vZnmpm+pXiPop1/UxTBAhxkE7XswV
	 +OEKvi2K2yR/YYYpcEf3JgapRBEsY2OWAupnKDHY=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.153])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 2C284849; Tue, 12 May 2026 15:11:02 +0800
X-QQ-mid: xmsmtpt1778569862trggnqjke
Message-ID: <tencent_0C775F885D7D4560DC59E359AE7DE74C7908@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+cISVLX2UZhCN77h4CaeFHNic4HGwuXFFaicwY+tx+1eXNTi182
	 WknE6+lkX7/Xz/cSqZc8LkIUX50SaDFMwhs3jgJRObp4Gy/r3n0XDmXT7bU8NIDv4Irwn7WmYlyH
	 HDYf/S+uVrbAOMeXK0cJWbDTnm1lGI+9cHjTuh8+z8j6xQCo8BxjCob5f/8EE4/j8VCP8sfcACcj
	 sozeHxNRUhf9KYRxsomPbu8mbshtBXsU4kK0TMeBKzNRjJbkj8IPLrFS15uYemsEEjK3mJ+/QxNW
	 /+pCsqGBFk9vjgHZe0Nv0FF0SwhTHnPBD1VPRW/ODC0qM0VkD3uc3iYfUPaSDEL4FHgTRP8FHPHH
	 TodxxVEfiZsPLmSaTo6gpX1FCH5y29eUQHZTyR3kZjoc24ta3fikXMWhtFN785ZflsVYcTtybkZ9
	 Ws3m04DYUf71Y36RSoWX3AFFLHkzYo6srvkQh3uzvddnt90gpqeNbEjjFP7yVEVX3h8L7akWtJWS
	 W/ZFXyf0+w1cDmOlQEzUMgQwfP2ZGevemVQEbdw18FpUjP/TqXh2kLh9bu4RCkF6DRrXw6bYLGsY
	 ikuILGcBsLCqbKqIVmfONpvDv5BqBNhJ/LC9kD5T5ePrKREZMPivtkHbgsKemMZDaKxP+WIiZqcm
	 ffdqjQz+BJx0m2oHxDATrgWRQTeuo12xqp1EZ1OsWyNkwDaU3aYozNyeU+WfGAkQusNFs7WgAZGd
	 zYRTEkuMQrduMH9l8KPiZ91TE0hEIUghU1hvEWxUhPKD/7UCzZfYGw7J7/VTb88nPa6KwdEGwWSF
	 Rx/jnjVDmFZwSIP+4o9dPcZS4jYjpabTHt+14hVU5nwu06gbflQ7tkl32XoO1DgpiEUCrWdrIFD5
	 8RvyusuZdPMej+JLvGPZCqzrPGd0SA586pAjAE4xO21l4ZMm+QjW1wPk0oz0xQT6gEBHf8HBdtl3
	 edQ41juu4939IBfzJpPppmxoVUPk/UWEMYvVsq0rBSRf8LcKVO7jUVZwi5fWFzR46zgmZIKv2VpO
	 xrWqegk2q6j8x3VBPHuhMC14sSvEZrwWXZWzFSLQzwvPr5sQato+V68zFx9IdD9hXAICFSJNrYC0
	 2VhdD0i9oxfbDzd5776oPJ0wXxqA==
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
	wakel@google.com,
	ywen.chen@foxmail.com
Subject: [PATCH v7 0/2] selftests/futex: fix the failed futex_requeue test issue
Date: Tue, 12 May 2026 15:11:00 +0800
X-OQ-MSGID: <20260512071100.3105883-1-ywen.chen@foxmail.com>
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

