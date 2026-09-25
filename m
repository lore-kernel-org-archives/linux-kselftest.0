Received: from mail-oa2-f17.google.com (mail-oa2-f17.google.com [74.125.231.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E444F93AA
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370967; cv=none; b=VIYu5/x3q/bswLSBBL+xtFGClHDoiPu4JakJcK7jJx2uCsshXN9VsuXQ62DXY22Lpth7NiUIMY5Seavr/quJR2eXtlvAZk47/6vb2DE96aI0VdlSK8Mi3WpeQ9ecUb3nj2Y+ARj5ekPpjPRpE7Ccgm4kztH2IWlVGI7AVvTM9qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370967; c=relaxed/simple;
	bh=y1PFaRBlTn/ZCYwF7xOFcCPi53rXVK3rGbNoLiZI0A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGidjusSXNk19u/WqrvzsqxqbJ/tZ7Sz+TtgS0G23NoArB/WFQERCO8JsPiMt4+QNFXZjHtVSZOUoJez6nDBYKeqqaYM2Tnz6k0yfmAP4NJg/RJI2XK+dJwMic+ELGKIzQMzLAQfNrU3NktxhomSZZ0rNf9NRA1WoUxeLVkepPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBzXGLKn; arc=none smtp.client-ip=74.125.231.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBzXGLKn"
Received: by mail-oa2-f17.google.com with SMTP id 586e51a60fabf-466cc88a0d7so1092692fac.2
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 14:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790370964; x=1790975764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+r3w/xqNCPChfm05nwGvpKJ2QthikR2lv0/GbZ7Ook=;
        b=aBzXGLKn76hfIPhFOkP03k3iecovKLEBx1zYF1+HJvX0aWmUTZ7ftFdSOB4o4h6mhp
         2hm6PVutDy/xD/6EYBUaeUJyr9fUI/3kE+o6BOSeT8Dr5yPrJVLxvwC7gFH6lHHrMVL3
         L3avvMMjOC9PHTWAxboyZg5O4/QCp3dKYceRAm75qaaRp89CIrWxmOI9yZlk65GRjZqA
         OrMh/etZpFmuqSTqIarUY5Ur9y3/KNLAAYuvS/pAwscyqEvy1o3E04Cfn13MDfOl9M39
         E+Oy5fKvvhf0CzuWNB2XstITwNCZmwvjQq/10PFpwwProaccLL7lqDszcgH2kwQZgwo/
         JJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790370964; x=1790975764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J+r3w/xqNCPChfm05nwGvpKJ2QthikR2lv0/GbZ7Ook=;
        b=KgucfKJ8wwDoJAz1F+oRhyCpw5yzrN+kIbf89vqdOVb7QhWkhZXSbu/UC01uGa+NQP
         fjlQFLo/WfEhV27j0wtLG53h95U6g3m51Z8599Keum6cuirhwDa4Sp5QzJfSLEcz8Azv
         pb/PAxACIeHkaG8RFIpNlVZJxegoIH63vK9tPbYZNHxBqyrOn9KOKSFk5FqJAWm3vkaI
         7TEnbRg7B6Am+x8Zn5qW5bW9V3apFirDNsYvTzZ6W994cPe7PIHnh1ul9gdH0M2Ze5SO
         UD/bYQfVYHWbYAUJVV+z87xUlEc2Ih8FIWPed5Vcd9S5a5JjyxfuqRotpIy+8VECwsUr
         3Bnw==
X-Forwarded-Encrypted: i=1; AKwUvBz/q9HR3gGDN2C3Sa+aBFaj09CtqpvD3TbkLo4ALZ4viTSGQEn/cSnX87bVVSjILKvccJq50iljpgpWs7/QZA8=@vger.kernel.org
X-Gm-Message-State: AFuF++li7OfIiWJCcpmkXDNfGQehLB1gYtf0X1c/5vHn1kZhN8ELHWtY
	N4RooKQwgzGqpWEvxihsiYTkOIebqXAbFcqO0BpxXi2LGNwYl7CDE9VD
X-Gm-Gg: AYBFou0B0lI2maCdzsyJcrzf7YCod1XaxYmJfNubJJi8lDLvY4MbLb9Cua4kK2Z79c1
	JTm9EDMHUgNtSqtOjyDoCDN5o5jEs3E/fmoo9fwLWto5r/6X/VXtHPlS2MPmbeKya1l0E2Ra1tt
	vkFbLS7LOdsi5FZhaQG4I1iUSrUmHraU+vgg690gR7d/ng3DbGoPXITjGkO3g6g2K5N4HySGNJy
	trAyqXpY687Dy5t5lLPGQe/wZ9Xl/KEmu8XztUQ5ZHK1lBCcP0ztVByfq9p5tFhYMlB0JOUEhQr
	L2TH3i6dSjx+FidrieRIkgg9OyuuaNVhmXE1bmhhjNmLTJIg1qoMQDbwz8RY67ENYnGWYnUQho2
	j7W26Gj9CJVAK+0tv2/2dQO+xm3OXBMqCSrzTT3rKro41TrvCP5Kvf9zxkmW0Bcq3pHM4dISJHF
	utF0IT9NjNa9sqHqxWrcaGU/qaQcAAtmkQfi4HJHul6V9zD+cw/5/M0yJ7/FRXbhnlV31c+oJOf
	GVO+ZgO2h3UmJLoOuhH0PxYgR9cmqOr6+HZlJzJyFiFjMHLqxI=
X-Received: by 2002:a05:6808:4f07:b0:4b3:7b31:8df7 with SMTP id 5614622812f47-4d72c042ed5mr7304247b6e.14.1790370964520;
        Fri, 25 Sep 2026 14:16:04 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d72057sm3066734b6e.6.2026.09.25.14.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:16:04 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 1/3] tools/nolibc: fix readdir_r() with 64-bit directory offsets
Date: Fri, 25 Sep 2026 16:15:58 -0500
Message-ID: <20260925211600.119116-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925211600.119116-1-danishkhateeb03@gmail.com>
References: <20260925211600.119116-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

readdir_r() stores the result of _sys_lseek() in an int. Directory
offsets are opaque cookies which can use all 64 bits: ext4, for
instance, gives 64-bit processes 63-bit hashes, and
0x7fffffffffffffff as the offset after the last entry. Truncated to an
int, such an offset is negative about half the time, and readdir_r()
takes it for an error.

Since commit 4ada5679f18d ("tools/nolibc/dirent: avoid errno in
readdir_r"), readdir_r() fails at the first entry whose offset has
bit 31 set, which on ext4 is usually one of the first few, and returns
the truncated offset as the error number. Before that, only -1 counted
as an error, which the last entry always hits: readdir_r() then
returned errno, usually 0, without filling in the entry, so the caller
got the previous entry a second time and never saw the last one.

32-bit processes get 31-bit hashes from ext4 and are not affected.

Keep the offset in an off_t.

Fixes: 665fa8dea90d ("tools/nolibc: add support for directory access")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    v2: No changes except dropping Cc: stable.
    
    v1: https://lore.kernel.org/all/20260924015222.31693-2-danishkhateeb03@gmail.com/

 tools/include/nolibc/dirent.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
index 2dbf4052b85a..19857369de2a 100644
--- a/tools/include/nolibc/dirent.h
+++ b/tools/include/nolibc/dirent.h
@@ -81,6 +81,7 @@ int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result)
 	struct linux_dirent64 *ldir = (void *)buf;
 	intptr_t i = (intptr_t)dirp;
 	int fd, ret;
+	off_t off;
 
 	if (i >= 0)
 		return EBADF;
@@ -100,9 +101,9 @@ int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result)
 	 * readdir() can only return one entry at a time.
 	 * Make sure the non-returned ones are not skipped.
 	 */
-	ret = _sys_lseek(fd, ldir->d_off, SEEK_SET);
-	if (ret < 0)
-		return -ret;
+	off = _sys_lseek(fd, ldir->d_off, SEEK_SET);
+	if (off < 0)
+		return -off;
 
 	entry->d_ino = ldir->d_ino;
 	/* the destination should always be big enough */
-- 
2.55.0

