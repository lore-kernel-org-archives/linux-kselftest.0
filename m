Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B1A3148BB
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 22:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179586; cv=none; b=QqBzsF+X+tWllayVpUvOwqRrIeI5sGCeTGe3AH6usd1MeU2FWkI2B0g8Eqs1hcQkd534MB/jy2WGcKgzYH68UkDe32fGpqQLA4awpjuGW/axWRRYuFhBmB3dYuTMXGM4HvleTNy7V8doJbCdv4C0Go3Wu9YZliV3qxyG5VYZJso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179586; c=relaxed/simple;
	bh=dq6VJL19bx4fk8daGhAlZmCEZx9LJQRuBBgg8TWS9rQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+mAqI8RPMnFy/w+nXPW2rnxo7kpk1S5rpDFpexrsW9kSbDlwe0sIbgg0yQmb/eLDdkF8kdyiTN95hAKpoBEPJ96fo/er2iMSoiW/3gwOiRodI8oaXTbHs/HVI2YkT7qYA8g4yEfWgO938ROO6GpFXoAUGpfmaHMzz9qPge7VOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=cvuTZsH/; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="cvuTZsH/"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-914a90b69a3so1047694285a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 15:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179584; x=1780784384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=087/smJrDH1Ri/FmSC9bbtTtLl+ESvDrae9U9V2wtSI=;
        b=cvuTZsH/od0mvFzcMzuphLBK2Gi0IRpU7tj7/MlSSWKVugWSdrJ0uRdC8Z9//oJpNP
         ipABiRbvbdAuwcP2e8s+ku+TwCTv75lXIgagypyJuGXjuyBP66f7wg4vopz04GeHpkdM
         ht2yzN3xqnqtSZcRJciz6AHH1924BEAnlBhFxTZQqgZAmfNoBALuWauv8SMMhbC4fgtx
         COvpCTeQWLulqHgVPixW4O79r1f4xedYKhim7RxkuJkAM6al31lIlvhjtxuQe78U00uH
         y9MxQyVjDqzYmYuWXatebpZO6uqUr9EKkvzqpqZf599/OpqDyZnN2Jqn2TqYnZqpeCDC
         guVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179584; x=1780784384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=087/smJrDH1Ri/FmSC9bbtTtLl+ESvDrae9U9V2wtSI=;
        b=NvuNBH4bgApUy/V6Q0CyPzupBqkRysOAop9q3eslwLxU+W/pykpn/I5SftnbTrs+sM
         DrMKkLDWeWzVXEhqcYtvz6qpGzU94ncDSDXKgbPOFxs6B0noLLqwmKG6oFJnUj/sPPoJ
         SYVBuNd46PTXbqV0NSOgyyrS4Dcw4byRt5wkb3RiYZPygrMC6UcT1wgC7FMs9BfFDvGb
         xUG9HMzJBQ7H2RkkpY9lhP5RQ5AmbN2W8LX4lSffpzXa2TZ/+aneHjSR7hvx9uDmJm+0
         Rn83Z3xuGhQfIp+rUbmk5UEkxInKncK1USCEMxl0M0bxf0jsGNLgU2CWJvaYB6SLej2T
         d7oQ==
X-Gm-Message-State: AOJu0YzonYnZNH4XXm0u+rvTYEf0fV45KHNikn3XyT2Zj1AaufwPLxlL
	j+MODRuMwp5aJRlL6XVp1HSbxFXq5A8pSqFTm2hGbTmCI493JqbyfrrOBPiFiURztp50/K7ijxP
	LFUKb
X-Gm-Gg: Acq92OFOghq0ThWYapP+nPxczPbUEtsa1rNjfCrX/0gG7EgkrSTa4TReBQU/06a4cRK
	ZLLM3tZHMLbfclS3tntRTQ24fnhvTAoHRXkRi6yKK2Q3rsQeEjd/lPf8Ua5BGbMSY4t9l8RHHcB
	6Frhlgif8i7JsDNILGokUdiem1jqg1NOL8qWs/Y+uPbYEiNu54R7JQrS51CfjFxcUPS/qBRxrnr
	w4RVl7IPsIpsQQa+7nggJQXYT4LqRnvdjU2JU18OeI3G4zc25W5VK78k8Kzh0Es4uIRRsMYbn5t
	V2hJehGgUtQqHGJtXvx4CGxTvcsGyA6F4Ssqpq+xK6zlireqAvJ3gaC0ikZT+B0aXxtjdaY/D0i
	DlN4sWojk8wDXv5Fx++2MfT9doJQkssOsGZF+EzNxpBQoTl6C3leW4PgEDsUSt41qqPdRjoRhei
	DkjX7Wa40K9u0paQw7nm0//Nevis4VFer6LEtQLTf26hMb8IfbnG2T9ICaiKnPEg==
X-Received: by 2002:a05:620a:4053:b0:911:449d:98c0 with SMTP id af79cd13be357-9153d9cb08emr793370385a.7.1780179584086;
        Sat, 30 May 2026 15:19:44 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:19:42 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v4 01/13] liveupdate: change file_set->count type to u64 for type safety
Date: Sat, 30 May 2026 22:19:26 +0000
Message-ID: <20260530221938.115978-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530221938.115978-1-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This improves type safety and aligns the in-memory file_set->count with
the serialized count type. It avoids potential truncation or sign
conversion mismatch issues.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index dd53d4a7277e..ae58206f14ac 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -52,7 +52,7 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
 struct luo_file_set {
 	struct list_head files_list;
 	struct luo_file_ser *files;
-	long count;
+	u64 count;
 };
 
 /**
-- 
2.53.0

