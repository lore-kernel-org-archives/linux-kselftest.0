Received: from mail-qk2-f5.google.com (mail-qk2-f5.google.com [74.125.230.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29335576ED4
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.197
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965666; cv=pass; b=npoLr2g3yO7b84cBocRMFl9foR7NGsmwWQgVnw5+RE2XlNbYf9yKTDRavOEE2+YDVZs3MF4dokiAd44piOBHavslmYGa+fuEQZH8vkOoKA7bprNNpX+H5yJZ8bDxO56eSomiZir/1p0KCxuTYVKQSP9eu7iougwAJ0acQTceHIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965666; c=relaxed/simple;
	bh=2+LQy41VBaoLXKZAd/GXhewDcJQYQpQ6hKJnhk5gu+0=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ag4WDNLy7Wt8UqzTZ74jbYnxw0KgxvcyDKEDo1qlw0PuFKft19R3ArezKOScS6uZNvIYiHJzSEVqGGNtLo3/iaF16KfCj9MFfWDNAlDH2VRrtcT0mQGe47EhZ8zfxSxHbvOMtMKROSzOqYvBda9O0bzu3uIH9M1smwppmfxDl+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qku35y4y; arc=pass smtp.client-ip=74.125.230.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qku35y4y"
Received: by mail-qk2-f5.google.com with SMTP id d75a77b69052e-52ff498cf90so37857681cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 07:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965664; cv=none;
        d=google.com; s=arc-20260327;
        b=BOS4Jnyff6fJ+PJIuXEe5at1LpCEzx6uLB981XoLWQPVh6CKIPevcQB/CiDZrRdfhy
         mTJHrprpedYmhwJQ42ZFYE5IcJEDlfh/rCGB90RQbMlS//U4Apkqud0uzxmFwNmrgfbe
         cFolrOvOtSrzbqkQ2k70Th81//e9keirjWycGTkNP8Pt3RF4AQ26001Aj5NMu2vSgokE
         vP1UFCsZpFPicJS+iMkW4JkH0jMlrPkPa1o4ssspTp47raHmb9gaHoJTce0Zb5lTNCTV
         Ql+FXQukoOQZads1DgX++fOnSmnOgyNVLV0ZfaikQK2jEhgRzTOY7Mjhp70UTMP8yBR9
         rm9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=+87EHy1co2pXlM7ySnDj2tBNxv7Gw6474K+toJRCPIc=;
        fh=mG1QfoQZFzl7BMsv867OLJiEaDhvIZOnzSmMF3Z2FsM=;
        b=Ek88ykCx76+2Njm00mJlrRH6Y6ePJA9eHkgttMTKbLOtM/PE3tPav28bLN7/KlH4xy
         GpLSLlL3jfBi8N65iQIOoI72pZOHSMlXFzMLPKiEkjcABhehrLJkmuRuCbnn2oU9w8gK
         tEgDH2daaMCxs0QMYGENedsMJvF7zMB5l3ufAGkMIDehqFqRZXUrNdUKBRD7fdSF6wfC
         64uM0IYCsmzgt01AVsKrmlo2/tTLFAgPBigMFyw0XENOjtVBtU9XYB5SlzfRCfCYS5bL
         tMPvgV1z45uVyfl58g/pUu1XC+vl/UZCLCljKsVsy5/EknMRleKiBC0kZFzVMchXvwcr
         msRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965664; x=1789570464; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+87EHy1co2pXlM7ySnDj2tBNxv7Gw6474K+toJRCPIc=;
        b=Qku35y4yshNJ5wZwCXfgdgKUu+WkrMJKy5T80XScG4FptYu2iB/7a8D2aKUlyOWvaH
         UJtSu4xCDGck5v6naFB6ayrJL67MbdIqbiY8l7TWx7r8T6csOK5bXAM8y8ChwgebPMtI
         yAUM87AWu84TeVERbEpPlDuvVfRVHi9mXGlNiYV9oyTkhx+U8hRSdYrBBbamSBFDQ61S
         EFoJBZr5zmWZfO9vAlPevJOXY8Im2SQjNrdqL981Ovyclmx1rHgli5MyoW+YPpfsmNju
         5PSWaKCr7yktiVqIrawmaP6kOxijCbbhrzb5fnh4AwHEOPL8gNDIzmu4ZxboI6cPAfY6
         H4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965664; x=1789570464;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+87EHy1co2pXlM7ySnDj2tBNxv7Gw6474K+toJRCPIc=;
        b=ZFjMGnRwfat7A+xa0iPkRzFm2YlvWYUCNF6bQA0Epo77+8mxx9o9iH4wRZMGZKG2lI
         0W8JbKsJf8TX7+BH1O8Y0uquFO9OwquN1Y/f6LvS1M4DB5jqTS/CJuN2cGbQxigQhvzB
         2aqdZvva73W7Isv6Bqy/0T2xndktAzoBc/MvhhsqtF6KiO3qrGahlLfOuPQYdOeHZDkp
         52rdE8xI7v51T5HgXlQb2pERaRYzvPg2nE6mdRVaohs0xjFKgwD3QVFauW2BkY0jEYRD
         TzFbVuip7lUHo7XJeer/FJRwNAjysLATMk4ZO0RDj6jXmzuJc/NialJTlWWVt6E8ibyD
         XFOA==
X-Forwarded-Encrypted: i=1; AKwUvBxMA4cHAsMBQNNIXWcD4WoYEAbUgKF5l1vHA0zs34q6KF5YtmRtG2Q0ccqZnBw8eTkNFEEtK1grvU+DZnvNeKc=@vger.kernel.org
X-Gm-Message-State: AFuF++ng6edoDztSNoLY1WJRG4yAb+1yq3JIAyLSMidIVYwCRHEX1zzX
	WBdz+XVkRJ4Hxs0JzzSwn/z6COJpVIn7HJRkUXcO2qOfFnFFra0YMZfmpHEIM50dzAX18ujOGmt
	/TGfTte6J08950LRiX2ZYk++M4Fd06D0=
X-Gm-Gg: AYBFou05LylhQ8u8S5QkWFfhmZm9F/kWFlfNysjSZyf5W+/RuWT2eW3hQaGHNZagQrG
	7VhWyKzrhvnebctoN+vELygpruqsMiTiiWAnUCJwc7QLVDz8dxvW2zvu8JFGB5o8RRd7OvsCAhX
	RdRG+Ti5T/PCKmESnbUKU0Ose38ZNBB6sbdwy7SjVJaBtGDCwsKmcWTwj1YLcVJM1/JGnMJAAVo
	w6FMOBql4s5iy17JX9M6FXn6UsNQNKYQh7QLCc1Uk1PDdCOhLtmPAkt2yc8p+2OQ9UUGCVt9ifN
	n4eBXzI/X11jXmXl+H+v7JNjaYT4tEq5NOmWPpBr4yXr5/1WLoJGxA==
X-Received: by 2002:a05:6214:3bc6:b0:8f3:cf36:15ca with SMTP id
 6a1803df08f44-910c8552de2mr28530296d6.9.1788965663921; Wed, 09 Sep 2026
 07:54:23 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 10:54:23 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 10:54:23 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
References: <CACGbirSdR30=YTPQGN-=202jZqiF8gBSewhq+K_fTSNpq=DMhQ@mail.gmail.com>
Date: Wed, 9 Sep 2026 10:54:23 -0400
X-Gm-Features: AcwNN1WLFkJxZiXjMeZLR_cyAMBfiX7lh_2ngWCAdTCfWBnsc8DM_11bZhuFLIg
Message-ID: <CACGbirSVuuwVFKOtdSh63s5ktbBwkC2hdkD3FBG7ndaAuFyWbw@mail.gmail.com>
Subject: [PATCH v3 RESEND 2/2] selftests/mm: Only prepare ptrace_scope when
 memfd_secret is selected
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Tianyi Chen <hi@tychen.cc>
Date: Tue, 08 Sep 2026 11:21:50 +0800

The memfd_secret setup clears ptrace_scope whenever its test binary is
executable, even when a different category was selected. run_test() filters
the test invocation, but it does not protect the preceding setup.

Check the category selection before entering the memfd_secret block so
running unrelated categories does not change ptrace_scope. Keep the
existing executable check and the behavior when memfd_secret is selected.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/selftests/mm/run_vmtests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh
b/tools/testing/selftests/mm/run_vmtests.sh
index 9e62ab4c6775..9bbef9410ccc 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -370,7 +370,7 @@ CATEGORY="process_madv" run_test ./process_madv

 CATEGORY="vma_merge" run_test ./merge

-if [ -x ./memfd_secret ]
+if test_selected "memfd_secret" && [ -x ./memfd_secret ]
 then
 if [ -f /proc/sys/kernel/yama/ptrace_scope ]; then
 	(echo 0 > /proc/sys/kernel/yama/ptrace_scope 2>&1) | tap_prefix
