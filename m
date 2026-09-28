Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5AD355F49
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 04:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570096; cv=none; b=rwRXQW9GJtWaExuzeOENNgIyaw4w9GT1LUOMVcY5rHQMPg9vIsvL710LOD2B3RyJNo80CD2qPmNA+Ohv/LFSdeLzq8cW6OhH8h73ltZywFhHpVIRsP+EkWS4Z7AUm/zXa0fiPzS2V9puCXMe4cjObzgJ4zccyks7zugVkLrLSiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570096; c=relaxed/simple;
	bh=eBMgFXdaXRWRqMM9g40eqrVjtsqHy7m4XXDCRXlFFk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=adbysNyRm/hoKbcq7dYM0znPTMbyLMWeHw61lXmpk8HZ3jSebNwJiM3HBnecoVEqLUPILeUgnVMFWNWqvKLP723VFBkxojxfbysL8SSFTKSyOthdefR9Cg0Moe/NseoJk28gi7RZCfOEkUaFst2aF5Wu8K4acxSnxI0L2MQ8LhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQKqcpYd; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQKqcpYd"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144f7915355so2160408c88.3
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 21:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790570094; x=1791174894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrXsda7Q/wV7+l2k+sGQxx8wXojvBKGw7M+uJmFtdYU=;
        b=mQKqcpYdIW+H7+SHclXaRuyAwdjXTaFT8/pmja26aEwgaeC6sxs2auLP77RhxfqLbH
         gZbfqip8JhiZvtdJ6VRyftMZrZzfDbo2j1tLhXHE3j+QpG9fCTE+HDFJUTWI+rXdx+AA
         U4oNkxIzwMiKN19DKhLovBHid7FS25onv5iZ4DEASdmCGTQKPsbEG4VSWuYdYwTrZ/zD
         8GmYZfkvXgFVdbEDV+KPT74cC7fW2zrM1/8hqTV+6NdMVh36uia92vtRdNl1oo9NWU+6
         ul3yJkKsEnyZbOIFtJiP8momqiq5Add+7TXwJmhoRT6ePZS1SolLLeF6JzcwGNvDY8DY
         lGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570094; x=1791174894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrXsda7Q/wV7+l2k+sGQxx8wXojvBKGw7M+uJmFtdYU=;
        b=pq6XDLfZurx4awgdvi3/2hsk4FE6M7Hb5CgEtyKAeIYWpVOzorKW6L1aqLZwZHK6w6
         AfkD+aicig00NdLVU76jTqEJbHkYQzm+ub+T8S9yMT484E7AIGpabr56M3AIbmpIdj0z
         XynNOKbOVWBUlCx3LZi1Nftx8gvoy+SsFdamThb8iJEJuMJpWp2eAoNdcbJKARNKlbf+
         i/r9PnKMiNTko9BRp6xV0vKPnaPH8bAC9+2dlb9uTFYOqipwAdHFsI2GQmDNlsA4kw7T
         bHSi2jsOBXE71MhZfN1v1NEKeN+dWbc3BrsUKJH88OV0hpG1MZ6Lb6fByDM7XL7imh6J
         tdzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzh8tLKscmq8P+9n8cuKlq+aKVcE+Dy0pFGObWGk8c7D1X2Wo80qbA4Wyd4pL+BXbj49EP6jh1X4LD0QejNs1w=@vger.kernel.org
X-Gm-Message-State: AFuF++nxNpTDloFc5Mplrs4/c6SvMJpfRSUqw8VvRk2yowHF1k5qcYUm
	OSmp325qCLO2l4SzSOzGSZynVuM2sMue0jl7MvGevsKrVfSU6OkbBq7S
X-Gm-Gg: AYBFou3i80WfsS8BXPfbtgGpi+NA3D5tkqgURbnWzyRHlP3ueL90E/mY9dsbKf/uzgz
	R0lGaPfaW7Sr3E+ONYw4mndP39bqhQbNhJGrus4Lp40/fFQvT/ukcIR02xaOqSR6xktdjRVb2Ab
	NOMtSNL5pe49IcmlkIQP3ytIbxb7qMpurUU5Uqf/F93n3YqkBHz6H6E/gZcPtv0HsQRzWiPP0g9
	OYNWU0D1EJWeGt159osIQxdEXafbL3V5c6bSGUUcmRAov2sHyg2gtMumeYA7Yite1ItIyFzjIwU
	/wXB5EUysGQ9v704bDlj60smIo7rArDoCpIWcM0b7ZYQ/HqeEDKrhCUj3+l3fnD/WvGCU2FhcRy
	PWx+P/rP2Aig0wRMFIhoxEa6mJt26gaacFmehmcV9H2wtM+1Ou7sw2rABrCI9ZpNA+T5ZGQOQqC
	7scTYZ3uyp2CQgmHhYDSdD/IlpBmFNGWrn/r5IZekLVUv3OQsx+BFzLF4UKQKnbwDKD7jcSNZ0F
	SeZFduoWtnAi3H3wmgThLEfyeFIMJwiHtlpiyG0cSTfSMWpHgzNnT75s2zTgX40+1rltnGo
X-Received: by 2002:a05:701b:4589:b0:143:26f9:becb with SMTP id a92af1059eb24-146d049577cmr8459429c88.35.1790570094265;
        Sun, 27 Sep 2026 21:34:54 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:571a:2a:d409:bce3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm27921045c88.14.2026.09.27.21.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:34:53 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v9 3/3] net/sched: pie: correct tc_pie_xstats field documentation
Date: Mon, 28 Sep 2026 10:03:58 +0530
Message-Id: <20260928043358.6866-4-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928043358.6866-1-hemendranaik@gmail.com>
References: <20260928043358.6866-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comments describing struct tc_pie_xstats do not match the values
exported by the kernel.

Update the delay field comment to microseconds (PSCHED_TICKS2NS() /
NSEC_PER_USEC). Update avg_dq_rate to bytes/second (avg_dq_rate *
PSCHED_TICKS_PER_SEC >> PIE_SCALE).

Documentation-only; no UAPI layout or runtime change. Touch
include/uapi/linux/pkt_sched.h only

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index fef848eaaab2..445a041cd103 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -920,9 +920,9 @@ enum {
 
 struct tc_pie_xstats {
 	__u64 prob;			/* current probability */
-	__u32 delay;			/* current delay in ms */
+	__u32 delay;			/* current delay in microseconds */
 	__u32 avg_dq_rate;		/* current average dq_rate in
-					 * bits/pie_time
+					 * bytes/second
 					 */
 	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
 	__u32 packets_in;		/* total number of packets enqueued */
-- 
2.34.1

