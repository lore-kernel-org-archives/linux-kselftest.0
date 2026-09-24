Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6983161A2
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 01:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214753; cv=none; b=MGWZ49iNNiSIQAnbfL78NoYR/kE9Tr6MaZWonx2RfCwRIX+VLq0WPKF+1m8LA7hxGC08w0Nt3HhQjwEoQkyN/hJzsJnPI73xUYMfLSUf3Q3EsPGgInivmcbnFbRE+GGxSp8h16qARcFLErzOkIznxxvoimEVT/otqegROOX+G+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214753; c=relaxed/simple;
	bh=QJvpPZ/MRHEPiELxTYOq1HgO1r8v2Ya4Ct5faQQJAIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJlyQKorrahbMKR0Zw6jAFTM76zcEdsl/SEIyMkplzEaAuvnoO/8DzJUl+vGm4PxACUpQD2TxuPHDLjgbVErzG2j7A+Rz3VMdLlZYU2PYewaWdpUfGo8n5MRIYDRi2GUccLK25VFL/oeX28d+uFYFA7KEadLnEWtcum/WwjDzDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ej2fSgYv; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ej2fSgYv"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6bcc0c495efso911695eaf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 18:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790214751; x=1790819551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QL7ggWRtNIdXL5Uv/0YUEwuqXEODJnZlZOBtu7H7FUA=;
        b=Ej2fSgYvIDvu4K3rl3CVkvaQDYRczxMggASq2zogrJkTs68frFCWzAqixBBM8l738R
         TjJYPAodYu0GgyQZspw9XzldaSklmW/eVL4qSysuclAtphiGqriOyusjL0zzYU+w3Ubs
         QoohskuB4+OAj+Ddg8BX606HA4LVmNVXnN6T9SB5AVnD1I9Jm5YgMZ4MijkKTxp8el83
         jtngD2XFjOhOXWK8INgK6UxxXhantLShGE6bPcyD6fCt8jXj2UjbMnuSekzQwbRnO3Ks
         7hTKYiBNUGL1aQ8GZ7qlEn29rOI/22XMH3lU17Xq+YcSXuGtUPZnQ0nMQ5jHATcDdbB+
         b6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790214751; x=1790819551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QL7ggWRtNIdXL5Uv/0YUEwuqXEODJnZlZOBtu7H7FUA=;
        b=rFj+JtY0jTmxlpxgZhRz6t4u50OrHoEkI7du2bDkhWVBJ+T3KUE39B7frRC0KFnRf0
         /tjJMyphu7J1NC8pDH0k7q7UJMB4Lc4LK2V2hPJqGdHOmmstRSdPYqYRprMdNbOpvrOY
         q/85SeyeskOW5euiB9TnZjsH7gXztfWiNx/3vYvs8uBZpQXkodNXev6cKYTp+s8QpcN3
         cj7/L9P7UhO4ZpL9EIvyD/kY44CU1OY3agzobQ5vYt1L5fff2dviWPC6rHZYlkbVEl2i
         IsLkweYRWo8L0IFNmWV6fTfc32nnVX2z96F0A2Nq6HEDHH+rhfurVXgSMKt3NTlp6Enc
         K+tw==
X-Forwarded-Encrypted: i=1; AKwUvBzIIvqH+tmG5ylPj6urliKth3euwr/8GIZYEy3AeC/a+XhCyj6AZPwUqF8IHguIN94mA5AtC6V/9dDo5VNhQ1M=@vger.kernel.org
X-Gm-Message-State: AFuF++mcgU3OfADUP2LVnZsDFR3dPkuxk1nSeQBH6k3PGi4ZW2yE3+tj
	wYj+hfl4bCgket2DLZaptRUycKQQlNQYVegjNtj1UyxckuYweSQsvZ+A5d0qh/l5
X-Gm-Gg: AYBFou1eNPCBKzO8pT73DxRs0M0Kc5Q9shHnQPtVl6yNB32ID4I3O6mxMakxv9xoJ61
	KFOket75RloNXtIk5tDX8mwS+JXr0B76OLLGacPpfo5BUdG+qhuPH///TRZc2/eD5kQNMOt7+7/
	DxxPqOuFJSgo6V2//hrE31A/D26V98fGb6O0n3AZfbMIVLLkEXMkqxl84OefklDPltLpXs1+BOp
	kC19igygJMnWNEydKC5XvwtOd+oIt8VJ8HZyWxmd9gE/Cqshz3cRVCVA99NazNTvBQhdq5mRNFg
	xD9UOlPjmrdZ0OTkxkmrSoGR2vtcUx4RgKEgF1o1Lozwihp3KFTCj8SpahEgrXuiY24IHmsBUvp
	RZnO/was5QQs4sQ+oUYUo1zHB3ViRL/NnbyKWiyrtwwFvAq/kNubyK0rRkpEBdZdKMGprZa+92Y
	6/StaDI2/Nv72QEf/iYfB7x9j3Rk5nMrT47iXTv40eBLdERpH0k1LC+tyWXjDiv9tmoFNTdbmfO
	pqehLCULYfFckYDZutMLa1ifs/tnLxtP6IRk5dZ
X-Received: by 2002:a05:6820:162b:b0:6c7:96e4:3539 with SMTP id 006d021491bc7-6d4416aaaf4mr1160260eaf.60.1790214750652;
        Wed, 23 Sep 2026 18:52:30 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491ed1ebc62sm1057379fac.3.2026.09.23.18.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:52:29 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] tools/nolibc: fix FD_SET(), FD_CLR() and FD_ISSET() on 64-bit
Date: Wed, 23 Sep 2026 20:52:21 -0500
Message-ID: <20260924015222.31693-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924015222.31693-1-danishkhateeb03@gmail.com>
References: <20260924015222.31693-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit feaf75658783 ("nolibc: fix fd_set type"), an fd_set is an
array of unsigned long, but the FD_* macros still build their masks as
an int or an unsigned int: 1 << n in FD_SET(), 1U << n in FD_CLR() and
FD_ISSET(), where n is the fd modulo 64 on 64-bit architectures. So:

- FD_SET() of an fd with n == 31 sets the bits for n = 31-63, as
  1 << 31 is negative and gets sign-extended.
- For n >= 32 the shifts are undefined. x86-64, for instance, masks
  the shift count, so FD_SET(40) and FD_ISSET(40) use the bit of fd 8.
- FD_CLR() zero-extends ~(1U << n), so it also clears the bits for
  n = 32-63, whichever fd it is given.

select() on fd 40, for instance, fails with EBADF, or watches fd 8
instead if that one is open.

Build the masks from 1UL.

Fixes: feaf75658783 ("nolibc: fix fd_set type")
Cc: stable@vger.kernel.org # v6.2+
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/sys/select.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/sys/select.h b/tools/include/nolibc/sys/select.h
index 6d65d9ef3d6a..f299c79939f5 100644
--- a/tools/include/nolibc/sys/select.h
+++ b/tools/include/nolibc/sys/select.h
@@ -26,7 +26,7 @@ typedef struct {
 		int __fd = (fd);					\
 		if (__fd >= 0)						\
 			__set->fds[__fd / FD_SETIDXMASK] &=		\
-				~(1U << (__fd & FD_SETBITMASK));	\
+				~(1UL << (__fd & FD_SETBITMASK));	\
 	} while (0)
 
 #define FD_SET(fd, set) do {						\
@@ -34,7 +34,7 @@ typedef struct {
 		int __fd = (fd);					\
 		if (__fd >= 0)						\
 			__set->fds[__fd / FD_SETIDXMASK] |=		\
-				1 << (__fd & FD_SETBITMASK);		\
+				1UL << (__fd & FD_SETBITMASK);		\
 	} while (0)
 
 #define FD_ISSET(fd, set) ({						\
@@ -43,7 +43,7 @@ typedef struct {
 		int __r = 0;						\
 		if (__fd >= 0)						\
 			__r = !!(__set->fds[__fd / FD_SETIDXMASK] &	\
-1U << (__fd & FD_SETBITMASK));						\
+1UL << (__fd & FD_SETBITMASK));						\
 		__r;							\
 	})
 
-- 
2.55.0

