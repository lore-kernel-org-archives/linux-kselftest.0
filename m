Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782171;
	b=YYQMPkSJRD/3cNxtiShswvVBywAD4wQfswYeqe/JQ/kkBT0bjnyj382TWpm2qZKps0io
	 KNQpTwVerQX3UPMbG7Yv9diXVeUScZ9C60DqQ5HNhbBosjxvAOKOKUHO3LrIa3qIcJOhH
	 g0ZelcYTHsyMp57OHICv8tTlrvxoUznXFXPNu7SVrtXCpzD5hooLV5+fU8qHMbwi5d6Z8
	 v7h8UURpO+myEOZ4WS7+CfHE3dERtFcShpGq6oyuE4JQrN/pEi4gzeRtRXI390cwCtZp6
	 ilLUTaHVB+vtbbA1YLoFVNgCQ4xOVC0UajSIHizIM/QhJQyjn3SL3IzPRTJ1SQOZOkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782171;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=q//KLy/Y3a7AScx/MmTv5eY2KIWeWBr081RjcW3CxKM=;
	b=nsgymW5rdBi6tN2aY7HJDUPC6ACAckiEHujpk95JTc8x9yqVdpCFcDcU1DvyY6mW+lqP
	 mJzq6MUB/NbIJxoXh9P0rFOHNRNrukI3kWEZXkO4ztPYNs/Vx7LYfTuVmo9PbqAfK3BXI
	 aktgh1nLJhXVR7A9nT0G71cEahbbBlKNj9RspvRRTsEIXjNKbbV7HUia+qFN973vffmyA
	 f39f7LTqG4ntKy61xRv/WwWeVSj0jGmdmXpRh8aFomV9qxTIL5qTHnw/iMqp6ddBKiSA+
	 3d7XrmAWDfSI8LpEJ9YNhMpAw2Xv7hvT43oD97jX147OFtOCfrXkLufyvitXif+NUHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eQS8pVuf;
	arc=none smtp.remote-ip=95.215.58.98
Received: from mta1.migadu.com (out-98.mta1.migadu.com [95.215.58.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DC8606A336
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 08:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63DC8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eQS8pVuf
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bq4IEJpkW+t4LROfZMKt2jm8AGqf9jqC24Qsw/6wVsc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782168; v=1; x=1794386968;
 b=eQS8pVuf8z1mYX50Gc3cb01VOvC8JeIZad7wyvD9EQRBkNJkeBJRnJILRDRQZgamqk1J+AQR
 exoeFagpXSLu3LF+QUnn8DV+Sz5oMcaSSte+uSLm5zGynSvpiybQ31V6lYc/Qn5JUezmaLBdG6S
 718D6PvZRhyeMuDvMtC5Nk9c=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id da5d20c7e6b5b114;
	Wed, 04 Nov 2026 08:49:28 +0000
X-Mizu-Trace-ID: da5d20c7e6b5b114
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
Date: Wed, 04 Nov 2026 16:49:10 +0800
Subject: [PATCH] selftests/mm: mlock2-tests: fix fclose(NULL) in
 is_vmflag_set()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-for-mlock2-v1-1-57e6dd74c2bd@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3bT8It3cnPzkbCPdRDPzNAuzlMQUE0sLJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaANvwU+ZuAAAA
X-Change-ID: 20261104-for-mlock2-a67f86dad498
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: hongfu.li@linux.dev, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hongfu Li <lihongfu@kylinos.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793782165; l=1119;
 i=lihongfu@kylinos.cn; s=20260915; h=from:subject:message-id;
 bh=TrH0M/9tUoCzlZ3bUvJkj4Lr3dyx5ztg1IswD37q+0I=;
 b=WmH/pfqlq6pR575URCgIXVvGxuYTxjdPhqE5cs8pgXFUDR7U2Tp3R24PgOHB4JspWE7i65a0A
 ffZGGbdU02BDX+52xJf0B+QMiNGA3KHhVvTvgCkyv5MBACTyA7DTBdS
X-Developer-Key: i=lihongfu@kylinos.cn; a=ed25519;
 pk=rUpDSpB3neoNZRlGG6dHlFb3RepiJakcev+ucyqaZzw=

From: Hongfu Li <lihongfu@kylinos.cn>

is_vmflag_set() jumps to the shared 'out' label when
seek_to_smaps_entry() fails. smaps is NULL on that path, and the
code at the 'out' label calls fclose(smaps) unconditionally.
fclose(NULL) is undefined behaviour, so the test crashes before
it can report a test result.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 tools/testing/selftests/mm/mlock2-tests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mlock2-tests.c b/tools/testing/selftests/mm/mlock2-tests.c
index 144b550813a6..85e6cd24515a 100644
--- a/tools/testing/selftests/mm/mlock2-tests.c
+++ b/tools/testing/selftests/mm/mlock2-tests.c
@@ -66,7 +66,7 @@ static bool is_vmflag_set(unsigned long addr, const char *vmflag)
 	smaps = seek_to_smaps_entry(addr);
 	if (!smaps) {
 		ksft_print_msg("Unable to parse /proc/self/smaps\n");
-		goto out;
+		return false;
 	}
 
 	while (getline(&line, &size, smaps) > 0) {

---
base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282
change-id: 20261104-for-mlock2-a67f86dad498

Best regards,
--  
Hongfu Li <lihongfu@kylinos.cn>

