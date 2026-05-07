Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F0A64AA4
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 23:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778197829; cv=none; b=SpJkA/kkpDUKXGS3NHTYAD0n/ofg5CjFVSNQAWdTHZgf3YUZsygDvP/+WwI2Mu7t679jHpauQCjaRQw7/qQGMgoo2jZZptdX9X7xY7JZA41OVHkxe8qtA93PazrfjreLo0KZT2dILhIPPhXDA9uhifjWxE7GE9n3rPS9dk5UrG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778197829; c=relaxed/simple;
	bh=073lgMhvjqclFH0EuFFz9TjdG45UkQ6Q2ldEN4q+umQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g5LvCIigXyy3VowxFTjpf3HfMKDbeQy4dulJ0pX/BY5vhV4oyHt1Z1n72tHAUqlwGVJfzAjlgffKZduEYJG5cStwtop4ocYbzaQZXzSWzHipdLpfunBt5VBX//fgB3ZMELYBitcJG7AHz1tOwZvOad46foTlevkVqJkhvLt9x5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TY9Tw92w; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TY9Tw92w"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d73422431so1152862f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 16:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778197826; x=1778802626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kpF9qxsJ2ZNxYIIifs8ofBMQ7yvnZFOLxS/oCrWEgcA=;
        b=TY9Tw92wh2llyXLA6+0anjYWZxGnFWZn+qiZ2GwdPtvIeScuF1QPqmjQ8q/bgq36Lx
         Dc14TPRcEtS3xD3teem+DDQh3tLO8a6SHQVW0ODfunmy02/EqrmI3T995cciut6vTQCI
         607QB0pFMSTfxaruiyaSYGSF2ONbfsbDJVNAC6JbYqVhkIoKEOhDiU0iiYiyn8tVHe7O
         MjlWZiRfImF8kzqX9zil3/gxDZMzmPRdeLrp5Cd3ECTkSYsh3QuUZQRmxvOCXRwnVU9b
         DeeGeZltQbMP+5h2suSaR0CoTW+y933OoiQaIrvtC+n2KSMkIAasdS3QfjZMAHUrvB9R
         gNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778197826; x=1778802626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpF9qxsJ2ZNxYIIifs8ofBMQ7yvnZFOLxS/oCrWEgcA=;
        b=JsDknXb8RW6UOv+WwApiFZU5Huu7hu0szadkyuKJ3g6vTMfHDso+ZzvIQppe2MLPoY
         p7mxusqAlo+QcI9pl5wCH7Sxgtpl/+svrdIM2Xz0lb2HNd1Fb1ExuyEk1Sj/emnKj/96
         29otcNIH2h/V9FLM/n/0aO9aThCzyePM53cm4fCNQoZIJgxPEL+8I5ZOLGufCy4uBIVG
         434shXnAQUAByTxBDZsdb1HqhoQKvrRNZkAXOA6Bayw7Y52KQJaZ+YIOwYH7m7EtfGG+
         U/bKh5y+CIMlhBZMzgx939PiXvag37BvwgWwDxdDzwYKyMcvCmun9FJu/8dOOB927Pbg
         iElg==
X-Forwarded-Encrypted: i=1; AFNElJ+DpMeyKVgVZ6johnM99mMezvJM4R5NpzquhiO7Cc7OFOS8K36cfALoEeDPncMgofo6jlnJeK686xjFp2N5hxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTUxSUGG+t8nhOJX2lIiz6v4L2fj3ryYkyKeQWT+2RwM7wociu
	C7d7K9sR66gJhSJJxKi38nI6l1Y2J9HrcT4pxKmGoxpQwpuPe0M7Mij9
X-Gm-Gg: Acq92OEjE/je7goDF7ft9Is5QLTSsE5zB5pvcjaE/b/se4EVOL6/H1nvOMe2UwoyWOH
	VqcMGuoRYpvySF9FiXIuWPkzKMsZlhYknDBOA6KA2X7IWU4vHoJilIdfqlKaPEQUWgXvt7cCcal
	01PZ8GBymsbMfGBZELMA4GBFOA73QjW7FF4CNqwDmY7DML2YmRAVf118Y93kMDKPj/4UWZcemKE
	ozk1Kzuo98vMrpSrGxIf2k5CpVsgqNL1tVNV4qzJTW+yvlizxayhFjIRNWeDez7/4IssCEHJ4Di
	BWMPmUcHsptAuZ9VLYXM1dgdbxtJ7kr/oyDZgb+jEVMWnxoexmwf5prz8Ru8FIwgfswIm0Br+MG
	32NA3n3ihC4wYQYoovq/+amMKQPoNmyR1eYivzYPbZS22ek0H5KPf3UHjWRORA96yCJIgA2B2D8
	eDYoKcviylYEwDKZLI+r+J/SXgRYBMQZAGOzgb
X-Received: by 2002:a05:6000:40da:b0:43f:e452:f391 with SMTP id ffacd0b85a97d-4515b056a89mr17178086f8f.6.1778197826208;
        Thu, 07 May 2026 16:50:26 -0700 (PDT)
Received: from hisam ([2407:d000:508:aa0:8b94:9971:991b:e7aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45417bb84fesm2075198f8f.35.2026.05.07.16.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 16:50:25 -0700 (PDT)
From: Hisam Mehboob <hisamshar@gmail.com>
To: acme@kernel.org
Cc: shuah@kernel.org,
	seanjc@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hisam Mehboob <hisamshar@gmail.com>,
	Aqib Faruqui <aqibaf@amazon.com>
Subject: [PATCH] tools/include/linux/bitops.h: undef PAGE_SIZE after including limits.h
Date: Fri,  8 May 2026 04:48:55 +0500
Message-ID: <20260507234854.273536-2-hisamshar@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

musl libc defines PAGE_SIZE as a signed int in <limits.h>
under _GNU_SOURCE, conflicting with kernel headers that
require an unsigned 64-bit definition:

  include/x86/processor.h:372:9: warning: 'PAGE_SIZE' redefined
  /usr/include/x86_64-linux-musl/limits.h:97:9: note: this is the
  location of the previous definition

Undefine PAGE_SIZE immediately after the #include <limits.h> to
prevent musl's definition from leaking into kernel headers. This
is a no-op on glibc, which does not define PAGE_SIZE in <limits.h>.

Reported-by: Aqib Faruqui <aqibaf@amazon.com>
Link: https://lore.kernel.org/kvm/aL8e0MMa4U2-nstQ@google.com/
Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
---
 tools/include/linux/bitops.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/include/linux/bitops.h b/tools/include/linux/bitops.h
index b4e4cd071f8c..62117a77ceb5 100644
--- a/tools/include/linux/bitops.h
+++ b/tools/include/linux/bitops.h
@@ -4,6 +4,7 @@
 
 #include <asm/types.h>
 #include <limits.h>
+#undef PAGE_SIZE
 #ifndef __WORDSIZE
 #define __WORDSIZE (__SIZEOF_LONG__ * 8)
 #endif
-- 
2.51.0

