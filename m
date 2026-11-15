Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794781463;
	b=TP71tI0IDmdDQpIYhFN66xNIUf2gQCrx5ec28QuwyNnbP5T9U33Xz5SeeNaLyNkWeHb4
	 oHMkgojrSphdqeX3FJNswqmGPLnmuO5HiAPNFdtuWwpZiyMGRhTtE607jVfcsuej4Yi2A
	 UiLdRAKPRpy229fzH+EF9rZtueQWGq5TA/zJ/q5xau8tHOJSRHadu158HZ8AaX7VjC6jy
	 /YuH83OTttztxqw2I3wJkMT8cLa5jaz3nNi7DA8AMo7sB+VMwVJmx6Gb7dpG4hXXTzn8N
	 JA52nl6xh0woUOn/3Ju6QxLQqgCROEpOqo7lCPSf15E5uZI2HQWGn6aW6k6MMsDAx/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YkVMBv/sY05OW6n9It2eq/jMeb5IfpTG+9202Dl+KMY=;
	b=rABL+mZfVlMowk6Jou8cqH15xkiOFCwND4XjkqLoZ0N6cBQ2NuuD0Ny+bitsdgYmF7J+
	 OQY+x+//589+tq+MoRLkv17be/kjJ0Me15HAESNx+gx7u2cpFKMCq4Wa11R38m7OkHIny
	 Dgmjs+EVy8N61xXjyQ9DsoSTFvHDAkj+rurSyBeZBypRkdet2aK0OiYa0uqGU1D3kByri
	 GIcKQnjJ6DOjcOqCK4VUeiXjyaVT1l+BfLosIydHDsEbEccnsTJhkTwxJ3mspGM64/S61
	 IahdeVNG0zlMWaspYRtvj0x5/j2bMB2dY3LwIkXeKNe8ee6UgBeC7uG5ze/OusQacVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0yQvjJe;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01538606A32F
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 22:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01538606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0yQvjJe
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso7126275e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 14:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794781461; x=1795386261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkVMBv/sY05OW6n9It2eq/jMeb5IfpTG+9202Dl+KMY=;
        b=b0yQvjJekO3PSUHhKhHzRM90blA1jqgD+9bqFw0785WKtWMeeX8nmRkizPtKugB50f
         4kgzzDXw1Okb2pUL7a/b7Tlv/deMoEF5qF8zy2dFFOCUYgKe8nsWi1eHuFmrlhDYQHaL
         xsLCJVUxO8TnwStZl74hS9tEP5Mc+iefJrwGIDhNGFnv3J6X9Xul109RTbeT5hL+IG0O
         TsH8tCyncH7AkvO+8j4h50MfyhIA0y/gycUXQ+MaHbbPWisx+jFygrjVVRZGHOb0jIAu
         f0wiRZr73uG4dXAHTvAs0h83ErXcq5F/jvpJ1dxxyQ9S/ptVF36pS3M1GMkuPibPiODQ
         mkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794781461; x=1795386261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkVMBv/sY05OW6n9It2eq/jMeb5IfpTG+9202Dl+KMY=;
        b=D7V0wgj9b7VD8yF17ySrN/6OKjlZVlX2PQ/D3y7ptDn1BKF86zxrSzAwl0DFAZwMN+
         RuUe1JLdU7EOOD39GDI9z179rGhitB1bGye8idmi4uFtjQXglkPW5KeFd1pu0uB1E6SU
         NmXVHZxGwlOcD5AZnzQaeJ8KfPbchAR0CtNcTS1mmIp9zSBuslwNmQ7sztREA1HbWBXP
         W22/cA9urMqVN76PV7HHdkid8lc+o/NWQIZDAm+/xwS4a4LtFYaPloNDImy1OIltI6JS
         D/WyDHDvEdrebg053ftcGHeCpIBXA62CiGyercu1Bq95xIUhWKFJXUYFOOnNmdxN17Hg
         wDsQ==
X-Forwarded-Encrypted: i=1; AL+hErEmiKzAm4gIQDZt/syZhJeVBzAl8Li0+qNGIq3cMovWYh/s8sIJxKQMEvo2yzwtmHMdVpoaVXcrCOA2suGp3lo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B1EQKXkejNbOLt26yMh8pTDWH6xEGjsB9nL7WuwwWqrRgPuW5
	Rcm7PcW/Wwi5fBUa+XgMy0yiUJU8qYOuEYkbvNKwLOAfwXwRwzAQk2q/
X-Gm-Gg: AYBFou1R8TqLB0zlHL6a1kKSwzDpr84cKIjU/A5EH1C0wRVKOGbn0w+W9cFpHOABt+Y
	Miy0gdVXhz65RELgBjB8FbH1PSkVv+jfi9NxrZxIBUwh9ayMFRdEQrMvS3zC2xeynuIoyXoEI9l
	+fmlodjCkcKC6y6hAyYNaLwR8yj8kXEs2LYJtIz73qZNStnk9URrrxA7a3gZBU8IF+SubeRU5bn
	9ySFF6Q/y4DxJAaTckapwrFeTTxGDP9y4Hs10KZ/BRen2/YgZyg/erTeDIOGkg0eyivbfT2OeF9
	/qfpG2JKREFYJ9AL0sjGX6lWn/UeqJfv0XHMRC0BiSH/IVwE+ooa0/xxbmvMSXUR32P9W61p2XG
	ve+l1kblSv6gZvetG33NRVL/9yWtW6asExF+3DE2/e4KDw7Njvm6Lf62afHA7vDwkwTVjDNkmjf
	YWLyrqgk30wmPE8Kprv2DGwFS6+l3jU3tiAGwJR9K24V7RK1+VelBz3jeAK0S/XAMt6kKhzg6ua
	Bf1YO0ZpRs8foAQ/cb/EVkM8JPpfzOOOiET3DA6G46Rmn5J2F0QPbffWDl7foKmb/Tt/aIgoy5v
	TusfmRs5CWq3ocAg4wBFgzuENcTGOYOuBlJuio9sFWdnZyPnhxA6KDyJilkGC4SiaUxZJKNf
X-Received: by 2002:a05:600d:6409:20b0:4bb:6fb4:586d with SMTP id 5b1f17b1804b1-4bb6fb45a20mr28190285e9.0.1794781461202;
        Sun, 15 Nov 2026 14:24:21 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm346050855e9.4.2026.11.15.14.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:24:20 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev@vger.kernel.org,
	po-hsu.lin@canonical.com,
	linux-kselftest@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net] selftests: net: arp_ndisc_evict_nocarrier: propagate the last test failure
Date: Sun, 15 Nov 2026 23:23:51 +0100
Message-ID: <20261115222351.52930-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

run_arp_evict_nocarrier_disabled_all() reports mismatches with a
"failed" line but never sets ret, so the script exits 0 even when the
all.arp_evict_nocarrier=0 test fails. The 2023 bulk fix wired the
other five test functions and missed this one; the v6 twin
(run_ndisc_evict_nocarrier_disabled_all) already sets ret=1. Set
ret=1 on mismatch.

Fixes: 1856628baa170 ("selftests: net: return non-zero for failures reported in arp_ndisc_evict_nocarrier")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh b/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh
index 00758f00efbfa..4afb953a3e479 100755
--- a/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh
+++ b/tools/testing/selftests/net/arp_ndisc_evict_nocarrier.sh
@@ -139,6 +139,7 @@ run_arp_evict_nocarrier_disabled_all() {
         echo "ok"
     else
         echo "failed"
+        ret=1
     fi
 
     cleanup_v4
-- 
2.43.0

