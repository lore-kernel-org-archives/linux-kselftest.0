Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB923BB674
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 07:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246432; cv=none; b=BkF+3R8wmb22bmo+MfCbtli8wvWPnml4iMYZ7qL32WZTrNhmVrKWFqxGqENFYWuZzbdeRXr0tht/qdOBY/dLdoY2J2VmWPEfJ6L6BMqC1q/CXdYcgkNDtFVUmdYXhi4It2BGZjsXIapWcYFI5Xmtw8BjjwgPF8FzW2C7kkHh8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246432; c=relaxed/simple;
	bh=FNflVYT5xQoaZ3kWaV8W1BzYLYuSaQ6DZ80e1DBpVKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LFK5mhrCbXJTezkPE0jcs5Mt0BlYJJEsFQiNMrBrhgBMjzA37rUs0tjes5Qj3bBvE2SHC72ooUzXIxFGYaKslXZ/vx5jEU0ONoCYNv+BBj4eCH/VVpnpgBC06cbMSzgRyFAjRuTglL+td4He3SWDdDLxv7Qqs3IDdc8CcOBTw1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIfyY3QQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIfyY3QQ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caced6038eso8078315ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246431; x=1788851231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vx15wRXdK1l+pFtaaPtI7i08zanEbZBalZduAsGHYJY=;
        b=TIfyY3QQ+zz1LgNS04r9T7G3IpkeDXqMjUZJrjlnvHVCCWPfMHRUbQns6HHQx8Iy/t
         POC8X0tCapdPqgO+sWxwtL4crMMLrzWowZhU7ra+jA9PsW1LxgsiR+KSeERqKSr4ersH
         su0WCJ5mLsHG6gVmgcgobwYuW2sYGXJOoVS5S2IiyFi6OevIKO1rQGfRtY1zTZy9os0n
         pHR3jrl/E20c3Pwjy4lswiXmU3PdKZnBvdstfYa9sHbEjvUX7A8wo1PgZFtMo2Gia48a
         eCMW9uXhf8XDllC41O+VT0CRqDBGreyI1hHekZSnpzsY3/p16VELZKPAutkyY18o9t1N
         vJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246431; x=1788851231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vx15wRXdK1l+pFtaaPtI7i08zanEbZBalZduAsGHYJY=;
        b=mAuafY5/FDJenVazScRajXFFFymTEBAIGcpDkdDdQ/6KRG2k1caELmGWxgobcPtXIh
         YKFJNY2UCHhOlG0+dyVBmzum+d168yOOO7KDx065P0F+DTTufKPk0AhbP45nJlOZyLwP
         h7uwNuqLhZx2Mu5GuFcvvyY983QCRgPYBZAjJVtX0M2M08fE376vuCmiRemzjFiHiPle
         vKavT6ZEcBs/OhT143cJL1gvmvmguV+iUK5+PeIo2M6J9IElVaEAkTTRIZLgd9eEbk6x
         gN6g4IJ2Ir8AOOl6ERLbz5FOuNjLuQCwzeLCkcroAZiaNutUty0eFkDCYi3NPzRfhxpf
         GjGw==
X-Forwarded-Encrypted: i=1; AKwUvBwtyXk/VcNbELNF9uOMo8vuHNhIe15mrBIsbdrolprNfUYZgdu0KGtDJDXOHMhJzOkzzAH7GN3rv0nI0z/Ady8=@vger.kernel.org
X-Gm-Message-State: AFuF++kI2PFEZBmXor8FY4u+DPb286Uurk9vqyii9Yzz3rbd3b/t2ylo
	d5daxIMOV45P54XahPTVc+bOgy1B5SrNQ04k1830D67emomJVVWR5VzE
X-Gm-Gg: AR+sD12+4drLjaBIuuYz+nvAFHJ3cNIv1u9WjdDOAmfdZC4XPHjUZo/FLfM+w0NZL9H
	2acZdLXpbyuzwJAQonXsNRzforOagTd06rgkK7JwAGvWesbzSomhCqzr0d76YPToWH6+dC/eFU1
	KboKhaUEmuDSL2hcKHQZ8reKabJrrU/hwPLkXiySQ4hx/YXX7tRd//M2RzQjxNIaJmyVNjSKdZB
	VT0hkuoZ3NrwlGwfOT3um/tYdWVgeDAl6HIJl6RQUr6AhWv5lhWDdgXjq6xu4Uux/pUmaB4PfSh
	/KBDDCXI8Yn89oi+AlDfUMLzAdRzxQimsQuzLi3Q3x6cccfZrSbmckuT18pVeKYNNFAX9DCIVOS
	FTzar/stNUH6/fIbRajOL95MjzzW/KmpGXFuxUGGTwNdCAheWz9o1VongD+N6vgAG12S3wKMVbP
	mRIf6CgK6xLE7w2zcOXUt1DjzJFJZkDqNaPWx5wkONMjVcTE+QvWN0fv+FNBpANKQsjUJKFB3Cq
	g==
X-Received: by 2002:a17:903:2c08:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2d952960702mr37706985ad.21.1788246430647;
        Tue, 01 Sep 2026 00:07:10 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm36432090eec.28.2026.09.01.00.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:07:10 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	Bongsu Jeon <bongsu.jeon@samsung.com>,
	Shuah Khan <shuah@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH] selftests: nci: Fix uninitialized family ID on missing attribute
Date: Tue,  1 Sep 2026 07:06:18 +0000
Message-ID: <20260901070618.3299012-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_family_id() walks the generic netlink CTRL_CMD_GETFAMILY reply
looking for the CTRL_ATTR_FAMILY_ID attribute and returns the parsed
value in the local variable "id". If the reply does not carry that
attribute, the parsing loop never assigns "id" and the function returns
an indeterminate stack value, which the caller stores in self->fid and
uses for subsequent netlink requests.

Initialize "id" to 0 so a missing attribute yields a deterministic
(invalid) family ID instead of a garbage value.

Fixes: f595cf1242f3 ("selftests: Add nci suite")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 tools/testing/selftests/nci/nci_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index 312f84ee0444..ed306ec23895 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -182,7 +182,7 @@ static int get_family_id(int sd, __u32 pid, __u32 *event_group)
 	} ans;
 	struct nlattr *na;
 	int resp_len;
-	__u16 id;
+	__u16 id = 0;
 	int len;
 	int rc;
 
-- 
2.43.0

