Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A824B346E58
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 04:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756786; cv=none; b=D2uciw5ZQD17vGe3X8ccLXYFW9PzcOWrx6VBQ0CQCaqfM6ZiwJpZn7mxVYtxh1ejsCXY1xSxYXWTKNSmSj33IiupSxaW9w9g0UCjaC7C5q0LuoLQgxY0YPuCU7u+AI+eOwynIa2zaxOS30LXnzuYryPUhG5SM66g8MvvAv+p2yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756786; c=relaxed/simple;
	bh=9EXCGpVfKBQS8nqmv2M5Um5dB6Qlnfw/r+giCzT8iM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bG7cizsgNF/wlE3wfMpTgpAqWhw2CIId+BePVy+RVUkoCQWQ6PYy3QhFRG4+pC6ueuk6QNpa9s81iH72gv4Krng+i8oNG2Dbi0VyluhVCJuafMGa3Kb2mKir6nludX069JHVWQIKg71qVAr44X4sjXmvBmRwgAmYQPJOTQMXens=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=piX3dBx1; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="piX3dBx1"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so3418963a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 21:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756785; x=1789361585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/DoQ4v3sOG7iCAF7e7sOxPVMm68Lco8LL3+nPKFM7Lg=;
        b=piX3dBx1CxIdvHXKLZTDwKKP7ZR+CFGe/mhS5HemZ+VVyNiw+w9ApZegLA6fnPb3ew
         NWwIRzduvlcEq/PfYFmHfDn4bw9yYwXMF6bAyLrW/Te1/98sLJIZazg4m2KIRvA8kXx/
         HBiiRBUAmtzyEWo0McTjWD8lujhQNgYFnL8ahOym07QlZfueQbfnyU9jFvz+tly/IHgn
         I5Yn7DCNQSOlGU5cgf9dnqKIPRme+IVdJSz2rJZr88mZlmryM3x7ZEmPKsTd5BCuqeJl
         mrkt7Cg9N09cKaqrxMKLqyxRv8iebgIF8b5kUpLAH1hp3R/VHgWXt4wZzgh1aZhrkoLE
         6jQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756785; x=1789361585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DoQ4v3sOG7iCAF7e7sOxPVMm68Lco8LL3+nPKFM7Lg=;
        b=AGVTndxVe38cFu4DeRgrtM1G5L8Z3ZMEq/qmoAN0FZru5VcpGDnJxUb4NJ1wy3Xc5f
         xZev5tKpUszgEcXhpoUeXRnQ01KAwErXggDql+/LPZRMxwbTy3EVvrGboSRcSd4PRTjC
         KzyLAICucFOjIDXn7q/MAMfwKqfRz5Mz2Xei1jadtvTzkP3MtOijqyF7Db4+P+oEEgVl
         oF/j5FAVN2T6YQAybDOfeJw8eDXc7EOEX7cI4Nr+UsDNXeOUItt3Ni7zJ8tIPhwi8HYj
         FSjNSehWg4pCyyfHuwFVx+6I5qzIDdorSIDBBKqkfUDG9obZJ8yKI/4VXhhpfO1o1sbp
         5hog==
X-Forwarded-Encrypted: i=1; AKwUvBx8e4Sf78GAduT3eaEfdALVbR8kUjxmiRw3JoXhel1/OPZa27IMT4CHXEdX5NEIfzNmnjC6kwidNJ9AUV2SNoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k21Th7I2l9axU2FHD+iZU8AsnlXLlr/jjTt+9ijKRjLQUVSx02
	a/1Dlgpn90/Tn3jObZCrqEpP1TH0GREM8zCiGw7AsNOo2Sm+932c6k9l
X-Gm-Gg: AYBFou0bcrmHW5gc/VSDTRK6c6jkHVU5rqmuRXu47oxsd7nvmnbWS+ppJ10dizd15Sk
	E9IgCjE8dqvyB7k/DzAKeOdkss47M3jaXWX5ep8xHUwdlCzLDaUS2befqTFzRAG6KphZyXMyj+W
	N4QqN9lpq0syHz7YEJMUG9BbFi0CIf01Vxa3nlMyNRhEF7jYp2zgR1bnIWrlLz3NXqy13tODGfO
	s2hcUmoX3upVWCszyXsBFAGBpEbS/aZigDfNkOrjm9n0gmHKpbXbuRrQSnEfNBT6u1ResM2N86F
	gN7Vudl4VlLbV7pZRplBVi78MCYIinDsW8scYB4voOZNM8clIVOAuFf7pPlRMFNCD5WLtUlNAl0
	Wr04BMee8gexiNO/lYMjwl3pi4Uy4xRxQQOpNdYfoGoyFjgPIaJpkrFziyTwktXSG82XAOC97pP
	BNW5EOW6ILyFdxst2NpE74wsgcBqjh8Gal0HCJNRwl3/NH+MhVt80J+ssMzXHTnrQIjCAcev1Qd
	Q==
X-Received: by 2002:a17:90b:4ac5:b0:398:9beb:a2ba with SMTP id 98e67ed59e1d1-39b087fb503mr29944113a91.28.1788756784912;
        Sun, 06 Sep 2026 21:53:04 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm37641639eec.15.2026.09.06.21.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:53:04 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: pbonzini@redhat.com,
	seanjc@google.com
Cc: shuah@kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nagachaithanya9911@gmail.com
Subject: [PATCH] KVM: selftests: Fix the never-true negative UFFD delay check
Date: Mon,  7 Sep 2026 04:52:46 +0000
Message-ID: <20260907045246.3783304-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

demand_paging_test parses the -d option with strtoul() and then asserts
that the result is not negative:

	p.uffd_delay = strtoul(optarg, NULL, 0);
	TEST_ASSERT(p.uffd_delay >= 0, "A negative UFFD delay is not supported.");

p.uffd_delay is a useconds_t, which is an unsigned type, so the comparison
is always true and the assertion can never fire. GCC points this out with
-Wtype-limits, which is enabled by -Wextra.

As a result, "-d -1" is accepted and converted to a very large unsigned
delay, causing each demand paging fault to sleep for an unexpectedly long
time in usleep() instead of rejecting the argument up front. The return
value of strtoul() is not validated either, so a non-numeric argument
such as "-d abc" is silently treated as a zero delay.

Use atoi_non_negative() instead. It rejects negative values, unparsable
input, and trailing garbage. It is already used a few lines below for -v,
and hexadecimal input keeps working because atoi_paranoid() also passes a
base of 0 to strtol().

Fixes: 0119cb365c93 ("KVM: selftests: Add configurable demand paging delay")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 tools/testing/selftests/kvm/demand_paging_test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/demand_paging_test.c b/tools/testing/selftests/kvm/demand_paging_test.c
index f8b3d0b68830..619a0b2be45c 100644
--- a/tools/testing/selftests/kvm/demand_paging_test.c
+++ b/tools/testing/selftests/kvm/demand_paging_test.c
@@ -297,8 +297,7 @@ int main(int argc, char *argv[])
 			p.single_uffd = true;
 			break;
 		case 'd':
-			p.uffd_delay = strtoul(optarg, NULL, 0);
-			TEST_ASSERT(p.uffd_delay >= 0, "A negative UFFD delay is not supported.");
+			p.uffd_delay = atoi_non_negative("UFFD delay", optarg);
 			break;
 		case 'b':
 			guest_percpu_mem_size = parse_size(optarg);
-- 
2.43.0

