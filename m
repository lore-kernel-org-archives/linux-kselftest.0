Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEC142C513
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 21:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791691; cv=none; b=SNdxmINMjtW2MST0lQcIylup/BDJq+/aiF2Lknf+nRXDgJt8rD2ypS3r8fhqcwg2usGwDxigUKqh5lx4dRpNe5Oko8wiWX4PpxASKdtGHVJ2D9+69yNCEq2QVfmplMRHAwEtMOPtGe2RTFjo4pPJOZPYnm51eYjsyk6jCUg3UTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791691; c=relaxed/simple;
	bh=8qxekDeSK5x+ec3E67tUMH2DiSjF/BHmj5eXMGM1EUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=azNsfZ8lgUQ+n1pvBoCvN5c2ExBqWToRpTwaWQJzCMQTZ8w6qmS7j35IhEN3xvV14mjed602o9M3i9Ts3DZOk8pEgR4spOukMN0wFqOOkzbpSycx9Eg280MqSrgINNzzbs9YhZDY8vQkI9Uzz8GIYyJZ5MP4VTL3zPVpzx+8tFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=DDzxn+MX; arc=none smtp.client-ip=209.85.222.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="DDzxn+MX"
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-934978559daso36505685a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 14:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1785791686; x=1786396486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/ysi0c3v/nSs3PcCunYETC+T3p7rfWS9Ra9/ntvyBI=;
        b=DDzxn+MX2lgwWRBkZu6OQhokrvUo1q+qdVG3p2rhBfx8VhGU6gwhBUlqTeQBCoB30B
         L/tEaknzZ5BQcejafpvsfq1939ABqYP7vtmBBbcuohJfC2b4+rh9IWURJkOJ6UWYnRLw
         DJxvZxEV55gJTW2/bQ1bvnoOq8yGFpuKfVT7UviH6LcyeZ8kn+Vc4/avg+eU6nvQ5Yyf
         Ih1Quw9TDgsdQjVEjjcpJNsec0WVBRtdZQVDs4GEQLYqeOxzSK43QDpFaLxwQwCRaNLy
         pd+aAkvEotoEqbiyJ7caWLZZqm5pQ5+r/6HFpP7/zd913dFy49Sz6wD1sYm5XqmdFoh9
         4m1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785791686; x=1786396486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/ysi0c3v/nSs3PcCunYETC+T3p7rfWS9Ra9/ntvyBI=;
        b=fw1yS59h8IdDp5T6T0uHVlEX0rFpIxXD1AUEtsmW9dFy8GeWzPFBuDhuKymprDXtX9
         9ZsDXb5CZ1mg5ID3FjEhWvGaLwX6yiuVYaWCtn9RrmPatpLP17ipnl6Sp3MXJloMJeAs
         DKN0TqBlhBxy3z/sMUPRGBpt6s77Itt5JXNRFT9uaBZs+oBSWsQ4vpvQLljh6YbeFZzd
         TTcy2czR/XEn4E/IX3jX66Nkyir5PlccYGyfk3sr0GMoXFKo+z1yN+Xch4iY0fYHA5BS
         4g1gN5viohfeG6SaSxmGskCRhVSOOIz/VzM1D9FuTNAgoehxZzrrCzu35RuTUoS8U+pn
         WKFA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7NpGc/0k73cm4LSvCFpX6ys8KQz3vgSBZX8rnTQjAdkRPScBJjttEqqPRYk8ffAPgTlcsv101O0X5V9Qtv44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/EX4Zq3iO/WFh81+TC3Fuz7EyNIUj/+mt3Y54AHCVxFga5go
	KzYq/Z2bFLd9rcSTqjAJl/L9M4GNPAByl241AU8ig5ECAMgr7IROJC8+cV41iyz2mckNGUTEnF0
	xeCaPsM8Od9vj8qXPNnnnG6BhwsdRJvA+JO2E
X-Gm-Gg: AR+sD11MWxLcP64HTS6o0Q+1hnQiGRBNrqeR++zgVAlAyQV4oxe3JRahvsnAjleRBoJ
	PC+A1jpaDptDNrfq0ZJQb4ZrZCI3plreqJRK8siv/R25QiKR60CYMIA9xfmp6mBFeLEm64rHnIG
	i11PvJXkeCX5A9sMjScmaB7vXGWPu048urDTH2BXt2VENkGrylInQxRPQO0DIP1VJeipll0H8fs
	BXUDArl1d+6tHrBQKML12FIFFMXlcQX5MDvRwwk3Q/M8RdUdX5oKFXT06jN7VAdYvMZ0vEEmTrP
	cQGSFc4SrHHrflzI6wSL11smwZgGFK3TNUGf7+1eN1ZdZscMz2QWohcxRhcKGQBuCsHaNL9krro
	0A5R1iR6PATM52Q8BdfvJUWaR4rnvs0Sv
X-Received: by 2002:ac8:7f55:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52b5681199dmr174778891cf.3.1785791686336;
        Mon, 03 Aug 2026 14:14:46 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-52b4eb94561sm4853741cf.22.2026.08.03.14.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 14:14:46 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.12.104])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id AD42143524;
	Mon,  3 Aug 2026 15:14:45 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id AB005E4041D; Mon,  3 Aug 2026 15:14:45 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <tom.leiming@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 7/8] selftests: ublk: add UBLK_F_IO_DESC_SIZE test
Date: Mon,  3 Aug 2026 15:14:39 -0600
Message-ID: <20260803211441.2538144-8-csander@purestorage.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803211441.2538144-1-csander@purestorage.com>
References: <20260803211441.2538144-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test loop_08, which creates a ublk device with UBLK_F_IO_DESC_SIZE
enabled and io_desc_size set to 64. The test issues verified I/O to the
device using fio.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 tools/testing/selftests/ublk/Makefile        |  1 +
 tools/testing/selftests/ublk/test_loop_08.sh | 25 ++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100755 tools/testing/selftests/ublk/test_loop_08.sh

diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selftests/ublk/Makefile
index 6e4fe8d1fed1..b00ef238a038 100644
--- a/tools/testing/selftests/ublk/Makefile
+++ b/tools/testing/selftests/ublk/Makefile
@@ -32,10 +32,11 @@ TEST_PROGS += test_loop_02.sh
 TEST_PROGS += test_loop_03.sh
 TEST_PROGS += test_loop_04.sh
 TEST_PROGS += test_loop_05.sh
 TEST_PROGS += test_loop_06.sh
 TEST_PROGS += test_loop_07.sh
+TEST_PROGS += test_loop_08.sh
 
 TEST_PROGS += test_integrity_01.sh
 TEST_PROGS += test_integrity_02.sh
 TEST_PROGS += test_integrity_03.sh
 
diff --git a/tools/testing/selftests/ublk/test_loop_08.sh b/tools/testing/selftests/ublk/test_loop_08.sh
new file mode 100755
index 000000000000..f7af2587482d
--- /dev/null
+++ b/tools/testing/selftests/ublk/test_loop_08.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+. "$(cd "$(dirname "$0")" && pwd)"/test_common.sh
+
+ERR_CODE=0
+
+if ! _have_program fio; then
+	exit "$UBLK_SKIP_CODE"
+fi
+
+_prep_test "loop" "write and verify with io_desc_size"
+
+_create_backfile 0 256M
+
+dev_id=$(_add_ublk_dev -t loop --io_desc_size 64 "${UBLK_BACKFILES[0]}")
+_check_add_dev $TID $?
+
+# run fio over the ublk disk
+_run_fio_verify_io --filename=/dev/ublkb"${dev_id}" --size=256M
+ERR_CODE=$?
+
+_cleanup_test
+
+_show_result $TID $ERR_CODE
-- 
2.54.0

