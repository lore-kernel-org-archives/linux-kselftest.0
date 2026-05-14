Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF893D8910
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778769348; cv=none; b=RGxROXaTB1Sc0ciH+SDasgDDyX6y0rVYJswhV+lLggTPUKOIevz0JRELD6v54qaKp1VMmuzDl4RsbyLUpZuEbDltpKsXHme8x21xnOolyxVANCGW7szOjBG87HeQNylbrg4S0/gwOegZLxUGsL+R2GL9YKSnn6jkj6LF4Qu1YpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778769348; c=relaxed/simple;
	bh=zTI62x+Er1nj1TIupC3QumbIb31i/Q56jB/+lk1fIrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9rqCOWbHFEMa2g0BtYstcJxwrvszIwN/ddTEXrH/c7k8JauOnDECJzcISonfPCzc+GNJi3MPFLxVk016X+pjeiKThK4H6yup8jibeP3ESqL4zSMEEsQfxTmGRwdaAfUmIjVHcQYNRFt29kfr3ZLJbQ+iL9CDeH9qeXlYc5/Gog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wpq0V7Vv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wpq0V7Vv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso4751007f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 07:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778769345; x=1779374145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTI62x+Er1nj1TIupC3QumbIb31i/Q56jB/+lk1fIrE=;
        b=Wpq0V7VvKMB5WpojVXIJGTc4d9WbnrwaIoOPut6ZJjSwc7iA9ScndWtZfjbYBKwU3X
         8MmxbG8YgC4Y0BRWR+I7vtldP89kT+gHOtLHPe1vr68wXPeU4HovfEIf8X0KJmfw3Ilh
         wmuTLvZ0sw3URqec16YvUNQ2q297JVVOhHTIzX1/f8h3IlVpw0GrMXPFt1r//aK5JN8X
         QHGsoZzxwSv0DvRQpuVap+nZPBeNip2AuD1Oi8zqMM5NqnHkwe879ZaZtdK7DgZ8axUs
         ztJBMkfpVUtMEQHG9Y0L6Ke0K092hirkwYacHBHLFkThZG4SAesmCxlu4eDLIFVFzzfb
         lBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778769345; x=1779374145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zTI62x+Er1nj1TIupC3QumbIb31i/Q56jB/+lk1fIrE=;
        b=pfwvFdRsr3g6Q4jOQ9i08TbdPJglFJH7/G4BWhyZWlFGxWgxxIGoai4XQ3t0PWA2oI
         G9URkiEiEg0ozRdxjeMfiYRWi4kJpHdrO3CW6kjHWsT8FmjWdGx7TDDMOiDa2i1CQktG
         i3TOea5j5hq5A9wrWWYx1SxVYzxypoeNFyI0BfPdlIuh2BAo29BleWpqoqe5BFHLR0Ex
         XQO3ze22nzsQlcHgMkxjKus189EZkPqxEd1/XH6J7B6g5rui5Haw/xnCWCQptpS6t9Rs
         EKNVV8vaBkrLNm7ZrGBP3HR5e/g80cD6Cugd77hgFziMS4owFpF8/U2ZYMy3p5MM4MNI
         jn3A==
X-Forwarded-Encrypted: i=1; AFNElJ8xvjkh4ekjfLbI7Kj9cKV8Aj3AZFN3HyIC2W4AvXLxI/KvhOuYEr7G83LKJWugN3SCJkCnmlcv0xEKOkv3XJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUSWfUQ98m0c2ULY+gZpWRl96xngBgiUdAElbmMxHVhAFWgX9+
	NzOzplY4N4nHuBSvd9SU0JR8nWTiIMfz6OYZhXcG+Ir1vegELPDLg8hq
X-Gm-Gg: Acq92OG7hZyQSQJpybwI71+8eVGznmua4xImIhT6xRp+raEnGTI7Yj5+hf858ZpV/Co
	gga03H/oxN5Q29awfTJh5D75KUtTdBTT7Wz7MTQM6xbq/fs3L1QPB/bv13RKL+kC0/VzQoNhB/M
	HLEneG0eaoAWBqWMP92SN/as1bjf1DW0Y3M1SFnoWqD4kAv68Or4b5/koGmhWJzI4UZFMxYP4Cj
	lZg56ZsS/8WT9H1cc0PThbjbAZySMNWcSLCU4b4q6YF/YekA1JdogLPi8tcYg4hxnfs6u+ikjWg
	9P/GEs2Qgxn5yGUC4Ie0JoXqV92eQ+p9M62bndWUzgFs6EXOHEFYuMbLJjjC9APWdMBf9RAzr3S
	PStWXcbhvmxuUUWixIzd/R53l5IKnuRxkfrM6A3Wil1y/BPIfCOMDwTgJyQ3/xdsr53aFpogAHr
	Yq/h3WcjeK03jXW6AM4g+UCvpmbMWtD9x6KNw=
X-Received: by 2002:a5d:5f45:0:b0:44f:d9da:2c40 with SMTP id ffacd0b85a97d-45c5a1a8b66mr12863131f8f.21.1778769345395;
        Thu, 14 May 2026 07:35:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8308:b093:bb00::bc35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13a7sm7694530f8f.29.2026.05.14.07.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:35:44 -0700 (PDT)
Sender: Alban Crequy <muadda@gmail.com>
From: Alban Crequy <alban.crequy@gmail.com>
To: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Peter Xu <peterx@redhat.com>,
	Willy Tarreau <w@1wt.eu>,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Usama Arif <usama.arif@linux.dev>,
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v3 1/2] mm/process_vm_access: pidfd and nowait support for process_vm_readv/writev
Date: Thu, 14 May 2026 16:34:15 +0200
Message-ID: <20260514143415.266045-1-alban.crequy@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <8b29da5b-e260-4b77-a640-8abb447291d1@kernel.org>
References: <20260428122826.339550-1-alban.crequy@gmail.com> <20260428122826.339550-2-alban.crequy@gmail.com> <8b29da5b-e260-4b77-a640-8abb447291d1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,=0D
=0D
(Apologies for the earlier HTML email =E2=80=94 resending in plain text.)=0D
=0D
Thanks for the review. I'm addressing all your comments in v4.=0D
=0D
> What is the expected return value to user space if we run into this case?=
=0D
=0D
If the first page is not resident and PROCESS_VM_NOWAIT is set, it returns =
-1=0D
with errno EFAULT.=0D
=0D
Note that Sashiko suggested to return errno EAGAIN to distinguish=0D
invalid addresses from unpaged memory. I haven't done that to avoid=0D
adding more code tweaking errnos; let me know if you would like me to do=0D
that.=0D
https://sashiko.dev/#/patchset/20260428122826.339550-1-alban.crequy%40gmail=
.com=0D
=0D
It can also return a short read, meaning it returns the number of bytes=0D
successfully transferred from pages prior to the fault.=0D
=0D
This is the same partial-read behavior as a regular=0D
process_vm_readv when hitting an unmapped page =E2=80=94 NOWAIT just change=
s=0D
when the fault fails (immediately instead of blocking).=0D
=0D
I've documented this in the updated commit message in v4 (I will send it=0D
shortly). I also added two selftests that verify partial reads across a=0D
resident and a non-resident page (with both single iovec and two iovecs).=0D
=0D
Interestingly, while writing these tests, I found that the current=0D
process_vm_readv(2) man page incorrectly claims that partial transfers=0D
apply at iovec-element granularity. In practice, the kernel returns=0D
partial reads at page granularity within a single remote iovec element.=0D
I've sent a separate fix for that to linux-man@:=0D
https://lore.kernel.org/linux-man/20260514083659.139971-1-alban.crequy@gmai=
l.com/T/#u=0D
=0D
> And in the same context: Will you send a man page update? :)=0D
=0D
I've included a suggested man page update in the commit message of v4 patch=
=0D
1/2, ready for the man-pages maintainer to pick up. I'll also send a separa=
te=0D
patch to linux-man@ once the kernel patches are merged and available in a n=
ew=0D
Linux release.=0D
=0D
> We try to sort this alphabetically.=0D
=0D
Fixed in v4 =E2=80=94 moved the include/uapi line to the correct position.=
=0D
=0D
> Thinking out loud: the c file is called "process_vm_access.c", should=0D
> we name the header like that as well?=0D
=0D
Good idea =E2=80=94 renamed to include/uapi/linux/process_vm_access.h in v4=
.=0D
=0D
> Should we use BIT here?=0D
=0D
As noted in the v2/v3 changelog: BIT() is defined in vdso/bits.h which is n=
ot=0D
exported to userspace. UAPI headers using BIT() (like tcp.h) work in-kernel=
 but=0D
break for userspace programs that include these headers directly. In practi=
ce,=0D
BIT() in tcp.h is only used by TCP_ACCECN_* flags, so merely including tcp.=
h in=0D
userspace programs won't break them unless they use those flags. Those flag=
s=0D
were moved from kernel-only headers to UAPI headers in commit 4fa4ac5e5848=
=0D
("tcp: accecn: add tcpi_ecn_mode and tcpi_option2 in tcp_info"), which appe=
ared=0D
in Linux v7.0-rc1 (not yet in a release). So userspace programs don't yet u=
se=0D
those macros.=0D
=0D
So I think (1UL << N) is the correct choice for UAPI.=0D
=0D
> This could return -EBADF or -ESRCH. We should document both in the=0D
> man page. (or decide to always return -ESRCH, dunno)=0D
=0D
Agreed with Christian's reply =E2=80=94 keeping the actual errno from=0D
pidfd_get_task() is useful information for userspace. Both EBADF=0D
and ESRCH are documented in the suggested man page update text in v4.=0D
=0D
Thanks,=0D
Alban=0D
