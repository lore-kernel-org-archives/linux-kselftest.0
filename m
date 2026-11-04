Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826542;
	b=Nv0O5nYqodPFsaoVWUyqroALImHpkmGg4a0W5mrf1+W4tWd5yzpFQGd7r9fTlr5Ilky/
	 EnbmFcBXQklqWZvaQ9vEev7fJUv57b6wb8o4pQ8VdfV0S0HDrfrL0VfWc5q6N0QgmuyCX
	 hsgVzWHn+V5GMqg3Y1Vel5Um2ZvFXbBWAhFTfUIFM7Er7rLkj3s7HwEAQ062oxrHQul7e
	 GJLZT2EVjKRWRzOoBNNdPN9jV4nofiZSZrKL2vav/wnldSRe2wJONF8CdWApl8g/y8cnZ
	 nP6EAa4UpyiUsRAot6CMndHEWZwy8+RZJnNJZpcu9u91Qlc0UonTXb0Gy18pPwM8J4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sYT6lspbzQpjqJHvYeUI29IkxxCfKlR9BhpAlEZsBIg=;
	b=FuxYyBQ4aLIGi2goORS5ZfJpT/w/PqPweNDwBYJscEWPJh/ZZlfbD+211Ggmd7E2WjmP
	 poBnmuhxEh7ig36tjzu0dLYB8JuMGb6/Gom4ql1lWQpDnTmI1UEtIxrA8GmCdUWtlMcow
	 YfrwKbSB/OawzfzYtQno0UZuMSrJzoc64jtKizMDPRaQQkgEIv9vFnKMhOmBUjgSO6OYQ
	 8Yn6EwPfnKjm7JgaywvHNkvtYHFS60ei1619NxNUA3rHU0dQul7+P3vao6/D3J4BirQIk
	 1WjnLOQ1CrKcEJ3EreNrTxvJbSq6R1+LLUB4YTi3zREPfbJ3thgC7aUQy4kT4NV0/Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPN1gvko;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BF5607C0B8
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BF5607C0B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPN1gvko
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so12765445e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826540; x=1794431340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYT6lspbzQpjqJHvYeUI29IkxxCfKlR9BhpAlEZsBIg=;
        b=BPN1gvko6GfLQrNWXzFw85BLDKdxLt0yjJ41u3wB5mR5jACBa+/7D6SRxEModQ2grs
         BcWDDFnHzx469RGOfSk1f5F9VieTbJCA2rMTDw5TDsuirul0VEfo4xI2KViHy9lsDr55
         UM/mt65se7j5ld6tdYW6B7hmBQOpZAbKm67fXmgtIqIJ70jMVvMR6mMpfCUTr1PLXvaG
         QJkWN0+rLUVbWOC19DWk61+MadS/Vxx3ImXwljaFLnQ8Xk9Vcxx8oYa09WyR8kTELJbP
         60xjM88t+E7r2Ceuu4ODsC9pntz3mfF1ndTqrkDM487cve1arzYdDvbG5x5ulvWVGCEL
         eikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826540; x=1794431340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sYT6lspbzQpjqJHvYeUI29IkxxCfKlR9BhpAlEZsBIg=;
        b=dK38AVYHwlLVSqs/9RB8/Xms/mVJWNpfSZwOmC+cOtEVajwGwgjhnkCArHJTceJKnV
         181qKdjkaqGyDbM7iFxtGTmvhp4T6CfseoZVympWYIOd33ustZlv+KBcT/vn+XZMXgLe
         kYjxfl7wissNR/MgyZ4Fo/ikX/8CYLRW921E2v2dmmVHFnjQPDxTfeRgHdlyyFWnbzDn
         Wcm5MCspL/WVxwPNzYQuKAE9knuV5KyHRVCbwX8CqLIga2hE4GNwY3cUEv7eY5oXI4oD
         6vSKZHv7pcqthg0HgxT6XA3rMnOHsCm8XooP4RlvM1z435aW2ilGnBXfMDefVmcup0cC
         GFEg==
X-Forwarded-Encrypted: i=1; AKwUvBzhVSJIfE1swryCXMCPdMNuMXdS2b5OXy9o+I3v1Z+9ss/qdxKiEy9gWi/c7PKImr9t5Lw3WfoL8xZG/Bj4+IY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p1mQGuLkX9+3m/W8GZVinOrG5uHcilWIq4si7ShUfZ+6fPyYK
	qaBCeGmEv1eJa0Q0eL3uHukPdyCtyn+V09btFDu1S/rgpYIc4xFv8Fqt
X-Gm-Gg: AYBFou2j5jZu7FIIp5C8RoYvsRDnXRUEyo9zW9BNBovKZX84xDTDAgFFthYGkLWF+Dy
	54twOglJq9ysUp+SE25BNNeYM3sE+5DCxxWuHoz6z7VFWKsf+lWYKGo9CbaYrsm3tMpiQ6Y4CY9
	JQm/XGLSH7M8GXbfmUB2nsxeT1HipsgTRqLVoYw+KTJ49XBcr6ahuBKKhsJYyGUOV+wDVKzw/Mg
	TI7QOu/9yAWDFffnNTOgOocnmHsGayFOxotolc879/EiGuSpNlQAZQuvd7OUUMdd0CKpvmXE2he
	7qKWZ7rGFVw5QN8BzEPwMWhmmkbMFJRX9oJRW3q7eVdg8y4ayvYDHXIgozOF2c7vm3Q51RPYf9s
	wKVvhU95jlY9exzCLfZpFkwPShQkyfRnNIDPIjJUbZrSwQK85ZEvzvrfMkRywXaTjLIiC2qDfvS
	2+YL4bV/1+TCP31J44RajUo7++TLhfqVt/HYEEQY5UnOaa+VOWc6SbpRvINpHrNL/2nUJjhdcqA
	DX1OPvsFmwWrXb5UFMzp8/OraU2P9b+u5kkeEqvTK5N1pZ+pDAklyS6UrnrLGdkNMwNog4W60Vu
	gD66MVKN5BQy+h/X4yyIuBFjlYBgNG/mDwwO7+dHfexQ/nNAhSK5ug==
X-Received: by 2002:a05:600c:4f8b:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4ac17ffaf95mr390439375e9.18.1793826540343;
        Wed, 04 Nov 2026 13:09:00 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4104d600fsm78187495e9.0.2026.11.04.13.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:00 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:50 +0100
Subject: [PATCH v2 04/27] selftests/landlock: Zero-initialize the buffer in
 inconsistent_attr
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-4-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

This buffer is passed to landlock_create_ruleset() a bit further down,
expecting an ENOMSG error.  This is only guaranteed when the buffer is
zero-initialized.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/base_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/base_test.c b/tools/testing/selftests/landlock/base_test.c
index 89c0d96607de..0bf8632b725f 100644
--- a/tools/testing/selftests/landlock/base_test.c
+++ b/tools/testing/selftests/landlock/base_test.c
@@ -25,7 +25,7 @@
 TEST(inconsistent_attr)
 {
 	const long page_size = sysconf(_SC_PAGESIZE);
-	char *const buf = malloc(page_size + 1);
+	char *const buf = calloc(1, page_size + 1);
 	struct landlock_ruleset_attr *const ruleset_attr = (void *)buf;
 
 	ASSERT_NE(NULL, buf);

-- 
2.56.0

