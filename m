Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1CB3DD531
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 20:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802153; cv=none; b=X/tLvbCSgR11QwL50KISCxPDZV+0D8diYJIAntZMdPYsJyEj92TmoAVu1iXuTWcDdmxnskeYA6bDEQ7qzulRB/w2MC9SMytz3Pk9ZMlj6SjHxxiWKfKzWJzH9a8pA/cgQ0Hjj00vOhP2ymIHwQqfsfDn7DgY1i7Cl8xV0na1nfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802153; c=relaxed/simple;
	bh=lwAa3zZY4dUx5e7J56G35xKAUJYH+Ib6EeZjW3NXaCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPGcklY+L/Hp67JJBpVc2pKcv8XOuK2aPlIxT9vByX5PJSHyMj6YePYcYGcD065AM7Qxp9P52y/Y6mzU0SBouDwQuBgRygWUzcCEAJklMc82iTB8f8pweKK1XSgIIt9rBJv4pctS6rA7crmaYYdL/dsDKxy25nxAoJ5oQjjZjII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=fDVuRrh7; arc=none smtp.client-ip=209.85.222.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="fDVuRrh7"
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-8d42b9d150dso81040885a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 13:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1776802146; x=1777406946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAZHQPO98mzj8j7p5PPgcZ6Q+1cUZmFim3S2B/NBScE=;
        b=fDVuRrh7vEW/l9fQocW4FHVypEZGVgI4FiTpGyY+cqZVRX9fNPcfXvpzpnGqoTQtQz
         BZgQhsotZW5EBxLWs0psFttANvEh0FFgydxgLMAfQzRKZZpSuH5owTMSTtLUsd+1H2Fm
         rVXe8+h4Xe2biJ131NW5ARocVo7XqcBsTjA3K3mDSkywQnn2tIJE2aDeB/1HbFkDYgfp
         tzMa+5cqXGGBjvE1qNKwip4RW0NclSMeWi2uB2lI4SgqUEvQlhpNPDox09/sprDa0Hma
         LVSJ7gXu44umBAWQQVAs7N8spKPGbSOgcBOQ+9Tdfg6JH2RaCjGj8AOQ4zm8wjP1Mh1P
         HnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776802146; x=1777406946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jAZHQPO98mzj8j7p5PPgcZ6Q+1cUZmFim3S2B/NBScE=;
        b=nCRgPL4EvZAPIRnga2rmmy33NdLe6lrStdydGgebJfo0WUpl0LMWlbpkVNpsCT7pX8
         Frx3/eJylHLO9S0JT4qNmjeVtgarIT3mm0IEEiq/XZymxjHvzWLzECPjqUV1bNrbg7Nr
         XE1y9tP6u7INOwBWZTDHcbQD97syV/8Ed9vLpHw8IHVR/S2om2B4gAagvO34SCjjt0KY
         5JrPkG18B1tOkbnKpUIt2U8Kq7XP7CYXqM4775Pd2voTe8bt3h1rRAZHh1yafro9JE/W
         Ob5xOzR3I38TEINrE2budkC9zcBYecj7hWSaxif00LXbRAgnbT/XFSYjumdA/IZt/xa9
         wzBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+usv2hRN+i8zO1IHQVIZVDvFVoAsFfBE/R8oBkhDuxjaV24gV/gX2fHSVYimyLKZmvUviPg2ouV/uxuJbJ1cE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLyaduPRM3Iuzc6Xqaplz44WmKns9QWOfbiXEJBp3raSYbCf5V
	SYVKFtazW7ry68jkYTydzhF6wjO4zIdcfTaM0zhx+mtAdcwXKZoY9f8h5/TjBVuOP987Ud3AQ5M
	RF3WeoIeO2vRLPAnnS5iq5CccVNXRmyPXpM3K
X-Gm-Gg: AeBDietsNrekiB53jx5uBOOVrm73CkzY8CdiPAHwq19X6YEuqrDfqWa8JvrC3GBIoHq
	LHaIKr7dytDy8mnuEBnsLh1dKk8N+MV6s4csN1Z+tUZ12ib+jBLikSIc+ISfdLQN/z8IhOgTi0u
	tie1Do5JW2wXZm6FiYMI3+RnkQ0WY6c68UEXmhVo3X+7me6sd7EesL8AZ4Gi2vt/EextQTyoVWK
	mBGSx0XFJiNdksvauTCTagXZJICUAW8Vbr5xUWvcd0t2Q7pRCV+DnUrraPJOQPnNEopKrkf0b8m
	Bwk1iVq7nA7sWHgRhVlRweuecDJsd3bDwDDJpaI0AW5o5j5zx3Pyjnw/YYaSIzSYP0egklkCTIe
	H/w3m9drp1EpRcCnN8IYKzuAC/m4c0HsOreYcjjfvJeyKxlJWyYcS5gFIYai6m4ky
X-Received: by 2002:a05:6214:518c:b0:8ac:b300:c558 with SMTP id 6a1803df08f44-8b028023a33mr204724176d6.2.1776802146333;
        Tue, 21 Apr 2026 13:09:06 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8b02ac7bba3sm10611586d6.11.2026.04.21.13.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:09:06 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.29.101])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id BEAA0340576;
	Tue, 21 Apr 2026 14:09:05 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id B9EDDE41A9F; Tue, 21 Apr 2026 14:09:05 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <tom.leiming@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 3/3] selftests: ublk: add ublk auto integrity test
Date: Tue, 21 Apr 2026 14:09:01 -0600
Message-ID: <20260421200901.1528842-4-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260421200901.1528842-1-csander@purestorage.com>
References: <20260421200901.1528842-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The end-to-end integrity ublk selftest test_integrity_02 requires a
relatively recent fio version to support I/O with integrity buffers. Add
a version test_integrity_03 that uses the block layer's auto integrity
path instead. The auto integrity code doesn't check the application tag,
and doesn't indicate the bad guard/ref tag (just returns EILSEQ). But
it's a good smoke-test of the ublk integrity code and provides coverage
of the auto integrity path as well.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 tools/testing/selftests/ublk/Makefile         |   1 +
 .../selftests/ublk/test_integrity_03.sh       | 103 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100755 tools/testing/selftests/ublk/test_integrity_03.sh

diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selftests/ublk/Makefile
index ec6a8ce83d38..6e4fe8d1fed1 100644
--- a/tools/testing/selftests/ublk/Makefile
+++ b/tools/testing/selftests/ublk/Makefile
@@ -35,10 +35,11 @@ TEST_PROGS += test_loop_05.sh
 TEST_PROGS += test_loop_06.sh
 TEST_PROGS += test_loop_07.sh
 
 TEST_PROGS += test_integrity_01.sh
 TEST_PROGS += test_integrity_02.sh
+TEST_PROGS += test_integrity_03.sh
 
 TEST_PROGS += test_recover_01.sh
 TEST_PROGS += test_recover_02.sh
 TEST_PROGS += test_recover_03.sh
 TEST_PROGS += test_recover_04.sh
diff --git a/tools/testing/selftests/ublk/test_integrity_03.sh b/tools/testing/selftests/ublk/test_integrity_03.sh
new file mode 100755
index 000000000000..10f02339ea2d
--- /dev/null
+++ b/tools/testing/selftests/ublk/test_integrity_03.sh
@@ -0,0 +1,103 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+. "$(cd "$(dirname "$0")" && pwd)"/test_common.sh
+
+if ! _have_program fio; then
+	exit $UBLK_SKIP_CODE
+fi
+
+_test_fill_and_verify() {
+	fio --name fill --rw randwrite $fio_args > /dev/null
+	if [ $? != 0 ]; then
+		echo "fio fill failed"
+		ERR_CODE=255
+		return 1
+	fi
+
+	fio --name verify --rw randread $fio_args > /dev/null
+	if [ $? != 0 ]; then
+		echo "fio verify failed"
+		ERR_CODE=255
+		return 1
+	fi
+}
+
+_test_corrupted_reftag() {
+	local dd_reftag_args="bs=1 seek=58 count=6 oflag=dsync conv=notrunc status=none"
+
+	# Overwrite 6-byte reftag at offset 48 + 10 = 58
+	dd if=/dev/urandom "of=${UBLK_BACKFILES[1]}" $dd_reftag_args
+	if [ $? != 0 ]; then
+		echo "dd corrupted_reftag failed"
+		ERR_CODE=255
+		return 1
+	fi
+
+	if fio --name corrupted_reftag --rw randread $fio_args > /dev/null 2> "$fio_err"; then
+		echo "fio corrupted_reftag unexpectedly succeeded"
+		ERR_CODE=255
+		return 1
+	fi
+
+	if ! grep -q "$expected_err" "$fio_err"; then
+		echo "fio corrupted_reftag message not found: $expected_err"
+		ERR_CODE=255
+		return 1
+	fi
+
+	# Reset to 0
+	dd if=/dev/zero "of=${UBLK_BACKFILES[1]}" $dd_reftag_args
+	if [ $? != 0 ]; then
+		echo "dd restore corrupted_reftag failed"
+		ERR_CODE=255
+		return 1
+	fi
+}
+
+_test_corrupted_data() {
+	local dd_data_args="bs=512 count=1 oflag=direct,dsync conv=notrunc status=none"
+
+	dd if=/dev/zero "of=${UBLK_BACKFILES[0]}" $dd_data_args
+	if [ $? != 0 ]; then
+		echo "dd corrupted_data failed"
+		ERR_CODE=255
+		return 1
+	fi
+
+	if fio --name corrupted_data --rw randread $fio_args > /dev/null 2> "$fio_err"; then
+		echo "fio corrupted_data unexpectedly succeeded"
+		ERR_CODE=255
+		return 1
+	fi
+
+	if ! grep -q "$expected_err" "$fio_err"; then
+		echo "fio corrupted_data message not found: $expected_err"
+		ERR_CODE=255
+		return 1
+	fi
+}
+
+_prep_test "loop" "end-to-end auto integrity"
+
+_create_backfile 0 256M
+_create_backfile 1 32M # 256M * (64 integrity bytes / 512 data bytes)
+integrity_params="--integrity_capable --integrity_reftag
+		  --metadata_size 64 --pi_offset 48 --csum_type nvme"
+dev_id=$(_add_ublk_dev -t loop -u $integrity_params "${UBLK_BACKFILES[@]}")
+_check_add_dev "$TID" $?
+
+fio_args="--ioengine libaio --direct 1 --bsrange 512-1M --iodepth 32
+	  --filename /dev/ublkb$dev_id"
+fio_err=$(mktemp "${UBLK_TEST_DIR}"/fio_err_XXXXX)
+ERR_CODE=0
+
+expected_err="Invalid or incomplete multibyte or wide character: read offset=0"
+_test_fill_and_verify && \
+_test_corrupted_reftag && \
+_test_corrupted_data
+
+rm -f "$fio_err"
+
+_cleanup_test
+_show_result "$TID" $ERR_CODE
-- 
2.45.2

