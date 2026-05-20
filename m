Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494DB2D97B5
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 02:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779242636; cv=none; b=EoSIaV6sHOMCZeymPpzIAuBqs0apWn7Z8zvffApgBMLIp+g/d51qwAcHacUm9kDXRKw+SDVljGRkMqejAuog95V/WjPhJ1f5O30UX9BA0iPBYWDpJqZVNMBpjjPymYqa4IT7Hd782CSaAkBILqPOfDW8ulNq5vvRVXIyj9DVGfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779242636; c=relaxed/simple;
	bh=vfzyde6ewQJTbLa2Go3tut+aVQmJwQmGpqL8IGTVFM8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=qwIfIatA+QlJmUGyLaIO2sySAcKKGXZspn/2FzGSdgSi5ftr/N+1tzE0Z7uxhxsXyZXPqgK1dKv9iAX4sblDty48QSno0yQsEt41LsIoswS23ml9okhBw/NaCfwmVo4+OP4y12/sOmNHfDaLmpas1BXFJP8pnVmuRMZdFBbnbk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vm8RW0u4; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vm8RW0u4"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso7636884a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 19:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779242632; x=1779847432; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yR0/f+KzLBdnQPqPTpQPmi8cxShP2a0wD6YDyJC6LqU=;
        b=Vm8RW0u4to7i5WU8kZJtKIsYQyY55t3JQBn4EHhldG+qSUn1n2zsdWu0d6yN1pibek
         UGtPK0D5C3xBcez1h5YNN9KwgqrVsBkDOXk6thqJBzmaDlzwBc+AUv8pqI+PTYmgyZES
         pWzC+pgF6AYlR+o4huipWvMU5+BlPjknML97wYfNyayCm+xy1JS310MOtHRX7WTagcZu
         iUNNdAT9JiYv+U+h7QqixlImaj8GOeADvMGDsCNxA4M/ybw62pXHZ8uMn7jnoRMXoPnI
         j44uITagTWocWF5GMAbJYeegu2/ApMQ8gKB2wkgRsYdHrZGlZ7J5xt+kTdHQylKB7i50
         Z0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779242632; x=1779847432;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yR0/f+KzLBdnQPqPTpQPmi8cxShP2a0wD6YDyJC6LqU=;
        b=tR6dF0cQEdEia0l6jzRI599eJIROwgYfwLG5JxTNhAVoNQ9WYB5KFcuPKpvbr318GY
         na1uxl6nv1nPfI6487tJ+RKMWNe5tjxocy61HV+/fYZ14uusT03bDiul6trVZYIjqOHV
         1d/uOOPXtLftdU9WxmERHrN1cULY307mUtLc4MAqUJxkHrgAoDK6fiSgBTqSIscjv6Yk
         GBSsk2zFR/SBzKpgAKLItBXQwv9l1pjyYBoKhNo+kvIeMeDhZnU7M57oAFYXF118HJ6i
         xXxFrdto84HwEMVzDCA+3oAzayKCTU3P1m63Mkgsyp3st67srAZximJnEkqxG0HGOGVl
         wTPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FXuAhC1vEeiHuVM8rBtlPdbLw9qri1JpKju882nTP7BBercv3vRqntLiXB8xoANUDIzCsDWQIq5kpAU9/NWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6VJVLbT3eQnKumNWro9eGi9hr2DdBLAcmQJ9jrJAr1+H/qfRC
	xe9SL311B5LuoPxiQSlhxyrE8JPu3gkW6aI/KjneF/VF0E8Me7HtFkE0
X-Gm-Gg: Acq92OEhSL5p+XD9DkcUkGi+wHaB40pjLXDjkagcAPRGRvMtAn3nXedcfxu0dVko3zB
	vhQNxAlpqI1pd641wjAUT7lGnq6bgyi70Pk6+enlVaYbZvSEf9MHIX/jObi8jNyN9GN8Bqbr5wD
	wu4irZMk3E1OXZ64Gm/AdIhPkNsy1KiRd1P/mbGHryuIVUbNt/RyFL+7G9L7buNxX1h+h6wVi4L
	Re09WSEWA30E3rUXTq4m9JEhpPabIs4Zu7yTbtzvdf9tNY7TsyCjpUO+MrspjLcai8GtPKX3zJ0
	SV8hL20eWTlNvjQm7W6TMF/QS/Xb8VMYv5h2x6k/pufstE0j38tshifcsav2C0nJfXwEXVvFgDy
	MlNx47m3Lf8ve6Iq24eQIST7mI9sCehLDJmHsl4D2AeWUNRU1KH7Q6fIIeQjvA9IWtggDfcc1gJ
	EZOWL51iZEdUdP3di+8dzNvCH5LNTn12h+
X-Received: by 2002:a05:6402:4347:b0:684:32ec:2332 with SMTP id 4fb4d7f45d1cf-68432ec299fmr9688144a12.2.1779242632059;
        Tue, 19 May 2026 19:03:52 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68705a68375sm577452a12.25.2026.05.19.19.03.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2026 19:03:50 -0700 (PDT)
From: Wei Yang <richard.weiyang@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH] selftests/mm: close fd on write error
Date: Wed, 20 May 2026 02:03:36 +0000
Message-Id: <20260520020336.28914-1-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

When create_pagecache_thp_and_fd() write returns error on
/proc/sys/vm/dropcache, it just "goto err_out_unlink", which left fd
still open.

Use "goto err_out_close" to close the fd.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
---
 tools/testing/selftests/mm/split_huge_page_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 460fa1f606fd..f30402ece608 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -469,7 +469,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
 	}
 	if (write(*fd, "3", 1) != 1) {
 		ksft_perror("write to drop_caches");
-		goto err_out_unlink;
+		goto err_out_close;
 	}
 	close(*fd);
 
-- 
2.34.1

