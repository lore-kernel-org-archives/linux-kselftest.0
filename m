Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538392;
	b=MVAs+z9Kdu6g+ocEFk0EENJCppTDmVHvsnEwsjnCjshkQwKvurmK8kpR+ch73cbU8hL/
	 o/1SQkfRYSOb+5kYVv0TxexfdnLpL1iydLbaNIlwuNy1B+13yLQuPQVZNc4AbmMNBF9of
	 fgrBcaN75yLTXNqyUchGY0k46LpM/Lq4LcsfiSt4lic0LCjYgga6S3LULQ3JIslhMB4fI
	 nNq8A7fR+5z16R29C7AEk3loUeygKtFb9kBtwDNHyKXYZysSxB3MfH93h1beDBGOOOL4b
	 rE/qmuiNytj4KVmLHiHr4HMfDkE6/w9kexBgWZ2gjQY1Z4JSucBBQHKclY4N2L4yw2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538392;
	h=DMARC-Filter:X-UUID:X-CTIC-Tags:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qKeJBKYSKrXzA2DdXk+Uv7PAsSWBeJIQUutMePGjhzg=;
	b=xLF5E6zr7iv+SYR86SkBNG93Dn7buoP/sKVBsO/uFn8H4FSS5e49216gOeeuQryV9bQZ
	 r+b0R7xq70bG7j15hgeYRg8SNXU3x2JVsLNJr7aH/KhLdyIW7MQ4+0T7y68ZLpZIif6Od
	 g8IC45JLXcyeJRpQz6ub/2nsQrQ/VZTqP0iXAGDaF9oFlpES8v8e5NuzCwjon64HqV6Lw
	 9An8PWNEKMm3eqXMHltKFfg9a6RwTSCQYcJYIdra0TrYoIq6rFHQmZCE9tVGVWGq3YXtc
	 Xhlgq5pd+J2GxTjn8i6bGDitl6NhtrGFvpe2fOi0YhsTbdy1wTxUEAOmjbMI3iVf+Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AABB606A88B;
	Fri, 13 Nov 2026 02:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AABB606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 56b8724edf0d11f19a56ed5b684f684d-20261113
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_7B
	HR_CTT_TXT, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NAME, IP_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4f9bbadd-e78c-4769-a1dd-5c2cd0e23a33,IP:10,
	URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-INFO: VERSION:1.3.19,REQID:4f9bbadd-e78c-4769-a1dd-5c2cd0e23a33,IP:10,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-15
X-CID-META: VersionHash:7db8b62,CLOUDID:4af21d31961f732c8794b7d6542fc9f3,BulkI
	D:261113104019IM9075YM,BulkQuantity:2,SF:10|38|66|78|102|127|153|841|865|8
	98,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:41,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 56b8724edf0d11f19a56ed5b684f684d-20261113
X-User: lihongfu@kylinos.cn
Received: from macbook.local [(114.244.3.119)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1341907876; Fri, 13 Nov 2026 10:53:00 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
Date: Fri, 13 Nov 2026 10:52:37 +0800
Subject: [PATCH v2] selftests/mm: mlock2-tests: fix fclose(NULL) in
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
Message-Id: <20261113-for-mlock2-v2-1-f62195fc8394@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBAFf4Xs2RraYIue/A/DAdqtrGBrWmwkh
 H+X4tXjJPPmLRAxEEa4FAsETBTJuw3EoQDdt+6OjMzGIEohOS8rZn1gz9HrQbBWKltL05rqXMM
 2eAW09Nljt+bH8d09UE+5kI2e4uTDvL8lnr2/4cQZZyeF0hhVadGZ6zCP5Hw8agfNuq5f/hNIs
 7cAAAA=
X-Change-ID: 20261104-for-mlock2-a67f86dad498
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: hongfu.li@linux.dev, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Liam R.Howlett" <liam@infradead.org>, Hongfu Li <lihongfu@kylinos.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794538380; l=2033;
 i=lihongfu@kylinos.cn; s=20260915; h=from:subject:message-id;
 bh=c5NvTkyLv8vVmdu1qrQ3QDkHHLM9VqONXM8ZX64SW3A=;
 b=8msNcvfbPWNkjRBc55Y3yhcUCTKNn80xye5iwBTmLuI+t+agi89Y5Yqv/WWCI0aHBzW2dabOv
 aQpO35FY8oZDjv7tZmhqPAfT/w7reiAigPaMTzGYMqj0xR9lgJG1tGC
X-Developer-Key: i=lihongfu@kylinos.cn; a=ed25519;
 pk=rUpDSpB3neoNZRlGG6dHlFb3RepiJakcev+ucyqaZzw=

is_vmflag_set() jumps to the shared 'out' label when
seek_to_smaps_entry() fails. smaps is NULL on that path, and the
code at the 'out' label calls fclose(smaps) unconditionally.
fclose(NULL) is undefined behaviour, so the test crashes before
it can report a test result.

Return early on that error path instead, so smaps is always valid
at the 'out' label.

get_value_for_name() follows the same pattern. Return early on the
seek_to_smaps_entry() error path there as well, and drop the now
redundant 'if (smaps)' guard on the fclose().

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
Changes in v2:
- Convert get_value_for_name() in the same way, as suggested by Liam R.Howlett.
- Update the commit message.
---
 tools/testing/selftests/mm/mlock2-tests.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/mlock2-tests.c b/tools/testing/selftests/mm/mlock2-tests.c
index 144b550813a6..455f1c841dec 100644
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
@@ -103,7 +103,7 @@ static unsigned long get_value_for_name(unsigned long addr, const char *name)
 	smaps = seek_to_smaps_entry(addr);
 	if (!smaps) {
 		ksft_print_msg("Unable to parse /proc/self/smaps\n");
-		goto out;
+		return value;
 	}
 
 	while (getline(&line, &size, smaps) > 0) {
@@ -123,9 +123,8 @@ static unsigned long get_value_for_name(unsigned long addr, const char *name)
 	}
 
 out:
-	if (smaps)
-		fclose(smaps);
 	free(line);
+	fclose(smaps);
 	return value;
 }
 

---
base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282
change-id: 20261104-for-mlock2-a67f86dad498

Best regards,
--  
Hongfu Li <lihongfu@kylinos.cn>

