Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EEE43F4B1
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784570068; cv=none; b=ub0PBb9zRIUNUtYEEl6EmjJ8rf2TANBjs25annvziG+AjMRTcjRW5/eU9GKjid4dCJfdQNhnQ9s2WgLVIHIsK04qL0dZ++rciRqXmS7ilLte0Qz0M8fP9Jtq8TivsFhk4n8dS7oC8IxEiE5VvWp+MDrpsswRlX8X4nBmv+RVKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784570068; c=relaxed/simple;
	bh=8PnWAwaPwirmO4GgL7LEGlIqHi6SyKLQQ7uw3JXA7yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4/3khwte8p+N+iOgbLBMpfvRaJb86A1PPAvFw4yYz5G/CI50PmQK2hBoAU7Te5Oxcet0op48/FoSRGJC4LEfhgsA81NbSSyFKjBRnFCL4aNFg65JLMRGz5+wshmgebLQFtZChOTk0kR054eKWPoDWyFMoZKzpkihGcwI9vLJyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyIqqgSr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyIqqgSr"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-382ef647e20so9888722a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 10:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784570059; x=1785174859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NzAJq7vlEZOu57+6zY6rNgf3B6FzEOANzSndOpxDhqo=;
        b=HyIqqgSrmaPkAM/HeyiCHpeJsgqnMgCvDzj/c26lbx8Bf4EF2ADU1pa7Brv2lHItTN
         TvOjdPH/UMtVIv2J5N+WpUztdToTAxAtb0amKdMbL4mP4rnWYBLbhSFxlyNMC1eOmYnU
         RwUqYRWg1x3/yDdX+mLGdpAqag+ZIOwwBXiP/YBaJyordQfUaKXgwGn5+RIacZVT1t9k
         u1gIG6NP0dz597//asX4gYY6kyYp672ifYPasSL5Tq/r0jiOKH4fjStVM31atIcHGPKN
         Ug40fU4GzuZ73s8S2fwOjThelElhstrfb8T9611EO2yP12rxUP3QUbge5l7c9rBNNaAy
         Fo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784570059; x=1785174859;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NzAJq7vlEZOu57+6zY6rNgf3B6FzEOANzSndOpxDhqo=;
        b=o/pSHVXAaovH7lBv0Cvesz5l7kvYi7Ci5RTnk6e+Wi4bGW8ol8DV3OAst6VuO1G3XC
         y64DtdcHtsF12cM3fO4lz5w47SdsNtOwWAtHBJaFYaVZ310RgWEQC+JzgKAG6XKoU4Xq
         G6NXLTtIgulS6psNj1Mw0is3H0BYUjQDRGSaAqW3ctL3GpsBMTGpVTRYI/JbfftgKRTB
         9YJYoqiyRfxDDnC/SlNSrcMqo5rWCcuroa2sZwFdpb8NOB6B5ItGZn9owDLH8pyfZXWc
         TN9EPPMC0cDWO1OK0485MTUrN0XAcZQH9CL3cI9+VG6l5t3GEDnwS73tUqG9qAwFbz0W
         Yolw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8aeHU3haL1d+oFq0LidDc4woCmgs71SyUZav2SDiqsd8i0WrHYPYr2vb+IW1oYBNWfbB58LDyB6Nt7gJtFos=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKBITw3x27YB0WJUlaiCg12WMRoIeTJR/hnFXoJgE4apv+r4mv
	Ar2C9QZANtjm/NfrPc7ErtYhyElbxv6RTLKLxqFAIk8dPTmDDBsjwifk
X-Gm-Gg: AR+sD12ogXPOearsAU04XOPyiK8pZdOAeuZMnuvXiJaCGZjUdUAezcIpxiYF3bMsJDK
	GtfaiuD7EB/9L43U23hr7WtRtorC1y7j6xylumh1sEmqAJcG7giLs2PoPITU5WzaIvsrR1YSCOq
	N/jo5RNjRPoTyoqq2t5Q35mar9SzrMxffYdmnvFugn0g1lY66RXDE8jyXfQhWdIpze/uh9844ua
	YCNp8rJQ1SwfYstMnPU/VjrVFi3BPEvmO5SUyEcPHbeWO+7nYdgWvq66XaCPqAEyttTJknQCFzQ
	DgWZe/I4cSqHwLCHfnTVUKpSiGiUjyNVTxp0ZzoGmvwyYee228VW1VFfQRFiEA3zZe7fRYrRUCG
	TnFC6iB3lPkIAxx5626ElaCArUPwS2Q2Qk7RUUvJ+xSK8QyL61BNPR/bDZhNc9sMxvWc+J6t6
X-Received: by 2002:a17:90b:5588:b0:38d:a150:ee04 with SMTP id 98e67ed59e1d1-38e4b55aabfmr15311812a91.30.1784570058844;
        Mon, 20 Jul 2026 10:54:18 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm33370583c88.15.2026.07.20.10.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:54:18 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 1/2] docs: ntsync: align ioctl names and struct layouts with uapi
Date: Mon, 20 Jul 2026 14:54:01 -0300
Message-ID: <20260720175402.44338-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720175402.44338-1-ivanrwcm25@gmail.com>
References: <20260720175402.44338-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The uAPI documentation used outdated or conceptual ioctl macro names
and listed ntsync_event_args / ntsync_wait_args fields in the wrong
order. Match include/uapi/linux/ntsync.h and note that absolute
MONOTONIC timeouts are interpreted in the caller's time namespace.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 Documentation/userspace-api/ntsync.rst | 33 +++++++++++++-------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/Documentation/userspace-api/ntsync.rst b/Documentation/userspace-api/ntsync.rst
index 25e7c4aef968..a778016feb87 100644
--- a/Documentation/userspace-api/ntsync.rst
+++ b/Documentation/userspace-api/ntsync.rst
@@ -83,18 +83,18 @@ structures used in ioctl calls::
    };
 
    struct ntsync_event_args {
-   	__u32 signaled;
    	__u32 manual;
+   	__u32 signaled;
    };
 
    struct ntsync_wait_args {
    	__u64 timeout;
    	__u64 objs;
    	__u32 count;
-   	__u32 owner;
    	__u32 index;
-   	__u32 alert;
    	__u32 flags;
+   	__u32 owner;
+   	__u32 alert;
    	__u32 pad;
    };
 
@@ -152,7 +152,7 @@ The ioctls on the device file are as follows:
 
 The ioctls on the individual objects are as follows:
 
-.. c:macro:: NTSYNC_IOC_SEM_POST
+.. c:macro:: NTSYNC_IOC_SEM_RELEASE
 
   Post to a semaphore object. Takes a pointer to a 32-bit integer,
   which on input holds the count to be added to the semaphore, and on
@@ -186,7 +186,7 @@ The ioctls on the individual objects are as follows:
   unowned and signaled, and eligible threads waiting on it will be
   woken as appropriate.
 
-.. c:macro:: NTSYNC_IOC_SET_EVENT
+.. c:macro:: NTSYNC_IOC_EVENT_SET
 
   Signal an event object. Takes a pointer to a 32-bit integer, which on
   output contains the previous state of the event.
@@ -194,12 +194,12 @@ The ioctls on the individual objects are as follows:
   Eligible threads will be woken, and auto-reset events will be
   designaled appropriately.
 
-.. c:macro:: NTSYNC_IOC_RESET_EVENT
+.. c:macro:: NTSYNC_IOC_EVENT_RESET
 
   Designal an event object. Takes a pointer to a 32-bit integer, which
   on output contains the previous state of the event.
 
-.. c:macro:: NTSYNC_IOC_PULSE_EVENT
+.. c:macro:: NTSYNC_IOC_EVENT_PULSE
 
   Wake threads waiting on an event object while leaving it in an
   unsignaled state. Takes a pointer to a 32-bit integer, which on
@@ -213,7 +213,7 @@ The ioctls on the individual objects are as follows:
   afterwards, and a simultaneous read operation will always report the
   event as unsignaled.
 
-.. c:macro:: NTSYNC_IOC_READ_SEM
+.. c:macro:: NTSYNC_IOC_SEM_READ
 
   Read the current state of a semaphore object. Takes a pointer to
   struct :c:type:`ntsync_sem_args`, which is used as follows:
@@ -225,7 +225,7 @@ The ioctls on the individual objects are as follows:
      * - ``max``
        - On output, contains the maximum count of the semaphore.
 
-.. c:macro:: NTSYNC_IOC_READ_MUTEX
+.. c:macro:: NTSYNC_IOC_MUTEX_READ
 
   Read the current state of a mutex object. Takes a pointer to struct
   :c:type:`ntsync_mutex_args`, which is used as follows:
@@ -242,7 +242,7 @@ The ioctls on the individual objects are as follows:
   ``EOWNERDEAD``. In this case, ``count`` and ``owner`` are set to
   zero.
 
-.. c:macro:: NTSYNC_IOC_READ_EVENT
+.. c:macro:: NTSYNC_IOC_EVENT_READ
 
   Read the current state of an event object. Takes a pointer to struct
   :c:type:`ntsync_event_args`, which is used as follows:
@@ -255,7 +255,7 @@ The ioctls on the individual objects are as follows:
        - On output, contains 1 if the event is a manual-reset event,
          and 0 otherwise.
 
-.. c:macro:: NTSYNC_IOC_KILL_OWNER
+.. c:macro:: NTSYNC_IOC_MUTEX_KILL
 
   Mark a mutex as unowned and abandoned if it is owned by the given
   owner. Takes an input-only pointer to a 32-bit integer denoting the
@@ -276,11 +276,12 @@ The ioctls on the individual objects are as follows:
      * - ``timeout``
        - Absolute timeout in nanoseconds. If ``NTSYNC_WAIT_REALTIME``
          is set, the timeout is measured against the REALTIME clock;
-         otherwise it is measured against the MONOTONIC clock. If the
-         timeout is equal to or earlier than the current time, the
-         function returns immediately without sleeping. If ``timeout``
-         is U64_MAX, the function will sleep until an object is
-         signaled, and will not fail with ``ETIMEDOUT``.
+         otherwise it is measured against the MONOTONIC clock in the
+         caller's time namespace. If the timeout is equal to or earlier
+         than the current time, the function returns immediately
+         without sleeping. If ``timeout`` is U64_MAX, the function will
+         sleep until an object is signaled, and will not fail with
+         ``ETIMEDOUT``.
      * - ``objs``
        - Pointer to an array of ``count`` file descriptors
          (specified as an integer so that the structure has the same
-- 
2.43.0

