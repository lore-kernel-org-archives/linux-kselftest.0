Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA823D8100
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 02:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031519; cv=none; b=Rp9f/fqJsAlvf18Su0E/zNOUskRNO5ojuLE3jXqR5UV27ME0IKCEOWQNa0LIUaaPmeqGSpVUNWr3zS1elbsuJD7Y2p6N+R/Aj0J3QhOiWh+HvFHMiMzLR69JRADNqHPBLIEevOo8ft7swSds8LDNVtQ6hZdVdNhJrFofOuNByQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031519; c=relaxed/simple;
	bh=Hyn6Brz2r6asUQqPw/bkJ2P070nwYSPvJpihl6CDeM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQ6f88ivuEAPz9YLjVCCe2s9BLk0G2BkLlQE1jVg7tKECaKSCEmj3npt8A8AnFKCb2C+nj/d59Kx82nh9fh2Z4VrlE4JbI08Q8BicRTN+CIOng0TAD8IKbuoNG/qApzQx5OMKCtS6WUDKbPzmedNVW+hgAPcCtn+GqZAKumnOoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3Cbaah/; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3Cbaah/"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1419d3416ceso2899947c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 19:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792031517; x=1792636317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hCmj7xyopycFNiv0D1Stl0bSxaenFDlp3ayU0RvHx10=;
        b=Y3Cbaah/ghciNRRWbzQDwMQsBFzPrD8o/4gKuuQx8Zhmzfjs5tYGjZr+yo18zveRWC
         RvwgM1BGGy3vLuxtreqD7K8WtyJ0AnoSPJYOh8EZ1/gnf+VG84VvX0B5wckXzWWBCwzx
         nUXugvVqsnHXOEvX1FKUpVC4abICZ3GPRbx3cRF6xAONex6tG411noU6HfxHx0rhBO8a
         5ewEgeSDAKR4QRcVd3qXFRMVfQzYogZLDEtZXRhS4YrlZ2N8seaj750MvHFTcNhKTl5h
         AAj7HBKPcdooEqXSLv5O2PyUIKJBYmwl0s7t4TG8ucIGk4N6JT71oydRMa7Vz1MC5HEt
         FDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031517; x=1792636317;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCmj7xyopycFNiv0D1Stl0bSxaenFDlp3ayU0RvHx10=;
        b=mc1S11M8hRH4HuKnIFSEmkRVjVdHbygztvmgA5krJFhR3h9Mg/K2J25DIptkm8GZkv
         BbYLgkcYNH8cXnU3ydPFKGOOcXs202cJUeo28R0q9NQ+NRCU09G2K4NS94fO8RAOEKqP
         wqOONcbVjSp//nxcmK5NHeh+Rl7wVt1hXDhLV2e12gB8mvde6EXQqabN5JgJsN7mjXg/
         fM257ELf+ANtkuSterOLMUALxX6MnLC/ryviQ+qBZc7EGB+ZdRI+9kDcGcyJrda0J8BW
         JcePJBnUPuqkT/DcRX6jXKjJ1nAb7yyYOQ++fH9ZMLQcjIWVywpwCxs79vAcfjqZQWKr
         F/HA==
X-Forwarded-Encrypted: i=1; AKwUvBx21pa1ngwbNrcGJ+Rw3ortWKqbz2Kpb6/8+499bih0H9lkAsk6xGe3w/0NsTOISvyPH7QT93LhovImvHSpm8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyiroAvONA3GdcAqTCcNPxfZ/CrNSf/TmeNmM0CqJk+03/gGeV
	j8pJ9r1BNtDpj8u1aP4HwxUEo2qhsrr416/ZDCC/6OeE/VitkfUXjw3u
X-Gm-Gg: AYBFou3Tq8aWZ4Nw2uLz6e+uzVTg5XJ5CfVSFcqz5tiZMZXBgj0uXOVuUrlnPBKbiF2
	mGgPSoID0ytNUq1bmjYEbnD1N13lVZRPMiDSiu8iVzrmiSl3Tn6KwAVioVVqeeGHtppPEffC9aJ
	dl/YAdIFg3YGUdHtIeoX/VQVdxoaOAl2Wub7v4pAKR8g6tFjSeHw6AUzLzdH6Cn6DBLUnQjwSVC
	7crGzMO3ojcRPFMwvdrDmXsfdMsgTDvtjPdELUnLIM752I5U35m6CszdcK1cFPxkYu8SC/nzMpY
	47/YYPjk85F3N/dujb2Xjpst/ygSkyhUR1DblbrRZ3eo8JPPq3NT6pzIbEwzwwrtCFBMfNw//WD
	v9z2y0HwCwpyvrwnvzQ+h34tVh/KMUR4t5CnAb/u2Psg1rEJkSyimCKWZpXqR0zIs6l+G19jwsZ
	Aw6L0ihuCRs1m+k/LvGsNbXzaD7FXFOvpKaDx9x5HB40ZKxMQZidceEko3aR92fgrE
X-Received: by 2002:a05:701b:454f:10b0:14d:baf5:c411 with SMTP id a92af1059eb24-16a5faa7697mr23383062c88.14.1792031516796;
        Wed, 14 Oct 2026 19:31:56 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm49912225c88.21.2026.10.14.19.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:31:56 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Li RongQing <lirongqing@baidu.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	HyeongJun An <sammiee5311@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/2] x86/shstk: free shadow stack when copy_thread() fails
Date: Wed, 14 Oct 2026 23:31:46 -0300
Message-ID: <20261015023147.519257-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023147.519257-1-ivanrwcm25@gmail.com>
References: <20261015023147.519257-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

copy_thread() maps a shadow stack for a CLONE_VM child and can still
fail in set_new_tls(). That error returns through bad_fork_cleanup_io,
which does not call exit_thread(). bad_fork_cleanup_thread does, but
only after copy_thread() has returned 0.

commit 748c90c69336 ("x86/shstk: Remove useless clone error handling")
removed the shstk_free() on this path, assuming exit_thread() would
run. It does not. Each rejected clone leaves one shadow-stack VMA in
the parent's mm until the mm dies: one map_count slot, pages not
populated. The size follows the clone stack, or RLIMIT_STACK when
that size is zero.

Free only after set_new_tls() fails. The allocation error returns
earlier, while the child's base still aliases the parent.
shstk_free() ignores a cleared base and a different mm, so
CLONE_VFORK and !CLONE_VM stay no-ops. The exit_thread() path is
left alone, so the double unmap that commit avoided does not come
back. The io bitmap is still shared only when TLS setup succeeds.

Tested with user shadow stack enabled, on one config with and without
this change. Sixteen clone3() calls with CLONE_VM|CLONE_SETTLS and an
out-of-range TLS leaked 16 shadow-stack VMAs without the fix. With it,
the VMA count was unchanged and call/return on the parent still used
the original shadow stack.

Fixes: 748c90c69336 ("x86/shstk: Remove useless clone error handling")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/x86/kernel/process.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 346c438ac880..be840652d055 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -265,11 +265,19 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	/* Set a new TLS for the child thread? */
 	if (clone_flags & CLONE_SETTLS)
 		ret = set_new_tls(p, tls);
+	if (ret) {
+		/*
+		 * copy_process() skips exit_thread() when copy_thread()
+		 * fails. Free the shadow stack mapped before this error.
+		 */
+		shstk_free(p);
+		return ret;
+	}
 
-	if (!ret && unlikely(test_tsk_thread_flag(current, TIF_IO_BITMAP)))
+	if (unlikely(test_tsk_thread_flag(current, TIF_IO_BITMAP)))
 		io_bitmap_share(p);
 
-	return ret;
+	return 0;
 }
 
 static void pkru_flush_thread(void)
-- 
2.43.0

