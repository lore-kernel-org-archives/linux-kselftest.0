Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048225;
	b=Ik1JLj1Ah8AEI5nC6lt48/xu64V5SBCH0WAaf5fLPVP+wgMDj7Xx8BvbdoMYFyVx4qO0
	 ACnyZxdJQWQsI4PA65doO4KTTPaoOFtsS4+kTs/3ZGo/WjcCATMgH0+Ef+IZ3Fu5zLIEK
	 Z5Hej6wpB1KnycGPraxiaGuwiDPM4sUvHXaIK+cCnodWk6YaqlSt5RN7Gkcg6OLuGBJUM
	 tQYm51EiqdhC4ax9TmST2a6KDaKJE6pmJaBSnIDGqhxpMicGVw+HylNVX1TRYCc03EDx9
	 1OEuL+vWSyEQRG0aCdVnRkWy/z0aUlZ7v+q/6CG2sbf/T99t1W03LsbCs+fSZ6iZeTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
	b=lDQvthcJ7GwJxiM0vJdaaOiAghZ030pO/4soKUJfRhoZgiuiPrNTnts7+tVdYnVrDPRb
	 WngXDcwLuq3mNa7/PIrFsLIlarbZxltU/IfXiuheZgbtDAY2iuLu3kefQpTOXSlQxu4bh
	 pYabl3sUmJKI6q3jVsewB7ndwFYLjESS1jPydbR6U8yfxUHhiz/2z3j/Wt/Hkav+cn8qU
	 TABWVdv/oWpUbLAf4UK6LL4RquQSNCRgJK3CC/WqCIS8m4npODk+u/F/LmMbzFj/6/tGt
	 +Xvr/BF4YFGs293XzgVugQAVXzRq3GPlGeyhgnuPDpDS19t8gpBCg2U8RsHcGAcKW8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZOt97z7;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1735A606A338
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 00:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1735A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZOt97z7
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c505a0acbc1so37797666b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048223; x=1795653023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
        b=pZOt97z7oXYPDrXer2WA3LC4yS2BO044M6yHvur62qVooM8RRujv164PxvZTmPo/pC
         YTEyg0l2pdWvhT0e5vGapkbYWYaYe3zfm57V5SEkCRSwoYTGKPt+j28zJ9yFfRInOOuB
         lzSi+wlIQEF81Lp9DT3Umx/ywacnX078dJoyLGYL9vOlkpyQFEyjy/DF9LiNhwPi5EyT
         Git1WOgf3JoINy8xjyg1h/YpZYHcf6SXMKRVkDFoTJoaB7P7W4H0f0kvgM7IIh+8lO9R
         X4InlCI0k0LphUqOqKDtpA8OnIVQAbh7KPZ73XVJDa8x/3ujv3VJNy9ATUKlAHSKa9HK
         Biww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048223; x=1795653023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAnazgbAEbBUyJvl2IrarULxEN8A8O9+J2KxABxOX8o=;
        b=BVW09NeyHwOTh0OURQ0yRLw2SKtY9h64FrWrXPqLNoqzw2iNE9py30WRXxONj7AzNL
         VUc/ulvJJHC7IEenvfpeidg4j80pFocTi9HXQ+8kgauuqfE6mcL1vyD3UiTxgkcaUkWd
         1JqjNfLhLNizBH7uLIPISSIStvWKAhq/+DO6NQ15QdbAEJljrDOY6yMe5zDY0tHMR8YX
         eAojthx3TIsuUwm7qU6PqK51WoDp5XZwsK/dk4jgz6qkGbNNhqt9TwjG5CyuO7nRWXqN
         7QWBiy+x6c5Vd+yLwR9qHF2B60MGIjFMPMY4k5MHeIbS1fwLcCtjgL46XHxkta/CdoK5
         bbRQ==
X-Forwarded-Encrypted: i=1; AL+hErHRMcgGI4w7k+CnN3s2zztNMJgsLI96mcXkdQVebiNwf9t5BDupzuMXX+2PM0AJv5kcDPPmOLL2707GfLm0wf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PNFMH6ESN4JzAsMEBjzZWpzZ1GSQgQdnOvlGbdKqNgDVp6pCV
	iC+gbsLn526tanKQOAzm1EwWnP4PuPG8Ha1GFJj+L0ZK9FIejisnxkr+
X-Gm-Gg: AYBFou1L++XnFYL5NW0CDkSMHCQq1hxMrw0pGD6z507l05PzwvyreOMehFQZWPrDU1h
	gb/JJ8SZSOd275SwL55uoJ0wfXqJGkKNzvsEjcrawd4W9GiCxRcyU3W4gItY/VgcLbGNA+KbVIw
	N7N4AdQ0RsUaSFswykJXs2DYDudnB6U0iYMWGI7cRKh43TNaY/8cnyeFy7EzPh80AYR4GxyABBk
	B1JmvIf92cp0+7ajbS7L9Nc9YGw0yBBMr0WGepR5bmLZx1m9s0m32KSWhiPcYhTAWARklMaCDU1
	Em2Qde93ErPD1EADCXlp+8sP4lKd8NxRUYu46GyMXTloBnPcaU5MuI23alvmuGwfk8WaDL9qNK3
	tCJmf72zUqYdvGteOcRh8hDOazySUsUuFkP8+Q1l05eh5Uqr8nQyT4YBnUD5cVZrkKm3eurvJtR
	MYbynE803VYxKurtvl/Y/iGZdNE2RZ4tMSY1T9XGzQ3unZsOBhPYO1h4+tqncdkNwhBDdpvQ4Yp
	k2bnqlJW62zI0HEsCbj5unn9BNfE2FdSIRb3ra9AVIIKMev3tPlNBdMT1fNBwPuCZxUsWMl/NYg
	VAFQGstkTkCSFQsXvScE+1B2bgADd2YRsOBK+H6GauaIN+iGCMJ0neAEQ1aZbUBwHz4FW589yA=
	=
X-Received: by 2002:a05:6402:2422:b0:6b8:4f3e:62c8 with SMTP id 4fb4d7f45d1cf-6b8877decc6mr4950784a12.0.1795048223372;
        Wed, 18 Nov 2026 16:30:23 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.208.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a001123sm1729744a12.21.2026.11.18.16.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:30:22 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v4 1/3] selftests: net: veth: propagate channel-check failures to exit status
Date: Thu, 19 Nov 2026 01:30:00 +0100
Message-ID: <20261119003003.40482-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119003003.40482-1-emmaonana18@gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
 <20261119003003.40482-1-emmaonana18@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821d..5c1dbe1516bb4 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
-- 
2.43.0

