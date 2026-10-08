Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFD53630AF
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 18:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484695; cv=none; b=T97hFPjI5B8IZ/B0vIcio9ovdn2Pmc7YPYgQQJmMa6mPWn2RBJJ1YDiObgQKMz6TumUibuL1/AzYpVfYo4Tpm+iCxZui7izCFYYVdg4u9f3079rYL3KSCAaH8j4ltlbrIxfmAl900GY0Mvr4wu+xnqHpC9+BB8M8qALwESCN2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484695; c=relaxed/simple;
	bh=suAC79Lb92vdODjVsBBG58aFPRRoscz21TCCDZVGmFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VrP+E8DVf0G+9JnJ/bZn9b/dcDX4cMQdUVoTnTYjBeBNewlKlHeJwtNnnmId1k42FMwj66suR1PnvDdJXNLnfUgixpQPUVUegO4l4exxLXJyXKsyWzgdlEpS5z8Id5reMmYgfs8rFxsJWZkArwJj2A/pW6fTkgN0QwW1CjV/jY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiA/HrfC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiA/HrfC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49ff680331aso61694865e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 11:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791484689; x=1792089489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rhdzuOviOybOfOdxdwALihDABzSCdOjxs/WfjtGrXrM=;
        b=iiA/HrfC5mJbNgDDKCGkMSVDyTi5Op7URF7mB0vKQ3GegdZWRTXllCIsV/EAbZTX1B
         MdzsOMqJsCCjGyWNOF+kqQNu7HAhBlbfpDvexOL1+IZqH1prQ4+rvIPEfGiNmYiiCOdN
         P9JnbJvDMIom7zeKI/sgAsPMsM98GJ4jkJXjN663U/AeT1RrTh90oWnHNHAfJIoXnkxA
         4QPqfWSyZv/sMXkrm3f42FdyWpe+rqSF/6xtLFXgNNcZL1Ucp7RGo6qgdtc2Q5dzX/nE
         HAupAEN/wqd5ZfpwFbbPG0QbXxhBh4PiMGT3ShIHPhQUn6hZyIwlgIcVWLnGNLZvxmHH
         R62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791484689; x=1792089489;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rhdzuOviOybOfOdxdwALihDABzSCdOjxs/WfjtGrXrM=;
        b=i5ssXB+yiriWeyb30vlIFjlxE424JQbPvOGU8wpX1PYKe3z4bPsfiZsw3BBmGcQkjh
         PsOt4576d0AfyEbu6JT03zyWYfIhV8syi+lXz/7aTy/vrY200bSjM1avd37JJYfVmRDH
         o7TQo+Y76vuw9DYCZUdqbrGyYQqYBOKBmX4Ki9S/yZwaOu7PvJuYUX77SBtJNY7cDzpN
         S1bRmoeiUKmQOptAJJvBbkZ1YyWDY1O0/9E9p0IgmJoA6qwxXOOmQulHQtgoAp3wN25R
         7zCjKya18nZlnRZlaMKvjk4vMZN130L50pIpV+IteyZetMVtobMLL6UOMr2gqqgY5biC
         6w8A==
X-Forwarded-Encrypted: i=1; AKwUvBwbzl4ql0hlsQ5i4rM8ihuC1umbzsYeXK7HLz/iMDZFA6TwCdjSkSOvNly1Vau3zmcf4/7BZW146ch0MR7Ta7A=@vger.kernel.org
X-Gm-Message-State: AFuF++m8iSnoohEZLb9rSk3qpIfsVNdM4U8UZII9QpcOSDUBjjkmO4xT
	Kl0SOqW6zOoZ+D7espZjUzyN1PZC/JMhJNTgipy5ZeY7G9xjvLh0od+T
X-Gm-Gg: AYBFou0UdQwDMp7Ge1r5y37qzBdkBqkBOofnOFUjHI4RmHpID3iGLldkCtyezIhNYaZ
	H6qZUcei0q3pzYOqR2ikGMIuytn17I0l2kOKeMKCQv8Il0IUYhDbeuFlHtJgSrlV3AtGHgOO9Mg
	/4H03K+JxrfJYRNQwfCD8Up+WxFQUcUGuFid4DMsUEr7c252mqAebsNTR6BmYm+EuqPip+RaBGa
	cjyGJc4287JTBILnZOp/z1AFYYbKukTDFswdJNtGNCWzY2IwixyYHrRK0quE55WSCF98xLsaHgw
	oKPhqG9OVkIpqaUfvUZtr/N9th7G0CrEWD5PvXo4JCasPJGNeV1/u4/EkWWTShuSsS7vI1AltJK
	otJuS45fXEBkZVZNBtZqVqXyjzWnuFSFt35v12PuVkPjzDbRSEf/+yRmcDjhF++exWcXIC8yvTp
	sOcQXTZhReRmvQIcbeVNHtfTAGUfFfO5yG1qLUnmBARX4ZSy+zbn2S44pgrg2JFo/GJf5HVtel3
	rGwO/unXY3Pb0Gb7UUf2tAfi9X7ux+ngGB52iqqsJVkbZKEEdjdUA6rJA==
X-Received: by 2002:a05:600c:4e03:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a18064c31cmr105908565e9.15.1791484688923;
        Thu, 08 Oct 2026 11:38:08 -0700 (PDT)
Received: from localhost ([159.26.107.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bbbfc03sm2413385e9.1.2026.10.08.11.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:38:08 -0700 (PDT)
From: =?UTF-8?q?Dar=C3=ADo=20Hueso=20Gisbert?= <darihueso21@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Dar=C3=ADo=20Hueso=20Gisbert?= <darihueso21@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] selftests: rtnetlink: skip ifalias test if uuidgen is missing
Date: Thu,  8 Oct 2026 20:37:41 +0200
Message-ID: <20261008183742.678-1-darihueso21@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kci_test_ifalias() uses uuidgen to generate the alias names, but
uuidgen is not always installed on minimal systems. When it is
missing, the test fails with "uuidgen: command not found" instead of
being reported as skipped.

Check for uuidgen before running the test and return SKIP when it is
not available, as kci_test_promote_secondaries() already does for
ifconfig.

Assisted-by: LLM
Signed-off-by: Darío Hueso Gisbert <darihueso21@gmail.com>
---
The commit message and the added check were drafted with the help of
an LLM (Claude). I reviewed both and tested the script on a kernel
built from mainline, with uuidgen installed (unchanged behaviour) and
with it removed (the ifalias test now reports SKIP instead of FAIL).

On that kernel the unrelated ipsec_offload test fails with and without
this change.

 tools/testing/selftests/net/rtnetlink.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/net/rtnetlink.sh b/tools/testing/selftests/net/rtnetlink.sh
index 4843d474538f..c758efb734da 100755
--- a/tools/testing/selftests/net/rtnetlink.sh
+++ b/tools/testing/selftests/net/rtnetlink.sh
@@ -412,6 +412,13 @@ kci_test_addrlabel()
 kci_test_ifalias()
 {
 	local ret=0
+
+	run_cmd uuidgen
+	if [ $ret -ne 0 ]; then
+		end_test "SKIP: uuidgen not installed"
+		return $ksft_skip
+	fi
+
 	namewant=$(uuidgen)
 	syspathname="/sys/class/net/$devdummy/ifalias"
 	run_cmd ip link set dev "$devdummy" alias "$namewant"
-- 
2.53.0

