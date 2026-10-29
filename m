Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255089;
	b=S7QTR+fgwHk+C4FO3fv/rY1nKkGvRWs8VyiFGTJOZPW/cVM6K/du8z9nxeM9ufOdyov0
	 GnatAkEiPh/bIEd+UWaJtopXRDBrNfUVfJsKEeBwRkXC+PiZRWyyECG/5IxyRPEtv5rcb
	 RKLqJSVlVZeQQAZuenP4wGbMBvo2SVdL4aUMgljrKMxdv/o6MKaD/lqbeLCyilDMLga+C
	 bTpc7FXm3xLLlIDuxFBep0URyX5lzcRWMJvbJbawLIQIENILEtEHdptlyuUoHUJKKeBvZ
	 LqhCDMBAgpkeWj/I3tFwQa5i8J+nU+oxpmYygk40TV4VVbR8/xmL4VYgaxym/lBxhyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PSKKrZBqxdz+n8H6S7Tg/WkVPzmvnVBSCNKmv7aM/z8=;
	b=iGdnQMxbzbC+XXC0Qgj6laTuWMwmFLKXos7a7MicBr5mxgkqQ6d2RmLwlLbP+w/jaLqT
	 s6AhiUzmxsc2oiMv+IJfC7kswiEDL165r+Gcbb2LRX498Yw0IPqlVafSWVmfIRlJGO7XZ
	 h5lbUJgaYqhTA4Mt3iH+/RbdLd6GqMenXtwLWS0v1dATloWm0F7f+bYs798ucR/l1kK1G
	 eotivG5RJybrWbH7sP2+pqJuLcxIaF6fbWx/i306uaW+2topuYywAcnkotV+GDu29Q0Ws
	 eRj0rECMo2sqF9HRE5ProG2Z+U2EblGbRGLKj5CvldAFvY2o0ydNPtg42Fs7zzjab/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ntw2xBjL;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59947606A322
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59947606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ntw2xBjL
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35c76e9614aso2554862eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 23:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793255088; x=1793859888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSKKrZBqxdz+n8H6S7Tg/WkVPzmvnVBSCNKmv7aM/z8=;
        b=Ntw2xBjLx1jCLiCYxOf9f5CBNYq/fjJHvxouoXHdwTmFEVd2kk1dnKLR3K8UViwajy
         VX/5aHC9QDSqpoe0AYMdF0pw3YxblG4wV4v81FhZ2xAUNON6RfpeICt2tBKLkN4GFgMl
         IW55pHwNEZzOWjXMjAPiox5c+99hZS6EQp33nyz9VS/C4V13iz+D1UShpH4eY50LiJER
         JLci77NKQCA6/SP7FKr0LQFsIn4EoRN2fOQYK9XJXV5U0J2pL+Ilj00q8nOxtdiH3Qd4
         BivF7MhsgrAVf5Fdj7NoI2llG5otZZBNQiZY6GOyjGRmLBapGhSNCzg6ye8icHMVRdW7
         c7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793255088; x=1793859888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSKKrZBqxdz+n8H6S7Tg/WkVPzmvnVBSCNKmv7aM/z8=;
        b=1xXrNG+8wnAnO3NqyTVSfYrujsyhkskBalagaRxTJpzmMxRlgjylqvjCnIk1qQfwzw
         bM7HT8MgSQ2kiOLa/1X93wvkGVvSR2EKg9aFTMw9zq9lECR9kI8opJqYkCy8E0S8eQjj
         9TGGu7PZ1QhEUGaByfDkTee6VyLCiynoBva7bdSlUzFTmYFyw/BNUyWtYIwl6wbOjXYU
         wKtnUevkK6fNJ8LTQlvVTGiHG+9bE8FBwTlUDytDopb2icDXpH6Po1ZtGp3+Z8ggI9XO
         oA9LjPVaosXJ2DYZdxlSzdM67gxl4lP5SDe3Vd7eSkO4gCG5BxV+KHDU5mCG+o6ixBLC
         FW/g==
X-Forwarded-Encrypted: i=1; AKwUvBy3I86mjUVY0fkqVtSskcDQmb0Enhto+l7ViFRX9WwEJpJ6e6AMklTxy/JSDEfXdEu3Z6Mn9rtQxtpAqR5nAk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQD64v0uSiBIqY8fVFD69fN6KnKa81Y1vRar+qlAuqf9hFn64i
	SPDt6yDg663yBtUbtUxeb0JVgsGJSCKc9TXlqHpJdLwpv979AQGdp9eB
X-Gm-Gg: AYBFou1aRYNp7nMw8SmiNBXLPBjXeH2M4EoqEseYr5B1qBT3SEmRjhyOyvbCR2RG04a
	J+Sfh43dDtJzwnC2l1uxKcxJWX5G1beytBpXXyjWaIK0EQWRetJRlsvdXDnm7NOVu2jx7smzm0t
	Tr1dDurjSVF7l0wKA7WPzu3wdgwwwcu29UlI3CqB+AwxfWywjOyNFceHx9z4FUro7c5X9FRnO/P
	pWHq+QvTHJLHLiziZKs24mZRaR0bH5i/Yed3ZcTXsXUO3E1qI8B7DBRYpBL10os8nWdQnmGxr2+
	Qc3Lamr1vsnvXxgq5nTFIScmFraHfLnz+pR4yHzIm8PO5XoSddo6wNRREe7en/tqWZLN4PpOvI4
	IUv88S7Ks06m+fue543Yz0NuYUIiaJj990xnCOdxmufLNri/X1JeK1Yr1C3H5hcqGgHEGpaA9/j
	nGPc3lHRGtIEmBRNtjvnVG/WlTFtVIdeONPI5KZN6Mnk8nCfgktwFwNeue2WsgT3fY97LbF0DfK
	EwAw6U0eK8TmgxjyH+2WB4YGfGoPVen6uV3PjKPIH8a4dDoGCEFuOCJ9JiisH7ChBxRmKYrbFmQ
	nezQXgayOY9STukpv5Ucz7y/CA==
X-Received: by 2002:a05:7022:7f06:b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1a8ff0ba512mr2702485c88.18.1793255088321;
        Wed, 28 Oct 2026 23:24:48 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aa2f100684sm2152004c88.3.2026.10.28.23.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:24:48 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 29 Oct 2026 02:24:35 -0400
Subject: [PATCH v3 1/2] selftests/mm: track the modules run_vmtests.sh
 loads
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
Message-Id: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-1-16ad772850ee@gmail.com>
References: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-0-16ad772850ee@gmail.com>
In-Reply-To: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-0-16ad772850ee@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>, 
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
X-Mailer: b4 0.13.0

run_vmtests.sh loads hwpoison_inject for the memory-failure test when it
is not there yet, remembers that in a variable local to run_test() and
unloads the module right after the test.

The thp tests need xfs loaded in the same way, and repeating the load,
the bookkeeping and the unload for every module that some test needs
does not scale.

Add load_module(), which loads a module unless it is already present
and records it, and unload every recorded module, in reverse order,
before the script exits. Use it for hwpoison_inject.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Tested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index a1b45a3dedaee..e104a9c6fdefb 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -171,11 +171,30 @@ pretty_name() {
 	echo "$*" | sed -e 's/^\(bash \)\?\.\///'
 }
 
+# Modules this script loaded, unloaded again before it exits
+LOADED_MODULES=()
+
+# Usage: load_module [module]
+load_module() {
+	if [ -d "/sys/module/$1" ]; then
+		return 0
+	fi
+	modprobe -q "$1" || return 1
+	LOADED_MODULES+=("$1")
+}
+
+unload_modules() {
+	local i
+
+	for (( i = ${#LOADED_MODULES[@]} - 1; i >= 0; i-- )); do
+		modprobe -r -q "${LOADED_MODULES[i]}"
+	done
+}
+
 # Usage: run_test [test binary] [arbitrary test arguments...]
 run_test() {
 	if test_selected ${CATEGORY}; then
 		local skip=0
-		local LOADED_HWPOISON_INJECT_MOD=0
 
 		# On memory constrainted systems some tests can fail to allocate hugepages.
 		# perform some cleanup before the test for a higher success rate.
@@ -201,8 +220,7 @@ run_test() {
 						| tap_prefix
 					skip=1
 				else
-					modprobe hwpoison_inject > /dev/null 2>&1
-					LOADED_HWPOISON_INJECT_MOD=1
+					load_module hwpoison_inject
 					if [ ! -d "$HWPOISON_DIR" ]; then
 						echo "hwpoison debugfs interface not present" \
 							| tap_prefix
@@ -225,11 +243,6 @@ run_test() {
 			local ret=${PIPESTATUS[0]}
 		fi
 
-		# Unload hwpoison_inject if we loaded it
-		if [ "${LOADED_HWPOISON_INJECT_MOD}" = "1" ]; then
-			modprobe -r hwpoison_inject > /dev/null 2>&1
-		fi
-
 		count_total=$(( count_total + 1 ))
 		if [ $ret -eq 0 ]; then
 			count_pass=$(( count_pass + 1 ))
@@ -453,4 +466,6 @@ CATEGORY="memory-failure" run_test ./memory-failure
 echo "SUMMARY: PASS=${count_pass} SKIP=${count_skip} FAIL=${count_fail}" | tap_prefix
 echo "1..${count_total}" | tap_output
 
+unload_modules
+
 exit $exitcode

-- 
2.43.0

